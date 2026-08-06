variable "azure_region" {
  description = "Azure region where resources will be created"
  type        = string
  default     = "eastus"
}

variable "project" {
  description = "Project name used for naming resources"
  type        = string
  default     = "jubilee-azure-foundation"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "vpc_cidr" {
  description = "CIDR block for the VNet"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "instance_type" {
  description = "Azure VM size. Standard_B1s is very cheap/free-tier eligible."
  type        = string
  default     = "Standard_D2s_v3"
}


variable "availability_zone" {
  description = "Azure Availability Zone to use"
  type        = string
  default     = "3"
}

variable "my_ip" {
  description = "Your public IP address in CIDR format"
  type        = string
}

variable "create_new_key" {
  description = "Generate a new SSH key pair"
  type        = bool
  default     = true
}

variable "create_budget" {
  description = "Create an Azure Cost Management Budget"
  type        = bool
  default     = true
}

variable "monthly_budget_limit" {
  description = "Monthly budget limit in USD"
  type        = number
  default     = 5
}

variable "billing_alert_emails" {
  description = "List of emails for budget alerts"
  type        = list(string)
  default     = []
}

variable "default_tags" {
  type = map(string)
  default = {
    Project            = "jubilee-azure-foundation"
    Environment        = "dev"
    Purpose            = "cloud-engineer-training"
    DataClassification = "internal"
    CostCenter         = "learning"
  }
}

variable "create_entra_users" {
  description = "Set to true to create Entra ID users and add them to groups"
  type        = bool
  default     = false
}

variable "entra_domain_name" {
  description = "Your Azure Entra ID domain, example: yourtenant.onmicrosoft.com"
  type        = string
  default     = ""
}