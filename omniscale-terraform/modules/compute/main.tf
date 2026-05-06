# modules/compute/main.tf
# C:\Users\DAYLIFF\Desktop\DevOps.E_Cloud.E_Platform.E_Infrastructure.E_DevSecOps._Site_Realiability.E\Projects\omniscale-terraform\modules\compute\main.tf

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs for instances"
}

variable "security_group_id" {
  type        = string
  description = "Security group ID"
}

variable "environment" {
  type        = string
  description = "Environment name"
}

variable "tags" {
  type        = map(string)
  description = "Common tags for resources"
}

# ✅ FIX: Use local_file to read raw content without interpolation
data "local_file" "baseline" {
  filename = "${path.module}/../../scripts/baseline.sh"
}

resource "aws_launch_template" "web" {
  name_prefix   = "${var.environment}-web-"
  image_id      = "ami-0c55b159cbfafe1f0" # Ubuntu 22.04 (LocalStack ignores validation)
  instance_type = "t3.micro"

  # ✅ Base64 encode the raw file content for user_data
  user_data = base64encode(data.local_file.baseline.content)

  network_interfaces {
    subnet_id       = var.subnet_ids[0]
    security_groups = [var.security_group_id]
  }

  tag_specifications {
    resource_type = "instance"
    tags = merge(var.tags, {
      Name = "${var.environment}-web-parity"
      Tier = "public"
    })
  }
}

output "web_lt_id" {
  value       = aws_launch_template.web.id
  description = "Web launch template ID"
}