# ==========================================
# 1. TERRAFORM & PROVIDERS
# ==========================================
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  project = "project-2978a6d6-1bf2-4d65-996"
  region  = "us-central1"
  zone    = "us-central1-a"
}

# ==========================================
# 2. THE SECRET CLUBHOUSE (Custom VPC Network)
# ==========================================
resource "google_compute_network" "vpc_network" {
  name                    = "secret-clubhouse-network"
  auto_create_subnetworks = false # WE ARE DESIGNING OUR OWN ROOMS!

  # REMOVED: "tags" attribute, because google_compute_network does not support it.
  # Tags belong on the VMs, not the network itself!
}

# ==========================================
# 3. THE ROOMS (Subnets)
# ==========================================
# The Front Door (Public Subnet)
resource "google_compute_subnetwork" "public" {
  name          = "public-subnet-frontdoor"
  ip_cidr_range = "10.0.1.0/24"
  region        = "us-central1"
  network       = google_compute_network.vpc_network.id

  # This enables external IPs for instances in this subnet
  private_ip_google_access = false
}

# The Vault (Private Subnet - Hidden from Internet)
resource "google_compute_subnetwork" "private" {
  name          = "private-subnet-vault"
  ip_cidr_range = "10.0.2.0/24"
  region        = "us-central1"
  network       = google_compute_network.vpc_network.id

  # This allows instances to reach Google APIs without external IPs
  private_ip_google_access = true
}

# ==========================================
# 4. THE SECURITY GUARD (Firewall Rules)
# ==========================================
# Allow HTTP from anywhere (for the Front Door)
resource "google_compute_firewall" "allow_http" {
  name    = "allow-http-firewall"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["web-server"] # This targets the VM's tag below!
}

# Allow SSH from anywhere (for management)
resource "google_compute_firewall" "allow_ssh" {
  name    = "allow-ssh-firewall"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["web-server"] # This targets the VM's tag below!
}

# ==========================================
# 5. THE VIRTUAL COMPUTER (In the Front Door!)
# ==========================================
resource "google_compute_instance" "vm" {
  name         = "clubhouse-vm"
  machine_type = "e2-micro" # Cost-optimized! (Hits "cost optimization" requirement)
  zone         = "us-central1-a"

  # Place the VM in the PUBLIC subnet (Front Door)
  network_interface {
    network    = google_compute_network.vpc_network.name
    subnetwork = google_compute_subnetwork.public.name # WIRED TO FRONT DOOR!

    # This gives it an external IP. 
    # REMOVED: "name = 'External NAT'" because access_config doesn't take a name argument.
    access_config {}
  }

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  # Add tags so firewall rules can target this VM (This is the CORRECT place for tags!)
  tags = ["web-server"]

  # Use the startup script
  metadata_startup_script = file("${path.module}/startup.sh")

  service_account {
    scopes = ["cloud-platform"]
  }
}

# ==========================================
# 6. THE OUTPUTS
# ==========================================
output "website_url" {
  value       = "http://${google_compute_instance.vm.network_interface[0].access_config[0].nat_ip}"
  description = "The URL to access your web server"
}

output "vpc_network_id" {
  value       = google_compute_network.vpc_network.id
  description = "The ID of our Secret Clubhouse VPC"
}

output "public_subnet_id" {
  value       = google_compute_subnetwork.public.id
  description = "The ID of the Front Door (Public Subnet)"
}

output "private_subnet_id" {
  value       = google_compute_subnetwork.private.id
  description = "The ID of the Back Room Vault (Private Subnet)"
}