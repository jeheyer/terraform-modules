variable "vpc_network_name" {
  type    = string
  default = "default"
}
variable "name" {
  type    = string
  default = "terraform-regional-neg"
}
variable "region" {
  type    = string
  default = null
}
variable "instances" {
  type    = list(string)
  default = []
}
variable "zones" {
  type    = list(string)
  default = []
}
