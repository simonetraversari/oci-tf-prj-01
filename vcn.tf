resource "oci_core_virtual_network" "TF_VCN01" {
  cidr_block = "${var.TF_VCN01_CONFIG.cidr_block}"
  dns_label = "${var.TF_VCN01_CONFIG.dns_label}"
  compartment_id = "${var.compartment_ocid}"  
  display_name = "${var.TF_VCN01_CONFIG.display_name}"
}