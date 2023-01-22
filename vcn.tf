resource "oci_core_virtual_network" "TF_VCN01" {
  cidr_block = "10.0.0.0/16"
  dns_label = "vcn01"
  compartment_id = "${var.compartment_ocid}"
  display_name = "vcn01"
}