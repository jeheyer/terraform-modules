variable "project_id" {
  type = string
}
variable "name" {
  type = string
}
variable "region" {
  type    = string
  default = "us-central1"
}
variable "type" {
  type    = string
  default = "mysql"
}
variable "db_version" {
  type    = string
  default = null
}
variable "tier" {
  type    = string
  default = "db-f1-micro"
}
variable "private_network_id" {
  description = "Network ID of the VPC network (if using private IP networking)"
  type        = string
}
