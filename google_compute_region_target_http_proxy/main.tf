resource "google_compute_region_target_http_proxy" "default" {
  region  = var.region
  name    = coalesce(var.name, local.default_name)
  url_map = var.urlmap_id
}
locals {
  default_name = "tproxy"
}
