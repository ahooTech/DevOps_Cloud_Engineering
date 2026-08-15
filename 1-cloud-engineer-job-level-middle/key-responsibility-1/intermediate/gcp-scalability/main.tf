terraform {
  required_version = ">= 1.5.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

provider "google" {
  impersonate_service_account = "terraform-sa@project-2978a6d6-1bf2-4d65-996.iam.gserviceaccount.com"
  project                     = var.project_id
  region                      = var.region
  zone                        = var.zone
}

###############################################################
# Local values
###############################################################
locals {
  ssh_metadata           = "ubuntu:${tls_private_key.ssh.public_key_openssh}"
  bastion_startup_script = <<EOF
#!/bin/bash
apt-get update
apt-get install -y curl
EOF
  web_user_data          = file("${path.module}/web_user_data.sh")
}

###############################################################
# Enable required GCP APIs
###############################################################
resource "google_project_service" "services" {
  for_each = toset([
    "compute.googleapis.com",
    "iam.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "billingbudgets.googleapis.com",
    "monitoring.googleapis.com",
  ])
  project            = var.project_id
  service            = each.value
  disable_on_destroy = false
}

###############################################################
# SSH key pair
###############################################################
resource "tls_private_key" "ssh" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "ssh_private_key" {
  filename        = "${path.module}/${var.project}-key.pem"
  content         = tls_private_key.ssh.private_key_pem
  file_permission = "0600"
}

###############################################################
# VPC network & subnets (subnets are REGIONAL in GCP, like Azure)
###############################################################
resource "google_compute_network" "main" {
  name                    = "${var.project}-vpc"
  project                 = var.project_id
  auto_create_subnetworks = false
  routing_mode            = "REGIONAL"
  depends_on = [
    google_project_service.services
  ]
}

resource "google_compute_subnetwork" "public" {
  name          = "public-subnet-a"
  project       = var.project_id
  region        = var.region
  network       = google_compute_network.main.id
  ip_cidr_range = var.public_subnet_cidr
}

resource "google_compute_subnetwork" "private" {
  name          = "private-subnet-a"
  project       = var.project_id
  region        = var.region
  network       = google_compute_network.main.id
  ip_cidr_range = var.private_subnet_cidr
}

###############################################################
# Firewall rules
###############################################################
resource "google_compute_firewall" "allow_ssh_to_bastion" {
  name    = "allow-ssh-to-bastion"
  project = var.project_id
  network = google_compute_network.main.name

  direction = "INGRESS"
  priority  = 1000

  source_ranges = [var.my_ip]
  target_tags   = ["bastion"]

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
}

# Kept from Level 1: lets you curl the web app FROM the bastion
resource "google_compute_firewall" "allow_http_from_bastion_to_web" {
  name    = "allow-http-from-bastion-to-web"
  project = var.project_id
  network = google_compute_network.main.name

  direction = "INGRESS"
  priority  = 1000

  source_tags = ["bastion"]
  target_tags = ["web"]

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
}

# NEW (Level 2): Allow HTTP from the GCP Load Balancer & health checkers only.
# These two ranges are Google's documented LB/health-check source ranges.
resource "google_compute_firewall" "allow_http_lb_to_web" {
  name    = "allow-http-lb-to-web"
  project = var.project_id
  network = google_compute_network.main.name

  direction = "INGRESS"
  priority  = 1000

  source_ranges = ["130.211.0.0/22", "35.191.0.0/16"]
  target_tags   = ["web"]

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
}

# NEW (Level 2): SSH to scale-group instances via the bastion subnet only
resource "google_compute_firewall" "allow_ssh_from_bastion_to_web" {
  name    = "allow-ssh-from-bastion-to-web"
  project = var.project_id
  network = google_compute_network.main.name

  direction = "INGRESS"
  priority  = 1000

  source_ranges = [var.public_subnet_cidr]
  target_tags   = ["web"]

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
}

###############################################################
# Workload service accounts (least privilege)
###############################################################
resource "google_service_account" "bastion" {
  account_id   = "bastion-sa"
  display_name = "Bastion Service Account"
  project      = var.project_id
  depends_on = [
    google_project_service.services
  ]
}

resource "google_service_account" "web" {
  account_id   = "web-sa"
  display_name = "Private Web Service Account"
  project      = var.project_id
  depends_on = [
    google_project_service.services
  ]
}

resource "google_project_iam_member" "bastion_logging" {
  project = var.project_id
  role    = "roles/logging.logWriter"
  member  = "serviceAccount:${google_service_account.bastion.email}"
}

resource "google_project_iam_member" "bastion_monitoring" {
  project = var.project_id
  role    = "roles/monitoring.metricWriter"
  member  = "serviceAccount:${google_service_account.bastion.email}"
}

resource "google_project_iam_member" "web_logging" {
  project = var.project_id
  role    = "roles/logging.logWriter"
  member  = "serviceAccount:${google_service_account.web.email}"
}

resource "google_project_iam_member" "web_monitoring" {
  project = var.project_id
  role    = "roles/monitoring.metricWriter"
  member  = "serviceAccount:${google_service_account.web.email}"
}

###############################################################
# Bastion host (public subnet) — unchanged from Level 1
###############################################################
resource "google_compute_instance" "bastion" {
  name         = "bastion"
  project      = var.project_id
  zone         = var.zone
  machine_type = var.machine_type
  tags         = ["bastion"]

  boot_disk {
    initialize_params {
      image = "projects/ubuntu-os-cloud/global/images/family/ubuntu-2204-lts"
      size  = 10
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.public.id
    access_config {
      # Ephemeral external IP
    }
  }

  metadata = {
    ssh-keys = local.ssh_metadata
  }

  metadata_startup_script = local.bastion_startup_script

  service_account {
    email = google_service_account.bastion.email
    scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring.write"
    ]
  }

  depends_on = [
    google_project_service.services
  ]
}

###############################################################
# LEVEL 2: Instance Template (the GCP "Launch Template")
# NOTE: the old single web_private VM is REMOVED — the MIG replaces it.
###############################################################
resource "google_compute_instance_template" "web" {
  name_prefix  = "${var.project}-web-"
  machine_type = var.machine_type
  region       = var.region

  tags = ["web"]

  labels = {
    project            = var.project
    environment        = "dev"
    purpose            = "cloud-engineer-training"
    dataclassification = "internal"
    costcenter         = "learning"
  }

  disk {
    source_image = "projects/ubuntu-os-cloud/global/images/family/ubuntu-2204-lts"
    auto_delete  = true
    boot         = true
    disk_size_gb = 10
  }

  # NO external IP -> private instances, reachable only via LB or bastion
  network_interface {
    subnetwork = google_compute_subnetwork.private.id
  }

  metadata = {
    ssh-keys = local.ssh_metadata
  }

  metadata_startup_script = local.web_user_data

  service_account {
    email = google_service_account.web.email
    scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring.write"
    ]
  }

  lifecycle {
    create_before_destroy = true
  }
}

###############################################################
# LEVEL 2: Health Check (LB probe + self-healing)
###############################################################
resource "google_compute_health_check" "web" {
  name    = "${var.project}-web-hc"
  project = var.project_id

  check_interval_sec  = 15
  timeout_sec         = 5
  healthy_threshold   = 2
  unhealthy_threshold = 2

  http_health_check {
    port         = 80
    request_path = "/"
  }
}

###############################################################
# LEVEL 2: Regional Managed Instance Group
# GCP equivalent of AWS ASG / Azure VMSS
# Spreads instances across the region's zones
###############################################################
resource "google_compute_region_instance_group_manager" "web" {
  name    = "${var.project}-web-mig"
  project = var.project_id
  region  = var.region

  base_instance_name = "web"
  target_size        = 3

  version {
    instance_template = google_compute_instance_template.web.id
  }

  # Spread VMs across the region's zones
  distribution_policy_target_shape = "EVEN"

  named_port {
    name = "http"
    port = 80
  }

  # Self-healing
  auto_healing_policies {
    health_check      = google_compute_health_check.web.id
    initial_delay_sec = 120
  }

  update_policy {
    type                         = "PROACTIVE"
    minimal_action               = "REPLACE"
    instance_redistribution_type = "PROACTIVE"
    max_surge_fixed              = 3
    max_unavailable_fixed        = 3
  }

  # The autoscaler owns the instance count
  lifecycle {
    ignore_changes = [target_size]
  }
}

###############################################################
# LEVEL 2: Autoscaler (the GCP "scaling brain")
# Scale OUT when avg CPU > 60%, scale IN when it drops (same as AWS/Azure)
###############################################################
resource "google_compute_region_autoscaler" "web" {
  name    = "${var.project}-web-autoscaler"
  project = var.project_id
  region  = var.region
  target  = google_compute_region_instance_group_manager.web.id

  autoscaling_policy {
    min_replicas    = 1
    max_replicas    = 3
    cooldown_period = 300

    cpu_utilization {
      target = 0.6
    }
  }
}

###############################################################
# LEVEL 2: External HTTP Load Balancer (the GCP "traffic cop")
# global address -> forwarding rule -> proxy -> url map -> backend -> MIG
###############################################################
resource "google_compute_global_address" "lb" {
  name    = "${var.project}-lb-ip"
  project = var.project_id
}

resource "google_compute_backend_service" "web" {
  name      = "${var.project}-web-backend"
  project   = var.project_id
  protocol  = "HTTP"
  port_name = "http"

  backend {
    group = google_compute_region_instance_group_manager.web.instance_group
  }

  health_checks = [google_compute_health_check.web.id]
}

resource "google_compute_url_map" "web" {
  name            = "${var.project}-web-urlmap"
  project         = var.project_id
  default_service = google_compute_backend_service.web.id
}

resource "google_compute_target_http_proxy" "web" {
  name    = "${var.project}-web-proxy"
  project = var.project_id
  url_map = google_compute_url_map.web.id
}

resource "google_compute_global_forwarding_rule" "web" {
  name       = "${var.project}-web-lb"
  project    = var.project_id
  target     = google_compute_target_http_proxy.web.id
  ip_address = google_compute_global_address.lb.address
  port_range = "80"
}

###############################################################
# Human IAM Role Assignments (RBAC) — unchanged from Level 1
###############################################################
locals {
  iam_bindings = flatten([
    for role, members in {
      "roles/editor"                          = concat(var.admin_members, var.engineer_members)
      "roles/resourcemanager.projectIamAdmin" = var.admin_members
      "roles/viewer"                          = var.auditor_members
      } : [
      for member in members : {
        role   = role
        member = member
      }
    ]
  ])
}

resource "google_project_iam_member" "human_roles" {
  for_each = { for idx, binding in local.iam_bindings : "${binding.role}-${binding.member}" => binding }
  project  = var.project_id
  role     = each.value.role
  member   = each.value.member
  depends_on = [
    google_project_service.services
  ]
}

###############################################################
# Billing budget - FinOps / Cost Governance — unchanged
###############################################################
resource "google_billing_budget" "learning" {
  billing_account = var.billing_account_id
  display_name    = "${var.project}-learning-budget"

  amount {
    specified_amount {
      currency_code = "USD"
      units         = tostring(var.monthly_budget_limit)
    }
  }

  threshold_rules {
    threshold_percent = 0.8
  }

  all_updates_rule {
    monitoring_notification_channels = [
      for channel in google_monitoring_notification_channel.budget_email : channel.id
    ]
  }

  depends_on = [
    google_project_service.services
  ]
}

resource "google_monitoring_notification_channel" "budget_email" {
  for_each     = toset(var.billing_alert_emails)
  project      = var.project_id
  display_name = "Budget alert - ${each.value}"
  type         = "email"
  labels = {
    email_address = each.value
  }
  depends_on = [
    google_project_service.services
  ]
}