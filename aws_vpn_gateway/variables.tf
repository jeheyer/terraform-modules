variable "vpc_id" {
  type = string
}
variable "name" {
  type    = string
  default = "vpgw"
}
variable "asn" {
  type    = number
  default = 64512
}
