resource "google_compute_router_interface" "default" {
  count      = length(var.tunnels)
  name       = coalesce(var.name, "${local.name_prefix}-${count.index}")
  region     = var.region
  router     = coalesce(var.cloud_router_name, "${var.vpc_network_name}-${var.region}")
  ip_range   = var.tunnels[count.index].cloud_router_ip
  vpn_tunnel = coalesce(var.tunnels[count.index].name, "${local.name_prefix}-${count.index}")
}

locals {
  name_prefix = "${var.cloud_router_name}-${var.peer_vpn_gateway_name}"
}

