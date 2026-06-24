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






# Think of this `azure_vwan.tf` file as the **Azure Construction Blueprint**. 

# Just like the AWS file, this blueprint tells Terraform exactly how to build your private network and secure tunnel in Microsoft Azure. However, Azure has some very specific, strict rules about how VPNs must be built, and this file handles all of those quirks perfectly.

# Here is the easy-to-understand breakdown of what this crew is building, using a **Secure International Branch Office** analogy:

# ### 1. Buying the Land (Resource Group)
# ```hcl
# resource "azurerm_resource_group" "rg" { ... }
# ```
# *   **The Resource Group:** In Azure, you can't just build resources in the void. You need a legal "property deed" or container to hold them. This is the Resource Group. If you delete this one resource, Azure instantly demolishes everything inside it.

# ### 2. Fencing the Perimeter (Virtual Network)
# ```hcl
# resource "azurerm_virtual_network" "vnet" { ... }
# ```
# *   **The VNet:** This is your private, fenced-in campus in Azure. 
# *   *Cool Detail:* Notice `dns_servers = ["10.10.0.10"]`. This is like giving the campus a special phonebook. It tells all the servers inside Azure: *"If you need to find the on-premises headquarters, ask this specific DNS server."*

# ### 3. Building the Secure Loading Dock (Gateway Subnet)
# ```hcl
# resource "azurerm_subnet" "subnet" {
#   name = "GatewaySubnet" ...
# }
# ```
# *   **The Gateway Subnet:** Azure is incredibly strict. It requires a dedicated subnet named *exactly* `GatewaySubnet` just to hold the VPN hardware. You cannot put regular servers here. It's like building a reinforced, specialized loading dock just for secure shipments. 
# *   *Terraform Superpower:* Notice `cidrsubnet(var.azure_cidr, 8, 250)`. Terraform does the math for you, automatically slicing a tiny piece (`10.30.250.0/24`) out of the main VNet for this dock.

# ### 4. Getting the Official Address (Public IP)
# ```hcl
# resource "azurerm_public_ip" "pip" {
#   allocation_method = "Static"
#   sku               = "Standard"
#   zones             = ["1"] 
# }
# ```
# *   **The Public IP:** This is the permanent, public-facing street address of your Azure branch office. 
# *   *Crucial Detail:* Notice `zones = ["1"]`. Because we are building a high-end, highly available VPN Gateway (next step), Azure *forces* us to pin this IP address to a specific physical data center (Availability Zone 1) so it never goes offline.

# ### 5. Installing the Secure Vault (Virtual Network Gateway)
# ```hcl
# resource "azurerm_virtual_network_gateway" "vgw" {
#   sku = "VpnGw1AZ" ...
# }
# ```
# *   **The VPN Gateway:** This is the actual heavy-duty encryption hardware. 
# *   *The `VpnGw1AZ` SKU:* The "AZ" stands for Availability Zone. This tells Azure to buy the premium version of the gateway that spans multiple physical buildings. If one data center loses power, your tunnel stays up.
# *   *BGP Settings:* This configures the "diplomat" (ASN `65500`) that will automatically exchange routing maps with your on-premises network.

# ### 6. Hiring the Security Guard (Network Security Group / NSG)
# ```hcl
# resource "azurerm_network_security_group" "vpn_nsg" { ... }
# ```
# *   **The NSG:** This is a firewall rule. It acts like a security guard at the gate who only lets specific traffic through. Here, the guard is told: *"Only allow UDP traffic on ports 500 and 4500."* (These are the exact ports used by IPsec VPN tunnels).

# ### 7. The Commented-Out Code (Why is it crossed out?)
# ```hcl
# #resource "azurerm_subnet_network_security_group_association" "nsg_assoc" { ... }
# ```
# *   You might wonder why this last block is commented out with `#`. 
# *   **The Reason:** Azure literally **forbids** putting Network Security Groups (firewalls) on the `GatewaySubnet`. Microsoft handles the security for that specific subnet behind the scenes. If you tried to uncomment this block, Azure would throw an error and fail the deployment. So, we build the firewall (the NSG), but we intentionally leave it unassigned to satisfy Azure's strict rules.

# ---

# ### 💡 The Big Picture Takeaway

# This file perfectly demonstrates **cloud-specific knowledge**. 

# While AWS and GCP have their own ways of doing things, Azure has very specific quirks:
# 1. It requires a subnet named exactly `GatewaySubnet`.
# 2. It requires Zone-pinned IPs (`zones = ["1"]`) if you use Availability Zone gateway SKUs (`VpnGw1AZ`).
# 3. It forbids NSGs on Gateway Subnets.

# This Terraform file handles all those Azure-specific rules cleanly, ensuring your network is not just built, but built *correctly* according to Microsoft's best practices!