variable "aws_region" {
  default = "us-east-1"
}

variable "azure_location" {
  default = "eastus"
}

variable "azure_subscription_id" {
  type      = string
  sensitive = true
}

variable "gcp_project_id" {
  type = string
}

variable "gcp_region" {
  default = "us-central1"
}

# Parity-aligned CIDRs (non-overlapping)
variable "onprem_cidr" {
  default = "10.10.0.0/16"
} # Matches your Vagrant private_network

variable "aws_cidr" {
  default = "10.20.0.0/16"
}

variable "azure_cidr" {
  default = "10.30.0.0/16"
}

variable "gcp_cidr" {
  default = "10.40.0.0/16"
}

# BGP ASNs (RFC 6598/64512 range for private peering)
variable "onprem_bgp_asn" {
  default = 65000
}

variable "aws_bgp_asn" {
  default = 64512
}

variable "azure_bgp_asn" {
  default = 65500
}

variable "gcp_bgp_asn" {
  default = 65001
}

variable "onprem_public_ip_placeholder" {
  description = "Public IP of on-prem environment (Vagrant/NAT/edge simulation)"
  type        = string
  default     = "203.0.113.10"
}


# Think of this `variables.tf` file as the **Master Rulebook** or the **Corporate Policy Manual**. 

# While your resource files (`aws_tgw.tf`, `azure_vwan.tf`, etc.) are the actual architectural blueprints that build the network, they don't contain the specific values (like IP addresses or region names). Instead, they use placeholders like `var.aws_cidr`. 

# This `variables.tf` file is where you **define those placeholders**. It sets the ground rules and creates the "empty boxes" that will be filled with actual data later.

# Here is the easy-to-understand breakdown of the rules defined in this manual:

# ### 1. The Physical Locations (Regions)
# ```hcl
# variable "aws_region" { default = "us-east-1" }
# variable "azure_location" { default = "eastus" }
# variable "gcp_region" { default = "us-central1" }
# ```
# *   **What it means:** This tells the construction crews exactly *where* on the planet to build the data centers. By putting them here, if your boss suddenly says, *"Move everything to Europe,"* you only have to change these three lines, and the whole project updates.

# ### 2. The Corporate Wallets (Billing IDs)
# ```hcl
# variable "azure_subscription_id" {
#   type      = string
#   sensitive = true
# }
# variable "gcp_project_id" { type = string }
# ```
# *   **What it means:** These are the empty boxes for your billing account numbers. 
# *   **The `sensitive = true` flag:** This is a crucial security feature. It tells Terraform: *"This is a secret. Never print this value in the console logs, and never show it in the outputs."* If you accidentally take a screenshot of your deployment logs, Terraform will automatically blur out this ID to protect your account.

# ### 3. The Network "Zip Codes" (CIDRs)
# ```hcl
# variable "onprem_cidr" { default = "10.10.0.0/16" }
# variable "aws_cidr"    { default = "10.20.0.0/16" }
# variable "azure_cidr"  { default = "10.30.0.0/16" }
# variable "gcp_cidr"    { default = "10.40.0.0/16" }
# ```
# *   **What it means:** As we discussed in the Pulumi `config.py` file, these are the IP address ranges (Zip Codes) for each network. 
# *   **The Golden Rule:** Notice the comment `# Parity-aligned CIDRs (non-overlapping)`. This file enforces the rule that no two clouds can share the same IP range, ensuring traffic never gets confused when traveling between them.

# ### 4. The Router "Dialing Codes" (BGP ASNs)
# ```hcl
# variable "onprem_bgp_asn" { default = 65000 }
# variable "aws_bgp_asn"    { default = 64512 }
# variable "azure_bgp_asn"  { default = 65500 }
# variable "gcp_bgp_asn"    { default = 65001 }
# ```
# *   **What it means:** These are the unique identification numbers (Autonomous System Numbers) for the BGP "diplomats" in each cloud. They allow the routers to introduce themselves and exchange routing maps securely.

# ### 5. The Fake Headquarters Address (Placeholder)
# ```hcl
# variable "onprem_public_ip_placeholder" {
#   description = "Public IP of on-prem environment (Vagrant/NAT/edge simulation)"
#   type        = string
#   default     = "203.0.113.10"
# }
# ```
# *   **What it means:** Since this is a lab and you don't have a real physical datacenter with a real public IP, you are simulating one. This variable creates a placeholder IP address (`203.0.113.10`) so the cloud VPN gateways have *something* to point to, even if it's just a dummy address for now.

# ---

# ### 💡 The Big Picture: Why do it this way?

# You might wonder: *"Why not just type `10.20.0.0/16` directly into the `aws_tgw.tf` file?"*

# If you hardcode values, your code becomes **rigid**. If you want to deploy this exact same network to a "Production" environment tomorrow, you'd have to copy all your files and manually change every single IP address and region.

# By using `variables.tf`, you achieve **Reusability and Environment Parity**. 
# 1. `variables.tf` creates the empty boxes (e.g., "I need an AWS CIDR").
# 2. `terraform.tfvars` (which we looked at earlier) puts the *Dev* values into those boxes.
# 3. Tomorrow, you can create a `production.tfvars` file with *Prod* values, and run the exact same code to build a production network without changing a single line of your blueprints!