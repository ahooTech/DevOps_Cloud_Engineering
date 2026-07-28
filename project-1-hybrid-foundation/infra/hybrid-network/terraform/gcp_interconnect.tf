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

resource "google_compute_firewall" "allow_vpn" {
  name    = "proj1-gcp-allow-vpn"
  network = google_compute_network.vpc.name

  allow {
    protocol = "udp"
    ports    = ["500", "4500"]
  }

  allow {
    protocol = "esp" # Encapsulating Security Payload (IPSec)
  }

  allow {
    protocol = "icmp" # For BGP health checks
  }

  source_ranges = ["0.0.0.0/0"] # In prod, restrict to your on-prem IP
}




# Think of this `gcp_interconnect.tf` file as the **GCP Foundation Crew**. 

# While your `bgp_peering.tf` file handles the complex, heavy-lifting of building the actual encrypted tunnels and BGP routers, this file is responsible for laying the absolute groundwork. It builds the land, the specific building zones, and the perimeter security guards.

# Here is the easy-to-understand breakdown of what this crew is building, using our **Corporate Campus** analogy:

# ### 1. Fencing the Private Campus (VPC)
# ```hcl
# resource "google_compute_network" "vpc" {
#   name                    = "proj1-gcp-vpc"
#   auto_create_subnetworks = false
#   routing_mode            = "GLOBAL"
# }
# ```
# *   **The VPC:** This is your private, fenced-in land in Google Cloud. 
# *   **`auto_create_subnetworks = false`:** This is a crucial GCP-specific setting. By default, if you create a VPC in GCP, it automatically creates a building zone (subnet) in *every single region in the world*. That's messy and wastes IP addresses. Setting this to `false` tells GCP: *"Stop! I will build my own subnets exactly where I need them."*
# *   **`routing_mode = "GLOBAL"`:** This is a GCP superpower. It means that if a route is learned in one region (like `us-central1`), it is instantly available in all other regions. It makes your network behave like one giant, unified campus rather than isolated regional branches.

# ### 2. Building the Specific Zone (Subnet)
# ```hcl
# resource "google_compute_subnetwork" "subnet" {
#   name          = "proj1-gcp-subnet"
#   ip_cidr_range = var.gcp_cidr
#   region        = var.gcp_region
#   network       = google_compute_network.vpc.id
# }
# ```
# *   **The Subnet:** This is the specific building zone inside your campus where your servers will actually live. 
# *   Notice how it uses `var.gcp_cidr` (which is `10.40.0.0/16` from your `variables.tf`). It also explicitly links itself to the VPC using `network = google_compute_network.vpc.id`. Because we turned off auto-creation in the previous step, we are manually placing this zone exactly in the `us-central1` region.

# ### 3. Hiring the Perimeter Security Guards (Firewall)
# ```hcl
# resource "google_compute_firewall" "allow_vpn" { ... }
# ```
# *   **The Firewall:** In GCP, firewalls are attached directly to the VPC. This block hires a team of security guards and gives them a very specific instruction manual on what traffic is allowed to enter the campus.
# *   **The Instruction Manual:**
#     *   **UDP ports 500 & 4500:** These are the "handshake" and "tunnel maintenance" ports for IPsec. The guards let this traffic through so the VPN tunnel can establish itself and stay alive.
#     *   **ESP (Encapsulating Security Payload):** This is the actual "armored truck" carrying your encrypted data. The guards let this protocol through so your secure data can flow.
#     *   **ICMP:** This is for "health checks" (like the `ping` command). It lets the network verify that the tunnel is actually working.
# *   **`source_ranges = ["0.0.0.0/0"]`:** This tells the guards to accept this traffic from *anywhere* on the internet. 
#     *   *⚠️ Security Note:* The comment in your code is spot-on. In a real production environment, you would change this to your actual on-premises public IP address so random people on the internet can't try to talk to your VPN gateway.

# ---

# ### 💡 The Big Picture Takeaway

# Why did you split this into `gcp_interconnect.tf` and `bgp_peering.tf`? 

# This is a fantastic example of **Separation of Concerns** in Terraform:
# 1.  **`gcp_interconnect.tf`** handles the **Foundation**: The VPC, the Subnet, and the basic Firewall. These are the things that need to exist *before* you can even think about connecting to the outside world.
# 2.  **`bgp_peering.tf`** handles the **Connectivity**: The HA VPN Gateways, the Tunnels, the Cloud Routers, and the BGP Peers. These are the complex plumbing that connects your foundation to your on-premises network.

# By keeping them in separate files, your code is incredibly clean. If you ever need to change the IP address of your subnet, you know exactly which file to look in (`gcp_interconnect.tf`). If you need to change the BGP ASN, you know to look in `bgp_peering.tf`.