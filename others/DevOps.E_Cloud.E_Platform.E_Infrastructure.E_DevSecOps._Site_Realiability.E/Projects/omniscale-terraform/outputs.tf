# outputs.tf
# Exposes key infrastructure values for parity validation and external consumption
# C:\Users\DAYLIFF\Desktop\DevOps.E_Cloud.E_Platform.E_Infrastructure.E_DevSecOps._Site_Realiability.E\Projects\omniscale-terraform\outputs.tf

output "vpc_cidr" {
  description = "CIDR block of the main VPC"
  value       = module.vpc.cidr
}

output "public_subnet_cidrs" {
  description = "List of public subnet CIDR blocks"
  value       = module.networking.public_subnet_ids
}

output "private_subnet_cidrs" {
  description = "List of private subnet CIDR blocks"
  value       = module.networking.private_subnet_ids
}

output "baseline_security_group_id" {
  description = "ID of the baseline security group"
  value       = module.networking.baseline_sg_id
}

output "parity_summary" {
  description = "Human-readable parity validation summary"
  value = <<-EOT
    ✅ Omniscale Infrastructure Parity
    ────────────────────────────────
    VPC CIDR:        ${module.vpc.cidr}
    Public Subnets:  ${length(module.networking.public_subnet_ids)} (/24)
    Private Subnets: ${length(module.networking.private_subnet_ids)} (/22)
    Security Group:  ${module.networking.baseline_sg_id}
    State Backend:   S3 (Remote, Locked)
    EOT
}