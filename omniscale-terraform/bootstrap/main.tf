terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # Local state for bootstrap only
  backend "local" {
    path = "bootstrap.tfstate"
  }
}

provider "aws" {
  region                      = "us-east-1"
  s3_use_path_style           = true
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
  access_key                  = "test"
  secret_key                  = "test"
}

# S3 Bucket for Terraform state
resource "aws_s3_bucket" "state" {
  bucket = "omniscale-terraform-state"

  tags = {
    Name        = "omniscale-terraform-state"
    ManagedBy   = "terraform-bootstrap"
    Environment = "dev"
  }
}

# Enable versioning (NEW syntax)
resource "aws_s3_bucket_versioning" "state" {
  bucket = aws_s3_bucket.state.id

  versioning_configuration {
    status = "Enabled"
  }
}

# DynamoDB Table for state locking
resource "aws_dynamodb_table" "state_lock" {
  name         = "omniscale-state-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name        = "omniscale-state-lock"
    ManagedBy   = "terraform-bootstrap"
    Environment = "dev"
  }
}

output "bucket_name" {
  value = aws_s3_bucket.state.bucket
}

output "table_name" {
  value = aws_dynamodb_table.state_lock.name
}