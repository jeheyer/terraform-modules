variable "name" {
  type        = string
  description = "Name for the VPC Network"
  default     = "default"
}
variable "description" {
  type        = string
  description = "Description for the VPC Network"
  default     = null
}
variable "mtu" {
  type        = number
  description = "IP MTU for network"
  default     = null
  validation {
    condition     = var.mtu == null || var.mtu == 1460 || var.mtu == 1500
    error_message = "If specified, MTU must be 1460 or 1500."
  }
}
variable "routing_mode" {
  type        = string
  description = "Routing mode (GLOBAL or REGIONAL)"
  default     = null
  validation {
    condition     = var.routing_mode == null || var.routing_mode == "GLOBAL" || var.routing_mode == "REGIONAL"
    error_message = "If set, Dynamic routing mode must be be GLOBAL or REGIONAL."
  }

}
variable "enable_global_routing" {
  type    = bool
  default = false
}
variable "auto_create_subnetworks" {
  type    = bool
  default = false
}

