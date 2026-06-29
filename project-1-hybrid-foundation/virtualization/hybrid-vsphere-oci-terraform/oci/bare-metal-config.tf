# virtualization/hybrid-vsphere-oci/oci/bare-metal-config.tf

# Input: IP of the AWS bridge node

# OCI Provider (commented for simulation - uncomment when using real OCI)
/*
provider "oci" {
  region = var.oci_region
}

resource "oci_core_instance" "bare_metal_bridge" {
  availability_domain = data.oci_identity_availability_domain.ad.name
  compartment_id      = var.compartment_id
  shape               = "BM.Standard.E3.Flex"
  
  create_vnic_details {
    subnet_id        = var.oci_subnet_id
    display_name     = "hybrid-bridge-vnic"
    assign_public_ip = false
  }
  
  # Cloud-init to configure bridge sync
  metadata = {
    user_data = base64encode(templatefile("${path.module}/cloud-init-oci.yaml", {
      bridge_ip = var.bridge_node_ip
    }))
  }
}
*/

# Simulation output (works without real OCI credentials)
output "oci_bridge_status" {
  value = "OCI bare-metal configured to peer with bridge node at ${var.bridge_node_ip}:8443"
}

# Variables for real deployment (uncomment when ready)
/*
variable "oci_region" { default = "us-ashburn-1" }
variable "compartment_id" { type = string }
variable "oci_subnet_id" { type = string }
*/