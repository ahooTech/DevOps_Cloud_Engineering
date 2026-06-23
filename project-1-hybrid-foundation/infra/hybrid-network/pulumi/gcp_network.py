"""
gcp_network.py - GCP Hybrid Network Resources
Provisions: VPC, Subnet, HA VPN Gateway, Cloud Router, VPN Tunnels, BGP Peering
"""

import pulumi
import pulumi_gcp as gcp
from config import (
    GCP_CIDR,
    GCP_REGION,
    GCP_BGP_ASN,
    ONPREM_BGP_ASN,
    ONPREM_GCP_IP,
    VPN_SHARED_SECRET,
    COMMON_TAGS,
)


def create_gcp_network() -> dict:
    """Creates the complete GCP hybrid network stack."""

    # ==========================================
    # VPC Network
    # ==========================================
    vpc = gcp.compute.Network(
        "proj1-gcp-vpc", auto_create_subnetworks=False, routing_mode="GLOBAL"
    )

    # ==========================================
    # Subnet
    # ==========================================
    subnet = gcp.compute.Subnetwork(
        "proj1-gcp-subnet",
        ip_cidr_range=GCP_CIDR,
        region=GCP_REGION,
        network=vpc.id,
        private_ip_google_access=True,
    )

    # ==========================================
    # Firewall (Allow VPN traffic)
    # ==========================================
    firewall = gcp.compute.Firewall(
        "proj1-gcp-allow-vpn",
        network=vpc.id,
        allows=[
            gcp.compute.FirewallAllowArgs(protocol="udp", ports=["500", "4500"]),
            gcp.compute.FirewallAllowArgs(protocol="esp"),
            gcp.compute.FirewallAllowArgs(protocol="icmp"),
        ],
        source_ranges=["0.0.0.0/0"],
    )

    # ==========================================
    # HA VPN Gateway
    # ==========================================
    ha_vpn_gw = gcp.compute.HaVpnGateway(
        "proj1-gcp-ha-vpn-gw", network=vpc.id, region=GCP_REGION
    )

    # ==========================================
    # External VPN Gateway (On-Prem)
    # ==========================================
    external_gw = gcp.compute.ExternalVpnGateway(
        "proj1-onprem-ext-gw",
        redundancy_type="SINGLE_IP_INTERNALLY_REDUNDANT",
        interfaces=[
            gcp.compute.ExternalVpnGatewayInterfaceArgs(id=0, ip_address=ONPREM_GCP_IP)
        ],
    )

    # ==========================================
    # Cloud Router
    # ==========================================
    router = gcp.compute.Router(
        "proj1-gcp-cloud-router",
        network=vpc.id,
        region=GCP_REGION,
        bgp=gcp.compute.RouterBgpArgs(asn=GCP_BGP_ASN, advertise_mode="DEFAULT"),
    )

    # ==========================================
    # VPN Tunnels (CRITICAL: These MUST be created explicitly)
    # ==========================================
    tunnel1 = gcp.compute.VPNTunnel(
        "proj1-gcp-tunnel-1",
        region=GCP_REGION,
        vpn_gateway=ha_vpn_gw.id,
        peer_external_gateway=external_gw.id,
        peer_external_gateway_interface=0,
        shared_secret=VPN_SHARED_SECRET,
        vpn_gateway_interface=0,
        router=router.name,
        ike_version=2,
    )

    tunnel2 = gcp.compute.VPNTunnel(
        "proj1-gcp-tunnel-2",
        region=GCP_REGION,
        vpn_gateway=ha_vpn_gw.id,
        peer_external_gateway=external_gw.id,
        peer_external_gateway_interface=0,
        shared_secret=VPN_SHARED_SECRET,
        vpn_gateway_interface=1,
        router=router.name,
        ike_version=2,
    )

    # ==========================================
    # Router Interfaces (Linked to Tunnels)
    # ==========================================
    if1 = gcp.compute.RouterInterface(
        "proj1-gcp-if-1",
        router=router.name,
        region=GCP_REGION,
        ip_range="169.254.101.0/30",
        vpn_tunnel=tunnel1.name,  # ✅ Must link to tunnel
    )

    if2 = gcp.compute.RouterInterface(
        "proj1-gcp-if-2",
        router=router.name,
        region=GCP_REGION,
        ip_range="169.254.101.4/30",
        vpn_tunnel=tunnel2.name,  # ✅ Must link to tunnel
    )

    # ==========================================
    # BGP Peers (CRITICAL: These MUST be created explicitly)
    # ==========================================
    bgp_peer1 = gcp.compute.RouterPeer(
        "proj1-gcp-bgp-peer-1",
        router=router.name,
        region=GCP_REGION,
        interface=if1.name,
        peer_ip_address="169.254.101.2",
        peer_asn=ONPREM_BGP_ASN,
        advertised_route_priority=100,
    )

    bgp_peer2 = gcp.compute.RouterPeer(
        "proj1-gcp-bgp-peer-2",
        router=router.name,
        region=GCP_REGION,
        interface=if2.name,
        peer_ip_address="169.254.101.6",
        peer_asn=ONPREM_BGP_ASN,
        advertised_route_priority=100,
    )

    # ==========================================
    # Return outputs
    # ==========================================
    return {
        "vpc_name": vpc.name,
        "router_name": router.name,
    }

    # The tunnel is implicitly created by GCP when you attach HA VPN gateway + interfaces. In your version, HA VPN tunnel creation is NOT a Pulumi resource.
    # ✔ You already have:
    # HaVpnGateway
    # Router
    # RouterInterface
    # RouterBgpPeer

    # 👉 These together define the tunnel behavior

    # ==========================================
    # NOTE:
    # RouterBgpPeer is NOT available in your provider version.
    # BGP peer is configured via router interfaces + tunnel config.
    # ==========================================
