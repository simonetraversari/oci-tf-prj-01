### Automatically populated
variable "compartment_ocid" {}
variable "region" {}

### Custom
variable "TF_VCN01_CONFIG_CIDR_BLOCK" {}
variable "TF_VCN01_CONFIG_DNS_LABEL" {}
variable "TF_VCN01_CONFIG_DISPLAY_NAME" {}
variable "TF_VCN01_CONFIG_COMPARTMENT_OCID" {}

variable "TF_VCN01_IGW01_CONFIG_DISPLAY_NAME" {}

variable "TF_VCN01_ROUTE01_CONFIG_DISPLAY_NAME" {}

variable "TF_VCN01_SUBNET01_CONFIG_CIDR_BLOCK" {}
variable "TF_VCN01_SUBNET01_CONFIG_DISPLAY_NAME" {}
variable "TF_VCN01_SUBNET01_CONFIG_DNS_LABEL" {}

variable "TF_VCN01_SECLIST01_CONFIG_DISPLAY_NAME" {}

variable "buckets" {
  type = list(object({
    name    = string
    enabled = optional(bool, true)
    website = optional(object({
      index_document = optional(string, "index.html")
      error_document = optional(string, "error.html")
      routing_rules  = optional(string)
    }), {})
  }))
}


variable "TF_VCN01_SECLIST01_CONFIG_EGRESS_RULES" {
  type = list(object({
      stateless     = bool,
      protocol      = string,
      dst           = string,
      dst_type      = string,
      src_port      = object({
        min         = number,
        max         = number
      }),
      dst_port      = object({
        min         = number,
        max         = number
      }),
      icmp_type     = number,
      icmp_code     = number
    }))
}

###variable "TF_VCN01_SECLIST01_CONFIG_RULES" {
###  type = map(object({        
###    ingress_rules   = list(object({
###      stateless     = bool,
###      protocol      = string,
###      src           = string,
###      src_type      = string,
###      src_port      = object({
###        min         = number,
###        max         = number
###      }),
###      dst_port      = object({
###        min         = number,
###        max         = number
###      }),
###      icmp_type     = number,
###      icmp_code     = number
###    })),
###    egress_rules    = list(object({
###      stateless     = bool,
###      protocol      = string,
###      dst           = string,
###      dst_type      = string,
###      src_port      = object({
###        min         = number,
###        max         = number
###      }),
###      dst_port      = object({
###        min         = number,
###        max         = number
###      }),
###      icmp_type     = number,
###      icmp_code     = number
###    }))
###  }))  
###}