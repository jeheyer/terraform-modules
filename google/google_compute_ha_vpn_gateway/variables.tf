variable "name" {
  type        = string
  description = "Cloud VPN Gateway name"
  default     = null
}
variable "vpc_network_name" {
  type        = string
  description = "Name of VPC Network"
  default     = "default"
}
variable "region" {
  type        = string
  description = "GCP region name"
}
