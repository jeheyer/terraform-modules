variable "name" {
  description = "Name of Cloud VPN Tunnel"
  type        = string
  default     = null
}
variable "description" {
  description = "Description of Cloud VPN Tunnel"
  type        = string
  default     = null
}
variable "region" {
  type = string
}
variable "vpc_network_name" {
  description = "Name of the VPC Network"
  type        = string
  default     = "default"
}
variable "cloud_router_name" {
  description = "Name of the Cloud VPN Router"
  type        = string
  default     = null
}
variable "cloud_vpn_gateway_name" {
  description = "Name of the Cloud VPN Gateway"
  type        = string
  default     = null
}
#variable "cloud_vpn_gateway_interfaces" { 
#  description  = "Interface list for the Cloud VPN Gateway"
#  type         = list(number)
#  default      = [0,1]
#}
variable "peer_vpn_gateway_name" {
  description = "Name of the Peer (External) VPN Gateway"
  type        = string
}
#variable "peer_vpn_gateway_interfaces" {
#  type         = list(number)
#  description  = "Interface list for the (External) VPN Gateway"
#  default      = [0,1]
#}
variable "tunnels" {
  type = list(object({
    interface_index = optional(number)
    name            = optional(string)
    description     = optional(string)
    ike_version     = optional(number)
    ike_psk         = string
  }))
  description = "Parameters for each Cloud VPN Tunnel"
  validation {
    condition     = length(var.tunnels) == 1 || length(var.tunnels) == 2 || length(var.tunnels) == 4
    error_message = "Number of VPN Tunnels should be 1, 2, or 4."
  }
}
