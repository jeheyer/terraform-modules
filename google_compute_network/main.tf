resource "google_compute_network" "default" {
  name                    = var.name
  description             = var.description
  mtu                     = var.mtu
  routing_mode            = coalesce(var.routing_mode, local.routing_mode)
  auto_create_subnetworks = var.auto_create_subnetworks
}

locals {
  routing_mode = var.enable_global_routing == true ? "GLOBAL" : "REGIONAL"
}
