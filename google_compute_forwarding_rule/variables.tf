variable "name" {
  description = "Name for this Forwarding Rule"
  type        = string
  default     = null
}
variable "region" {
  type = string
}
variable "ports" {
  description = "List of TCP/UDP ports to pass through to backend (TCP/UDP LB only)"
  type        = list(string)
  default     = []
}
variable "port_range" {
  description = "Range of ports for HTTP Forwarding Rule"
  type        = string
  default     = null
}
variable "tproxy_id" {
  description = "ID of the Target Proxy to use (HTTP/HTTPS LB only)"
  type        = string
  default     = null
}
variable "backend_service_name" {
  description = "Name for the regional backend service (TCP/UDP LB only)"
  type        = string
  default     = null
}
variable "ip_address" {
  description = "Global IP Address for the forwarding rule (listener)"
  type        = string
  default     = null
}
variable "lb_scheme" {
  description = "Load Balancing Scheme (EXTERNAL, INTERNAL, or INTERNAL_MANAGED)"
  type        = string
  default     = "EXTERNAL"
}
variable "network_project_id" {
  description = "Project ID of host project if using shared network"
  type        = string
  default     = null
}
variable "subnet_name" {
  description = "Name of Subnet (internal LB only)"
  type        = string
  default     = null
}
variable "network_tier" {
  type    = string
  default = "PREMIUM"
}
variable "allow_global_access" {
  type    = bool
  default = false
}
