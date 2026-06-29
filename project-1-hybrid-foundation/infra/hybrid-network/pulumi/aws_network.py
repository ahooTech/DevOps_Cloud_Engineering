"""
aws_network.py - AWS Hybrid Network Resources
Provisions: VPC, Subnet, IGW, Transit Gateway, VPN Gateway, BGP Peering
"""

import pulumi
import pulumi_aws as aws
from config import (
    AWS_CIDR,
    AWS_REGION,
    AWS_BGP_ASN,
    ONPREM_BGP_ASN,
    ONPREM_AWS_IP,
    ONPREM_CIDR,
    COMMON_TAGS,
)


def create_aws_network() -> dict:
    """Creates the complete AWS hybrid network stack."""

    # ==========================================
    # VPC & Subnet
    # ==========================================
    vpc = aws.ec2.Vpc(
        "proj1-aws-vpc",
        cidr_block=AWS_CIDR,
        enable_dns_hostnames=True,
        enable_dns_support=True,
        tags={**COMMON_TAGS, "Name": "proj1-aws-vpc"},
    )

    # ✅ FIXED: Use cidrsubnet equivalent (Python doesn't have cidrsubnet, so we calculate it)
    # cidrsubnet("10.20.0.0/16", 8, 1) = "10.20.1.0/24"
    subnet_cidr = "10.20.1.0/24"  # This is the result of cidrsubnet(AWS_CIDR, 8, 1)

    subnet = aws.ec2.Subnet(
        "proj1-aws-public",
        vpc_id=vpc.id,
        cidr_block=subnet_cidr,
        map_public_ip_on_launch=True,
        availability_zone=f"{AWS_REGION}a",
        tags={**COMMON_TAGS, "Name": "proj1-aws-public"},
    )

    # ==========================================
    # Internet Gateway
    # ==========================================
    igw = aws.ec2.InternetGateway(
        "proj1-aws-igw", vpc_id=vpc.id, tags={**COMMON_TAGS, "Name": "proj1-aws-igw"}
    )

    # ==========================================
    # Transit Gateway (Central routing hub)
    # ✅ CORRECT: aws.ec2transitgateway namespace
    # ==========================================
    tgw = aws.ec2transitgateway.TransitGateway(
        "proj1-aws-tgw",
        description="Project 1 Hybrid TGW",
        amazon_side_asn=AWS_BGP_ASN,
        auto_accept_shared_attachments="enable",
        default_route_table_association="enable",
        default_route_table_propagation="enable",
        tags={**COMMON_TAGS, "Name": "proj1-aws-tgw"},
    )

    # ==========================================
    # TGW VPC Attachment
    # ✅ CORRECT: aws.ec2transitgateway.VpcAttachment
    # ==========================================
    tgw_attachment = aws.ec2transitgateway.VpcAttachment(
        "proj1-aws-tgw-attach",
        subnet_ids=[subnet.id],
        transit_gateway_id=tgw.id,
        vpc_id=vpc.id,
        tags={**COMMON_TAGS, "Name": "proj1-aws-tgw-attach"},
    )

    # ==========================================
    # VPN Gateway (for Site-to-Site VPN)
    # ==========================================
    vgw = aws.ec2.VpnGateway(
        "proj1-aws-vgw",
        vpc_id=vpc.id,
        amazon_side_asn=AWS_BGP_ASN,
        tags={**COMMON_TAGS, "Name": "proj1-aws-vgw"},
    )

    # ==========================================
    # Customer Gateway (represents on-prem device)
    # ==========================================
    customer_gw = aws.ec2.CustomerGateway(
        "proj1-onprem-cgw-aws",
        bgp_asn=ONPREM_BGP_ASN,
        ip_address=ONPREM_AWS_IP,
        type="ipsec.1",
        tags={**COMMON_TAGS, "Name": "proj1-onprem-cgw-aws"},
    )

    # ==========================================
    # VPN Connection (with BGP tunnels)
    # ==========================================
    vpn_connection = aws.ec2.VpnConnection(
        "proj1-aws-vpn-conn",
        customer_gateway_id=customer_gw.id,
        vpn_gateway_id=vgw.id,
        type="ipsec.1",
        static_routes_only=False,
        tunnel1_inside_cidr="169.254.100.0/30",
        tunnel2_inside_cidr="169.254.100.4/30",
        tags=COMMON_TAGS,
    )

    # ==========================================
    # Route Tables
    # ==========================================
    public_rt = aws.ec2.RouteTable(
        "proj1-aws-public-rt",
        vpc_id=vpc.id,
        routes=[aws.ec2.RouteTableRouteArgs(cidr_block="0.0.0.0/0", gateway_id=igw.id)],
        tags={**COMMON_TAGS, "Name": "proj1-aws-public-rt"},
    )

    aws.ec2.RouteTableAssociation(
        "proj1-aws-public-assoc", subnet_id=subnet.id, route_table_id=public_rt.id
    )

    # ✅ FIXED: Add the missing TGW route table
    tgw_rt = aws.ec2.RouteTable(
        "proj1-aws-tgw-rt",
        vpc_id=vpc.id,
        routes=[
            aws.ec2.RouteTableRouteArgs(
                cidr_block=ONPREM_CIDR, transit_gateway_id=tgw.id  # 10.10.0.0/16
            )
        ],
        tags={**COMMON_TAGS, "Name": "proj1-aws-tgw-rt"},
    )

    # Note: We don't associate tgw_rt with a subnet because TGW handles routing automatically
    # (This matches your Terraform code where tgw_assoc is commented out)

    # ==========================================
    # Return outputs for cross-module use
    # ==========================================
    return {
        "vpc_id": vpc.id,
        "vpc_cidr": vpc.cidr_block,
        "tgw_id": tgw.id,
        "subnet_id": subnet.id,
        "subnet_cidr": subnet.cidr_block,
        "vgw_id": vgw.id,
    }


# Think of this `aws_network.py` file as the **AWS Construction Crew**. 

# While `__main__.py` was the Project Manager, this file is the specialized team that actually knows how to pour the concrete and lay the cables specifically for AWS. 

# Instead of just listing resources top-to-bottom like Terraform does, this file wraps everything inside a Python function (`def create_aws_network():`). This means the Project Manager can just say, *"Hey AWS Crew, go build the network!"* and wait for them to finish.

# Here is the easy-to-understand breakdown of exactly what this crew is building, using a **Corporate Campus** analogy:

# ### 1. Building the Fenced Campus (VPC & Subnet)
# ```python
# vpc = aws.ec2.Vpc(...)
# subnet = aws.ec2.Subnet(...)
# ```
# *   **The VPC (Virtual Private Cloud):** This is like buying a massive plot of land and putting a security fence around it. Nothing gets in or out unless you allow it.
# *   **The Subnet:** This is like dividing that land into specific zones (e.g., "Public Zone" and "Private Zone"). Here, they are building one public zone where resources can live.

# ### 2. Building the Main Gate (Internet Gateway)
# ```python
# igw = aws.ec2.InternetGateway(...)
# ```
# *   **The IGW:** This is the main security gate at the front of the campus. It allows traffic from the "Public Zone" (Subnet) to go out onto the public internet.

# ### 3. Building the Highway Interchange (Transit Gateway)
# ```python
# tgw = aws.ec2transitgateway.TransitGateway(...)
# tgw_attachment = aws.ec2transitgateway.VpcAttachment(...)
# ```
# *   **The Transit Gateway (TGW):** Imagine a massive, high-speed highway interchange. Its job is to connect your AWS campus to other clouds (Azure, GCP) or your on-premises office. 
# *   **The Attachment:** This is the on-ramp that physically connects your AWS campus (VPC) to that highway interchange.

# ### 4. Digging the Secure Tunnel (VPN)
# ```python
# vgw = aws.ec2.VpnGateway(...)
# customer_gw = aws.ec2.CustomerGateway(...)
# vpn_connection = aws.ec2.VpnConnection(...)
# ```
# *   **The VPN Gateway (VGW):** This is the secure vault door on the AWS side of the campus.
# *   **The Customer Gateway (CGW):** This represents the physical router/firewall at your "on-premises" office (the other side of the tunnel).
# *   **The VPN Connection:** This is the actual encrypted, underground tunnel connecting the AWS vault door to the on-premises router. Data travels through here safely.

# ### 5. Putting up the GPS Signage (Route Tables)
# ```python
# public_rt = aws.ec2.RouteTable(...)
# tgw_rt = aws.ec2.RouteTable(...)
# aws.ec2.RouteTableAssociation(...)
# ```
# *   **Route Tables:** If the VPC is the campus, Route Tables are the GPS signs telling data packets where to drive.
#     *   **Public Route Table:** Says, *"If you want to go to the Internet (0.0.0.0/0), drive to the Main Gate (IGW)."*
#     *   **TGW Route Table:** Says, *"If you want to go to the On-Premises office (10.10.0.0/16), drive to the Highway Interchange (TGW)."*
# *   **Route Table Association:** This physically nails the "Public Route Table" sign to the "Public Subnet" building so the resources inside know which rules to follow.

# ### 6. The Handover Packet (The Return Statement)
# ```python
# return {
#     "vpc_id": vpc.id,
#     "tgw_id": tgw.id,
#     ...
# }
# ```
# *   Once the crew finishes building, they hand the Project Manager a clipboard (a Python dictionary) containing the **ID numbers** of the most important buildings. 
# *   The Project Manager (`__main__.py`) takes these IDs and prints them out at the end of the deployment so you know exactly what was built.

# ---

# ### 💡 The Big Picture Takeaway
# In Terraform, you had to split these resources across `aws_tgw.tf` and `bgp_peering.tf`. 

# In Pulumi, because Python is a real programming language, you get to organize your code logically. **All** the AWS resources live neatly inside this one file, wrapped in a clean, reusable function. It makes the code much easier to read, test, and maintain!