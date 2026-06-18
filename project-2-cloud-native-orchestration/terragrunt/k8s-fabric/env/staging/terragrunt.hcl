# env/staging/terragrunt.hcl
terraform {
  source = "../../modules/eks"
}

include "root" {
  path = find_in_parent_folders()
}

inputs = {
  env                        = "staging"
  cluster_name               = "k8s-fabric-staging"
  cidr_range                 = "10.1.0.0/16"  # From parity matrix
  node_pool_instance_types   = ["t3.large"]
  node_pool_desired_size     = 2
  node_pool_max_size         = 6
  node_pool_min_size         = 2
  dns_domain                 = "staging.example.com"
}