resource "aws_lambda_permission" "LAMBDA_PERMISSION" {
  statement_id  = "AllowExecutionFromALB"
  action        = "lambda:InvokeFunction"
  function_name = var.function_name
  principal     = "elasticloadbalancing.amazonaws.com"
  #  qualifier     = aws_lambda_alias.LAMBDA_ALIAS.name
  #  source_arn    = aws_lb_target_group.LAMBDA_TG.arn
  qualifier  = var.alias_name
  source_arn = var.target_group_arn
}

