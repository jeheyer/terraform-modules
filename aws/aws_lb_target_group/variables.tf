variable "name" {
  type        = string
  description = "ALB name"
}

variable "multi_value_headers" {
  type    = bool
  default = false
}

variable "target_type" {
  type    = string
  default = "instance"
}

variable "target_port" {
  type    = number
  default = null
}

variable "protocol" {
  type    = string
  default = "HTTP"
}

variable "vpc_id" {
  type    = string
  default = null
}

