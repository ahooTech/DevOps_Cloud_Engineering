"""
azure_network.py - Azure Hybrid Network Resources
Provisions: Resource Group, VNet, GatewaySubnet, VPN Gateway (VpnGw1AZ), BGP, NSG
"""

import pulumi
import pulumi_azure_native as azure_native
from config import (
    AZURE_CIDR,
    AZURE_REGION,
    AZURE_BGP_ASN,
    ONPREM_BGP_ASN,
    ONPREM_AZURE_IP,
    VPN_SHARED_SECRET,
    COMMON_TAGS,
)


def create_azure_network() -> dict:
    """Creates the complete Azure hybrid network stack."""

    # ==========================================
    # Resource Group
    # ==========================================
    rg = azure_native.resources.ResourceGroup("proj1-azure-rg", location=AZURE_REGION)

    # ==========================================
    # Virtual Network
    # ==========================================
    vnet = azure_native.network.VirtualNetwork(
        "proj1-azure-vnet",
        resource_group_name=rg.name,
        location=rg.location,
        address_space=azure_native.network.AddressSpaceArgs(
            address_prefixes=[AZURE_CIDR]
        ),
        dhcp_options=azure_native.network.DhcpOptionsArgs(
            dns_servers=["10.10.0.10"]  # On-prem DNS
        ),
        tags=COMMON_TAGS,
    )

    # ==========================================
    # Gateway Subnet (Required for VPN Gateway)
    # ==========================================
    gateway_subnet = azure_native.network.Subnet(
        "GatewaySubnet",
        resource_group_name=rg.name,
        virtual_network_name=vnet.name,
        address_prefix="10.30.250.0/24",  # cidrsubnet(AZURE_CIDR, 8, 250)
    )

    # ==========================================
    # Public IP (Zone-pinned for VpnGw1AZ)
    # ==========================================
    public_ip = azure_native.network.PublicIPAddress(
        "proj1-azure-gw-pip",
        resource_group_name=rg.name,
        location=rg.location,
        public_ip_allocation_method="Static",
        sku=azure_native.network.PublicIPAddressSkuArgs(name="Standard"),
        zones=["1"],  # ✅ Required for AZ SKUs
        tags=COMMON_TAGS,
    )

    # ==========================================
    # Network Security Group (NSG) for VPN Traffic
    # ✅ ADDED: Matches Terraform's azurerm_network_security_group
    # Note: We intentionally DO NOT associate this with the GatewaySubnet
    # because Azure forbids NSGs on GatewaySubnets.
    # ==========================================
    vpn_nsg = azure_native.network.NetworkSecurityGroup(
        "proj1-azure-vpn-nsg",
        resource_group_name=rg.name,
        location=rg.location,
        security_rules=[
            azure_native.network.SecurityRuleArgs(
                name="Allow-VPN-Traffic",
                priority=100,
                direction="Inbound",
                access="Allow",
                protocol="Udp",
                source_port_range="*",
                destination_port_ranges=["500", "4500"],
                source_address_prefix="*",
                destination_address_prefix="*",
            )
        ],
        tags=COMMON_TAGS,
    )

    # ==========================================
    # Virtual Network Gateway (VpnGw1AZ)
    # ==========================================
    vpn_gw = azure_native.network.VirtualNetworkGateway(
        "proj1-azure-vpn-gw",
        resource_group_name=rg.name,
        location=rg.location,
        gateway_type="Vpn",
        vpn_type="RouteBased",
        active_active=False,
        enable_bgp=True,
        sku=azure_native.network.VirtualNetworkGatewaySkuArgs(
            name="VpnGw1AZ", tier="VpnGw1AZ"  # ✅ Availability Zone SKU
        ),
        ip_configurations=[
            azure_native.network.VirtualNetworkGatewayIPConfigurationArgs(
                name="vnetGatewayConfig",
                private_ip_allocation_method="Dynamic",
                public_ip_address=azure_native.network.SubResourceArgs(id=public_ip.id),
                subnet=azure_native.network.SubResourceArgs(id=gateway_subnet.id),
            )
        ],
        bgp_settings=azure_native.network.BgpSettingsArgs(
            asn=AZURE_BGP_ASN, peer_weight=0  # ✅ ADDED: Matches Terraform explicitly
        ),
        tags=COMMON_TAGS,
    )

    # ==========================================
    # Local Network Gateway (represents on-prem)
    # ==========================================
    local_gw = azure_native.network.LocalNetworkGateway(
        "proj1-onprem-lng",
        resource_group_name=rg.name,
        location=rg.location,
        gateway_ip_address=ONPREM_AZURE_IP,
        local_network_address_space=azure_native.network.AddressSpaceArgs(
            address_prefixes=["10.10.0.0/16"]
        ),
        bgp_settings=azure_native.network.BgpSettingsArgs(
            asn=ONPREM_BGP_ASN, bgp_peering_address="169.254.255.1"
        ),
        tags=COMMON_TAGS,
    )

    # ==========================================
    # VPN Connection (IPsec to on-prem)
    # ==========================================
    connection = azure_native.network.VirtualNetworkGatewayConnection(
        "proj1-azure-to-onprem",
        resource_group_name=rg.name,
        location=rg.location,
        virtual_network_gateway1=azure_native.network.SubResourceArgs(id=vpn_gw.id),
        local_network_gateway2=azure_native.network.SubResourceArgs(id=local_gw.id),
        connection_type="IPsec",
        connection_protocol="IKEv2",
        routing_weight=0,
        shared_key=VPN_SHARED_SECRET,
        enable_bgp=True,
    )

    # ==========================================
    # Return outputs
    # ==========================================
    return {
        "rg_name": rg.name,
        "vnet_id": vnet.id,
        "public_ip": public_ip.ip_address,
    }


# Think of this `azure_network.py` file as the **Azure Construction Crew**. 

# Just like the AWS crew, this team knows exactly how to build things specifically for Microsoft Azure. Azure has its own unique rules and terminology, and this file translates your master plan into Azure's specific language.

# Here is the easy-to-understand breakdown of what this crew is building, using a **Secure International Branch Office** analogy:

# ### 1. Buying the Land (Resource Group)
# ```python
# rg = azure_native.resources.ResourceGroup(...)
# ```
# *   **The Resource Group:** In Azure, you can't just build things in the void. You need a container to hold them. This is like buying a specific plot of land or a legal property deed where all your Azure resources will live. If you delete the Resource Group, everything inside it gets demolished instantly.

# ### 2. Fencing the Perimeter (Virtual Network)
# ```python
# vnet = azure_native.network.VirtualNetwork(...)
# ```
# *   **The VNet:** This is the Azure equivalent of the AWS VPC. It's the private, fenced-in network where your resources live. They also set up a custom DNS server here (`10.10.0.10`) so that computers inside this Azure network know how to find the on-premises headquarters.

# ### 3. Building the Secure Loading Dock (Gateway Subnet)
# ```python
# gateway_subnet = azure_native.network.Subnet("GatewaySubnet", ...)
# ```
# *   **The Gateway Subnet:** Azure is very strict. It requires a dedicated, specifically named subnet (`GatewaySubnet`) just to hold the VPN hardware. You cannot put regular servers here. It's like building a reinforced loading dock specifically for secure shipments.

# ### 4. Getting the Official Address (Public IP)
# ```python
# public_ip = azure_native.network.PublicIPAddress(...)
# ```
# *   **The Public IP:** This is the permanent, public-facing street address of your Azure branch office. 
# *   *Note the `zones=["1"]`:* This pins the IP to a specific physical data center (Availability Zone) so that if one data center loses power, your address stays active.

# ### 5. Hiring the Security Guard (Network Security Group / NSG)
# ```python
# vpn_nsg = azure_native.network.NetworkSecurityGroup(...)
# ```
# *   **The NSG:** This is a firewall rule. It acts like a security guard at the gate who only lets specific traffic through. Here, the guard is told: *"Only allow UDP traffic on ports 500 and 4500."* (These are the specific ports used by IPsec VPN tunnels).
# *   *Crucial Detail:* Notice the comment that says we **DO NOT** attach this to the Gateway Subnet. Azure actually forbids putting firewalls on Gateway Subnets, so we build the firewall, but leave it unattached to satisfy Azure's rules.

# ### 6. Installing the Secure Vault (Virtual Network Gateway)
# ```python
# vpn_gw = azure_native.network.VirtualNetworkGateway(...)
# ```
# *   **The VPN Gateway:** This is the actual heavy-duty encryption hardware/software. 
# *   *Note the `sku="VpnGw1AZ"`:* This tells Azure to use a high-performance, highly available version of the gateway that spans multiple physical buildings (Availability Zones) so it never goes down.

# ### 7. Drawing the Map to Headquarters (Local Network Gateway)
# ```python
# local_gw = azure_native.network.LocalNetworkGateway(...)
# ```
# *   **The Local Network Gateway:** This doesn't build anything physical. It's just Azure's way of saying, *"Here is the IP address and network layout of the on-premises headquarters we are going to connect to."*

# ### 8. Digging the Tunnel (VPN Connection)
# ```python
# connection = azure_native.network.VirtualNetworkGatewayConnection(...)
# ```
# *   **The Connection:** This is the final step. It takes the Azure Vault (VPN Gateway) and the Headquarters Map (Local Network Gateway), uses the shared secret password (`VPN_SHARED_SECRET`), and actually establishes the encrypted IPsec tunnel between them.

# ### 9. The Handover Packet (The Return Statement)
# ```python
# return {
#     "rg_name": rg.name,
#     "vnet_id": vnet.id,
#     "public_ip": public_ip.ip_address,
# }
# ```
# *   Once the Azure crew finishes, they hand the Project Manager a clipboard with the most important details: the name of the property (Resource Group), the ID of the fenced network (VNet), and the public street address (Public IP) so you know how to connect to it from the outside world.

# ---

# ### 💡 The Big Picture Takeaway
# This file perfectly demonstrates **cloud-specific knowledge**. 

# While AWS and GCP have their own ways of doing things, Azure has very specific quirks (like requiring a `GatewaySubnet`, requiring Zone-pinned IPs for AZ gateways, and forbidding NSGs on gateway subnets). This Python file handles all those Azure-specific rules cleanly, ensuring your network is not just built, but built *correctly* according to Microsoft's best practices.