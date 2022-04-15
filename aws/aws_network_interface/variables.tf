variable "subnet_ids" {
  type    = list(string)
  default = null
}
variable "security_group_ids" {
  type    = list(string)
  default = []
}
