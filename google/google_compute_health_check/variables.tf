variable "name" {
  type    = string
  default = null
}
variable "protocol" {
  type    = string
  default = "HTTP"
}
variable "port" {
  type    = number
  default = 80
}
variable "interval" {
  type    = number
  default = 5
}
variable "timeout" {
  type    = number
  default = 5
}
variable "request_path" {
  type    = string
  default = "/"
}
variable "response" {
  type    = string
  default = null
}
