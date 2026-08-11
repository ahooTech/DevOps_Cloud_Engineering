output "vpc_id" {
  description = "ID of the custom VPC"
  value       = aws_vpc.main.id
}

output "bastion_public_dns" {
  description = "Public DNS name of the bastion server"
  value       = aws_instance.bastion.public_dns
}

output "ssh_command" {
  description = "SSH command to connect to the bastion server"
  value       = local.create_new_key ? "ssh -i ${local_file.ssh_private_key[0].filename} ec2-user@${aws_instance.bastion.public_dns}" : "ssh ec2-user@${aws_instance.bastion.public_dns}"
}

output "alb_dns_name" {
  description = "DNS name of the Application Load Balancer"
  value       = aws_lb.main.dns_name
}

output "curl_command" {
  description = "Command to test the load balancer"
  value       = "curl http://${aws_lb.main.dns_name}"
}

output "iam_user_passwords" {
  description = "Generated IAM console passwords. Use: terraform output -json iam_user_passwords"
  value       = { for username, profile in aws_iam_user_login_profile.this : username => profile.password }
  sensitive   = true
}