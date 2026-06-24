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




# Think of this `gcp_network.py` file as the **GCP Construction Crew**. 

# Google Cloud is famous for its massive, high-speed global network. When building a hybrid connection in GCP, the focus is heavily on **High Availability (HA)** and **dynamic routing (BGP)**. 

# Here is the easy-to-understand breakdown of what this crew is building, using a **Dual Secure Rail System** analogy:

# ### 1. The Private Campus & The Building (VPC & Subnet)
# ```python
# vpc = gcp.compute.Network(...)
# subnet = gcp.compute.Subnetwork(...)
# ```
# *   **The VPC:** Just like AWS and Azure, this is the fenced-off private land. Notice `routing_mode="GLOBAL"`. This is a GCP superpower—it means routes learned in one region are instantly available in all regions.
# *   **The Subnet:** This is the specific building zone inside the campus where your servers will live.

# ### 2. The Perimeter Security Guards (Firewall)
# ```python
# firewall = gcp.compute.Firewall(...)
# ```
# *   **The Firewall:** These are the guards at the edge of the campus. They are given a very specific instruction: *"Only allow traffic coming in on UDP ports 500 and 4500, ESP (Encapsulating Security Payload), and ICMP (for health checks)."* If it's not VPN traffic, the guards block it.

# ### 3. The Twin Secure Terminals (HA VPN & External Gateways)
# ```python
# ha_vpn_gw = gcp.compute.HaVpnGateway(...)
# external_gw = gcp.compute.ExternalVpnGateway(...)
# ```
# *   **HA VPN Gateway:** "HA" stands for **High Availability**. Instead of building one secure vault door, GCP builds **two** side-by-side. If one physical data center loses power, the other one instantly takes over. This is the GCP side of the connection.
# *   **External VPN Gateway:** This doesn't build anything physical. It’s just a digital placard that says, *"The on-premises headquarters we are connecting to is located at IP 52.0.0.3."*

# ### 4. The Traffic Dispatcher (Cloud Router)
# ```python
# router = gcp.compute.Router(...)
# ```
# *   **The Cloud Router:** In older networks, you had to manually type in every route (Static Routing). The Cloud Router is a smart dispatcher. It uses **BGP** (Border Gateway Protocol) to automatically listen to the on-premises network and dynamically update its maps. If a new server is added on-prem, the Cloud Router learns about it automatically.

# ### 5. The Twin Underground Tunnels (VPNTunnels)
# ```python
# tunnel1 = gcp.compute.VPNTunnel(...)
# tunnel2 = gcp.compute.VPNTunnel(...)
# ```
# *   **The Tunnels:** This is where the actual magic happens. The Gateways (Step 3) are just the buildings. The **Tunnels** are the actual encrypted underground tubes connecting the GCP campus to the on-premises headquarters. 
# *   Because we built an **HA** (High Availability) gateway, we build **two tunnels**. If Tunnel 1 gets cut, traffic instantly reroutes through Tunnel 2. They use a `shared_secret` (a password) and `ike_version=2` (the latest encryption standard) to secure the data.

# ### 6. The Connection Ports (Router Interfaces)
# ```python
# if1 = gcp.compute.RouterInterface(...)
# if2 = gcp.compute.RouterInterface(...)
# ```
# *   **The Interfaces:** The Cloud Router (Step 4) needs a physical place to plug in the Tunnels (Step 5). These interfaces are the ports on the back of the Cloud Router where the tunnels connect. They are assigned specific internal IP ranges (like `169.254.101.0/30`) just for the two routers to talk to each other.

# ### 7. The Diplomats (BGP Peers)
# ```python
# bgp_peer1 = gcp.compute.RouterPeer(...)
# bgp_peer2 = gcp.compute.RouterPeer(...)
# ```
# *   **The BGP Peers:** This is the most critical part of hybrid networking. Imagine two diplomats sitting at the connection ports (Interfaces). The GCP diplomat (`bgp_peer1`) sits across the table from the on-premises diplomat. They constantly talk to each other, exchanging lists of IP addresses (routes). 
# *   Because we have two tunnels, we have **two pairs of diplomats** to ensure that if one conversation drops, the other keeps the network maps updated.

# ### 8. The Handover Packet (The Return Statement)
# ```python
# return {
#     "vpc_name": vpc.name,
#     "router_name": router.name,
# }
# ```
# *   Once the GCP crew finishes, they hand the Project Manager a clipboard with the names of the Campus (VPC) and the Traffic Dispatcher (Cloud Router) so the rest of the project knows what was built.

# ---

# ### 💡 The Big Picture Takeaway

# Why is the GCP file the longest and most detailed? 

# Because **GCP is the most explicit**. In AWS and Azure, some of the tunnel and BGP configuration is hidden behind the scenes or abstracted away. GCP forces you to build every single piece of the puzzle: the Gateways, the Tunnels, the Interfaces, and the Peers. 

# While it requires more code, it gives you **absolute, granular control** over exactly how your high-availability, encrypted, dynamically-routed hybrid network behaves.