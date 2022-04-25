variable "name" {
  description = "Name for the Published Service"
  type        = string
}
variable "description" {
  description = "Description for the Published Service"
  type        = string
  default     = null
}
variable "region" {
  description = "GCP region name"
  type        = string
}
variable "nat_subnet_ids" {
  description = "NAT subnets for this region"
  type = list(string)
}
variable "target_service_id" {
  description = "Load Balancer Service ID to publish "
  type        = string
}
