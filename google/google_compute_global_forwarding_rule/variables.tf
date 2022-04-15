variable "name" {
  description = "Name for this Forwarding Rule"
  type        = string
  default     = null
}
variable "port_range" {
  description = "Range of ports for HTTP Forwarding Rule"
  type        = string
  default     = "80"
}
variable "tproxy_id" {
  description = "ID of the Target Proxy to use"
  type        = string
}
variable "lb_scheme" {
  description = "Load Balancing Scheme"
  type        = string
  default     = "EXTERNAL"
}
variable "ip_address" {
  description = "Global IP Address for the forwarding rule (listener)"
  type        = string
  default     = null
}
variable "vpc_network_name" {
  description = "Name of the VPC network"
  type        = string
  default     = null
}
