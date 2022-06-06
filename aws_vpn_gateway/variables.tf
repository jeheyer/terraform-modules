variable "vpc_id" {
  type = string
}
variable "number" {
  type    = number
  default = 1
}
variable "names" {
  type    = list(string)
  default = []
}

