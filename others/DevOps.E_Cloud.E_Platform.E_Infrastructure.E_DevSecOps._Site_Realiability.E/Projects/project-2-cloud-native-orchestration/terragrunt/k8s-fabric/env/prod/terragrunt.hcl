# env/prod/terragrunt.hcl
terraform {
  source = "../../modules/eks"
}

include "root" {
  path = find_in_parent_folders()
}

inputs = {
  env                        = "prod"
  cluster_name               = "k8s-fabric-prod"
  cidr_range                 = "10.2.0.0/16"  # From parity matrix
  node_pool_instance_types   = ["t3.large"]
  node_pool_desired_size     = 3
  node_pool_max_size         = 10
  node_pool_min_size         = 3
  dns_domain                 = "prod.example.com"
}