resource "oci_core_virtual_network" "TF_VCN01" {
  cidr_block = "${var.TF_VCN01_CONFIG_CIDR_BLOCK}"
  dns_label = "${var.TF_VCN01_CONFIG_DNS_LABEL}"
  compartment_id = "${var.TF_VCN01_CONFIG_COMPARTMENT_OCID}"  
  display_name = "${var.TF_VCN01_CONFIG_DISPLAY_NAME}"
}

resource "oci_core_internet_gateway" "TF_VCN01_IGW01" {
  compartment_id = "${var.TF_VCN01_CONFIG_COMPARTMENT_OCID}"  
  display_name = "${var.TF_VCN01_IGW01_CONFIG_DISPLAY_NAME}"
  vcn_id = "${oci_core_virtual_network.TF_VCN01.id}"
}

resource "oci_core_route_table" "TF_VCN01_ROUTE01" {
  compartment_id = "${var.TF_VCN01_CONFIG_COMPARTMENT_OCID}"
  vcn_id = "${oci_core_virtual_network.TF_VCN01.id}"
  display_name = "${var.TF_VCN01_ROUTE01_CONFIG_DISPLAY_NAME}"
  route_rules {
    cidr_block = "0.0.0.0/0"
    network_entity_id = "${oci_core_internet_gateway.TF_VCN01_IGW01.id}"
  }
}

resource "oci_core_subnet" "TF_VCN01_SUBNET01" {  
  cidr_block = "${var.TF_VCN01_SUBNET01_CONFIG_CIDR_BLOCK}"
  display_name = "${var.TF_VCN01_SUBNET01_CONFIG_DISPLAY_NAME}"
  dns_label = "${var.TF_VCN01_SUBNET01_CONFIG_DNS_LABEL}"
  security_list_ids = ["${oci_core_virtual_network.TF_VCN01.default_security_list_id}"]
  compartment_id = "${var.TF_VCN01_CONFIG_COMPARTMENT_OCID}"  
  vcn_id = "${oci_core_virtual_network.TF_VCN01.id}"
  route_table_id = "${oci_core_route_table.TF_VCN01_ROUTE01.id}"
  dhcp_options_id = "${oci_core_virtual_network.TF_VCN01.default_dhcp_options_id}"
}