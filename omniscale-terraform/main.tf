# C:\Users\DAYLIFF\Desktop\DevOps.E_Cloud.E_Platform.E_Infrastructure.E_DevSecOps._Site_Realiability.E\Projects\omniscale-terraform\main.tf
# Minimal test resource to trigger state write
# terraform {
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "~> 6.0"  # Updated to match your installed version
#     }
#   }
# }

# # Root provider configuration (required for v6.x)
# provider "aws" {
#   region = "us-east-1"

#   # LocalStack configuration
#   s3_use_path_style           = true
#   skip_credentials_validation = true
#   skip_metadata_api_check     = true
#   skip_requesting_account_id  = true

#   # Credentials via env vars (already set in PowerShell)
#   # access_key = "test"      # Optional: can use env vars instead
#   # secret_key = "test"
# }

# C:\Users\DAYLIFF\Desktop\DevOps.E_Cloud.E_Platform.E_Infrastructure.E_DevSecOps._Site_Realiability.E\Projects\omniscale-terraform\main.tf

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Root provider configuration for LocalStack + AWS Provider v6.x
provider "aws" {
  region = "us-east-1"

  # LocalStack compatibility
  s3_use_path_style           = true
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  # Credentials via environment variables (set in PowerShell)
  # access_key = "test"      # Optional: uncomment if not using env vars
  # secret_key = "test"
}

# =============================================================================
# MODULE CALLS: Wire infrastructure modules together
# =============================================================================

# VPC Module: Core network foundation
module "vpc" {
  source = "./modules/vpc"

  cidr        = var.cidr
  environment = var.environment
  tags        = var.tags
}

# Networking Module: Subnets, gateways, routing, security
module "networking" {
  source = "./modules/networking"

  vpc_id      = module.vpc.id
  cidr        = var.cidr
  azs         = var.azs
  environment = var.environment
  tags        = var.tags
}

# Compute Module: Launch templates, instances, user-data parity
module "compute" {
  source = "./modules/compute"

  vpc_id            = module.vpc.id
  subnet_ids        = module.networking.public_subnet_ids
  security_group_id = module.networking.baseline_sg_id
  environment       = var.environment
  tags              = var.tags
}