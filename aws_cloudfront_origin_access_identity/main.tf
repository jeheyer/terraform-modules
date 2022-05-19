resource "aws_cloudfront_origin_access_identity" "default" {
  comment = "OAI policy for ${var.name}"
}

