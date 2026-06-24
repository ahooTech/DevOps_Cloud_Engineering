# aws_tgw.tf - Corrected Transit Gateway Config
# ⚠️ Save as UTF-8 WITHOUT BOM in VS Code/Notepad++

resource "aws_vpc" "main" {
  cidr_block           = var.aws_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name        = "proj1-aws-vpc"
    Environment = "lab"
  }
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet(var.aws_cidr, 8, 1)
  map_public_ip_on_launch = true
  availability_zone       = "${var.aws_region}a"
  tags = {
    Name = "proj1-aws-public"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "proj1-aws-igw"
  }
}

# ✅ CORRECT: aws_ec2_transit_gateway (not aws_transit_gateway)
resource "aws_ec2_transit_gateway" "tgw" {
  description                     = "Project 1 Hybrid TGW"
  amazon_side_asn                 = var.aws_bgp_asn
  auto_accept_shared_attachments  = "enable"
  default_route_table_association = "enable"
  default_route_table_propagation = "enable"
  tags = {
    Name = "proj1-aws-tgw"
  }
}

# ✅ CORRECT: aws_ec2_transit_gateway_vpc_attachment
resource "aws_ec2_transit_gateway_vpc_attachment" "vpc_attach" {
  subnet_ids         = [aws_subnet.public.id]
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  vpc_id             = aws_vpc.main.id
  tags = {
    Name = "proj1-aws-tgw-attach"
  }
}

resource "aws_vpn_gateway" "vgw" {
  vpc_id          = aws_vpc.main.id
  amazon_side_asn = var.aws_bgp_asn
  tags = {
    Name = "proj1-aws-vgw"
  }
}




# Route Table for Public Subnet (Traffic to Internet)
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = { Name = "proj1-aws-public-rt" }
}

resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public_rt.id
}

# Route Table for TGW (Traffic to On-Prem/Other Clouds)
resource "aws_route_table" "tgw_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block         = var.onprem_cidr # Route to on-prem
    transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  }

  tags = { Name = "proj1-aws-tgw-rt" }
}

#resource "aws_route_table_association" "tgw_assoc" {
#  subnet_id      = aws_subnet.public.id # In prod, this would be your private subnet
#  route_table_id = aws_route_table.tgw_rt.id
#}


#Notes


# Think of this `aws_tgw.tf` file as the **AWS Construction Blueprint** written in Terraform's native language (HCL - HashiCorp Configuration Language). 

# Unlike the Python Pulumi file which used functions and logic, Terraform is **declarative**. You aren't writing a script that executes top-to-bottom; you are simply declaring a list of **resources** you want to exist, and Terraform's engine figures out the order to build them.

# Here is the easy-to-understand breakdown of exactly what this blueprint is building, block by block:

# ---

# ### 1. The Fenced Campus & The Building (VPC & Subnet)
# ```hcl
# resource "aws_vpc" "main" { ... }
# resource "aws_subnet" "public" { ... }
# ```
# *   **The VPC (`aws_vpc`):** This is the private, fenced-in land. Notice it uses `var.aws_cidr`. In Terraform, `var.` means *"go look in the `variables.tf` file for this value."* This keeps your code clean and reusable.
# *   **The Subnet (`aws_subnet`):** This is a specific building zone inside the campus. 
#     *   *Terraform Superpower:* Notice `cidrsubnet(var.aws_cidr, 8, 1)`. Unlike Python, Terraform has built-in math functions! This tells Terraform: *"Take the main VPC IP range, slice it into smaller pieces, and give me the 2nd piece."* It automatically calculates `10.20.1.0/24` for you.

# ### 2. The Main Gate (Internet Gateway)
# ```hcl
# resource "aws_internet_gateway" "igw" { ... }
# ```
# *   **The IGW:** This is the main security gate at the front of the campus. It allows traffic from the "Public Subnet" to go out onto the public internet.

# ### 3. The Highway Interchange & The On-Ramp (Transit Gateway)
# ```hcl
# resource "aws_ec2_transit_gateway" "tgw" { ... }
# resource "aws_ec2_transit_gateway_vpc_attachment" "vpc_attach" { ... }
# ```
# *   **The Transit Gateway (`tgw`):** This is a massive, high-speed highway interchange. Its job is to connect your AWS campus to other clouds (Azure, GCP) or your on-premises office.
# *   **The Attachment (`vpc_attach`):** This is the physical on-ramp that connects your AWS campus (the VPC) to the highway interchange (the TGW). Without this attachment, the VPC and the TGW are completely isolated from each other.

# ### 4. The Secure Vault Door (VPN Gateway)
# ```hcl
# resource "aws_vpn_gateway" "vgw" { ... }
# ```
# *   **The VGW:** This is the secure vault door on the AWS side of the campus. In the next file (`bgp_peering.tf`), you will build the actual encrypted tunnel that connects this vault door to your on-premises router.

# ### 5. The GPS Signage (Route Tables & Associations)
# ```hcl
# resource "aws_route_table" "public_rt" { ... }
# resource "aws_route_table_association" "public_assoc" { ... }

# resource "aws_route_table" "tgw_rt" { ... }
# ```
# *   **Route Tables:** If the VPC is the campus, Route Tables are the GPS signs telling data packets where to drive.
#     *   **`public_rt`:** Says, *"If you want to go to the Internet (`0.0.0.0/0`), drive to the Main Gate (`igw`)."*
#     *   **`tgw_rt`:** Says, *"If you want to go to the On-Premises office (`var.onprem_cidr`), drive to the Highway Interchange (`tgw`)."*
# *   **Route Table Association (`public_assoc`):** This physically nails the "Public Route Table" sign to the "Public Subnet" building so the resources inside know which rules to follow.

# ### 6. The Commented-Out Code (Why is it crossed out?)
# ```hcl
# #resource "aws_route_table_association" "tgw_assoc" { ... }
# ```
# *   You might wonder why this last block is commented out with `#`. 
# *   **The Reason:** When you created the `vpc_attach` (the on-ramp to the Transit Gateway) earlier in the file, you set `default_route_table_association = "enable"` on the Transit Gateway itself. Because of that setting, AWS **automatically** handles the routing for the Transit Gateway. If you tried to uncomment this block, AWS would throw an error saying, *"This route table is already associated!"*

# ---

# ### 💡 The Big Picture: Terraform vs. Pulumi

# Now that you've seen both, here is the fundamental difference in how they think:

# *   **Pulumi (Python)** is **Imperative**: You write a function (`create_aws_network()`) that executes line-by-line. You have to manually calculate things like IP subnets using Python libraries or hardcode them.
# *   **Terraform (HCL)** is **Declarative**: You just declare `resource "aws_vpc" "main"`. You don't write loops or functions. You just state what you want, and Terraform's engine builds a dependency graph. It sees that the Subnet needs the VPC's ID (`aws_vpc.main.id`), so it automatically builds the VPC *first*, then the Subnet.

# **In summary:** This file lays the entire physical and logical foundation for your AWS network. It builds the land, the gates, the highway interchange, and the GPS signs, preparing it perfectly for the VPN tunnels that will be built in the next file!