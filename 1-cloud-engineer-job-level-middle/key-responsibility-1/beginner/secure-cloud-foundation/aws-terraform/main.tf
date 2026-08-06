terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
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

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project            = var.project
      Environment        = var.environment
      Purpose            = "cloud-engineer-training"
      DataClassification = "internal"
      CostCenter         = "learning"
    }
  }
}

###############################################################
# Data sources
###############################################################

data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_ami" "amazon_linux_2023" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023*-x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

###############################################################
# Local values
###############################################################

locals {
  create_new_key = var.create_key_pair && var.existing_key_name == ""

  ssh_key_name = var.existing_key_name != "" ? var.existing_key_name : (
    local.create_new_key ? aws_key_pair.ssh[0].key_name : null
  )

  web_user_data = file("${path.module}/web_user_data.sh")

  iam_users = var.create_iam_users ? {
    "admin.lab" = [
      aws_iam_group.admins.name
    ]

    "engineer.lab" = [
      aws_iam_group.engineers.name
    ]

    "auditor.lab" = [
      aws_iam_group.auditors.name
    ]
  } : {}
}

###############################################################
# SSH key pair
###############################################################

resource "tls_private_key" "ssh" {
  count = local.create_new_key ? 1 : 0

  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "ssh" {
  count = local.create_new_key ? 1 : 0

  key_name   = "${var.project}-key"
  public_key = tls_private_key.ssh[0].public_key_openssh

  tags = {
    Name = "${var.project}-key"
  }
}

resource "local_file" "ssh_private_key" {
  count = local.create_new_key ? 1 : 0

  filename        = "${path.module}/${var.project}-key.pem"
  content         = tls_private_key.ssh[0].private_key_pem
  file_permission = "0600"
}

###############################################################
# VPC
###############################################################

resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr

  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.project}-vpc"
  }
}

###############################################################
# Subnets
###############################################################

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidr
  availability_zone       = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-a"
  }
}

resource "aws_subnet" "private" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.private_subnet_cidr
  availability_zone       = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = false

  tags = {
    Name = "private-subnet-a"
  }
}

###############################################################
# Internet Gateway
###############################################################

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.project}-igw"
  }
}

###############################################################
# Route Tables
###############################################################

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "public-rt"
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "private-rt"
  }
}

resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}

###############################################################
# Security Groups
###############################################################

resource "aws_security_group" "bastion" {
  name        = "${var.project}-bastion-sg"
  description = "Allow SSH only from administrator IP"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "SSH from admin IP only"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "bastion-sg"
  }
}

resource "aws_security_group" "web" {
  name        = "${var.project}-web-sg"
  description = "Allow HTTP only from bastion security group"
  vpc_id      = aws_vpc.main.id

  egress {
    description = "Allow outbound traffic within VPC only"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.vpc_cidr]
  }

  tags = {
    Name = "web-sg"
  }
}

resource "aws_security_group_rule" "web_http_from_bastion" {
  type                     = "ingress"
  description              = "HTTP from bastion only"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.bastion.id
  security_group_id        = aws_security_group.web.id
}

###############################################################
# EC2 Instances
###############################################################

resource "aws_instance" "bastion" {
  ami                         = data.aws_ami.amazon_linux_2023.id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = [aws_security_group.bastion.id]
  associate_public_ip_address = true
  key_name                    = local.ssh_key_name

  metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 1
  }

  root_block_device {
    volume_type           = "gp3"
    volume_size           = 8
    encrypted             = true
    delete_on_termination = true
  }

  tags = {
    Name = "bastion"
  }

  depends_on = [
    aws_internet_gateway.main
  ]
}

resource "aws_instance" "web_private" {
  ami                         = data.aws_ami.amazon_linux_2023.id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.private.id
  vpc_security_group_ids      = [aws_security_group.web.id]
  associate_public_ip_address = false
  key_name                    = local.ssh_key_name

  user_data                   = local.web_user_data
  user_data_replace_on_change = true

  metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 1
  }

  root_block_device {
    volume_type           = "gp3"
    volume_size           = 8
    encrypted             = true
    delete_on_termination = true
  }

  tags = {
    Name = "web-private"
  }
}

###############################################################
# IAM Account Password Policy
###############################################################

resource "aws_iam_account_password_policy" "strict" {
  count = var.manage_password_policy ? 1 : 0

  minimum_password_length        = 14
  require_lowercase_characters   = true
  require_numbers                = true
  require_uppercase_characters   = true
  require_symbols                = true
  allow_users_to_change_password = true
  password_reuse_prevention      = 24
  max_password_age               = 90
}

###############################################################
# IAM Groups
###############################################################

resource "aws_iam_group" "admins" {
  name = "Admins"
}

resource "aws_iam_group" "engineers" {
  name = "CloudEngineers"
}

resource "aws_iam_group" "auditors" {
  name = "Auditors"
}

###############################################################
# IAM Group Policy Attachments
###############################################################

resource "aws_iam_group_policy_attachment" "admins_administrator_access" {
  group      = aws_iam_group.admins.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_group_policy_attachment" "engineers_power_user_access" {
  group      = aws_iam_group.engineers.name
  policy_arn = "arn:aws:iam::aws:policy/PowerUserAccess"
}

resource "aws_iam_group_policy_attachment" "engineers_iam_read_only" {
  group      = aws_iam_group.engineers.name
  policy_arn = "arn:aws:iam::aws:policy/IAMReadOnlyAccess"
}

resource "aws_iam_group_policy_attachment" "engineers_change_own_password" {
  group      = aws_iam_group.engineers.name
  policy_arn = "arn:aws:iam::aws:policy/IAMUserChangePassword"
}

resource "aws_iam_group_policy_attachment" "auditors_read_only" {
  group      = aws_iam_group.auditors.name
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

resource "aws_iam_group_policy_attachment" "auditors_change_own_password" {
  group      = aws_iam_group.auditors.name
  policy_arn = "arn:aws:iam::aws:policy/IAMUserChangePassword"
}

###############################################################
# IAM Users
###############################################################

resource "aws_iam_user" "this" {
  for_each = local.iam_users

  name = each.key
}

resource "aws_iam_user_group_membership" "this" {
  for_each = local.iam_users

  user   = aws_iam_user.this[each.key].name
  groups = each.value
}

resource "aws_iam_user_login_profile" "this" {
  for_each = local.iam_users

  user                    = aws_iam_user.this[each.key].name
  password_length         = 16
  password_reset_required = true
}

###############################################################
# AWS Budget - FinOps / Cost Governance
###############################################################

resource "aws_budgets_budget" "learning" {
  count = var.create_budget && var.billing_alert_emails != "" ? 1 : 0

  name         = "${var.project}-learning-budget"
  budget_type  = "COST"
  limit_amount = var.monthly_budget_limit
  limit_unit   = "USD"
  time_unit    = "MONTHLY"

  notification {
    comparison_operator        = "GREATER_THAN"
    notification_type          = "ACTUAL"
    threshold                  = 80
    threshold_type             = "PERCENTAGE"
    subscriber_email_addresses = var.billing_alert_emails # Changed this line
  }

}