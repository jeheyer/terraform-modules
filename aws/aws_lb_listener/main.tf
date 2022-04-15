resource "aws_lb_listener" "default" {
  load_balancer_arn = var.aws_lb_arn
  port              = var.port
  protocol          = upper(var.protocol)
  default_action {
    type             = "forward"
    target_group_arn = var.target_group_arn
  }
  certificate_arn = upper(var.protocol) == "HTTPS" ? var.default_cert_arn : null
  ssl_policy      = upper(var.protocol) == "HTTPS" ? var.ssl_policy_name : null
}

