terraform {
  required_version = ">= 1.5.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.0"
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

provider "azurerm" {
  features {}
}

provider "azuread" {}

locals {
  web_user_data = file("${path.module}/web_user_data.sh")
}

###############################################################
# Resource Group (The Azure "Folder")
###############################################################
resource "azurerm_resource_group" "main" {
  name     = "${var.project}-rg"
  location = var.azure_region
  tags     = var.default_tags
}

###############################################################
# Networking (VNet & Subnets)
###############################################################
resource "azurerm_virtual_network" "main" {
  name                = "${var.project}-vnet"
  address_space       = [var.vpc_cidr]
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  tags                = var.default_tags
}

resource "azurerm_subnet" "public" {
  name                 = "public-subnet-a"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = [var.public_subnet_cidr]
}

resource "azurerm_subnet" "private" {
  name                 = "private-subnet-a"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = [var.private_subnet_cidr]
}

###############################################################
# Network Security Groups (Azure Firewalls)
###############################################################
resource "azurerm_network_security_group" "bastion" {
  name                = "${var.project}-bastion-nsg"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  tags                = var.default_tags
}

resource "azurerm_network_security_rule" "bastion_ssh" {
  name                        = "AllowSSH"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = var.my_ip
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.main.name
  network_security_group_name = azurerm_network_security_group.bastion.name
}

resource "azurerm_network_security_group" "web" {
  name                = "${var.project}-web-nsg"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  tags                = var.default_tags
}

resource "azurerm_network_security_rule" "web_http" {
  name                   = "AllowHTTPFromBastion"
  priority               = 100
  direction              = "Inbound"
  access                 = "Allow"
  protocol               = "Tcp"
  source_port_range      = "*"
  destination_port_range = "80"
  # Only allow traffic originating from the Public Subnet (Bastion)
  source_address_prefix       = var.public_subnet_cidr
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.main.name
  network_security_group_name = azurerm_network_security_group.web.name
}

# Attach NSGs to Subnets
resource "azurerm_subnet_network_security_group_association" "public" {
  subnet_id                 = azurerm_subnet.public.id
  network_security_group_id = azurerm_network_security_group.bastion.id
}

resource "azurerm_subnet_network_security_group_association" "private" {
  subnet_id                 = azurerm_subnet.private.id
  network_security_group_id = azurerm_network_security_group.web.id
}

###############################################################
# SSH Key Generation
###############################################################
resource "tls_private_key" "ssh" {
  count     = var.create_new_key ? 1 : 0
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "ssh_private_key" {
  count           = var.create_new_key ? 1 : 0
  filename        = "${path.module}/${var.project}-key.pem"
  content         = tls_private_key.ssh[0].private_key_openssh
  file_permission = "0600"
}

###############################################################
# Public IP & Network Interfaces (NICs)
###############################################################
resource "azurerm_public_ip" "bastion" {
  name                = "${var.project}-bastion-pip"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  allocation_method   = "Static"
  sku                 = "Standard"
  zones               = [var.availability_zone]

  tags = var.default_tags
}

resource "azurerm_network_interface" "bastion" {
  name                = "${var.project}-bastion-nic"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  tags                = var.default_tags

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.public.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.bastion.id
  }
}

resource "azurerm_network_interface" "web" {
  name                = "${var.project}-web-nic"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  tags                = var.default_tags

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.private.id
    private_ip_address_allocation = "Dynamic"
  }
}

###############################################################
# Virtual Machines (Ubuntu)
###############################################################
resource "azurerm_linux_virtual_machine" "bastion" {
  name                  = "bastion-vm"
  resource_group_name   = azurerm_resource_group.main.name
  location              = azurerm_resource_group.main.location
  size                  = var.instance_type
  admin_username        = "azureuser"
  zone                  = var.availability_zone
  network_interface_ids = [azurerm_network_interface.bastion.id]
  tags                  = var.default_tags

  admin_ssh_key {
    username   = "azureuser"
    public_key = tls_private_key.ssh[0].public_key_openssh
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }
}

resource "azurerm_linux_virtual_machine" "web_private" {
  name                  = "web-private-vm"
  resource_group_name   = azurerm_resource_group.main.name
  location              = azurerm_resource_group.main.location
  size                  = var.instance_type
  admin_username        = "azureuser"
  zone                  = var.availability_zone
  network_interface_ids = [azurerm_network_interface.web.id]
  tags                  = var.default_tags
  custom_data           = base64encode(local.web_user_data)

  admin_ssh_key {
    username   = "azureuser"
    public_key = tls_private_key.ssh[0].public_key_openssh
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }
}

###############################################################
# Azure RBAC (Identity & Access Management)
###############################################################
resource "azuread_group" "admins" {
  display_name     = "Cloud-Admins"
  security_enabled = true
}

resource "azuread_group" "engineers" {
  display_name     = "Cloud-Engineers"
  security_enabled = true
}

resource "azuread_group" "auditors" {
  display_name     = "Cloud-Auditors"
  security_enabled = true
}

# Assign Azure Roles to the Groups at the Resource Group level
resource "azurerm_role_assignment" "admins" {
  scope                = azurerm_resource_group.main.id
  role_definition_name = "Owner"
  principal_id         = azuread_group.admins.object_id
}

resource "azurerm_role_assignment" "engineers" {
  scope                = azurerm_resource_group.main.id
  role_definition_name = "Contributor"
  principal_id         = azuread_group.engineers.object_id
}

resource "azurerm_role_assignment" "auditors" {
  scope                = azurerm_resource_group.main.id
  role_definition_name = "Reader"
  principal_id         = azuread_group.auditors.object_id
}


###############################################################
# Optional Entra ID Users
###############################################################

locals {
  entra_users = var.create_entra_users ? {
    "admin.lab" = {
      display_name = "Lab Admin"
      group_id     = azuread_group.admins.object_id
    }

    "engineer.lab" = {
      display_name = "Lab Engineer"
      group_id     = azuread_group.engineers.object_id
    }

    "auditor.lab" = {
      display_name = "Lab Auditor"
      group_id     = azuread_group.auditors.object_id
    }
  } : {}
}

resource "random_password" "entra_users" {
  for_each = local.entra_users

  length           = 16
  special          = true
  override_special = "!@#$%^&*()-_=+[]{}"
}

resource "azuread_user" "this" {
  for_each = local.entra_users

  user_principal_name = "${each.key}@${var.entra_domain_name}"
  display_name        = each.value.display_name
  mail_nickname       = replace(each.key, ".", "-")
  password            = random_password.entra_users[each.key].result

  force_password_change = true
}

resource "azuread_group_member" "this" {
  for_each = local.entra_users

  group_object_id  = each.value.group_id
  member_object_id = azuread_user.this[each.key].object_id
}

###############################################################
# Cost Governance (Azure Budgets)
###############################################################
resource "azurerm_consumption_budget_resource_group" "learning" {
  count = var.create_budget ? 1 : 0

  name              = "${var.project}-learning-budget"
  resource_group_id = azurerm_resource_group.main.id

  amount     = var.monthly_budget_limit
  time_grain = "Monthly"

  time_period {
    start_date = formatdate("YYYY-MM-01'T'00:00:00Z", timestamp())
    end_date   = timeadd(formatdate("YYYY-MM-01'T'00:00:00Z", timestamp()), "8760h")
  }

  notification {
    enabled        = true
    threshold      = 80.0
    operator       = "GreaterThan"
    threshold_type = "Actual"
    contact_emails = var.billing_alert_emails
  }
}