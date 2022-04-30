variable "name" {
  description = "Name for Cloud Router Interface"
  type        = string
  default     = null
}
variable "region" {
  type        = string
  description = "GCP region name"
}
variable "vpc_network_name" {
  type        = string
  description = "Name of VPC Network"
  default     = "default"
}
variable "cloud_router_name" {
  type        = string
  description = "Cloud Router name"
  default     = null
}
variable "peer_vpn_gateway_name" {
  type        = string
  description = "Name of the Peer (External) VPN Gateway"
}
variable "tunnels" {
  type = list(object({
    name            = string
    cloud_router_ip = string
  }))
  description = "Parameters for each Cloud VPN Tunnel"
}

