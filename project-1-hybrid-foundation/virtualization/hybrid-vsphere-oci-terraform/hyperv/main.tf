# hyperv/main.tf
# Renders the PowerShell Data file with the actual bridge node IP

resource "local_file" "hyperv_psd1" {
  content = templatefile("${path.module}/hyper-v-config.psd1", {
    bridge_node_ip = var.bridge_node_ip
  })
  filename = "${path.module}/generated/hyper-v-config.psd1"
}

output "hyperv_bridge_status" {
  value = "Hyper-V PSD1 rendered with bridge target ${var.bridge_node_ip}"
}