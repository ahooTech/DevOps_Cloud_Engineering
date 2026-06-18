# bgp_peering.tf - FINAL COMPLETE VERSION (AWS + Azure + GCP)

# ==========================================
# AWS HYBRID VPN + BGP
# ==========================================
resource "aws_customer_gateway" "onprem_aws" {
  bgp_asn    = var.onprem_bgp_asn
  ip_address = "52.0.0.1" # Replace with your actual on-prem/public IP
  type       = "ipsec.1"
  tags       = { Name = "proj1-onprem-cgw-aws" }
}

resource "aws_vpn_connection" "aws_conn" {
  customer_gateway_id = aws_customer_gateway.onprem_aws.id
  vpn_gateway_id      = aws_vpn_gateway.vgw.id
  type                = "ipsec.1"
  static_routes_only  = false

  # ✅ SAFE: Non-reserved BGP peering range
  tunnel1_inside_cidr = "169.254.100.0/30"
  tunnel2_inside_cidr = "169.254.100.4/30"
}

# ==========================================
# AZURE HYBRID VPN + BGP
# ==========================================
resource "azurerm_virtual_network_gateway_connection" "azure_conn" {
  name                       = "proj1-azure-to-onprem"
  location                   = var.azure_location
  resource_group_name        = azurerm_resource_group.rg.name
  type                       = "IPsec"
  virtual_network_gateway_id = azurerm_virtual_network_gateway.vgw.id
  local_network_gateway_id   = azurerm_local_network_gateway.onprem.id
  shared_key                 = "Lab-Secure-Preshared-Key-2024!"
}

resource "azurerm_local_network_gateway" "onprem" {
  name                = "proj1-onprem-lng"
  location            = var.azure_location
  resource_group_name = azurerm_resource_group.rg.name
  gateway_address     = "52.0.0.2"
  address_space       = [var.onprem_cidr]

  bgp_settings {
    asn                 = var.onprem_bgp_asn
    bgp_peering_address = "169.254.255.1"
  }
}

# ==========================================
# GCP HA VPN + CLOUD ROUTER + BGP
# Maps to Blueprint: "Cloud Interconnect, BGP peering, hybrid routing"
# ==========================================
resource "google_compute_ha_vpn_gateway" "gcp_vpn_gw" {
  name    = "proj1-gcp-ha-vpn-gw"
  network = google_compute_network.vpc.id
  region  = var.gcp_region
}

resource "google_compute_external_vpn_gateway" "onprem_gcp" {
  name            = "proj1-onprem-ext-gw"
  redundancy_type = "SINGLE_IP_INTERNALLY_REDUNDANT"
  interface {
    id         = 0
    ip_address = "52.0.0.3" # Lab placeholder for on-prem/firewall
  }
}

resource "google_compute_vpn_tunnel" "tunnel1" {
  name                            = "proj1-gcp-tunnel-1"
  region                          = var.gcp_region
  vpn_gateway                     = google_compute_ha_vpn_gateway.gcp_vpn_gw.id
  peer_external_gateway           = google_compute_external_vpn_gateway.onprem_gcp.id
  shared_secret                   = "Lab-Secure-Preshared-Key-2024!"
  vpn_gateway_interface           = 0
  peer_external_gateway_interface = 0
  depends_on                      = [google_compute_router.router]

  router = google_compute_router.router.name
}

resource "google_compute_vpn_tunnel" "tunnel2" {
  name                            = "proj1-gcp-tunnel-2"
  region                          = var.gcp_region
  vpn_gateway                     = google_compute_ha_vpn_gateway.gcp_vpn_gw.id
  peer_external_gateway           = google_compute_external_vpn_gateway.onprem_gcp.id
  shared_secret                   = "Lab-Secure-Preshared-Key-2024!"
  vpn_gateway_interface           = 1
  peer_external_gateway_interface = 0
  depends_on                      = [google_compute_router.router]

  router = google_compute_router.router.name
}

# GCP Cloud Router (if not already in gcp_interconnect.tf, keep this. If yes, remove duplicate)
resource "google_compute_router" "router" {
  name    = "proj1-gcp-cloud-router"
  network = google_compute_network.vpc.id
  region  = var.gcp_region
  bgp {
    asn = var.gcp_bgp_asn
  }
}

# Router Interfaces & BGP Peers
resource "google_compute_router_interface" "if1" {
  name       = "proj1-gcp-if-1"
  router     = google_compute_router.router.name
  region     = var.gcp_region
  ip_range   = "169.254.101.0/30"
  vpn_tunnel = google_compute_vpn_tunnel.tunnel1.id
}

resource "google_compute_router_peer" "bgp_peer1" {
  name                      = "proj1-gcp-bgp-peer-1"
  router                    = google_compute_router.router.name
  region                    = var.gcp_region
  peer_ip_address           = "169.254.101.2" # On-prem side of /30
  peer_asn                  = var.onprem_bgp_asn
  advertised_route_priority = 100
  interface                 = google_compute_router_interface.if1.name
}

resource "google_compute_router_interface" "if2" {
  name       = "proj1-gcp-if-2"
  router     = google_compute_router.router.name
  region     = var.gcp_region
  ip_range   = "169.254.101.4/30"
  vpn_tunnel = google_compute_vpn_tunnel.tunnel2.id
}

resource "google_compute_router_peer" "bgp_peer2" {
  name                      = "proj1-gcp-bgp-peer-2"
  router                    = google_compute_router.router.name
  region                    = var.gcp_region
  peer_ip_address           = "169.254.101.6" # On-prem side of /30
  peer_asn                  = var.onprem_bgp_asn
  advertised_route_priority = 100
  interface                 = google_compute_router_interface.if2.name
}