terraform {
  required_version = ">= 1.5.0"

  # 🔐 Local state backend (change to s3/azurerm/gcs/Terraform Cloud later)
  # backend "local" {
  #   path = "state/terraform.tfstate"
  # }
  # 🔐 S3 Backend for Remote State
  backend "s3" {
    bucket         = "project1-terraform-state-ahootech"  # ⚠️ CHANGE THIS to your unique bucket name
    key            = "hybrid-network/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    use_lockfile   = true  # For state locking (optional but recommended)
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




# Think of this `main.tf` file as the **Site Setup and Vendor Contracts**. 

# If your other Terraform files (`aws_tgw.tf`, `azure_vwan.tf`, etc.) are the architectural blueprints, and the `variables.tf` is the master rulebook, then `main.tf` is where you actually **set up the construction site, hire the specialized contractors, and set the ground rules** before anyone starts building.

# Here is the easy-to-understand breakdown of exactly what is happening in this file, block by block:

# ---

# ### 1. The `terraform` Block (The Site Rules & Tooling)
# ```hcl
# terraform {
#   required_version = ">= 1.5.0"
#   backend "local" { path = "state/terraform.tfstate" }
#   required_providers { ... }
# }
# ```
# This block sets up the foundational environment for your project.
# *   **`required_version`:** This is a safety lock. It says, *"Do not let anyone run this code unless they are using Terraform version 1.5.0 or higher."* This prevents bugs if someone tries to run your modern code on an ancient version of Terraform.
# *   **`backend "local"`:** This is **Terraform's Memory**. When Terraform builds your network, it writes down exactly what it built, where it built it, and what its ID numbers are into a "diary" called the **State File** (`terraform.tfstate`). This block tells Terraform to keep that diary in a local folder on your computer. *(Note: In a real corporate job, you would change this to store the diary in the cloud, like AWS S3, so your whole team can share it).*
# *   **`required_providers`:** Terraform doesn't know how to talk to AWS, Azure, or GCP out of the box. It needs specialized translator plugins called **Providers**. This block tells Terraform: *"Go download the AWS, Azure, and GCP translator plugins, and make sure they are these specific versions."*

# ---

# ### 2. The `provider` Blocks (The Vendor Contracts)
# Once Terraform downloads the plugins, you have to configure them. This is where you give each cloud provider its specific login details and ground rules.

# #### **The AWS Contract**
# ```hcl
# provider "aws" {
#   region = var.aws_region
#   default_tags { ... }
# }
# ```
# *   **`region`:** Tells AWS to build everything in `us-east-1`.
# *   **`default_tags`:** This is a **massive time-saver**. Instead of going into every single AWS resource (VPC, Subnet, Gateway) and manually typing out the tags (Project, Environment, etc.), you define them *once* here. Terraform will automatically slap these tags onto **every single AWS resource** you create. 

# #### **The Azure Contract**
# ```hcl
# provider "azurerm" {
#   features {}
#   subscription_id = var.azure_subscription_id
# }
# ```
# *   **`subscription_id`:** This is your billing account number. It tells Azure exactly which corporate wallet to charge for this project.
# *   **`features {}`:** This looks weird, but it's mandatory. Microsoft's API requires you to explicitly acknowledge their "Terms and Conditions" before you can use their provider. Leaving this empty block is just Terraform's way of saying, *"I accept the terms."*

# #### **The GCP Contract**
# ```hcl
# provider "google" {
#   project = var.gcp_project_id
#   region  = var.gcp_region
#   default_labels = { ... }
# }
# ```
# *   **`project`:** In GCP, everything must belong to a "Project" (which is just a billing and organizational container). This tells GCP which project to build inside.
# *   **`default_labels`:** This is the exact same concept as AWS's `default_tags`, but GCP calls them "labels" instead of "tags". Again, it automatically applies these labels to every single GCP resource you build.

# ---

# ### 💡 The Big Picture Takeaway

# Why is `main.tf` so important? Because it **centralizes your configuration**. 

# Imagine you have 30 different resources spread across 5 different files. If your boss tells you, *"We need to add a 'CostCenter: 12345' tag to every single resource for billing,"* you don't have to hunt through 5 files and update 30 blocks of code. 

# You just open `main.tf`, add `"CostCenter" = "12345"` to the `default_tags` and `default_labels`, run `terraform apply`, and Terraform automatically updates all 30 resources for you. 

# It is the ultimate "Control Tower" for your multi-cloud deployment!