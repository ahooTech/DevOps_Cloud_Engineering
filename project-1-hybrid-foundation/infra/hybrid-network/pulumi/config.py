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
