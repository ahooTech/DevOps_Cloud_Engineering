# ============================================
# AWS OUTPUTS
# ============================================
output "aws_vpc_id" {
  description = "AWS VPC ID"
  value       = aws_vpc.main.id
}

output "aws_subnet_id" {
  description = "AWS Public Subnet ID"
  value       = aws_subnet.public.id
}

output "aws_subnet_cidr" {
  description = "AWS Public Subnet CIDR"
  value       = aws_subnet.public.cidr_block
}

output "aws_vpc_cidr" {
  description = "AWS VPC CIDR"
  value       = aws_vpc.main.cidr_block
}

output "aws_tgw_id" {
  description = "AWS Transit Gateway ID"
  value       = aws_ec2_transit_gateway.tgw.id
}

output "aws_bgp_asn" {
  description = "AWS BGP ASN"
  value       = var.aws_bgp_asn
}

# ============================================
# AZURE OUTPUTS
# ============================================
output "azure_vnet_id" {
  description = "Azure VNet ID"
  value       = azurerm_virtual_network.vnet.id
}

output "azure_gw_public_ip" {
  description = "Azure VPN Gateway Public IP"
  value       = azurerm_public_ip.pip.ip_address
}

# ============================================
# GCP OUTPUTS
# ============================================
output "gcp_vpc_network" {
  description = "GCP VPC Network Name"
  value       = google_compute_network.vpc.name
}

output "gcp_router_asn" {
  description = "GCP Cloud Router ASN"
  value       = var.gcp_bgp_asn
}

# ============================================
# PARITY STATUS
# ============================================
output "parity_status" {
  description = "Parity validation status"
  value       = "On-Prem CIDR: ${var.onprem_cidr} | Cloud CIDRs: AWS=${var.aws_cidr} Azure=${var.azure_cidr} GCP=${var.gcp_cidr}"
}


# 1. outputs.tf (The Final Handover Clipboard)
# When your construction crew finishes building the multi-cloud network, you need to know the "addresses" and "IDs" of what they built so you can actually use it. This file tells Terraform exactly what information to print to your screen when the deployment finishes.
# aws_vpc_id & aws_tgw_id: These are the unique ID numbers for your AWS campus and highway interchange. If you ever need to attach a new server to your network later, you'll need these IDs.
# azure_gw_public_ip: This is the most critical one. It’s the public street address of your Azure branch office. If you want to configure your physical on-premises firewall to connect to Azure, you need this exact IP address.
# parity_status: This is a custom, human-readable summary. It prints out a neat little message showing all the IP ranges (CIDRs) you used, proving that your network design is consistent across all three clouds.
# 💡 The Big Picture: Without this file, Terraform would just say "Apply complete!" and you'd have to go hunting through the AWS, Azure, and GCP web consoles to find the IP addresses and IDs of what you just built. outputs.tf hands you the keys directly.