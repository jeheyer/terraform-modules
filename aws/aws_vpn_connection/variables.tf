variable "name" {
  type    = string
  default = null
}
variable "vpn_gateway_id" {
  type = string
}
variable "customer_gateway_id" {
  type = string
}
variable "type" {
  type    = string
  default = "ipsec.1"
}
variable "ike_version" {
  type     = number
  default  = 1
  nullable = false
}
variable "phase1_settings" {
  type = object({
    lifetime   = number
    encryption = list(string)
    integrity  = list(string)
    dh_groups  = list(number)
  })
  default = {
    lifetime   = 28800
    encryption = null
    integrity  = null
    dh_groups  = null
  }
  nullable = false
}

variable "phase2_settings" {
  type = object({
    lifetime   = number
    encryption = list(string)
    integrity  = list(string)
    dh_groups  = list(number)
  })
  default = {
    lifetime   = 3600
    encryption = null
    integrity  = null
    dh_groups  = null
  }
  nullable = false
}

variable "tunnel_settings" {
  description = "Custom Pre-shared keys and IP addresses for VPN tunnels"
  type = list(object({
    preshared_key    = string
    inside_ipv4_cidr = string
  }))
  default = []
}
