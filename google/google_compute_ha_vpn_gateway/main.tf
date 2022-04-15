resource "google_compute_ha_vpn_gateway" "default" {
  name    = coalesce(var.name, local.default_name)
  network = var.vpc_network_name
  region  = var.region
}

locals {
  default_name = "${var.vpc_network_name}-${var.region}"
}

