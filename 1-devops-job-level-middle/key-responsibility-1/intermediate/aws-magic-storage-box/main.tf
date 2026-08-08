# ==========================================
# 1. THE PROVIDERS
# ==========================================
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# ==========================================
# 2. THE MAGIC NAMING HAT (Random Generator)
# ==========================================
resource "random_pet" "bucket_name" {
  prefix    = "pizza-recipes"
  length    = 2
  separator = "-"
}

# ==========================================
# 3. THE SECRET CLUBHOUSE (Custom VPC)
# ==========================================
resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "MySecretClubhouse-VPC"
  }
}

# ==========================================
# 4. THE ROOMS (Subnets)
# ==========================================
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "PublicSubnet-FrontDoor"
  }
}

resource "aws_subnet" "private" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = false

  tags = {
    Name = "PrivateSubnet-Vault"
  }
}

# ==========================================
# 5. THE MAIN GATE & MAP (IGW & Route Table)
# ==========================================
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags   = { Name = "Clubhouse-MainGate" }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
  tags = { Name = "PublicRouteTable-Map" }
}

resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

# ==========================================
# 6. DYNAMIC AMI LOOKUP
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
# 7. THE SECURITY GUARD (Updated for SSH)
# ==========================================
resource "aws_security_group" "web_sg" {
  name        = "hello-cloud-sg"
  description = "Allow HTTP, HTTPS, and SSH inbound traffic"
  vpc_id      = aws_vpc.main.id

  # NEW: Open Port 22 for SSH!
  ingress {
    description = "SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

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
  tags = { Name = "WebServer-SecurityGuard" }
}

# ==========================================
# 8. THE MAGIC STORAGE BOX (S3 Bucket)
# ==========================================
resource "aws_s3_bucket" "pizza_vault" {
  bucket        = random_pet.bucket_name.id
  force_destroy = true

  tags = {
    Name = "MagicStorageBox-S3"
  }
}

resource "aws_s3_bucket_public_access_block" "pizza_vault_block" {
  bucket = aws_s3_bucket.pizza_vault.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# ==========================================
# 9. THE SECURITY BADGE (IAM Role & Policy)
# ==========================================
data "aws_iam_policy_document" "s3_access" {
  statement {
    actions   = ["s3:ListBucket"]
    resources = [aws_s3_bucket.pizza_vault.arn]
  }
  statement {
    actions   = ["s3:PutObject", "s3:GetObject", "s3:DeleteObject"]
    resources = ["${aws_s3_bucket.pizza_vault.arn}/*"]
  }
}

resource "aws_iam_policy" "s3_policy" {
  name        = "EC2-S3-Access-Policy"
  description = "Allows EC2 to read and write to the S3 Magic Storage Box"
  policy      = data.aws_iam_policy_document.s3_access.json
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "ec2_s3_role" {
  name               = "EC2-S3-Role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_role_policy_attachment" "s3_attach" {
  role       = aws_iam_role.ec2_s3_role.name
  policy_arn = aws_iam_policy.s3_policy.arn
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "EC2-Instance-Profile"
  role = aws_iam_role.ec2_s3_role.name
}

# ==========================================
# 10. THE FRONT DOOR KEY (Auto-Generated SSH Key)
# ==========================================
# Generate a secure RSA key pair locally
resource "tls_private_key" "example" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Save the private key directly into your project directory!
resource "local_file" "private_key" {
  content         = tls_private_key.example.private_key_pem
  filename        = "${path.module}/my-devops-key.pem"
  file_permission = "0400" # Secures the file automatically
}

# Upload the public key to AWS
resource "aws_key_pair" "deployer_key" {
  key_name   = "my-devops-key" # <--- CHANGED TO key_name
  public_key = tls_private_key.example.public_key_openssh
}

# ==========================================
# 11. THE VIRTUAL COMPUTER (Updated with SSH Key)
# ==========================================
resource "aws_instance" "hello_cloud" {
  ami           = data.aws_ami.amazon_linux_2023.id
  instance_type = "t2.micro"

  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  # WEAR THE LANYARD!
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name

  # USE THE KEY!
  key_name = aws_key_pair.deployer_key.key_name

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
# 12. THE PERMANENT NAMEPLATE (Elastic IP)
# ==========================================
resource "aws_eip" "web_eip" {
  instance = aws_instance.hello_cloud.id
  domain   = "vpc"
  tags     = { Name = "My-Permanent-Web-IP" }
}

# ==========================================
# 13. THE OUTPUTS
# ==========================================
output "website_url" {
  value       = "http://${aws_eip.web_eip.public_ip}"
  description = "The permanent URL to access your web server"
}

output "elastic_ip" {
  value       = aws_eip.web_eip.public_ip
  description = "The Elastic IP address of your web server"
}

output "ssh_command" {
  value       = "ssh -i my-devops-key.pem ec2-user@${aws_eip.web_eip.public_ip}"
  description = "The exact command to SSH into your server"
}

output "vpc_id" {
  value       = aws_vpc.main.id
  description = "The ID of our new Secret Clubhouse"
}

output "bucket_name" {
  value       = aws_s3_bucket.pizza_vault.id
  description = "The globally unique name of your Magic Storage Box"
}