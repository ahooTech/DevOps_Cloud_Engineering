# virtualization/hybrid-vsphere-oci/oci/variables.tf

variable "bridge_node_ip" {
  description = "Private IP of the AWS bridge node (passed from main.tf)"
  type        = string
}

variable "compartment_id" {
  description = "OCI compartment OCID for bare-metal instance"
  type        = string
}

variable "oci_subnet_id" {
  description = "OCI subnet OCID for bare-metal instance network attachment"
  type        = string
}