# Create Lambda Function
resource "aws_lambda_function" "default" {
  filename      = var.zipfile_name
  function_name = var.name
  role          = var.iam_role_arn
  handler       = var.handler
  runtime       = var.runtime
  memory_size   = var.memsize
  description   = var.description
}
