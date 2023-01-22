variable "TF_VCN01_CONFIG" {
  type = object({
    cidr_block      = bool
    dns_label       = string
    display_name    = string
  })
  default = [
    {
      cidr_block   = "10.0.0.0/16"
      dns_label    = "vcn01"
      display_name = "vcn01"
    }
  ]
}