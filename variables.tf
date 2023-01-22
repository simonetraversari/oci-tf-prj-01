variable "compartment_ocid" {}
variable "region" {}

variable "TF_VCN01_CONFIG" {
  type = object({
    cidr_block      = bool
    dns_label       = string
    display_name    = string
  })
}

variable "sample" {}