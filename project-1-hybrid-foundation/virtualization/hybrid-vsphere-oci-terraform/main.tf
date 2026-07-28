# ============================================
# REMOTE STATE (Read Project 1 Outputs)
# ============================================
data "terraform_remote_state" "project1" {
  backend = "s3"
  
  config = {
    bucket = "project1-terraform-state-ahootech"  # ⚠️ MUST MATCH Project 1 backend bucket
    key    = "hybrid-network/terraform.tfstate"
    region = "us-east-1"
  }
}

# ============================================
# TERRAFORM CONFIGURATION
# ============================================
terraform {
  required_version = ">= 1.5.0"
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.100.0"
    }
    vsphere = {
      source  = "vmware/vsphere"
      version = "~> 2.0"
    }
    oci = {
      source  = "oracle/oci"
      version = "~> 5.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4"
    }
    # huaweicloud = {
    #   source  = "huaweicloud/huaweicloud"
    #   version = "~> 1.50.0"
    # }
  }
}

# ============================================
# PROVIDERS
# ============================================
provider "aws" {
  region = var.aws_region
  
  default_tags {
    tags = {
      Project     = "project-1-hybrid-foundation"
      Environment = var.env_tag
      ManagedBy   = "terraform"
      Component   = "virtualization-bridge"
    }
  }
}

# vSphere Provider - Uncomment when you have real vCenter
/*
provider "vsphere" {
  user                 = var.vsphere_user
  password             = var.vsphere_password
  vsphere_server       = var.vsphere_server
  allow_unverified_ssl = true
}
*/

# provider "huaweicloud" {
#   region     = var.hcs_region
#   access_key = var.hcs_access_key
#   secret_key = var.hcs_secret_key
# }

# provider "oci" {
#   region = var.oci_region != null ? var.oci_region : "us-ashburn-1"
# }

# ============================================
# DATA SOURCES
# ============================================
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}


# ============================================
# IDENTITY POLICY VALIDATION (Policy-as-Code)
# ============================================
locals {
  # Parse all 5 identity configuration files to validate JSON/YAML syntax
  aws_ad_config   = jsondecode(file("${path.module}/../../identity/ad-sync-config/aws-managed-ad.json"))
  azure_ad_config = jsondecode(file("${path.module}/../../identity/ad-sync-config/azure-ad-connect.json"))
  gcp_id_config   = jsondecode(file("${path.module}/../../identity/ad-sync-config/gcp-identity-sync.json"))
  rbac_mapping    = yamldecode(file("${path.module}/../../identity/ad-sync-config/rbac-mapping.yaml"))
  sync_rules      = jsondecode(file("${path.module}/../../identity/ad-sync-config/sync-rules.json"))
}

# Output a beautiful, structured summary of the validated architecture
output "identity_architecture_validation" {
  value = {
    status           = "✅ All Identity Policies Validated"
    target_providers = local.sync_rules.sync_policy.target_providers
    aws_trust_type   = local.aws_ad_config.trust_relationship.type
    azure_ou_filters = length(local.azure_ad_config.ou_filtering.include)
    gcp_scim_enabled = local.gcp_id_config.scim_endpoint != null ? true : false
    #total_rbac_roles = length(local.rbac_mapping.rbac_mapping.aws.group_assignments) + length(local.rbac_mapping.rbac_mapping.azure.group_assignments) + length(local.rbac_mapping.rbac_mapping.gcp.group_assignments)
    total_rbac_roles = sum([
      length(local.rbac_mapping.rbac_mapping.aws.group_assignments),
      length(local.rbac_mapping.rbac_mapping.azure.group_assignments),
      length(local.rbac_mapping.rbac_mapping.gcp.group_assignments)
    ])
  
  }
  description = "Summary of validated hybrid identity and RBAC policies"
}

# ============================================
# RESOURCES
# ============================================

# SSH Key Pair
resource "aws_key_pair" "hybrid_lab" {
  key_name   = "hybrid-lab-key-${var.env_tag}"
  public_key = file(var.ssh_public_key_path)

  tags = {
    Name        = "hybrid-lab-key"
    Environment = var.env_tag
    Project     = "project-1-hybrid-foundation"
    Component   = "virtualization-bridge"
  }
}

# Security Group - Uses remote state for VPC CIDR
resource "aws_security_group" "bridge_sg" {
  name        = "hybrid-bridge-sg-${var.env_tag}"
  description = "Hardened bridge: SSH from trusted IP, hypervisor ports from VPC"
  vpc_id      = data.terraform_remote_state.project1.outputs.aws_vpc_id  # ✅ From remote state

  # SSH from trusted IP only
  ingress {
    description = "SSH from trusted on-prem/lab IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.trusted_cidr]
  }

  # vCenter HTTPS (from VPC only)
  ingress {
    description = "vCenter HTTPS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [data.terraform_remote_state.project1.outputs.aws_vpc_cidr]  # ✅ From remote state
  }

  # KVM/Libvirt TLS (from VPC only)
  ingress {
    description = "KVM Libvirt TLS from VPC"
    from_port   = 16509
    to_port     = 16514
    protocol    = "tcp"
    cidr_blocks = [data.terraform_remote_state.project1.outputs.aws_vpc_cidr]  # ✅ From remote state
  }

  # WinRM for Hyper-V (from VPC only)
  ingress {
    description = "WinRM HTTP/HTTPS from VPC"
    from_port   = 5985
    to_port     = 5986
    protocol    = "tcp"
    cidr_blocks = [data.terraform_remote_state.project1.outputs.aws_vpc_cidr]  # ✅ From remote state
  }

  # Allow all outbound
  egress {
    description = "Allow outbound for updates & sync"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "bridge-sg"
    Project     = "project-1-hybrid-foundation"
    Environment = var.env_tag
    Component   = "virtualization-bridge"
  }
}

# Bridge Node Instance
resource "aws_instance" "bridge_node" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.hybrid_lab.key_name
  subnet_id              = data.terraform_remote_state.project1.outputs.aws_subnet_id  # ✅ From remote state
  vpc_security_group_ids = [aws_security_group.bridge_sg.id]

  user_data = templatefile("${path.module}/cloud-init.tpl", {
    ssh_key = file(var.ssh_public_key_path)
  })

  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "required"
  }

  root_block_device {
    volume_size = 20
    volume_type = "gp3"
    encrypted   = true
  }

  tags = {
    Name        = "hybrid-vsphere-oci-node"
    Environment = var.env_tag
    Role        = "virtualization-bridge"
    Project     = "project-1-hybrid-foundation"
    Component   = "virtualization-bridge"
  }
}

# ============================================
# MODULES
# ============================================

# vSphere Module - Simulation (Generates Ansible Playbook)
module "vsphere_config" {
  source = "./vsphere"
  bridge_node_ip = aws_instance.bridge_node.private_ip
}

# KVM Module - Simulation (Generates Libvirt XML)
module "kvm_config" {
  source = "./kvm"
  bridge_node_ip = aws_instance.bridge_node.private_ip
}

# OCI Module - Simulation (Generates Cloud-Init & TF Payload)
module "oci_config" {
  source = "./oci"
  bridge_node_ip = aws_instance.bridge_node.private_ip
}

# Hyper-V Module - Simulation (Generates PSD1 Config)
module "hyperv_config" {
  source = "./hyperv"
  bridge_node_ip = aws_instance.bridge_node.private_ip
}

# HCS (Huawei) Module - Simulation (Generates Cloud-Init Payload)
# ✅ UNCOMMENTED: Now uses the local_file simulation, no credentials needed!
module "hcs_config" {
  source = "./hcs"
  bridge_node_ip = aws_instance.bridge_node.private_ip
}