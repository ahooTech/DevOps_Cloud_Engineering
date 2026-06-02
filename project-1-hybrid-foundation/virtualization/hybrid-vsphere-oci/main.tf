# virtualization/hybrid-vsphere-oci/main.tf
# Final version: Simulation-ready with mock providers for plan/validate

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
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
# PROVIDERS (Mock Mode for Simulation)
# ============================================

# AWS Provider - Mock credentials for plan/validate only
provider "aws" {
  region = var.aws_region

  # Mock credentials - allows terraform plan without real AWS account
  access_key                  = "mock_access_key"
  secret_key                  = "mock_secret_key"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  # Optional: Point to LocalStack or other mock endpoint for testing
  # endpoints {
  #   ec2 = "http://localhost:4566"
  #   iam = "http://localhost:4566"
  # }
}

# vSphere Provider - Mock settings for simulation
/*
provider "vsphere" {
  user                 = "mock_user"
  password             = "mock_password"
  vsphere_server       = "vcenter.mock.local"
  allow_unverified_ssl = true
  # In production: Remove mock values and use real vCenter credentials
}
*/

# OCI Provider - Mock settings for simulation
provider "oci" {
  tenancy_ocid         = "ocid1.tenancy.oc1..mock"
  user_ocid            = "ocid1.user.oc1..mock"
  fingerprint          = "mock:fingerprint"
  private_key_path     = "/dev/null"
  region               = var.oci_region != null ? var.oci_region : "us-ashburn-1"
  disable_auto_retries = true
  # In production: Use OCI config file or instance principal auth
}

# ============================================
# RESOURCES (AWS Bridge Node)
# ============================================

# SSH Key Pair (reuse your Step 3 lab key)
resource "aws_key_pair" "hybrid_lab" {
  key_name   = "hybrid-lab-key-${var.env_tag}"
  public_key = file(var.ssh_public_key_path)

  tags = {
    Name        = "hybrid-lab-key"
    Environment = var.env_tag
    Project     = "step6-virtualization-bridge"
  }
}

# Security Group (Parity with Step 1/2: Lockdown + Audit)
resource "aws_security_group" "bridge_sg" {
  name        = "hybrid-bridge-sg-${var.env_tag}"
  description = "Hardened bridge: SSH only from trusted IP, audit enabled"
  vpc_id      = var.vpc_id

  ingress {
    description = "SSH from trusted on-prem/lab IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.trusted_cidr]
  }

  egress {
    description = "Allow outbound for updates & sync"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "bridge-sg"
    Project     = "step6-virtualization"
    Environment = var.env_tag
  }
}

# Bridge Node (Simulates Bare-Metal/Hypervisor Host)
resource "aws_instance" "bridge_node" {
  # Note: ami_id will fail on apply with mock credentials, but plan works
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.hybrid_lab.key_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.bridge_sg.id]

  # Inject cloud-init with SSH key & hardening rules
  user_data = templatefile("${path.module}/cloud-init.tpl", {
    ssh_key = file(var.ssh_public_key_path)
  })

  # IMDSv2 for secure metadata access (DevSecOps parity)
  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "required"
  }

  tags = {
    Name        = "hybrid-vsphere-oci-node"
    Environment = var.env_tag
    Role        = "virtualization-bridge"
    Project     = "step6-virtualization"
  }
}

# ============================================
# MODULES (Hypervisor Bridge Configs)
# ============================================

# vSphere Module - Pass bridge node IP for sync configuration
/*
module "vsphere_config" {
  source = "./vsphere"
  
  bridge_node_ip = aws_instance.bridge_node.private_ip
}
*/

# KVM/Libvirt Module - Pass bridge node IP for sync configuration  
module "kvm_config" {
  source = "./kvm"

  bridge_node_ip = aws_instance.bridge_node.private_ip
}

# OCI Bare-Metal Module - Pass bridge node IP for peer configuration
module "oci_config" {
  source = "./oci"

  bridge_node_ip = aws_instance.bridge_node.private_ip
}