resource "aws_lambda_alias" "default" {
  name             = var.name
  description      = var.description
  function_name    = var.function_arn
  function_version = var.function_version
}

