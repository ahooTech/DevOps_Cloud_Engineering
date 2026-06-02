# bridge-logic.tf
# Remove all "variable" blocks from this file.
# Use "locals" and "output" blocks instead.

locals {
  common_tags = {
    Project     = "project-1-hybrid-foundation"
    Step        = "6-virtualization-bridge"
    Environment = var.env_tag
    ManagedBy   = "terraform"
  }
}

output "bridge_sync_status" {
  value = {
    #vsphere = "Configured to sync with ${aws_instance.bridge_node.private_ip}"
    kvm     = "Libvirt XML ready for ${aws_instance.bridge_node.private_ip}"
    oci     = "Bare-metal peer config for ${aws_instance.bridge_node.private_ip}"
  }
  description = "Status of the virtualization bridge configuration"
}