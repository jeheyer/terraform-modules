variable "vpc_network_name" {
  description = "Name for this VPC Network"
  type        = string
}
variable "project_id" {
  description = "Project ID of our VPC network"
  type        = string
  default     = null
}
variable "service" {
  description = "Service to connect to"
  type        = string
  default     = null
}
variable "ranges" {
  description = "Names IP Address ranges to use"
  type        = list(string)
  default     = []
}
