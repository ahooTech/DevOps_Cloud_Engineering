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