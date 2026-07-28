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
    user_data = base64encode(file("oci/generated/oci-cloud-init.yaml"))
  }
}
