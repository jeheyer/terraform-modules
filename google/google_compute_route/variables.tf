variable "vpc_network_name" {
  description = "Name of the VPC Network"
  type        = string
  default     = "default"
}
variable "name" {
  description = "Name of the Route(s)"
  type        = string
}
variable "description" {
  description = "Description of the Route(s)"
  type        = string
  default     = null
}
variable "dest_range" {
  description = "Destination Prefix"
  type        = string
  default     = null
}
variable "dest_ranges" {
  description = "Destination Prefixes"
  type        = list(string)
  default     = []
}
variable "priority" {
  description = "Priority for route(s) (lower number is better)"
  type        = number
  default     = 1000
}
variable "instance_tags" {
  description = "Instance Tags for route(s)"
  type        = list(string)
  default     = []
}
variable "next_hop" {
  description = "Next Hop"
  type        = string
  default     = "default-internet-gateway"
}
variable "next_hop_zone" {
  description = "If using Instance as next hop, zone for that instance"
  type        = string
  default     = null
}
