variable "vpc_id" {
  type = string
}
variable "cidr_block" {
  type = string
}
variable "az" {
  type    = string
  default = null
}
variable "az_id" {
  type    = string
  default = null
}
variable "name" {
  type    = string
  default = null
}
variable "tier" {
  type    = string
  default = null
}
