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