variable "name" {
  type        = string
  description = "Cloud NAT Name"
  default     = null
}
variable "vpc_network_name" {
  type        = string
  description = "Name of VPC Network"
}
variable "region" {
  type        = string
  description = "GCP region name"
}
variable "cloud_router_name" {
  type        = string
  description = "Name of the Cloud Router"
  default     = null
}
variable "use_static_ip" {
  type        = bool
  description = "Use Reserved External Static IP (default is auto-assign)"
  default     = false
}
variable "nat_ips" {
  type        = list(string)
  description = "List of IP External IP addresses to use"
  default     = []
}
variable "subnets" {
  type        = list(string)
  description = "List subnets to provide NAT access for"
  default     = []
}
variable "log_type" {
  type        = string
  description = "Type of logging to use"
  default     = "errors"
}
variable "min_ports_per_vm" {
  type        = number
  description = "Minimum ports to allocate per VM instance"
  default     = 64
}
variable "enable_eim" {
  type        = bool
  description = "Enable Endpoint-Independent Mappping"
  default     = false
}
variable "timeouts" {
  type        = list(any)
  description = "Number of seconds for UDP, TCP Established, TCP Transitory, and ICMP idle timeout"
  default     = [30, 1200, 30, 30]
}
