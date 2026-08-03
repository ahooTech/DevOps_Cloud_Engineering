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
# 2. RESOURCE GROUP
# ==========================================
resource "azurerm_resource_group" "rg" {
  name     = "HelloCloud-RG"
  location = "East US"
}

# ==========================================
# 3. NETWORK
# ==========================================
resource "azurerm_virtual_network" "vnet" {
  name                = "HelloCloud-VNet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "subnet" {
  name                 = "HelloCloud-Subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

# ==========================================
# 4. NETWORK SECURITY GROUP
# ==========================================
resource "azurerm_network_security_group" "nsg" {
  name                = "HelloCloud-NSG"
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
# 5. PUBLIC IP
# ==========================================
resource "azurerm_public_ip" "pip" {
  name                = "HelloCloud-PublicIP"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

# ==========================================
# 6. NETWORK INTERFACE
# ==========================================
resource "azurerm_network_interface" "nic" {
  name                = "HelloCloud-NIC"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip.id
  }
}

resource "azurerm_network_interface_security_group_association" "nsg_assoc" {
  network_interface_id      = azurerm_network_interface.nic.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

# ==========================================
# 7. SSH KEY
# ==========================================
resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# ==========================================
# 8. LINUX VIRTUAL MACHINE
# ==========================================
resource "azurerm_linux_virtual_machine" "vm" {
  name                = "HelloCloud-VM"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  size = "Standard_D2s_v3"
  zone = "3"

  admin_username = "azureuser"

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
    offer     = "ubuntu-24_04-lts"
    sku       = "server"
    version   = "latest"
  }

  custom_data = base64encode(<<EOF
#!/bin/bash
apt-get update
apt-get install -y apache2
systemctl enable apache2
systemctl start apache2
echo "<h1>Hello from Terraform on Azure!</h1>" > /var/www/html/index.html
EOF
  )

  tags = {
    environment = "learning"
  }
}

# ==========================================
# 9. OUTPUTS
# ==========================================
output "public_ip" {
  description = "Public IP Address"
  value       = azurerm_public_ip.pip.ip_address
}

output "website_url" {
  description = "Apache Web Server URL"
  value       = "http://${azurerm_public_ip.pip.ip_address}"
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