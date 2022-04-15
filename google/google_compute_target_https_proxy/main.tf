resource "google_compute_target_https_proxy" "default" {
  name             = coalesce(var.name, local.default_name)
  url_map          = var.urlmap_id
  ssl_certificates = var.ssl_certificates
  ssl_policy       = var.ssl_policy_name
}
locals {
  default_name = "tproxy-https"
}
