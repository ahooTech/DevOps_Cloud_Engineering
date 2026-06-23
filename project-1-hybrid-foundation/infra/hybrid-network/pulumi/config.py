"""
config.py - Parity Matrix for Multi-Cloud Hybrid Network
This is the Python equivalent of variables.tf + terraform.tfvars in Terraform.
All CIDRs, ASNs, and Provider IDs are defined here to ensure consistency.
"""

# ==========================================
# Non-Overlapping CIDR Ranges (Parity)
# ==========================================
ONPREM_CIDR = "10.10.0.0/16"  # Simulated on-prem datacenter
AWS_CIDR = "10.20.0.0/16"  # AWS VPC
AZURE_CIDR = "10.30.0.0/16"  # Azure VNet
GCP_CIDR = "10.40.0.0/16"  # GCP VPC

# ==========================================
# BGP ASNs (RFC 64512/6598 private range)
# ==========================================
ONPREM_BGP_ASN = 65000
AWS_BGP_ASN = 64512
AZURE_BGP_ASN = 65500
GCP_BGP_ASN = 65001

# ==========================================
# Regions
# ==========================================
AWS_REGION = "us-east-1"
AZURE_REGION = "eastus"
GCP_REGION = "us-central1"

# ==========================================
# On-Prem Simulation IPs (Lab placeholders)
# ==========================================
ONPREM_AWS_IP = "52.0.0.1"
ONPREM_AZURE_IP = "52.0.0.2"
ONPREM_GCP_IP = "52.0.0.3"
ONPREM_PUBLIC_IP_PLACEHOLDER = "203.0.113.10"  # ✅ ADDED: Matches Terraform variable

# ==========================================
# Shared Secrets (for lab only!)
# ==========================================
VPN_SHARED_SECRET = "Lab-Secure-Preshared-Key-2024!"

# ==========================================
# Cloud Provider Configuration (Secrets/IDs)
# ✅ ADDED: Matches Terraform's terraform.tfvars
# ==========================================

# ==========================================
# Common Tags (Parity enforcement)
# ==========================================
COMMON_TAGS = {
    "Project": "project-1-hybrid-foundation",
    "Environment": "lab",
    "ManagedBy": "pulumi",
    "ParityGroup": "hybrid-network",
}




# Think of this `config.py` file as the **Master Rulebook** or the **Corporate Blueprint** for your entire multi-cloud construction project. 

# If your AWS, Azure, and GCP files are the specialized construction crews, this file is the strict set of corporate guidelines they *must* follow. It ensures that no matter which cloud you are building in, the underlying network rules remain exactly the same (this is called **Environment Parity**).

# Here is the easy-to-understand breakdown of what each section does, using a **Global Franchise** analogy:

# ### 1. The Zip Codes (Non-Overlapping CIDR Ranges)
# ```python
# ONPREM_CIDR = "10.10.0.0/16"  
# AWS_CIDR = "10.20.0.0/16"  
# AZURE_CIDR = "10.30.0.0/16"  
# GCP_CIDR = "10.40.0.0/16"  
# ```
# *   **What it means:** CIDRs are just blocks of IP addresses. Think of them like **Zip Codes** for your networks. 
# *   **The Golden Rule:** Notice the comment `# Non-Overlapping`. If your AWS network and your Azure network both used the exact same Zip Code (`10.10.0.0/16`), the routers wouldn't know where to send the traffic. By giving each cloud its own unique "Zip Code" (`10.20`, `10.30`, `10.40`), you guarantee that traffic can flow smoothly between them without getting confused.

# ### 2. The International Dialing Codes (BGP ASNs)
# ```python
# ONPREM_BGP_ASN = 65000
# AWS_BGP_ASN = 64512
# AZURE_BGP_ASN = 65500
# GCP_BGP_ASN = 65001
# ```
# *   **What it means:** BGP (Border Gateway Protocol) is how different networks talk to each other on the internet. An ASN (Autonomous System Number) is like an **international dialing code** or an **airline code** for a network. 
# *   When your AWS network wants to talk to your on-premises network, it uses these unique numbers to introduce itself and exchange routing maps.

# ### 3. The Physical Locations (Regions)
# ```python
# AWS_REGION = "us-east-1"
# AZURE_REGION = "eastus"
# GCP_REGION = "us-central1"
# ```
# *   **What it means:** This simply tells the construction crews *where* on the physical planet to build the data centers. 

# ### 4. The Headquarters Addresses & Keys (On-Prem IPs & Secrets)
# ```python
# ONPREM_AWS_IP = "52.0.0.1"
# ONPREM_AZURE_IP = "52.0.0.2"
# ONPREM_GCP_IP = "52.0.0.3"
# VPN_SHARED_SECRET = "Lab-Secure-Preshared-Key-2024!"
# ```
# *   **What it means:** Since you don't have a real physical datacenter for this lab, you are simulating one. These are the fake "street addresses" (IPs) and the "secret handshake" (Shared Secret) that the cloud VPN gateways will use to authenticate and establish a secure tunnel back to your simulated headquarters.

# ### 5. The Asset Nametags (Common Tags)
# ```python
# COMMON_TAGS = {
#     "Project": "project-1-hybrid-foundation",
#     "Environment": "lab",
#     "ManagedBy": "pulumi",
#     "ParityGroup": "hybrid-network",
# }
# ```
# *   **What it means:** Imagine you buy 100 laptops for your company. You put a barcode sticker on every single one that says "Property of [Company], Dept: IT". 
# *   In the cloud, every single resource (VPC, Gateway, Subnet) gets these tags attached to it. If you ever get a massive cloud bill and need to figure out what you are paying for, you can just search for `Project = project-1-hybrid-foundation` and see exactly what belongs to this lab.

# ---

# ### 💡 The Big Picture Takeaway: Why do it this way?

# In older ways of building infrastructure, you might hardcode `10.20.0.0/16` inside your AWS file, and `10.30.0.0/16` inside your Azure file. 

# **The danger?** Six months from now, if you need to change the AWS IP range, you have to hunt through 5 different files to update it. If you miss one, your network breaks.

# By putting all these rules in **one single `config.py` file**, you achieve **Single Source of Truth**. If you ever need to change the AWS region or the BGP ASN, you change it in *one place*, and every script that imports `config.py` automatically gets the update. 

# *(Also, great job removing the hardcoded Azure Subscription ID and GCP Project ID from this file compared to the previous version! Moving those to `Pulumi.dev.yaml` is a massive security upgrade, as you no longer have sensitive account IDs sitting in plain text in your Python code!)*