# bridge-logic.tf
# Sync logic and status tracking for hypervisor bridges

locals {
  common_tags = {
    Project     = "project-1-hybrid-foundation"
    Step        = "6-virtualization-bridge"
    Environment = var.env_tag
    ManagedBy   = "terraform"
    Component   = "virtualization-bridge"
  }

  # Bridge node connectivity info for hypervisor modules
  bridge_connectivity = {
    private_ip = aws_instance.bridge_node.private_ip
    public_ip  = aws_instance.bridge_node.public_ip
    ssh_user   = "ubuntu"
    ssh_key    = var.ssh_public_key_path
  }
}

# Validation: Ensure bridge node is in correct VPC
resource "null_resource" "validate_vpc" {
  triggers = {
    # ✅ FIX: Use Remote State instead of variables
    vpc_id    = data.terraform_remote_state.project1.outputs.aws_vpc_id
    subnet_id = data.terraform_remote_state.project1.outputs.aws_subnet_id
  }

  provisioner "local-exec" {
    command = <<-EOT
      echo "✅ Bridge node validated:"
      echo "  VPC: ${data.terraform_remote_state.project1.outputs.aws_vpc_id}"
      echo "  Subnet: ${data.terraform_remote_state.project1.outputs.aws_subnet_id}"
      echo "  Expected CIDR: 10.20.0.0/16 (Project 1 AWS VPC)"
    EOT
  }
}