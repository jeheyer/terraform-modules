resource "google_compute_region_network_endpoint_group" "default" {
  name   = var.name
  region = var.region
}
