# hcs/main.tf
# Renders the HCS YAML config with the actual bridge node IP

resource "local_file" "hcs_yaml" {
  content = templatefile("${path.module}/hcs-config.yaml", {
    bridge_node_ip = var.bridge_node_ip
  })
  filename = "${path.module}/generated/hcs-config.yaml"
}

output "hcs_bridge_status" {
  value = "HCS YAML rendered with bridge target ${var.bridge_node_ip}"
}