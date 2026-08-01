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




# Think of this `bgp_peering.tf` file as the **Diplomatic Corps and Tunnel Builders**. 

# While your other Terraform files (`aws_tgw.tf`, `azure_vwan.tf`, `gcp_interconnect.tf`) were responsible for building the physical campuses (VPCs, VNets) and the security perimeters, this file is responsible for **digging the actual underground tunnels** that connect those campuses to your "On-Premises Headquarters." 

# More importantly, it sets up **BGP (Border Gateway Protocol)**. BGP is what makes these "smart" tunnels. Instead of manually telling the network where to send traffic, BGP allows the clouds and your on-premises network to automatically exchange "GPS maps" (routing tables).

# Here is the easy-to-understand breakdown of what this crew is building, cloud by cloud:

# ---

# ### 1. AWS: The ID Card and The Tunnel
# ```hcl
# resource "aws_customer_gateway" "onprem_aws" { ... }
# resource "aws_vpn_connection" "aws_conn" { ... }
# ```
# *   **The Customer Gateway:** AWS needs to know what the router at your on-premises headquarters looks like. This resource is essentially an "ID Card" for your on-prem router, telling AWS its public IP address (`52.0.0.1`) and its BGP dialing code (ASN `65000`).
# *   **The VPN Connection:** This is the actual encrypted Site-to-Site tunnel. It takes the AWS Vault Door (the `aws_vpn_gateway` built in the previous file) and connects it to the Customer Gateway. 
# *   *Note:* `static_routes_only = false` means "Turn on BGP." This tells AWS to dynamically learn routes from the on-premises network instead of relying on static, hardcoded paths.

# ### 2. Azure: The Map and The Tunnel
# ```hcl
# resource "azurerm_local_network_gateway" "onprem" { ... }
# resource "azurerm_virtual_network_gateway_connection" "azure_conn" { ... }
# ```
# *   **The Local Network Gateway:** In Azure, this doesn't build a physical gateway. Instead, it draws a **map** of your on-premises headquarters. It tells Azure: *"My headquarters is located at IP 52.0.0.2, and its internal network is 10.10.0.0/16."* It also configures the BGP diplomat (ASN `65000`).
# *   **The Connection:** This takes the Azure Vault Door (the `VpnGw1AZ` built in the previous file) and connects it to the Local Network Gateway map using a shared secret password (`Lab-Secure-Preshared-Key-2024!`).

# ### 3. GCP: The Twin Tunnels, The Dispatcher, and The Diplomats
# GCP is the most explicit cloud. It forces you to build every single piece of the plumbing.

# #### **The Vault Doors & The On-Prem Address**
# ```hcl
# resource "google_compute_ha_vpn_gateway" "gcp_vpn_gw" { ... }
# resource "google_compute_external_vpn_gateway" "onprem_gcp" { ... }
# ```
# *   **HA VPN Gateway:** "HA" means High Availability. GCP builds **two** vault doors side-by-side so if one data center loses power, the other keeps working.
# *   **External VPN Gateway:** Just like Azure's Local Network Gateway, this is a digital placard that says, *"The on-premises headquarters is at IP 52.0.0.3."*

# #### **The Actual Tunnels**
# ```hcl
# resource "google_compute_vpn_tunnel" "tunnel1" { ... }
# resource "google_compute_vpn_tunnel" "tunnel2" { ... }
# ```
# *   **The Tunnels:** These are the two encrypted underground tubes connecting the GCP campus to the on-premises headquarters. Notice how they explicitly link to the `router` (the Cloud Router). This is what makes them "smart" BGP tunnels.

# #### **The Traffic Dispatcher (Cloud Router)**
# ```hcl
# resource "google_compute_router" "router" { ... }
# ```
# *   **The Cloud Router:** This is the smart traffic dispatcher. It sits inside the GCP campus and listens to the BGP conversations. If a new server is added on-premises, the Cloud Router automatically updates GCP's internal maps.

# #### **The Connection Ports (Router Interfaces)**
# ```hcl
# resource "google_compute_router_interface" "if1" { ... }
# resource "google_compute_router_interface" "if2" { ... }
# ```
# *   **The Interfaces:** The Cloud Router needs a physical place to plug in the Tunnels. These interfaces are the ports on the back of the Cloud Router where the tunnels connect. They are assigned specific internal IP ranges (like `169.254.101.0/30`) just for the two routers to talk to each other.

# #### **The Diplomats (BGP Peers)**
# ```hcl
# resource "google_compute_router_peer" "bgp_peer1" { ... }
# resource "google_compute_router_peer" "bgp_peer2" { ... }
# ```
# *   **The BGP Peers:** This is the most critical part of hybrid networking. Imagine two diplomats sitting at the connection ports (Interfaces). The GCP diplomat (`bgp_peer1`) sits across the table from the on-premises diplomat. They constantly talk to each other, exchanging lists of IP addresses (routes). 
# *   Because we have two tunnels, we have **two pairs of diplomats** to ensure that if one conversation drops, the other keeps the network maps updated.

# ---

# ### 💡 The Big Picture Takeaway

# Why is this file the "Final Complete Version"?

# Because **a cloud network in isolation is just a server farm.** It only becomes a **Hybrid Network** when it can securely and dynamically talk to your on-premises data center. 

# This file is the bridge. It takes the isolated VPCs, VNets, and VPCs you built in the other files, and stitches them together with your on-premises environment using encrypted IPsec tunnels and dynamic BGP routing. 

# Without this file, your clouds are just islands. With this file, you have a unified, multi-cloud enterprise network!