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
# 4. THE ROOMS (Subnets) - UPGRADED FOR LOAD BALANCER!
# ==========================================
# An ALB requires at least TWO public subnets in different Availability Zones!
resource "aws_subnet" "public_1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
  tags                    = { Name = "PublicSubnet-1-FrontDoor" }
}

resource "aws_subnet" "public_2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true
  tags                    = { Name = "PublicSubnet-2-FrontDoor" }
}

resource "aws_subnet" "private" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1c"
  map_public_ip_on_launch = false
  tags                    = { Name = "PrivateSubnet-Vault" }
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

# We must map the route table to BOTH public front doors!
resource "aws_route_table_association" "public_assoc_1" {
  subnet_id      = aws_subnet.public_1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_assoc_2" {
  subnet_id      = aws_subnet.public_2.id
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
# 7. THE SECURITY GUARDS (Updated for ALB)
# ==========================================
# Guard 1: The Bouncer at the very front (ALB Security Group)
resource "aws_security_group" "alb_sg" {
  name        = "alb-sg"
  description = "Allow HTTP inbound traffic from the internet to the Load Balancer"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "HTTP from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = { Name = "ALB-SecurityGuard" }
}

# Guard 2: The Kitchen Door (Web Server Security Group)
resource "aws_security_group" "web_sg" {
  name        = "web-sg"
  description = "Allow HTTP ONLY from the ALB, and SSH from anywhere"
  vpc_id      = aws_vpc.main.id

  ingress {
    description     = "HTTP from ALB ONLY"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.alb_sg.id] # Super secure! Only the ALB can talk to the servers.
  }

  ingress {
    description = "SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
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
  tags          = { Name = "MagicStorageBox-S3" }
}

resource "aws_s3_bucket_public_access_block" "pizza_vault_block" {
  bucket                  = aws_s3_bucket.pizza_vault.id
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
resource "tls_private_key" "example" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "private_key" {
  content         = tls_private_key.example.private_key_pem
  filename        = "${path.module}/my-devops-key.pem"
  file_permission = "0400"
}

resource "aws_key_pair" "deployer_key" {
  key_name   = "my-devops-key"
  public_key = tls_private_key.example.public_key_openssh
}

# ==========================================
# 11. THE VIRTUAL COMPUTER FLEET (Updated for Load Balancing)
# ==========================================
# Instead of 1 instance, we use count = 3 to build a fleet!
resource "aws_instance" "web_fleet" {
  count         = 3 # WE ARE BUILDING A FLEET!
  ami           = data.aws_ami.amazon_linux_2023.id
  instance_type = "t2.micro"

  # Distribute the servers evenly across our two public subnets
  subnet_id              = count.index % 2 == 0 ? aws_subnet.public_1.id : aws_subnet.public_2.id
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name
  key_name             = aws_key_pair.deployer_key.key_name

  user_data = <<-EOF
              #!/bin/bash
              sudo dnf update -y
              sudo dnf install -y httpd
              sudo systemctl start httpd
              sudo systemctl enable httpd
              echo "<h1>Hello from Pizza Web Server ${count.index + 1}!</h1>" | sudo tee /var/www/html/index.html
              EOF

  tags = {
    Name = "PizzaWebServer-${count.index + 1}"
  }
}

# ==========================================
# 12. THE TRAFFIC COP (Application Load Balancer)
# ==========================================
resource "aws_lb" "web_alb" {
  name               = "pizza-traffic-cop"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = [aws_subnet.public_1.id, aws_subnet.public_2.id]

  tags = { Name = "The-Traffic-Cop" }
}

# The Clipboard (Target Group) where the ALB keeps track of the chefs
resource "aws_lb_target_group" "web_tg" {
  name     = "web-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    interval            = 30
  }
}

# The Ear (Listener) that listens for incoming web traffic on port 80
resource "aws_lb_listener" "web_listener" {
  load_balancer_arn = aws_lb.web_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web_tg.arn
  }
}

# The Handshake (Attachment) connecting the 3 servers to the Target Group
resource "aws_lb_target_group_attachment" "web_attachment" {
  count            = 3
  target_group_arn = aws_lb_target_group.web_tg.arn
  target_id        = aws_instance.web_fleet[count.index].id
  port             = 80
}

# ==========================================
# 13. THE OUTPUTS
# ==========================================
output "alb_dns_name" {
  value       = aws_lb.web_alb.dns_name
  description = "The DNS name of the Traffic Cop (Load Balancer)"
}

output "website_url" {
  value       = "http://${aws_lb.web_alb.dns_name}"
  description = "The URL to access your load-balanced web servers"
}

output "vpc_id" {
  value       = aws_vpc.main.id
  description = "The ID of our new Secret Clubhouse"
}

output "bucket_name" {
  value       = aws_s3_bucket.pizza_vault.id
  description = "The globally unique name of your Magic Storage Box"
}




# Once it finishes, look at your terminal outputs for website_url. It will be a long AWS link like http://pizza-traffic-cop-12345.us-east-1.elb.amazonaws.com.
# Open that link in your web browser. You will see: "Hello from Pizza Web Server 2!" (or 1, or 3).
# The Magic Trick: Hit the Refresh button on your browser 5 or 6 times.
# Watch the screen closely. You will see it change from Server 1 ➡️ Server 3 ➡️ Server 2 ➡️ Server 1.