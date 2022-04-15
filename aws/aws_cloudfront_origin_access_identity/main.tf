resource "aws_cloudfront_origin_access_identity" "OAI" {
  comment = "OAI policy for ${var.name}"
}

