output "resource_group_name" {
  value = azurerm_resource_group.main.name
}

output "bastion_public_ip" {
  value = azurerm_public_ip.bastion.ip_address
}

output "web_private_ip" {
  value = azurerm_network_interface.web.private_ip_address
}

output "ssh_command" {
  value = "ssh -i ./${var.project}-key.pem azureuser@${azurerm_public_ip.bastion.ip_address}"
}

output "entra_user_passwords" {
  description = "Generated Entra ID user passwords"
  value = {
    for username, user in azuread_user.this :
    username => random_password.entra_users[username].result
  }
  sensitive = true
}