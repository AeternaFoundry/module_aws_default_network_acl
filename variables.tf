variable "default_network_acls" {
  description = <<EOT
Map of default_network_acls, attributes below
Required:
    - default_network_acl_id
Optional:
    - region
    - subnet_ids
    - tags
    - tags_all
    - egress (block):
        - action (required)
        - cidr_block (optional)
        - from_port (required)
        - icmp_code (optional)
        - icmp_type (optional)
        - ipv6_cidr_block (optional)
        - protocol (required)
        - rule_no (required)
        - to_port (required)
    - ingress (block):
        - action (required)
        - cidr_block (optional)
        - from_port (required)
        - icmp_code (optional)
        - icmp_type (optional)
        - ipv6_cidr_block (optional)
        - protocol (required)
        - rule_no (required)
        - to_port (required)
EOT

  type = map(object({
    default_network_acl_id = string
    region                 = optional(string)
    subnet_ids             = optional(set(string))
    tags                   = optional(map(string))
    tags_all               = optional(map(string))
    egress = optional(list(object({
      action          = string
      cidr_block      = optional(string)
      from_port       = number
      icmp_code       = optional(number)
      icmp_type       = optional(number)
      ipv6_cidr_block = optional(string)
      protocol        = string
      rule_no         = number
      to_port         = number
    })))
    ingress = optional(list(object({
      action          = string
      cidr_block      = optional(string)
      from_port       = number
      icmp_code       = optional(number)
      icmp_type       = optional(number)
      ipv6_cidr_block = optional(string)
      protocol        = string
      rule_no         = number
      to_port         = number
    })))
  }))
}

