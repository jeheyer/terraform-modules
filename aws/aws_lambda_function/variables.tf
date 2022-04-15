variable "name" {
  type    = string
  default = "my-lambda-function"
}
variable "description" {
  type    = string
  default = null
}
variable "handler" {
  type    = string
  default = "lambda_function.lambda_handler"
}
variable "zipfile_name" {
  type    = string
  default = "lambda.zip"
}
variable "runtime" {
  type    = string
  default = "nodejs14.x"
}
variable "memsize" {
  type    = number
  default = 128
  validation {
    condition = (
      var.memsize >= 128
    )
    error_message = "Memory size must be 128 Megabytes or greater."
  }
}
variable "iam_role_arn" {
  type = string
}
