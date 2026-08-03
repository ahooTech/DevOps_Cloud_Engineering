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
# 2. DYNAMIC AMI LOOKUP (The Pro Way)
# ==========================================
# This asks AWS for the latest Amazon Linux 2023 AMI automatically!
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
# 3. THE SECURITY GUARD
# ==========================================
resource "aws_security_group" "web_sg" {
  name        = "hello-cloud-sg"
  description = "Allow HTTP and HTTPS inbound traffic"

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
}

# ==========================================
# 4. THE VIRTUAL COMPUTER
# ==========================================
resource "aws_instance" "hello_cloud" {
  # Notice we use the dynamic AMI ID here!
  ami           = data.aws_ami.amazon_linux_2023.id
  instance_type = "t2.micro"

  vpc_security_group_ids = [aws_security_group.web_sg.id]

  # The Magic Trick: User Data for Amazon Linux
  user_data = <<-EOF
              #!/bin/bash
              sudo dnf update -y
              sudo dnf install -y httpd
              sudo systemctl start httpd
              sudo systemctl enable httpd
              echo "<h1>Hello from my Terraform-built AWS Computer!</h1>" | sudo tee /var/www/html/index.html
              EOF

  tags = {
    Name = "MyFirstTerraformComputer-AWS"
  }
}

# ==========================================
# 5. THE OUTPUT
# ==========================================
output "website_url" {
  value       = "http://${aws_instance.hello_cloud.public_ip}"
  description = "The URL to access your new web server"
}