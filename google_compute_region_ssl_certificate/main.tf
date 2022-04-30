resource "google_compute_region_ssl_certificate" "default" {
  region      = var.region
  name_prefix = var.name_prefix
  description = var.description
  private_key = file(var.key_file)
  certificate = file(var.certificate_file)
  lifecycle {
    create_before_destroy = true
  }
}
