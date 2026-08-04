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
# 3. THE SECRET CLUBHOUSE (Virtual Network)
# ==========================================
resource "azurerm_virtual_network" "vnet" {
  name                = "SecretClubhouse-VNet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

# ==========================================
# 4. THE ROOMS (Subnets)
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
  # Note: In Azure, a subnet is private by default unless a Public IP or 
  # NAT Gateway is explicitly attached to resources inside it.
}

# ==========================================
# 5. NETWORK SECURITY GROUP (The Security Guard)
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
# 6. PUBLIC IP (The Permanent Nameplate)
# ==========================================
resource "azurerm_public_ip" "pip" {
  name                = "Clubhouse-PublicIP"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

# ==========================================
# 7. NETWORK INTERFACE (The Wiring)
# ==========================================
resource "azurerm_network_interface" "nic" {
  name                = "Clubhouse-NIC"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.public.id # WIRED TO THE FRONT DOOR!
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip.id
  }
}

resource "azurerm_network_interface_security_group_association" "nsg_assoc" {
  network_interface_id      = azurerm_network_interface.nic.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

# ==========================================
# 8. SSH KEY
# ==========================================
resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# ==========================================
# 9. LINUX VIRTUAL MACHINE (The Computer)
# ==========================================
resource "azurerm_linux_virtual_machine" "vm" {
  name                = "Clubhouse-VM"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = "Standard_D2s_v3" # Change to B1s to save you money (B-series is cheaper for learning!)
  zone                = "3"

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
    offer     = "0001-com-ubuntu-server-jammy" # Updated to a highly stable, standard Ubuntu LTS
    sku       = "22_04-lts"
    version   = "latest"
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
# 10. OUTPUTS
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
  value       = "ssh azureuser@${azurerm_public_ip.pip.ip_address}"
}

output "private_key" {
  description = "Private SSH key"
  value       = tls_private_key.ssh_key.private_key_pem
  sensitive   = true
}