variable "naming_prefix" {
  type = string
  default = "instance"
}
variable "num_instances" {
  type    = number
  default = 1
}
variable "ami" {
  type    = string
  default = null
}
variable "instance_type" {
  type    = string
  default = "t2.nano"
}
variable "eni_ids" {
  type    = list(string)
}
variable "key_name" {
  type    = string
}
