"""
__main__.py - Entry point for Project 1 Hybrid Foundation
Orchestrates AWS, Azure, and GCP network deployment
"""

import pulumi
from aws_network import create_aws_network
from azure_network import create_azure_network
from gcp_network import create_gcp_network
from config import (
    ONPREM_CIDR,
    AWS_CIDR,
    AZURE_CIDR,
    GCP_CIDR,
    AWS_BGP_ASN,
    AZURE_BGP_ASN,
    GCP_BGP_ASN,  # ✅ Import ASNs from config
)

# ==========================================
# Deploy all three clouds
# ==========================================
aws_resources = create_aws_network()
azure_resources = create_azure_network()
gcp_resources = create_gcp_network()

# ==========================================
# Stack Outputs (matches Terraform outputs)
# ==========================================
pulumi.export("aws_vpc_id", aws_resources["vpc_id"])
pulumi.export("aws_tgw_id", aws_resources["tgw_id"])
pulumi.export("aws_bgp_asn", AWS_BGP_ASN)  # ✅ Use config value

pulumi.export("azure_vnet_id", azure_resources["vnet_id"])
pulumi.export("azure_gw_public_ip", azure_resources["public_ip"])
pulumi.export("azure_bgp_asn", AZURE_BGP_ASN)  # Optional: Uncomment if needed

pulumi.export("gcp_vpc_network", gcp_resources["vpc_name"])
pulumi.export("gcp_router_asn", GCP_BGP_ASN)  # ✅ Use config value

pulumi.export(
    "parity_status",
    f"On-Prem CIDR: {ONPREM_CIDR} | Cloud CIDRs: "
    f"AWS={AWS_CIDR} Azure={AZURE_CIDR} GCP={GCP_CIDR}",
)
