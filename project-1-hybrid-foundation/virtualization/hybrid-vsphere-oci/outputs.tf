# outputs.tf
# ONLY "output" blocks are allowed here. No variables.

output "bridge_node_public_ip" {
  value       = aws_instance.bridge_node.public_ip
  description = "Public IP to SSH into the bridge node"
}

output "bridge_node_private_ip" {
  value       = aws_instance.bridge_node.private_ip
  description = "Private IP for internal hypervisor communication"
}

output "ssh_command" {
  value       = "ssh -i ${replace(var.ssh_public_key_path, ".pub", "")} ubuntu@${aws_instance.bridge_node.public_ip}"
  description = "Copy-paste this command to SSH into the bridge node"
}

output "hypervisor_module_outputs" {
  value = {
    #vsphere = module.vsphere_config
    kvm = module.kvm_config
    oci = module.oci_config
  }
  description = "Outputs from your existing hypervisor configs"
}