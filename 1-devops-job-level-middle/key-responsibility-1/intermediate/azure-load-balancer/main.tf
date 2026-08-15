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
resource "azurerm_subnet" "public" {
  name                 = "PublicSubnet-FrontDoor"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

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

# Associate NSG with the public subnet
resource "azurerm_subnet_network_security_group_association" "nsg_subnet_assoc" {
  subnet_id                 = azurerm_subnet.public.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

# ==========================================
# 7. THE TRAFFIC COP (Azure Load Balancer) & NAT GATEWAY
# ==========================================
# Public IP for the Load Balancer
resource "azurerm_public_ip" "lb_pip" {
  name                = "TrafficCop-PublicIP"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Static"
  sku                 = "Standard" # Standard is required for Zone Redundancy
  zones               = ["1", "2", "3"]
}

# Public IP for the NAT Gateway (for outbound internet access)
resource "azurerm_public_ip" "nat_pip" {
  name                = "NAT-Gateway-PublicIP"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

# The NAT Gateway (Allows backend VMs to download Apache without public IPs)
resource "azurerm_nat_gateway" "nat_gw" {
  name                = "Clubhouse-NAT-Gateway"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku_name            = "Standard"
}

resource "azurerm_nat_gateway_public_ip_association" "nat_pip_assoc" {
  nat_gateway_id       = azurerm_nat_gateway.nat_gw.id
  public_ip_address_id = azurerm_public_ip.nat_pip.id
}

resource "azurerm_subnet_nat_gateway_association" "nat_subnet_assoc" {
  subnet_id      = azurerm_subnet.public.id
  nat_gateway_id = azurerm_nat_gateway.nat_gw.id
}

# The Load Balancer itself
resource "azurerm_lb" "web_lb" {
  name                = "pizza-traffic-cop"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "Standard"

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.lb_pip.id
  }
}

# The Clipboard (Backend Pool)
resource "azurerm_lb_backend_address_pool" "web_pool" {
  loadbalancer_id = azurerm_lb.web_lb.id
  name            = "WebServerPool"
}

# The Health Check (Probe)
resource "azurerm_lb_probe" "web_probe" {
  loadbalancer_id = azurerm_lb.web_lb.id
  name            = "http-probe"
  port            = 80
  protocol        = "Http"
  request_path    = "/"
}

# The Rule (Forwarding traffic from Frontend to Backend)
resource "azurerm_lb_rule" "web_rule" {
  loadbalancer_id                = azurerm_lb.web_lb.id
  name                           = "HTTP-Rule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "PublicIPAddress"
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.web_pool.id]
  probe_id                       = azurerm_lb_probe.web_probe.id
}

# ==========================================
# 8. SSH KEY & LOCAL FILE (The Front Door Key)
# ==========================================
resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "private_key" {
  content         = tls_private_key.ssh_key.private_key_pem
  filename        = "${path.module}/my-devops-key-azure.pem"
  file_permission = "0400"
}

# ==========================================
# 9. THE MAGIC STORAGE BOX (Azure Storage Account)
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
# 10. THE VIRTUAL COMPUTER FLEET (3 VMs)
# ==========================================
# Create 3 Network Interfaces
resource "azurerm_network_interface" "nic" {
  count               = 3
  name                = "Clubhouse-NIC-${count.index + 1}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.public.id
    private_ip_address_allocation = "Dynamic"
    # No public IP here! The Load Balancer handles public traffic.
  }
}

# Connect the NICs to the NSG
resource "azurerm_network_interface_security_group_association" "nsg_assoc" {
  count                     = 3
  network_interface_id      = azurerm_network_interface.nic[count.index].id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

# Connect the NICs to the Load Balancer Backend Pool
resource "azurerm_network_interface_backend_address_pool_association" "lb_assoc" {
  count                   = 3
  network_interface_id    = azurerm_network_interface.nic[count.index].id
  ip_configuration_name   = "internal"
  backend_address_pool_id = azurerm_lb_backend_address_pool.web_pool.id
}

# Create the 3 VMs
resource "azurerm_linux_virtual_machine" "vm" {
  count               = 3
  name                = "Clubhouse-VM-${count.index + 1}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = "Standard_D2as_v7"

  # Distribute across Availability Zones 1, 2, and 3 for High Availability!
  zone = tostring(count.index + 1)

  admin_username                  = "azureuser"
  disable_password_authentication = true

  network_interface_ids = [
    azurerm_network_interface.nic[count.index].id
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
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }

  identity {
    type = "SystemAssigned"
  }

  custom_data = base64encode(<<EOF
#!/bin/bash
apt-get update
apt-get install -y apache2
systemctl enable apache2
systemctl start apache2
echo "<h1>Hello from Pizza Web Server ${count.index + 1}!</h1>" > /var/www/html/index.html
EOF
  )

  tags = {
    environment = "learning"
    project     = "SecretClubhouse"
  }
}

# ==========================================
# 11. THE SECURITY BADGE PERMISSIONS (Role Assignment)
# ==========================================
resource "azurerm_role_assignment" "vm_storage_access" {
  count                = 3
  scope                = azurerm_storage_account.pizza_vault.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azurerm_linux_virtual_machine.vm[count.index].identity[0].principal_id
}

# ==========================================
# 12. OUTPUTS
# ==========================================
output "website_url" {
  description = "The URL to access your load-balanced web servers"
  value       = "http://${azurerm_public_ip.lb_pip.ip_address}"
}

output "vnet_id" {
  description = "The ID of our Secret Clubhouse VNet"
  value       = azurerm_virtual_network.vnet.id
}

output "storage_account_name" {
  description = "The globally unique name of your Magic Storage Box"
  value       = azurerm_storage_account.pizza_vault.name
}