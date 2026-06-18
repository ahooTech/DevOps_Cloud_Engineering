resource "azurerm_resource_group" "rg" {
  name     = "proj1-azure-rg"
  location = var.azure_location
}

resource "azurerm_virtual_network" "vnet" {
  name                = "proj1-azure-vnet"
  location            = var.azure_location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = [var.azure_cidr]
  dns_servers         = ["10.10.0.10"] # Forward to on-prem DNS (your Vagrant AD/DNS)
}

resource "azurerm_subnet" "subnet" {
  name                 = "GatewaySubnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [cidrsubnet(var.azure_cidr, 8, 250)]
}

resource "azurerm_virtual_network_gateway" "vgw" {
  name                = "proj1-azure-vpn-gw"
  location            = var.azure_location
  resource_group_name = azurerm_resource_group.rg.name

  type          = "Vpn"
  vpn_type      = "RouteBased"
  active_active = false
  #enable_bgp    = true -> depreciated, BGP is now controlled via:.gateway SKU (VpnGw1, VpnGw2, etc.) connection configuration (later in your setup)
  sku = "VpnGw1AZ"

  bgp_settings {
    asn         = var.azure_bgp_asn
    peer_weight = 0
  }

  ip_configuration {
    name                          = "vnetGatewayConfig"
    public_ip_address_id          = azurerm_public_ip.pip.id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = azurerm_subnet.subnet.id
  }
}

resource "azurerm_public_ip" "pip" {
  name                = "proj1-azure-gw-pip"
  location            = var.azure_location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Static"
  sku                 = "Standard"

  zones = ["1"]
}

resource "azurerm_network_security_group" "vpn_nsg" {
  name                = "proj1-azure-vpn-nsg"
  location            = var.azure_location
  resource_group_name = azurerm_resource_group.rg.name

  security_rule {
    name                       = "Allow-VPN-Traffic"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Udp"
    source_port_range          = "*"
    destination_port_ranges    = ["500", "4500"]
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

#Azure doesn't allow NSGs on GatewaySubnet. Remove or comment out the NSG association.
#resource "azurerm_subnet_network_security_group_association" "nsg_assoc" {
#  subnet_id                 = azurerm_subnet.subnet.id
#  network_security_group_id = azurerm_network_security_group.vpn_nsg.id
#}