# ==========================================
# 1. THE PROVIDER
# ==========================================
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# ==========================================
# 2. THE SECRET CLUBHOUSE (Custom VPC)
# ==========================================
resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16" # This is the size of our property (65,536 IP addresses)
  enable_dns_hostnames = true          # Allows our computers to have DNS names
  enable_dns_support   = true          # Allows DNS resolution

  tags = {
    Name = "MySecretClubhouse-VPC"
  }
}

# ==========================================
# 3. THE ROOMS (Subnets)
# ==========================================
# The Front Door (Public)
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24" # A smaller slice of our property
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true # Crucial: Gives our computer a public IP automatically

  tags = {
    Name = "PublicSubnet-FrontDoor"
  }
}

# The Vault (Private)
resource "aws_subnet" "private" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = false # Crucial: NO public IP. Totally hidden.

  tags = {
    Name = "PrivateSubnet-Vault"
  }
}

# ==========================================
# 4. THE MAIN GATE (Internet Gateway)
# ==========================================
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "Clubhouse-MainGate"
  }
}

# ==========================================
# 5. THE MAP (Route Table)
# ==========================================
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  # This rule says: "Any traffic destined for the internet (0.0.0.0/0) goes to the Main Gate"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "PublicRouteTable-Map"
  }
}

# Tie the Map to the Front Door Room
resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

# ==========================================
# 6. DYNAMIC AMI LOOKUP (The Pro Way)
# ==========================================
data "aws_ami" "amazon_linux_2023" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# ==========================================
# 7. THE SECURITY GUARD (Updated for VPC)
# ==========================================
resource "aws_security_group" "web_sg" {
  name        = "hello-cloud-sg"
  description = "Allow HTTP and HTTPS inbound traffic"
  vpc_id      = aws_vpc.main.id # NOW TIED TO OUR CLUBHOUSE!

  ingress {
    description = "HTTP from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS from anywhere"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "WebServer-SecurityGuard"
  }
}

# ==========================================
# 8. THE VIRTUAL COMPUTER (Updated for Subnet)
# ==========================================
resource "aws_instance" "hello_cloud" {
  ami           = data.aws_ami.amazon_linux_2023.id
  instance_type = "t2.micro"

  # NOW PLACED INSIDE OUR PUBLIC FRONT DOOR ROOM!
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              sudo dnf update -y
              sudo dnf install -y httpd
              sudo systemctl start httpd
              sudo systemctl enable httpd
              echo "<h1>Hello from my Terraform-built AWS Computer inside a Custom VPC!</h1>" | sudo tee /var/www/html/index.html
              EOF

  tags = {
    Name = "MyFirstTerraformComputer-AWS"
  }
}

# ==========================================
# 9. THE PERMANENT NAMEPLATE (Elastic IP)
# ==========================================
resource "aws_eip" "web_eip" {
  instance = aws_instance.hello_cloud.id
  domain   = "vpc" # Ensures this IP is tied to our VPC environment

  tags = {
    Name = "My-Permanent-Web-IP"
  }
}

# ==========================================
# 10. THE OUTPUT
# ==========================================
output "website_url" {
  # NOTICE: We now use the Elastic IP, not the instance's dynamic IP!
  value       = "http://${aws_eip.web_eip.public_ip}"
  description = "The permanent URL to access your web server"
}

output "vpc_id" {
  value       = aws_vpc.main.id
  description = "The ID of our new Secret Clubhouse"
}