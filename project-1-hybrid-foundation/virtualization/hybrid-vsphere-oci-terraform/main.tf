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
      source  = "hashicorp/vsphere"
      version = "~> 2.0"
    }
    oci = {
      source  = "oracle/oci"
      version = "~> 5.0"
    }
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

provider "oci" {
  region = var.oci_region != null ? var.oci_region : "us-ashburn-1"
}

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
# vSphere Module - Uncomment when you have real vCenter
/*
module "vsphere_config" {
  source = "./vsphere"
  
  bridge_node_ip = aws_instance.bridge_node.private_ip
  vcenter_server = var.vsphere_server
}
*/

module "kvm_config" {
  source = "./kvm"
  bridge_node_ip = aws_instance.bridge_node.private_ip
}

module "oci_config" {
  source = "./oci"
  bridge_node_ip = aws_instance.bridge_node.private_ip
}

module "hyperv_config" {
  source = "./hyperv"
  bridge_node_ip = aws_instance.bridge_node.private_ip
}

module "hcs_config" {
  source = "./hcs"
  bridge_node_ip = aws_instance.bridge_node.private_ip
}

