variable "name" {
  description = "Name for the peering connection"
  type        = string
  default     = null
}
variable "vpc_network_name" {
  description = "Name for this VPC Network"
  type        = string
}
variable "project_id" {
  description = "Project ID of our VPC network"
  type        = string
  default     = null
}
variable "peer_network_name" {
  description = "Name of the VPC Network we are Peering to"
  type        = string
}
variable "peer_project_id" {
  description = "Project ID of peer's VPC network"
  type        = string
  default     = null
}
variable "import_custom_routes" {
  description = "Whether to import static and dynamic routes"
  type        = bool
  default     = false
}
variable "export_custom_routes" {
  description = "Whether to export static and dynamic routes"
  type        = bool
  default     = false
}
variable "import_subnet_routes_with_public_ip" {
  type    = bool
  default = false
}
variable "export_subnet_routes_with_public_ip" {
  type    = bool
  default = true
}
