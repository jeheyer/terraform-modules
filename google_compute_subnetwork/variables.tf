variable "vpc_network_name" {
  description = "Name of the VPC Network"
  type        = string
}
variable "name" {
  description = "Name of the Subnet"
  type        = string
  default     = null
}
variable "description" {
  description = "Description of the Subnet"
  type        = string
  default     = null
}
variable "region" {
  description = "GCP Region for the Subnet"
  type        = string
}
variable "stack_type" {
  description = "Stack type (IPv4 only or IPv4 + IPv6)"
  type        = string
  default     = null
}
variable "ip_range" {
  description = "Primary IP Range / CIDR block"
  type        = string
}
variable "purpose" {
  description = "Subnet Purpose"
  type        = string
  default     = "PRIVATE"
  validation {
    condition     = contains(["PRIVATE", "INTERNAL_HTTPS_LOAD_BALANCER", "PRIVATE_SERVICE_CONNECT"], var.purpose)
    error_message = "Invalid purpose; must be PRIVATE or INTERNAL_HTTPS_LOAD_BALANCER or PRIVATE_SERVICE_CONNECT."
  }
}
variable "role" {
  description = "If Internal load balancer, active or backup role"
  type        = string
  default     = null
}
variable "enable_private_access" {
  type    = bool
  default = false
}
variable "enable_flow_logs" {
  type    = bool
  default = false
}
variable "log_aggregation_interval" {
  type    = string
  default = null
}
variable "log_sample_rate" {
  type    = number
  default = null
}
variable "secondary_ranges" {
  type = map(object({
    range = string
  }))
  default = {}
}
