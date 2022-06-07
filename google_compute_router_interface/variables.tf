variable "project_id" {
  description = "Project ID for this resource"
  type        = string
  default     = null
}
#variable "name" {
#  description = "Name for Cloud Router Interface"
#  type        = string
#  default     = null
#}
variable "type" {
  description = "Type of interface (vpn or interconnect)"
  type        = string
  default     = "vpn"
}
variable "name_prefix" {
  description = "Naming Prefix for interfaces (default is use cloud router name)"
  type        = string
  default     = null
}
variable "cloud_router_name" {
  type        = string
  description = "Cloud Router name"
}
variable "region" {
  type        = string
  description = "GCP region name for this cloud router"
}
#variable "vpc_network_name" {
#  type        = string
#  description = "Name of VPC Network"
#  default     = "default"
#}
variable "peer_vpn_gateway_name" {
  type        = string
  description = "Name of the Peer (External) VPN Gateway"
  default     = null
}
variable "interfaces" {
  type = list(object({
    id              = optional(number)
    name            = optional(string)
    attachment      = optional(string)
    cloud_router_ip = string
  }))
  default     = []
  description = "Parameters for each Cloud Router Interface"
}
variable "vpn_tunnels" {
  description = "List of VPN names"
  type = list(string)
  default = []
}
variable "interconnect_attachments" {
  description = "List of Interconnect Attachment names"
  type = list(string)
  default = []
}
