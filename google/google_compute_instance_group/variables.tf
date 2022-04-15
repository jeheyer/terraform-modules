variable "project_id" {
  type = string
}
variable "network_project_id" {
  type    = string
  default = null
}
variable "vpc_network_name" {
  type    = string
  default = "default"
}
variable "name" {
  type    = string
  default = "terraform-instance-group"
}
variable "instances" {
  description = "List of instance names"
  type        = list(string)
  default     = []
}
variable "zone" {
  type = string
}
