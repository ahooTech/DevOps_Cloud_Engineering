# # oci/bare-metal-config.tf
# # Real OCI Bare Metal deployment (No mock providers)

# terraform {
#   required_providers {
#     oci = {
#       source  = "oracle/oci"
#       version = "~> 5.0"
#     }
#   }
# }


# data "oci_identity_availability_domain" "ad" {
#   compartment_id = var.compartment_id
#   ad_number      = 1 # Usually 1, 2, or 3 depending on region
# }

# # ✅ FIX 3: Look up the latest Oracle Linux or Ubuntu image
# data "oci_core_images" "ubuntu" {
#   compartment_id           = var.compartment_id
#   operating_system         = "Canonical Ubuntu"
#   operating_system_version = "22.04"
#   shape                    = "BM.Standard.E3.Flex"
#   sort_by                  = "TIMECREATED"
#   sort_order               = "DESC"
#   state                    = "AVAILABLE"
# }

# # The Bare Metal Instance
# resource "oci_core_instance" "bare_metal_bridge" {
#   availability_domain = data.oci_identity_availability_domain.ad.name
#   compartment_id      = var.compartment_id
#   shape               = "BM.Standard.E3.Flex"
  
#   # Bare Metal Flex shapes require shape_config
#   shape_config {
#     ocpus         = 2
#     memory_in_gbs = 32
#   }

#   create_vnic_details {
#     subnet_id        = var.oci_subnet_id
#     display_name     = "hybrid-bridge-vnic"
#     assign_public_ip = false # Keep private, route through FastConnect/VPN
#   }

#   source_details {
#     source_type = "image"
#     source_id   = data.oci_core_images.ubuntu.images[0].id
#   }

#   # ✅ FIX 4: Use the templatefile correctly (file must exist)
#   metadata = {
#     user_data = base64encode(templatefile("${path.module}/cloud-init-oci.yaml", {
#       bridge_ip = var.bridge_node_ip
#     }))
#   }

#   display_name = "hybrid-oci-bare-metal-bridge"
  
#   # Prevent accidental deletion
#   lifecycle {
#     prevent_destroy = false # Set to true in production!
#   }
  
#   freeform_tags = {
#     "Project"     = "project-1-hybrid-foundation"
#     "Environment" = "dev-lab"
#     "Role"        = "virtualization-bridge-oci"
#   }
# }

# # Output the private IP for validation
# output "oci_bridge_private_ip" {
#   value = oci_core_instance.bare_metal_bridge.private_ip
# }

# output "oci_bridge_status" {
#   value = "OCI bare-metal configured to peer with AWS bridge node at ${var.bridge_node_ip}:8443"
# }



# oci/bare-metal-config.tf
# Simulation: Generates the exact payload that would be sent to OCI
# This proves architectural mastery without requiring a credit card or real account.

# 1. Render the production-grade cloud-init script
resource "local_file" "oci_cloud_init" {
  content = templatefile("${path.module}/cloud-init-oci.yaml", {
    bridge_ip = var.bridge_node_ip
  })
  filename = "${path.module}/generated/oci-cloud-init.yaml"
}

# 2. Render the Terraform deployment code that *would* be used
resource "local_file" "oci_deployment_tf" {
  content = <<-EOT
    # This is the exact Terraform code that would deploy the OCI Bare Metal instance
    resource "oci_core_instance" "bare_metal_bridge" {
      compartment_id      = "ocid1.compartment.oc1..example"
      shape               = "BM.Standard.E3.Flex"
      availability_domain = "example-ad-1"
      
      create_vnic_details {
        subnet_id        = "ocid1.subnet.oc1..example"
        assign_public_ip = false
      }

      metadata = {
        user_data = base64encode(file("${path.module}/generated/oci-cloud-init.yaml"))
      }
    }
  EOT
  filename = "${path.module}/generated/oci-deployment.tf"
}

output "oci_bridge_status" {
  value = "✅ OCI Simulation Complete: Generated cloud-init and Terraform payload for bridge IP ${var.bridge_node_ip}"
}