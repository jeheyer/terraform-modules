variable "vpc_id" {
  type = string
}
variable "cidr_block" {
  type = string
}
variable "az" {
  type = string
  default = null
}
variable "tag" {
  type = string
  default = null
}
