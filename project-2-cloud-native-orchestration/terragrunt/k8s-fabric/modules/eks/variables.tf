# modules/eks/variables.tf
variable "env" {
  description = "Environment name (dev/staging/prod)"
  type        = string
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "k8s-fabric"
}

variable "k8s_version" {
  description = "Kubernetes version"
  type        = string
  default     = "1.28"
}

variable "node_os" {
  description = "Node OS image (ubuntu-22.04, amazon-linux-2)"
  type        = string
  default     = "ubuntu-22.04"
}

variable "cidr_range" {
  description = "VPC CIDR range"
  type        = string
  default     = "10.0.0.0/16"
}

variable "cni_plugin" {
  description = "CNI plugin (calico, aws-vpc-cni)"
  type        = string
  default     = "calico"
}

variable "calico_version" {
  description = "Calico version"
  type        = string
  default     = "3.26.1"
}

variable "node_pool_instance_types" {
  description = "EC2 instance types for node pool"
  type        = list(string)
  default     = ["t3.large"]
}

variable "node_pool_desired_size" {
  description = "Desired number of nodes"
  type        = number
  default     = 2
}

variable "node_pool_max_size" {
  description = "Max number of nodes"
  type        = number
  default     = 4
}

variable "node_pool_min_size" {
  description = "Min number of nodes"
  type        = number
  default     = 1
}

variable "dns_domain" {
  description = "DNS domain for ingress/certificates"
  type        = string
  default     = "example.com"
}