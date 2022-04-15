variable "num_instances" {
  type    = number
  default = 1
}
variable "ami" {
  type    = string
  default = "ami-0b614a5d911900a9b"
}
variable "instance_type" {
  type    = string
  default = "t2.nano"
}
variable "eni_ids" {
  type    = list(string)
  default = []
}
