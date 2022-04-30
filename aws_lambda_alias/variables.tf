variable "name" {
  type    = string
  default = "my-lambda-function"
}

variable "description" {
  type    = string
  default = null
}

variable "function_arn" {
  type = string
}

variable "function_version" {
  default = "LATEST"
}
