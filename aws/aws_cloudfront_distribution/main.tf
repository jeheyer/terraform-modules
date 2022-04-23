resource "aws_cloudfront_distribution" "default" {

  enabled             = var.enabled
  comment             = var.comment
  is_ipv6_enabled     = var.enable_ipv6
  aliases             = var.domain_names
  price_class         = var.price_class
  default_root_object = var.root_object
  http_version        = var.enable_http2 == true ? "http2" : "http1.1"

  # Origin(s)
  dynamic "origin" {
    for_each = var.origins
    content {
      #origin_id           = origin.value["bucket_name"] != null ? "S3-${origin.value["bucket_name"]}" : origin.key
      origin_id           = origin.key
      domain_name         = origin.value["bucket_name"] != null ? "${origin.value["bucket_name"]}.s3.amazonaws.com" : origin.value["dns_name"]
      origin_path         = origin.value["path"]
      connection_timeout  = 3
      connection_attempts = 2
      dynamic "custom_origin_config" {
        for_each = origin.value["bucket_name"] != null ? [] : [0]
        content {
          http_port              = coalesce(origin.value["port"], local.custom_origin_config["http_port"])
          https_port             = coalesce(origin.value["port"], local.custom_origin_config["https_port"])
          origin_protocol_policy = origin.value["protocol"] != null ? lookup(local.custom_origin_config["protocol_policy"], lower(origin.value["protocol"])) : "match-viewer"
          origin_ssl_protocols   = origin.value["tls_version"] != null ? [lookup(local.custom_origin_config["tls_version"], origin.value["tls_version"])] : local.custom_origin_config["ssl_protocols"]
        }
      }
    }
  }

  # Route different paths to their respective origin
  dynamic "ordered_cache_behavior" {
    for_each = local.path_patterns
    content {
      path_pattern     = local.path_patterns[ordered_cache_behavior.key].path
      allowed_methods  = ["GET", "HEAD", "OPTIONS"]
      cached_methods   = ["GET", "HEAD"]
      target_origin_id = local.path_patterns[ordered_cache_behavior.key].origin
      forwarded_values {
        headers      = ["Origin"]
        query_string = true
        cookies {
          forward = "none"
        }
      }
      viewer_protocol_policy = "allow-all"
      min_ttl                = var.ttls[0]
      default_ttl            = var.ttls[1]
      max_ttl                = var.ttls[2]
    }
  }

  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = var.default_origin
    forwarded_values {
      headers      = ["Origin"]
      query_string = true
      cookies {
        forward = "all"
      }
    }
    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = var.ttls[0]
    default_ttl            = var.ttls[1]
    max_ttl                = var.ttls[2]
  }

  restrictions {
    geo_restriction {
      restriction_type = "blacklist"
      locations        = var.block_list
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = false
    acm_certificate_arn            = var.ssl_cert
    minimum_protocol_version       = var.tls_security_policy
    ssl_support_method             = "sni-only"
  }

  tags = {
  }
}

locals {
  custom_origin_config = {
    http_port  = "80"
    https_port = "443"
    protocol_policy = {
      "http"  = "http-only"
      "https" = "https-only"
    }
    tls_version = {
      "1.2" = "TLSv1.2"
      "1.1" = "TLSv1.1"
      "1.0" = "TLSv1"
      "1"   = "TLSv1"
    }
    # Nobody uses TLS 1.1 :-)
    ssl_protocols = ["TLSv1.2", "TLSv1"]
  }
  path_patterns = flatten([
    for b in var.behaviors : [
      for p in b.paths : [{
        path   = p
        origin = b.origin
      }]
    ]
  ])
}
