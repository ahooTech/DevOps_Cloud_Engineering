# env/dev/terragrunt.hcl
terraform {
  source = "../../modules/eks"
}

include "root" {
  path = find_in_parent_folders()
}

inputs = {
  env                        = "dev"
  cluster_name               = "k8s-fabric-dev"
  cidr_range                 = "10.0.0.0/16"  # From parity matrix
  node_pool_instance_types   = ["t3.large"]
  node_pool_desired_size     = 2
  node_pool_max_size         = 4
  node_pool_min_size         = 1
  dns_domain                 = "dev.example.com"
}