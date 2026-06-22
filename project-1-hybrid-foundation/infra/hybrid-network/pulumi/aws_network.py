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
        "tgw_id": tgw.id,
        "subnet_id": subnet.id,
        "vgw_id": vgw.id,
    }
