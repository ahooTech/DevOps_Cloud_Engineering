"""
__main__.py - Entry point for Project 1 Hybrid Foundation
Orchestrates AWS, Azure, and GCP network deployment
"""

# configure pulumi to use backend state stored in AWS s3 via the command line through logging into the https://s3.....
# for now we use pulumi cloud for the state management

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

# AWS Outputs
pulumi.export("aws_vpc_id", aws_resources["vpc_id"])
pulumi.export("aws_subnet_id", aws_resources["subnet_id"])  # ✅ NEW: Critical for Project 2
pulumi.export("aws_subnet_cidr", aws_resources["subnet_cidr"])  # ✅ NEW
pulumi.export("aws_vpc_cidr", aws_resources["vpc_cidr"])  # ✅ NEW
pulumi.export("aws_tgw_id", aws_resources["tgw_id"])
pulumi.export("aws_bgp_asn", AWS_BGP_ASN)

# Azure Outputs
pulumi.export("azure_vnet_id", azure_resources["vnet_id"])
pulumi.export("azure_gw_public_ip", azure_resources["public_ip"])
pulumi.export("azure_bgp_asn", AZURE_BGP_ASN)

# GCP Outputs
pulumi.export("gcp_vpc_network", gcp_resources["vpc_name"])
pulumi.export("gcp_router_asn", GCP_BGP_ASN)

# Parity Status
pulumi.export(
    "parity_status",
    f"On-Prem CIDR: {ONPREM_CIDR} | Cloud CIDRs: "
    f"AWS={AWS_CIDR} Azure={AZURE_CIDR} GCP={GCP_CIDR}",
),




# Think of this `__main__.py` file as the **General Contractor** or **Project Manager** of your entire multi-cloud construction site. 

# It doesn't actually know *how* to build a VPC or configure BGP. Instead, its only job is to **hire the specialists, tell them to start working, and collect the final keys to the buildings when they are done.**

# Here is the easy-to-understand breakdown of exactly what is happening in three simple steps:

# ---

# ### Step 1: Calling in the Specialists (The Imports)
# ```python
# import pulumi
# from aws_network import create_aws_network
# from azure_network import create_azure_network
# from gcp_network import create_gcp_network
# from config import (...)
# ```
# **What it means:** 
# Instead of writing a massive, confusing 500-line script, you split your work into specialized teams. 
# * This file is saying: *"Go get the AWS blueprint, the Azure blueprint, the GCP blueprint, and the master rulebook (`config.py`) that ensures everyone uses the same IP addresses."*

# ### Step 2: Breaking Ground (The Execution)
# ```python
# aws_resources = create_aws_network()
# azure_resources = create_azure_network()
# gcp_resources = create_gcp_network()
# ```
# **What it means:** 
# This is the moment you run `pulumi up`. The Project Manager walks up to each team and says, **"Start building!"**
# * It tells the AWS script to go build the VPC, Transit Gateway, and VPN.
# * It tells the Azure script to go build the Resource Group, VNet, and VpnGw1AZ.
# * It tells the GCP script to go build the VPC, HA VPN Gateway, and Cloud Router.

# *Note: Pulumi is smart. It reads these three lines and figures out the exact order to build them in the cloud so they don't crash into each other.*

# ### Step 3: Handing Over the Keys (The Outputs)
# ```python
# pulumi.export("aws_vpc_id", aws_resources["vpc_id"])
# pulumi.export("azure_gw_public_ip", azure_resources["public_ip"])
# # ... etc ...
# ```
# **What it means:** 
# Once the clouds finish building (after ~40 minutes), the Project Manager hands you a clipboard with the **"Keys and Addresses"** to your new infrastructure. 

# When the deployment finishes, Pulumi prints these to your screen. Why is this important? Because if you want to connect your on-premises firewall to your Azure cloud, **you need that Azure Public IP address**. This section ensures you don't have to go hunting through the AWS/Azure/GCP web consoles to find it; Pulumi just hands it to you at the end.

# ---

# ### 💡 The Big Picture Takeaway

# Why is this file so short and clean? 

# Because it follows a golden rule of software engineering called **Separation of Concerns**. 
# * **`config.py`** handles the *rules* (IPs, ASNs).
# * **`aws/azure/gcp_network.py`** handle the *heavy lifting* (building the resources).
# * **`__main__.py`** just handles the *orchestration* (tying it all together).

# If you ever need to add a 4th cloud (like Oracle Cloud or DigitalOcean), you wouldn't have to rewrite this whole file. You would just write a `oracle_network.py` file, import it here, and add one line: `oracle_resources = create_oracle_network()`.