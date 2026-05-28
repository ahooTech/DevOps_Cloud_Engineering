output "aws_vpc_id" { value = aws_vpc.main.id }
output "aws_tgw_id" { value = aws_ec2_transit_gateway.tgw.id }
output "aws_bgp_asn" { value = var.aws_bgp_asn }
output "azure_vnet_id" { value = azurerm_virtual_network.vnet.id }
output "azure_gw_public_ip" { value = azurerm_public_ip.pip.ip_address }
output "gcp_vpc_network" { value = google_compute_network.vpc.name }
output "gcp_router_asn" { value = var.gcp_bgp_asn }
output "parity_status" { value = "On-Prem CIDR: ${var.onprem_cidr} | Cloud CIDRs: AWS=${var.aws_cidr} Azure=${var.azure_cidr} GCP=${var.gcp_cidr}" }