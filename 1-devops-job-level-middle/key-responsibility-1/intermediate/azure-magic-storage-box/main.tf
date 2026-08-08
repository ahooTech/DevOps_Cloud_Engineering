# ==========================================
# 1. TERRAFORM & PROVIDERS
# ==========================================
terraform {
  required_version = ">= 1.8"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.117"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# ==========================================
# 2. RESOURCE GROUP (The Property Deed)
# ==========================================
resource "azurerm_resource_group" "rg" {
  name     = "SecretClubhouse-RG"
  location = "East US"
}

# ==========================================
# 3. THE MAGIC NAMING HAT (Random Generator for Storage)
# ==========================================
# Azure storage names must be globally unique, lowercase, and numbers only
resource "random_string" "storage_suffix" {
  length  = 8
  special = false
  upper   = false
}

# ==========================================
# 4. THE SECRET CLUBHOUSE (Virtual Network)
# ==========================================
resource "azurerm_virtual_network" "vnet" {
  name                = "SecretClubhouse-VNet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

# ==========================================
# 5. THE ROOMS (Subnets)
# ==========================================
# The Front Door (Public)
resource "azurerm_subnet" "public" {
  name                 = "PublicSubnet-FrontDoor"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

# The Vault (Private - Completely hidden from the internet)
resource "azurerm_subnet" "private" {
  name                 = "PrivateSubnet-Vault"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

# ==========================================
# 6. NETWORK SECURITY GROUP (The Security Guard)
# ==========================================
resource "azurerm_network_security_group" "nsg" {
  name                = "Clubhouse-NSG"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  security_rule {
    name                       = "AllowHTTP"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  # NEW: Open Port 443 for HTTPS to match AWS!
  security_rule {
    name                       = "AllowHTTPS"
    priority                   = 105
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "AllowSSH"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

# ==========================================
# 7. PUBLIC IP (The Permanent Nameplate)
# ==========================================
resource "azurerm_public_ip" "pip" {
  name                = "Clubhouse-PublicIP"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

# ==========================================
# 8. NETWORK INTERFACE (The Wiring)
# ==========================================
resource "azurerm_network_interface" "nic" {
  name                = "Clubhouse-NIC"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.public.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip.id
  }
}

resource "azurerm_network_interface_security_group_association" "nsg_assoc" {
  network_interface_id      = azurerm_network_interface.nic.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

# ==========================================
# 9. SSH KEY & LOCAL FILE (The Front Door Key)
# ==========================================
resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Save the private key directly into your project directory!
resource "local_file" "private_key" {
  content         = tls_private_key.ssh_key.private_key_pem
  filename        = "${path.module}/my-devops-key-azure.pem"
  file_permission = "0400"
}

# ==========================================
# 10. THE MAGIC STORAGE BOX (Azure Storage Account)
# ==========================================
resource "azurerm_storage_account" "pizza_vault" {
  name                     = "pizzavault${random_string.storage_suffix.result}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    Name = "MagicStorageBox-Azure"
  }
}

resource "azurerm_storage_container" "recipes" {
  name                  = "recipes"
  storage_account_name  = azurerm_storage_account.pizza_vault.name
  container_access_type = "private"
}

# ==========================================
# 11. LINUX VIRTUAL MACHINE (The Computer)
# ==========================================
resource "azurerm_linux_virtual_machine" "vm" {
  name                = "Clubhouse-VM"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = "Standard_D2s_v3" # Retained as requested
  zone                = "3"               # Retained as requested

  admin_username                  = "azureuser"
  disable_password_authentication = true

  network_interface_ids = [
    azurerm_network_interface.nic.id
  ]

  admin_ssh_key {
    username   = "azureuser"
    public_key = tls_private_key.ssh_key.public_key_openssh
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  # THE SECURITY BADGE (Managed Identity - Azure's version of IAM Instance Profile)
  identity {
    type = "SystemAssigned"
  }

  custom_data = base64encode(<<EOF
#!/bin/bash
apt-get update
apt-get install -y apache2
systemctl enable apache2
systemctl start apache2
echo "<h1>Hello from my Terraform-built Azure Computer inside a Custom VNet!</h1>" > /var/www/html/index.html
EOF
  )

  tags = {
    environment = "learning"
    project     = "SecretClubhouse"
  }
}

# ==========================================
# 12. THE SECURITY BADGE PERMISSIONS (Role Assignment)
# ==========================================
# This gives the VM's identity permission to read/write to the Storage Account
resource "azurerm_role_assignment" "vm_storage_access" {
  scope                = azurerm_storage_account.pizza_vault.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azurerm_linux_virtual_machine.vm.identity[0].principal_id
}

# ==========================================
# 13. OUTPUTS
# ==========================================
output "website_url" {
  description = "Apache Web Server URL"
  value       = "http://${azurerm_public_ip.pip.ip_address}"
}

output "vnet_id" {
  description = "The ID of our Secret Clubhouse VNet"
  value       = azurerm_virtual_network.vnet.id
}

output "public_subnet_id" {
  description = "The ID of the Front Door"
  value       = azurerm_subnet.public.id
}

output "private_subnet_id" {
  description = "The ID of the Back Room Vault"
  value       = azurerm_subnet.private.id
}

output "ssh_command" {
  description = "SSH into the VM"
  value       = "ssh -i my-devops-key-azure.pem azureuser@${azurerm_public_ip.pip.ip_address}"
}

output "storage_account_name" {
  description = "The globally unique name of your Magic Storage Box"
  value       = azurerm_storage_account.pizza_vault.name
}