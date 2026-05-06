# C:\Users\DAYLIFF\Desktop\DevOps.E_Cloud.E_Platform.E_Infrastructure.E_DevSecOps._Site_Realiability.E\Projects\omniscale-terraform\backend.tf
# terraform {
#   backend "s3" {
#     bucket         = "omniscale-terraform-state"
#     key            = "prod/us-east-1/terraform.tfstate"
#     region         = "us-east-1"

#     # NEW: Use "use_lockfile" instead of deprecated "dynamodb_table"
#     use_lockfile = true

#     # NEW: Use "use_path_style" instead of deprecated "force_path_style"
#     use_path_style = true

#     # LocalStack overrides
#     skip_credentials_validation = true
#     skip_metadata_api_check     = true
#     skip_requesting_account_id  = true

#     access_key = "test"
#     secret_key = "test"
#   }
# }

# C:\Users\DAYLIFF\Desktop\DevOps.E_Cloud.E_Platform.E_Infrastructure.E_DevSecOps._Site_Realiability.E\Projects\omniscale-terraform\backend.tf

terraform {
  backend "s3" {
    # State storage location
    bucket = "omniscale-terraform-state"
    key    = "prod/us-east-1/terraform.tfstate"
    region = "us-east-1"

    # ✅ State locking via DynamoDB (re-enabled)
    dynamodb_table = "omniscale-state-lock"

    # ✅ LocalStack compatibility settings
    force_path_style            = true
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_requesting_account_id  = true

    # ✅ Explicit endpoints for LocalStack services
    endpoints = {
      s3       = "http://localhost:4566"
      dynamodb = "http://localhost:4566"
      sts      = "http://localhost:4566"
      iam      = "http://localhost:4566"
    }

    # ✅ Dummy credentials for LocalStack
    access_key = "test"
    secret_key = "test"
  }
}