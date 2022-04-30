resource "google_compute_backend_bucket" "default" {
  name        = coalesce(var.name, "${local.default_name_prefix}-${var.bucket_name}")
  bucket_name = var.bucket_name
  enable_cdn  = var.enable_cdn
}

locals {
  default_name_prefix = "backend-bucket"
}

