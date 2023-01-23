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

resource "oci_core_security_list" "TF_VCN01_SECLIST01" {  
  compartment_id = "${var.compartment_ocid}"
  vcn_id         = "${oci_core_virtual_network.TF_VCN01.id}"
  display_name   = "${var.TF_VCN01_SECLIST01_CONFIG_DISPLAY_NAME}"

###  dynamic "egress_security_rules" {
###    iterator = egress_security_rules
###    for_each = each.value.egress_security_rules != null ? each.value.egress_security_rules : []
###
###    content {
###      protocol =  egress_security_rules.value.protocol
###      destination = egress_security_rules.value.destination
###      description = egress_security_rules.value.description
###      stateless = egress_security_rules.value.stateless
###
###      dynamic "tcp_options" {
###        iterator = tcp_options
###        for_each = lookup(egress_security_rules.value, "tcp_options", null) != null ? egress_security_rules.value.tcp_options : []
###        content{
###          dynamic "source_port_range" {
###            iterator = source_port_range
###            for_each = lookup(tcp_options.value, "source_port_range", null) != null ? tcp_options.value.source_port_range : []
###            content {
###              min = source_port_range.value.min
###              max = source_port_range.value.max
###            }
###          }
###          min = tcp_options.value.min
###          max = tcp_options.value.max
###        }
###      }
###
###      dynamic "udp_options" {
###        iterator = udp_options
###        for_each = lookup(egress_security_rules.value, "udp_options", null) != null ? egress_security_rules.value.udp_options : []
###
###        content {
###          dynamic "source_port_range" {
###            iterator = source_ports
###            for_each = lookup(udp_options.value, "source_port_range", null) != null ? udp_options.value.source_port_range : []
###            content {
###              min = source_ports.value.min
###              max = source_ports.value.max
###            }
###          }
###
###          min = udp_options.value.min
###          max = udp_options.value.max
###        }
###      }
###
###      dynamic "icmp_options" {
###        iterator = icmp_options
###        for_each = lookup(egress_security_rules.value, "icmp_options", null) != null ? egress_security_rules.value.icmp_options : []
###        content {
###          type = icmp_options.value.type
###          code = icmp_options.value.code
###        }
###      }
###    }
###  }
###
###  dynamic "ingress_security_rules" {
###    iterator = ingress_security_rules
###    for_each = each.value.ingress_security_rules != null ? each.value.ingress_security_rules : []
###
###    content {
###      protocol =  ingress_security_rules.value.protocol
###      source = ingress_security_rules.value.source
###      description = ingress_security_rules.value.description
###      stateless = ingress_security_rules.value.stateless
###
###      dynamic "tcp_options" {
###        iterator = tcp_options
###        for_each = lookup(ingress_security_rules.value, "tcp_options", null) != null ? ingress_security_rules.value.tcp_options : []
###        content{
###          dynamic "source_port_range" {
###          iterator = source_port_range
###          for_each = lookup(tcp_options.value, "source_port_range", null) != null ? tcp_options.value.source_port_range : []
###          content {
###            min = source_port_range.value.min
###            max = source_port_range.value.max
###          }
###        }
###        min = tcp_options.value.min
###        max = tcp_options.value.max
###      }
###    }
###
###    dynamic "udp_options" {
###      iterator = udp_options
###      for_each = lookup(ingress_security_rules.value, "udp_options", null) != null ? ingress_security_rules.value.udp_options : []
###
###      content {
###        dynamic "source_port_range" {
###          iterator = source_ports
###          for_each = lookup(udp_options.value, "source_port_range", null) != null ? udp_options.value.source_port_range : []
###          content {
###            min = source_ports.value.min
###            max = source_ports.value.max
###          }
###        }
###
###        min = udp_options.value.min
###        max = udp_options.value.max
###      }
###    }
###
###    dynamic "icmp_options" {
###      iterator = icmp_options
###      for_each = lookup(ingress_security_rules.value, "icmp_options", null) != null ? ingress_security_rules.value.icmp_options : []
###      content {
###        type = icmp_options.value.type
###        code = icmp_options.value.code
###      }
###    }
###    }
###  }
}