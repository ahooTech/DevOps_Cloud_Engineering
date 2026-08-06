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
  ssh_metadata = "ubuntu:${tls_private_key.ssh.public_key_openssh}"

  bastion_startup_script = <<EOF
#!/bin/bash
apt-get update
apt-get install -y curl
EOF

  web_user_data = file("${path.module}/web_user_data.sh")
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
# VPC network
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

###############################################################
# Subnets
###############################################################

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

###############################################################
# Workload service accounts
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
# Human IAM Role Assignments (RBAC)
# Maps Gmail accounts to GCP Project Roles
###############################################################

locals {
  iam_bindings = flatten([
    for role, members in {
      "roles/editor"                          = concat(var.admin_members, var.engineer_members) # did not use "roles/owner" due to ORG_MUST_INVITE_EXTERNAL_OWNERS policy. Email must be invited via GUI
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

  project = var.project_id
  role    = each.value.role
  member  = each.value.member

  depends_on = [
    google_project_service.services
  ]
}

###############################################################
# Compute instances
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

resource "google_compute_instance" "web_private" {
  name         = "web-private"
  project      = var.project_id
  zone         = var.zone
  machine_type = var.machine_type
  tags         = ["web"]

  boot_disk {
    initialize_params {
      image = "projects/ubuntu-os-cloud/global/images/family/ubuntu-2204-lts"
      size  = 10
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.private.id

    # No access_config means no external IP.
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

  depends_on = [
    google_project_service.services
  ]
}

###############################################################
# Budget alert email channels
###############################################################

resource "google_monitoring_notification_channel" "budget_email" {
  for_each = toset(var.billing_alert_emails)

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

###############################################################
# Billing budget - FinOps / Cost Governance
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