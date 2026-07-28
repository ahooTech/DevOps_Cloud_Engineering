# virtualization/hybrid-vsphere-oci/variables.tf

variable "aws_region" {
  description = "AWS region for the bridge node"
  type        = string
  default     = "us-east-1"
}

variable "trusted_cidr" {
  description = "Your laptop or on-prem CIDR (e.g., 203.0.113.5/32)"
  type        = string
}

variable "ssh_public_key_path" {
  description = "Path to your Step 3 lab SSH public key"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

variable "instance_type" {
  description = "AWS instance type for the bridge node"
  type        = string
  default     = "t3.medium"
}

variable "env_tag" {
  description = "Environment tag for naming resources"
  type        = string
  default     = "dev-lab"
}
