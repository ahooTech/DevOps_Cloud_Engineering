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