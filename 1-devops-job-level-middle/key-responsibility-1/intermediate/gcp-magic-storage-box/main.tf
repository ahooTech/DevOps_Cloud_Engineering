# ==========================================
# 1. TERRAFORM & PROVIDERS
# ==========================================
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4"
    }
  }
}

provider "google" {
  project = "project-2978a6d6-1bf2-4d65-996"
  region  = "us-central1"
  zone    = "us-central1-a"
}

# ==========================================
# 2. THE MAGIC NAMING HAT (Random Generator)
# ==========================================
resource "random_string" "bucket_suffix" {
  length  = 8
  special = false
  upper   = false
}

locals {
  ssh_user = "gcpuser"
}

# ==========================================
# 3. THE SECRET CLUBHOUSE (Custom VPC Network)
# ==========================================
resource "google_compute_network" "vpc_network" {
  name                    = "secret-clubhouse-network"
  auto_create_subnetworks = false
}

# ==========================================
# 4. THE ROOMS (Subnets)
# ==========================================
resource "google_compute_subnetwork" "public" {
  name                     = "public-subnet-frontdoor"
  ip_cidr_range            = "10.0.1.0/24"
  region                   = "us-central1"
  network                  = google_compute_network.vpc_network.id
  private_ip_google_access = false
}

resource "google_compute_subnetwork" "private" {
  name                     = "private-subnet-vault"
  ip_cidr_range            = "10.0.2.0/24"
  region                   = "us-central1"
  network                  = google_compute_network.vpc_network.id
  private_ip_google_access = true
}

# ==========================================
# 5. THE SECURITY GUARD (Firewall Rules)
# ==========================================
resource "google_compute_firewall" "allow_http" {
  name    = "allow-http-firewall"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["web-server"]
}

# NEW: Open Port 443 for HTTPS to match AWS!
resource "google_compute_firewall" "allow_https" {
  name    = "allow-https-firewall"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["443"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["web-server"]
}

resource "google_compute_firewall" "allow_ssh" {
  name    = "allow-ssh-firewall"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["web-server"]
}

# ==========================================
# 6. THE MAGIC STORAGE BOX (GCS Bucket)
# ==========================================
resource "google_storage_bucket" "pizza_vault" {
  name          = "pizza-vault-${random_string.bucket_suffix.result}"
  location      = "US"
  force_destroy = true

  uniform_bucket_level_access = true
}

# ==========================================
# 7. THE SECURITY BADGE (Service Account & Permissions)
# ==========================================
resource "google_service_account" "vm_sa" {
  account_id   = "clubhouse-vm-sa"
  display_name = "Clubhouse VM Service Account"
}

# Give the Service Account permission to read/write objects in the bucket
resource "google_storage_bucket_iam_member" "sa_storage_admin" {
  bucket = google_storage_bucket.pizza_vault.name
  role   = "roles/storage.objectAdmin"
  member = "serviceAccount:${google_service_account.vm_sa.email}"
}

# ==========================================
# 8. THE FRONT DOOR KEY (Auto-Generated SSH Key)
# ==========================================
resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "private_key" {
  content         = tls_private_key.ssh_key.private_key_pem
  filename        = "${path.module}/my-devops-key-gcp.pem"
  file_permission = "0400"
}

# ==========================================
# 9. THE VIRTUAL COMPUTER (VM)
# ==========================================
resource "google_compute_instance" "vm" {
  name         = "clubhouse-vm"
  machine_type = "e2-micro"
  zone         = "us-central1-a"

  network_interface {
    network    = google_compute_network.vpc_network.name
    subnetwork = google_compute_subnetwork.public.name

    access_config {}
  }

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  tags = ["web-server"]

  metadata_startup_script = file("${path.module}/startup.sh")

  # WEAR THE LANYARD! (Attach the custom Service Account)
  service_account {
    email  = google_service_account.vm_sa.email
    scopes = ["cloud-platform"]
  }

  # USE THE KEY! (Inject SSH key via metadata)
  metadata = {
    ssh-keys = "${local.ssh_user}:${tls_private_key.ssh_key.public_key_openssh} ${local.ssh_user}"
  }
}

# ==========================================
# 10. THE OUTPUTS
# ==========================================
output "website_url" {
  value       = "http://${google_compute_instance.vm.network_interface[0].access_config[0].nat_ip}"
  description = "The URL to access your web server"
}

output "ssh_command" {
  value       = "ssh -i my-devops-key-gcp.pem ${local.ssh_user}@${google_compute_instance.vm.network_interface[0].access_config[0].nat_ip}"
  description = "The exact command to SSH into your server"
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

output "bucket_name" {
  value       = google_storage_bucket.pizza_vault.name
  description = "The globally unique name of your Magic Storage Box"
}