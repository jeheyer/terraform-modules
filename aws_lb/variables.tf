variable "name" {
  type    = string
  default = "alb"
}
variable "subnet_ids" {
  type = list(string)
}
variable "security_group_ids" {
  type = list(string)
}
variable "type" {
  type    = string
  default = "application"
}
variable "internal" {
  type    = bool
  default = false
}
