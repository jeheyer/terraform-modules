resource "aws_lb_listener_certificate" "default" {
  count           = length(var.additional_cert_arns)
  listener_arn    = var.listener_arn
  certificate_arn = var.additional_cert_arns[count.index]
}

