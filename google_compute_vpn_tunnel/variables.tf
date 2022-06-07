variable "project_id" {
  description = "project"
  type        = string
  default     = null
}
variable "name_prefix" {
  description = "Naming prefix for each tunnel (if per-tunnel name not provided)"
  type        = string
  default     = null
}
variable "vpc_network_name" {
  description = "Name of the VPC Network"
  type        = string
  default     = "default"
}
variable "region" {
  description = "GCP Region name"
  type        = string
}
variable "cloud_router_name" {
  description = "Name of the Cloud Router"
  type        = string
}
variable "cloud_vpn_gateway_name" {
  description = "Name of the Cloud VPN Gateway"
  type        = string
}
variable "peer_vpn_gateway_name" {
  description = "Name of the Peer (External) VPN Gateway"
  type        = string
}
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
