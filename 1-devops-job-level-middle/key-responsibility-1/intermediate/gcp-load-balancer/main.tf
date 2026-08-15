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
# CRITICAL: GCP Load Balancer Health Checks come from specific Google IP ranges.
# If we don't allow them, the LB will think our servers are dead and return 502 errors!
resource "google_compute_firewall" "allow_http_and_health" {
  name    = "allow-http-health-firewall"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = [
    "130.211.0.0/22", # GCP Health Check Range 1
    "35.191.0.0/16"   # GCP Health Check Range 2
  ]
  target_tags = ["web-server"]
}

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
# 9. THE MASTER BLUEPRINT (Instance Template)
# ==========================================
# Instead of building 3 individual VMs, we create a "Blueprint" (Template).
resource "google_compute_instance_template" "web_template" {
  name_prefix  = "web-template-"
  machine_type = "e2-micro"
  region       = "us-central1"

  disk {
    source_image = "debian-cloud/debian-12"
    auto_delete  = true
    boot         = true
  }

  network_interface {
    subnetwork = google_compute_subnetwork.public.id
    access_config {} # Ephemeral IP for outbound internet (to download Apache)
  }

  tags = ["web-server"]

  metadata_startup_script = file("${path.module}/startup.sh")

  service_account {
    email  = google_service_account.vm_sa.email
    scopes = ["cloud-platform"]
  }

  metadata = {
    ssh-keys = "${local.ssh_user}:${tls_private_key.ssh_key.public_key_openssh} ${local.ssh_user}"
  }

  lifecycle {
    create_before_destroy = true
  }
}

# ==========================================
# 10. THE PIZZA CHEF FLEET (Managed Instance Group)
# ==========================================
# The MIG uses the blueprint to automatically build and maintain 3 VMs 
# across different physical data centers (Zones) for High Availability!
resource "google_compute_region_instance_group_manager" "web_mig" {
  name               = "web-mig"
  region             = "us-central1"
  base_instance_name = "pizza-chef"

  version {
    instance_template = google_compute_instance_template.web_template.id
  }

  target_size = 3

  # Distribute across 3 distinct physical data centers!
  distribution_policy_zones = ["us-central1-a", "us-central1-b", "us-central1-c"]

  named_port {
    name = "http"
    port = 80
  }
}

# ==========================================
# 11. THE GLOBAL TRAFFIC COP (HTTP Load Balancer)
# ==========================================
# GCP's HTTP LB is Global and Layer 7. It reads every single HTTP request!

# The Health Inspector
resource "google_compute_health_check" "web_health_check" {
  name = "web-health-check"
  http_health_check {
    port         = 80
    request_path = "/"
  }
}

# The Clipboard (Backend Service)
resource "google_compute_backend_service" "web_backend" {
  name        = "web-backend-service"
  port_name   = "http"
  protocol    = "HTTP"
  timeout_sec = 10

  backend {
    group = google_compute_region_instance_group_manager.web_mig.instance_group
  }

  health_checks = [google_compute_health_check.web_health_check.id]
}

# The Map (URL Map)
resource "google_compute_url_map" "web_url_map" {
  name            = "web-url-map"
  default_service = google_compute_backend_service.web_backend.id
}

# The Receiver (Target HTTP Proxy)
resource "google_compute_target_http_proxy" "web_http_proxy" {
  name    = "web-http-proxy"
  url_map = google_compute_url_map.web_url_map.id
}

# The Permanent Global IP
resource "google_compute_global_address" "web_lb_ip" {
  name = "web-lb-ip"
}

# The Front Door (Global Forwarding Rule)
resource "google_compute_global_forwarding_rule" "web_forwarding_rule" {
  name       = "web-forwarding-rule"
  target     = google_compute_target_http_proxy.web_http_proxy.id
  port_range = "80"
  ip_address = google_compute_global_address.web_lb_ip.address
}

# ==========================================
# 12. THE OUTPUTS
# ==========================================
output "website_url" {
  value       = "http://${google_compute_global_address.web_lb_ip.address}"
  description = "The Global URL to access your load-balanced web servers"
}

output "vpc_network_id" {
  value       = google_compute_network.vpc_network.id
  description = "The ID of our Secret Clubhouse VPC"
}

output "bucket_name" {
  value       = google_storage_bucket.pizza_vault.name
  description = "The globally unique name of your Magic Storage Box"
}