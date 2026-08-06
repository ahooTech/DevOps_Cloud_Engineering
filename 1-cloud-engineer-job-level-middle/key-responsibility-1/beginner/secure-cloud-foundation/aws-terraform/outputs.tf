output "vpc_id" {
  description = "ID of the custom VPC"
  value       = aws_vpc.main.id
}

output "public_subnet_id" {
  description = "ID of the public subnet"
  value       = aws_subnet.public.id
}

output "private_subnet_id" {
  description = "ID of the private subnet"
  value       = aws_subnet.private.id
}

output "bastion_public_ip" {
  description = "Public IP address of the bastion server"
  value       = aws_instance.bastion.public_ip
}

output "bastion_public_dns" {
  description = "Public DNS name of the bastion server"
  value       = aws_instance.bastion.public_dns
}

output "web_private_ip" {
  description = "Private IP address of the private web server"
  value       = aws_instance.web_private.private_ip
}

output "ssh_private_key_file" {
  description = "Path to the generated private SSH key file"
  value       = local.create_new_key ? local_file.ssh_private_key[0].filename : null
}

output "ssh_command" {
  description = "SSH command to connect to the bastion server"
  value = local.create_new_key ? (
    "ssh -i ${local_file.ssh_private_key[0].filename} ec2-user@${aws_instance.bastion.public_dns}"
  ) : "ssh ec2-user@${aws_instance.bastion.public_dns}"
}

output "iam_user_passwords" {
  description = "Generated IAM console passwords. Use: terraform output -json iam_user_passwords"
  value = {
    for username, profile in aws_iam_user_login_profile.this :
    username => profile.password
  }
  sensitive = true
}