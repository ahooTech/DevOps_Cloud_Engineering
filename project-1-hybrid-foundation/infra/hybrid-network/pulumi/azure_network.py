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
