### Automatically populated
variable "compartment_ocid" {}
variable "region" {}

### Custom
variable "TF_VCN01_CONFIG_CIDR_BLOCK" {
  type = string
  default = "10.0.0.0/16"
}

variable "TF_VCN01_CONFIG_DNS_LABEL" {
  type = string
  default = "vcn01"
}

variable "TF_VCN01_CONFIG_DISPLAY_NAME" {
  type = string
  default = "vcn01"
}
