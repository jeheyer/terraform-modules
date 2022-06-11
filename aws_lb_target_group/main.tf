resource "aws_lb_target_group" "default" {
  name                               = var.name
  target_type                        = var.target_type
  vpc_id                             = var.target_type == "lambda" ? null : var.vpc_id
  port                               = var.target_type == "lambda" ? null : var.target_port
  protocol                           = upper(var.protocol)
  lambda_multi_value_headers_enabled = var.multi_value_headers
  protocol_version                   = "HTTP1"
}

