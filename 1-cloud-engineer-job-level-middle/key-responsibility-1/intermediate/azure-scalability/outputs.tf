output "resource_group_name" {
  description = "The name of the Azure Resource Group"
  value       = azurerm_resource_group.main.name
}

output "bastion_public_ip" {
  description = "Public IP address of the Bastion host"
  value       = azurerm_public_ip.bastion.ip_address
}

output "ssh_command" {
  description = "Command to SSH into the bastion host"
  value       = "ssh -i ./${var.project}-key.pem azureuser@${azurerm_public_ip.bastion.ip_address}"
}

output "lb_public_ip" {
  description = "Public IP of the Azure Load Balancer (The traffic cop)"
  value       = azurerm_public_ip.lb.ip_address
}

output "curl_command" {
  description = "Command to test the Load Balancer and web servers"
  value       = "curl http://${azurerm_public_ip.lb.ip_address}"
}

output "entra_user_passwords" {
  description = "Generated Entra ID user passwords. Use: terraform output -json entra_user_passwords"
  value = {
    for username, user in azuread_user.this :
    username => random_password.entra_users[username].result
  }
  sensitive = true
}