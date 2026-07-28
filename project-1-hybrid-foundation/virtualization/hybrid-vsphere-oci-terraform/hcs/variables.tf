# # virtualization/hybrid-vsphere-oci/hcs/variables.tf

# variable "bridge_node_ip" {
#   description = "Private IP of the AWS bridge node (passed from main.tf)"
#   type        = string
# }

# variable "hcs_region" {
#   description = "Huawei Cloud region (e.g., af-south-1 for Africa, relevant to Safaricom context)"
#   type        = string
#   default     = "af-south-1" 
# }

# variable "hcs_access_key" {
#   description = "Huawei Cloud Access Key"
#   type        = string
#   sensitive   = true
# }

# variable "hcs_secret_key" {
#   description = "Huawei Cloud Secret Key"
#   type        = string
#   sensitive   = true
# }

# variable "hcs_image_id" {
#   description = "Huawei Cloud Ubuntu 22.04 Image ID"
#   type        = string
#   default     = "Ubuntu 22.04 server 64bit" # Huawei Cloud allows searching by name
# }




# virtualization/hybrid-vsphere-oci/hcs/variables.tf

variable "bridge_node_ip" {
  description = "Private IP of the AWS bridge node (passed from main.tf)"
  type        = string
}