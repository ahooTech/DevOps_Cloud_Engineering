# terragrunt.hcl (Root Configuration)
# This enforces parity across all environments

locals {
  # Load parity matrix values (hardcoded for now, could be YAML/JSON)
  parity_config = {
    k8s_version   = "1.28"
    node_os       = "ubuntu-22.04"
    cidr_range    = "10.0.0.0/16"  # Will be overridden per env
    cni_plugin    = "calico"
    calico_version = "3.26.1"
  }
}

# Remote state (S3/Azure Blob/GCS - use one per cloud)
#remote_state {
#  backend = "s3"  # Change to azurerm/gcs for other clouds
#  config = {
#    bucket         = "k8s-fabric-terraform-state-${get_env("AWS_ACCOUNT_ID", "dev")}"
#    key            = "${path_relative_to_include()}/terraform.tfstate"
#    region         = get_env("AWS_REGION", "us-east-1")
#    encrypt        = true
#    dynamodb_table = "terraform-locks-k8s-fabric"
#  }
#}

# Common inputs for all environments
inputs = {
  k8s_version        = local.parity_config.k8s_version
  node_os            = local.parity_config.node_os
  cni_plugin         = local.parity_config.cni_plugin
  calico_version     = local.parity_config.calico_version
  enable_monitoring  = true
  enable_autoscaler  = true
}