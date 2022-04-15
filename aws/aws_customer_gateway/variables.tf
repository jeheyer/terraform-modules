variable "name" {
  type = string
}
variable "bgp_asn" {
  type     = number
  default  = 65000
  nullable = false
}
variable "ip_address" {
  type = string
}
variable "type" {
  type    = string
  default = "ipsec.1"
}
variable "device_name" {
  type    = string
  default = null
}
