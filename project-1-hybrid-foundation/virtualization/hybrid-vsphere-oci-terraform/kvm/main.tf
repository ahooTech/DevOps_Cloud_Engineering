# kvm/main.tf
# Renders the libvirt XML with the actual bridge node IP

resource "local_file" "kvm_libvirt_xml" {
  content = templatefile("${path.module}/libvirt-config.xml", {
    bridge_node_ip = var.bridge_node_ip
  })
  filename = "${path.module}/generated/hybrid-bridge-sync.xml"
}

output "kvm_bridge_status" {
  value = "KVM Libvirt XML rendered with bridge target ${var.bridge_node_ip}"
}