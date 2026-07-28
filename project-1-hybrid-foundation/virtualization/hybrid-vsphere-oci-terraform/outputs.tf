# outputs.tf

# ============================================
# BRIDGE NODE OUTPUTS
# ============================================
output "bridge_node_public_ip" {
  value       = aws_instance.bridge_node.public_ip
  description = "Public IP to SSH into the bridge node"
}

output "bridge_node_private_ip" {
  value       = aws_instance.bridge_node.private_ip
  description = "Private IP for internal hypervisor communication"
}

output "bridge_node_id" {
  value       = aws_instance.bridge_node.id
  description = "EC2 instance ID for the bridge node"
}

output "ssh_command" {
  value       = "ssh -i ${replace(var.ssh_public_key_path, ".pub", "")} ubuntu@${aws_instance.bridge_node.public_ip}"
  description = "Copy-paste this command to SSH into the bridge node"
}

# ============================================
# SECURITY & NETWORK OUTPUTS (Using Remote State)
# ============================================
output "security_group_id" {
  value       = aws_security_group.bridge_sg.id
  description = "Security group ID for the bridge node"
}

# ✅ FIX: Use Remote State instead of variables
output "vpc_id" {
  value       = data.terraform_remote_state.project1.outputs.aws_vpc_id
  description = "VPC ID where bridge node is deployed (from Project 1)"
}

output "subnet_id" {
  value       = data.terraform_remote_state.project1.outputs.aws_subnet_id
  description = "Subnet ID where bridge node is deployed (from Project 1)"
}

# ============================================
# HYPERVISOR MODULE OUTPUTS
# ============================================
output "hypervisor_module_outputs" {
  value = {
    vsphere = module.vsphere_config
    kvm     = module.kvm_config
    oci     = module.oci_config
    hyperv  = module.hyperv_config
    hcs     = module.hcs_config # ✅ UNCOMMENTED
  }
  description = "Outputs from hypervisor bridge configurations"
}

output "bridge_sync_status" {
  value = {
    vsphere = "Ansible playbook generated for ${aws_instance.bridge_node.private_ip}"
    kvm     = "Libvirt XML ready for ${aws_instance.bridge_node.private_ip}"
    oci     = "Bare-metal payload generated for ${aws_instance.bridge_node.private_ip}"
    hyperv  = "WinRM config ready for ${aws_instance.bridge_node.private_ip}"
    hcs     = "Cloud-init payload generated for ${aws_instance.bridge_node.private_ip}" # ✅ UNCOMMENTED
  }
  description = "Status of the virtualization bridge configuration"
}


output "aws_subnet_id" {
  value       = data.terraform_remote_state.project1.outputs.aws_subnet_id
  description = "Public subnet ID for the bridge node"
}

output "aws_vpc_cidr" {
  value       = data.terraform_remote_state.project1.outputs.aws_vpc_cidr  # ✅ CORRECT - from remote state
  description = "AWS VPC CIDR block from Project 1"
}