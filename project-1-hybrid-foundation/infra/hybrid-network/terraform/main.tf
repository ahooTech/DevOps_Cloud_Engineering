terraform {
  required_version = ">= 1.5.0"

  # 🔐 Local state backend (change to s3/azurerm/gcs/Terraform Cloud later)
  backend "local" {
    path = "state/terraform.tfstate"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.100.0"
    }

    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.117.0"
    }

    google = {
      source  = "hashicorp/google"
      version = "~> 5.45.0"
    }
  }
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project     = "project-1-hybrid-foundation"
      Environment = "lab"
      ManagedBy   = "terraform"
      ParityGroup = "hybrid-network"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.azure_subscription_id
}

provider "google" {
  project = var.gcp_project_id
  region  = var.gcp_region

  default_labels = {
    project      = "project-1-hybrid-foundation"
    environment  = "lab"
    managed_by   = "terraform"
    parity_group = "hybrid-network"
  }
}