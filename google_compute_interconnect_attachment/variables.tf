variable "project_id" {
  description = "Project ID for this Interconnect Attachment"
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
variable "name_prefix" {
  description = "Name of Interconnect Attachment"
  type        = string
}
variable "region" {
  type    = string
  default = null
}
variable "cloud_router_name" {
  description = "Name of the Cloud Router"
  type        = string
}
variable "encryption" {
  type    = string
  default = "NONE"
}
variable "interconnect" {
  description = "Interconnect Name (Dedicated Interconnect only)"
  type        = string
  default     = null
}
variable "circuits" {
  type = list(object({
    attachment  = optional(string)
    description = optional(string)
    mtu         = optional(number)
    enabled     = optional(bool)
  }))
  description = "Parameters for each Circuit"
}

