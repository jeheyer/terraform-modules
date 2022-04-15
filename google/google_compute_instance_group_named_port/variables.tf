variable "project_id" {
  default = "Project ID of the instance groups"
  type    = string
}
variable "instance_groups" {
  type = list(string)
}
variable "instance_groups_zones" {
  type = list(string)
}
variable "name" {
  description = "Name for this Named Port"
  type        = string
  default     = null
}
variable "port" {
  description = "Port number of Named Port"
  type        = number
  default     = 443
}
variable "protocol" {
  description = "Protocol of this named port (optional)"
  type        = string
  default     = null
}
