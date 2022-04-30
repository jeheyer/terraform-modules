resource "google_compute_target_http_proxy" "default" {
  name    = coalesce(var.name, local.default_name)
  url_map = var.urlmap_id
}
locals {
  default_name = "tproxy"
}
