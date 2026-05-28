# gcp_interconnect.tf - CLEANED
# Router, HA VPN Gateway & External GW moved to bgp_peering.tf
# Focus: Core VPC & Subnet definitions only

resource "google_compute_network" "vpc" {
  name                    = "proj1-gcp-vpc"
  auto_create_subnetworks = false
  routing_mode            = "GLOBAL"
}

resource "google_compute_subnetwork" "subnet" {
  name          = "proj1-gcp-subnet"
  ip_cidr_range = var.gcp_cidr
  region        = var.gcp_region
  network       = google_compute_network.vpc.id
}