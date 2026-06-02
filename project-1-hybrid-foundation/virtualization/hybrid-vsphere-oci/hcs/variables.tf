# virtualization/hybrid-vsphere-oci/hcs/variables.tf

variable "bridge_node_ip" {
  description = "Private IP of the AWS bridge node (passed from main.tf)"
  type        = string
}