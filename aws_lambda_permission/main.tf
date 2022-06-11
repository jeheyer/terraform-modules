resource "aws_lambda_permission" "default" {
  statement_id  = "AllowExecutionFromALB"
  action        = "lambda:InvokeFunction"
  function_name = var.function_name
  principal     = "elasticloadbalancing.amazonaws.com"
  qualifier  = var.alias_name
  source_arn = var.target_group_arn
}

