variable "name" {
  type        = string
  description = "Name of Peer (External) VPN Gateway"
  default     = "peer-vpn-gateway"
}
variable "description" {
  type        = string
  description = "Description of Peer (External) VPN Gateway"
  default     = null
}
variable "ip_addresses" {
  type        = list(string)
  description = "List of Public IP addresses used by Peer (External) Gateway"
  validation {
    condition     = length(var.ip_addresses) == 1 || length(var.ip_addresses) == 2 || length(var.ip_addresses) == 4
    error_message = "IP Address list must have 1, 2, or 4 values."
  }
}
