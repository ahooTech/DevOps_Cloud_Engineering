# outputs.tf
# ONLY "output" blocks are allowed here.

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
# SECURITY & NETWORK OUTPUTS
# ============================================

output "security_group_id" {
  value       = aws_security_group.bridge_sg.id
  description = "Security group ID for the bridge node"
}

output "vpc_id" {
  value       = var.vpc_id
  description = "VPC ID where bridge node is deployed"
}

output "subnet_id" {
  value       = var.subnet_id
  description = "Subnet ID where bridge node is deployed"
}

# ============================================
# HYPERVISOR MODULE OUTPUTS
# ============================================

output "hypervisor_module_outputs" {
  value = {
    kvm    = module.kvm_config
    oci    = module.oci_config
    hyperv = module.hyperv_config
    hcs    = module.hcs_config
    # vsphere = module.vsphere_config  # Uncomment when vSphere is enabled
  }
  description = "Outputs from hypervisor bridge configurations"
}

output "bridge_sync_status" {
  value = {
    kvm    = "Libvirt XML ready for ${aws_instance.bridge_node.private_ip}"
    oci    = "Bare-metal peer config for ${aws_instance.bridge_node.private_ip}"
    hyperv = "WinRM config ready for ${aws_instance.bridge_node.private_ip}"
    hcs    = "HCS API config ready for ${aws_instance.bridge_node.private_ip}"
    # vsphere = "vCenter sync pending for ${aws_instance.bridge_node.private_ip}"
  }
  description = "Status of the virtualization bridge configuration"
}