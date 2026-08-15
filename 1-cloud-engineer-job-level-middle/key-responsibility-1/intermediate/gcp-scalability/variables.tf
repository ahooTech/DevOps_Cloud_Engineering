variable "project_id" {
  description = "Existing GCP project ID where resources will be created"
  type        = string
}

variable "project" {
  description = "Project naming prefix"
  type        = string
  default     = "jubilee-gcp-foundation"
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "GCP zone inside the region"
  type        = string
  default     = "us-central1-a"
}

variable "machine_type" {
  description = "GCP VM machine type"
  type        = string
  default     = "e2-micro"
}

variable "network_cidr" {
  description = "VPC CIDR range"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "Public subnet CIDR range"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "Private subnet CIDR range"
  type        = string
  default     = "10.0.2.0/24"
}

variable "my_ip" {
  description = "Your public IP address in CIDR format, example: 197.232.10.55/32"
  type        = string

  validation {
    condition     = can(cidrhost(var.my_ip, 0))
    error_message = "The my_ip value must be a valid CIDR block, for example: 197.232.10.55/32."
  }
}

variable "billing_account_id" {
  description = "GCP billing account ID. Required for budget creation."
  type        = string

  validation {
    condition     = length(trimspace(var.billing_account_id)) > 0
    error_message = "billing_account_id is required because the budget is mandatory in this implementation."
  }
}

variable "monthly_budget_limit" {
  description = "Monthly budget limit in USD"
  type        = number
  default     = 5
}

variable "billing_alert_emails" {
  description = "Email addresses to receive budget alerts"
  type        = list(string)

  validation {
    condition     = length(var.billing_alert_emails) > 0
    error_message = "At least one billing alert email address is required."
  }
}


variable "admin_members" {
  description = "Gmail accounts for Project Administrators"
  type        = list(string)
  default     = []
}

variable "engineer_members" {
  description = "Gmail accounts for Engineer (Editor) role"
  type        = list(string)
  default     = []
}

variable "auditor_members" {
  description = "Gmail accounts for Auditor (Viewer) role"
  type        = list(string)
  default     = []
}
