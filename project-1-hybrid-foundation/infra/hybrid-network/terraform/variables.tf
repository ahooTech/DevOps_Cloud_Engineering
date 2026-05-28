variable "aws_region" {
  default = "us-east-1"
}

variable "azure_location" {
  default = "eastus"
}

variable "azure_subscription_id" {
  type      = string
  sensitive = true
}

variable "gcp_project_id" {
  type = string
}

variable "gcp_region" {
  default = "us-central1"
}

# Parity-aligned CIDRs (non-overlapping)
variable "onprem_cidr" {
  default = "10.10.0.0/16"
} # Matches your Vagrant private_network

variable "aws_cidr" {
  default = "10.20.0.0/16"
}

variable "azure_cidr" {
  default = "10.30.0.0/16"
}

variable "gcp_cidr" {
  default = "10.40.0.0/16"
}

# BGP ASNs (RFC 6598/64512 range for private peering)
variable "onprem_bgp_asn" {
  default = 65000
}

variable "aws_bgp_asn" {
  default = 64512
}

variable "azure_bgp_asn" {
  default = 65500
}

variable "gcp_bgp_asn" {
  default = 65001
}

variable "onprem_public_ip_placeholder" {
  description = "Public IP of on-prem environment (Vagrant/NAT/edge simulation)"
  type        = string
  default     = "203.0.113.10"
}