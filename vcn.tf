resource "oci_core_virtual_network" "TF_VCN01" {
  cidr_block = "${var.TF_VCN01_CONFIG_CIDR_BLOCK}"
  dns_label = "${var.TF_VCN01_CONFIG_DNS_LABEL}"
  compartment_id = "${var.compartment_ocid}"  
  display_name = "${var.TF_VCN01_CONFIG_DISPLAY_NAME}"
}