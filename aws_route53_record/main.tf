resource "aws_route53_record" "default" {
  zone_id         = var.dns_zone_id
  name            = var.name
  type            = var.type
  records         = var.records
  ttl             = var.ttl
  allow_overwrite = true
}

