variable "name" {
  description = "Name for the BGP Session"
  type        = string
  default     = null
}
variable "vpc_network_name" {
  description = "Name of VPC Network"
  type        = string
  default     = "default"
}
variable "region" {
  description = "GCP region name"
  type        = string
}
variable "cloud_router_name" {
  description = "Cloud Router name"
  type        = string
  default     = null
}
variable "interface_names" {
  description = "Name of the Cloud Router Interfaces"
  type        = list(string)
  default     = null
}
variable "peer_vpn_gateway_name" {
  description = "Name of the Peer (External) VPN Gateway"
  type        = string
}
variable "peer_bgp_asn" {
  description = "BGP AS Number for all sessions (can also be set for each peer)"
  type        = number
  default     = null
}
variable "advertised_priority" {
  description = "Base BGP MED value for route advertisements"
  type        = number
  default     = 100
}
variable "advertised_groups" {
  description = "Groups to advertise"
  type        = list(string)
  default     = ["ALL_SUBNETS"]
}
variable "advertised_ip_ranges" {
  description = "List of custom prefixes to advertise"
  type        = list(string)
  default     = null
}
variable "enabled" {
  description = "Enable BGP"
  type        = bool
  default     = true
}
variable "bgp_peers" {
  type = list(object({
    bgp_peer_ip          = string
    peer_bgp_asn         = optional(number)
    advertised_priority  = optional(number)
    advertised_groups    = optional(list(string))
    advertised_ip_ranges = optional(list(string))
    enabled              = optional(bool)
  }))
  description = "Parameters for each indivudal Cloud BGP Session"
}

variable "enable_bfd" {
  description = "Support BFD"
  type        = bool
  default     = false
}
variable "bfd_parameters" {
  description = "BFD transmit, receive, and multiplier values"
  type        = list(number)
  default     = [1000, 1000, 5]
}
