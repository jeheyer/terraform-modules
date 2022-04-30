variable "name" {
  type    = string
}
variable "subnet_ids" {
  type = list(string)
}
variable "security_groups" {
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
