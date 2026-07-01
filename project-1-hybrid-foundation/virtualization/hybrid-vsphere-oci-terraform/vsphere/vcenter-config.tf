# ⚠️ The Broadcom Licensing Reality (2024 Update)
# VMware (now owned by Broadcom) killed the free standalone ESXi license in 2024. You can no longer just download ESXi and run it on bare metal for free.
# ✅ The "Free Real vSphere" Workaround
# However, Broadcom made VMware Workstation Pro 100% FREE for personal use.
# We will use Workstation Pro to run a Nested ESXi 8.0 host (using the 60-day free evaluation). This gives you a 100% real vSphere API that Terraform can talk to.



# virtualization/hybrid-vsphere-oci/vsphere/vcenter-config.tf

# Input: IP of the AWS bridge node (passed from main.tf)

# Data source: Find your vCenter server (simulate with locals if no real vCenter)
data "vsphere_datacenter" "dc" {
  name = "Hybrid-DC"
}

# Simulated vCenter config for hybrid bridge (no real API call needed for lab)
locals {
  vcenter_host        = "vcenter.corp.local"
  bridge_sync_enabled = true
}


# Render a simulated config file to prove the IP is injected
resource "local_file" "vsphere_config" {
  content = <<-EOT
    # vSphere Bridge Sync Configuration
    vcenter_host = "${local.vcenter_host}"
    bridge_target_ip = "${var.bridge_node_ip}"
    bridge_port = 8443
    sync_enabled = ${local.bridge_sync_enabled}
  EOT
  filename = "${path.module}/generated/vsphere-sync.conf"
}

# Output: Status message for validation
output "vsphere_bridge_status" {
  value = "vCenter configured to sync with bridge node at ${var.bridge_node_ip}:8443"
}

# Optional: Real vCenter VM resource (commented for simulation)
/*
resource "vsphere_virtual_machine" "bridge_sync_vm" {
  name             = "hybrid-bridge-sync"
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.ds.id
  num_cpus         = 2
  memory           = 4096
  guest_id         = "ubuntu64Guest"
  
  network_interface {
    network_id = data.vsphere_network.vm_network.id
  }
  
  # Route sync traffic to AWS bridge node
  extra_config = {
    "bridge.sync.target" = var.bridge_node_ip
    "bridge.sync.port"   = "8443"
  }
}
*/
