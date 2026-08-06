output "project_id" {
  description = "GCP project ID"
  value       = var.project_id
}

output "vpc_id" {
  description = "GCP VPC network ID"
  value       = google_compute_network.main.id
}

output "public_subnet_id" {
  description = "Public subnet ID"
  value       = google_compute_subnetwork.public.id
}

output "private_subnet_id" {
  description = "Private subnet ID"
  value       = google_compute_subnetwork.private.id
}

output "bastion_external_ip" {
  description = "External IP of the bastion server"
  value       = google_compute_instance.bastion.network_interface[0].access_config[0].nat_ip
}

output "bastion_internal_ip" {
  description = "Internal IP of the bastion server"
  value       = google_compute_instance.bastion.network_interface[0].network_ip
}

output "web_internal_ip" {
  description = "Internal IP of the private web server"
  value       = google_compute_instance.web_private.network_interface[0].network_ip
}

output "ssh_private_key_file" {
  description = "Path to the generated private SSH key"
  value       = local_file.ssh_private_key.filename
}

output "ssh_command" {
  description = "SSH command to connect to the bastion server"
  value       = "ssh -i ./${var.project}-key.pem ubuntu@${google_compute_instance.bastion.network_interface[0].access_config[0].nat_ip}"
}

output "human_iam_bindings" {
  description = "Gmail accounts mapped to GCP project roles"
  value = {
    for key, binding in google_project_iam_member.human_roles :
    key => "${binding.member} -> ${binding.role}"
  }
}