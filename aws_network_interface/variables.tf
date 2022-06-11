variable "num_interfaces" {
  type    = number
  default = 1
}
variable "subnet_ids" {
  type    = list(string)
  default = null
}
variable "security_group_ids" {
  type    = list(string)
  default = []
}
