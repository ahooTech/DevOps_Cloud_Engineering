# This is the exact Terraform code that would deploy the HCS/ECS instance
resource "huaweicloud_compute_instance_v2" "hcs_bridge" {
  name        = "hcs-bridge-node"
  flavor_name = "s6.small.1"
  image_name  = "Ubuntu 22.04 server 64bit"
      
  network {
    uuid = "huaweicloud_vpc_subnet_v1.hcs_subnet.id"
  }

  user_data = base64encode(file("hcs/generated/hcs-cloud-init.yaml"))
      
  tags = {
    Project = "project-1-hybrid-foundation"
    Role    = "hcs-bridge"
  }
}
