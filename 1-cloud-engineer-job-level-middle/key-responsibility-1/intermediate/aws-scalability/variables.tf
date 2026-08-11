variable "aws_region" {
  description = "AWS region where resources will be created"
  type        = string
  default     = "us-east-1"
}

variable "project" {
  description = "Project name used for naming resources"
  type        = string
  default     = "jubilee-cloud-foundation"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
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
  description = "EC2 instance type. Use a small/free-tier eligible type."
  type        = string
  default     = "t2.micro"
}

variable "my_ip" {
  description = "Your public IP address in CIDR format, example: 197.232.10.55/32"
  type        = string

  validation {
    condition     = can(cidrhost(var.my_ip, 0))
    error_message = "The my_ip value must be a valid CIDR block, for example: 197.232.10.55/32"
  }
}

variable "create_key_pair" {
  description = "Set to true to generate a new SSH key pair using Terraform"
  type        = bool
  default     = true
}

variable "existing_key_name" {
  description = "Optional existing AWS EC2 key pair name. If set, Terraform will not create a new key."
  type        = string
  default     = ""
}

variable "create_iam_users" {
  description = "Set to true to create IAM users, login profiles, and group memberships"
  type        = bool
  default     = true
}

variable "manage_password_policy" {
  description = "Set to true only if your AWS account does not already have an IAM password policy."
  type        = bool
  default     = true
}

variable "create_budget" {
  description = "Set to true to create an AWS Budget for cost governance"
  type        = bool
  default     = true
}

variable "monthly_budget_limit" {
  description = "Monthly budget limit in USD"
  type        = string
  default     = "5"
}

variable "billing_alert_emails" {
  description = "List of email addresses to receive budget alerts."
  type        = list(string)
  default     = []
}

variable "public_subnet_b_cidr" {
  description = "CIDR block for the second public subnet"
  type        = string
  default     = "10.0.3.0/24"
}

variable "private_subnet_b_cidr" {
  description = "CIDR block for the second private subnet"
  type        = string
  default     = "10.0.4.0/24"
}