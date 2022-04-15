variable "project_id" {
  description = "Project ID for this Interconnect Attachment"
  type        = string
  default     = null
}
variable "name" {
  description = "Name of Interconnect Attachment"
  type        = string
}
variable "description" {
  description = "Description of Interconnect Attachment"
  type        = string
  default     = null
}
variable "type" {
  description = "Type Interconnect Attachment (Dediciated or Partner)"
  type        = string
  default     = "PARTNER"
  validation {
    condition     = contains(["DEDICATED", "PARTNER", "PARTNER_PROVIDER"], upper(var.type))
    error_message = "Invalid purpose; must be DEDICATED, PARTNER, or PARTNER_PROVIDER."
  }
}
variable "region" {
  type    = string
  default = null
}
variable "vpc_network_name" {
  description = "Name of the VPC Network"
  type        = string
  default     = "default"
}
variable "cloud_router_name" {
  description = "Name of the Cloud Router"
  type        = string
  default     = null
}
variable "mtu" {
  description = "MTU for the attachment"
  type        = number
  default     = null
  validation {
    condition     = var.mtu == null || var.mtu == 1440 || var.mtu == 1500
    error_message = "If specified, MTU must be 1440 or 1500."
  }
}
variable "enabled" {
  type    = bool
  default = true
}
