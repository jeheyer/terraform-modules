resource "google_compute_vpn_tunnel" "default" {
  count                           = length(var.tunnels)
  name                            = coalesce(var.tunnels[count.index].name, "${local.default_name_prefix}-${count.index}")
  description                     = coalesce(var.tunnels[count.index].description, "attached to ${var.vpc_network_name}")
  region                          = var.region
  router                          = coalesce(var.cloud_router_name, local.default_cloud_router_name)
  vpn_gateway                     = coalesce(var.cloud_vpn_gateway_name, local.default_cloud_vpn_gateway_name)
  peer_external_gateway           = var.peer_vpn_gateway_name
  shared_secret                   = var.tunnels[count.index].ike_psk
  ike_version                     = coalesce(var.tunnels[count.index].ike_version, local.default_ike_version)
  vpn_gateway_interface           = coalesce(var.tunnels[count.index].interface_index, count.index)
  peer_external_gateway_interface = coalesce(var.tunnels[count.index].interface_index, count.index)
}

locals {
  default_name_prefix            = "${var.vpc_network_name}-${var.region}-${var.peer_vpn_gateway_name}"
  default_cloud_router_name      = "${var.vpc_network_name}-${var.region}"
  default_cloud_vpn_gateway_name = "${var.vpc_network_name}-${var.region}"
  default_ike_version            = 2
}
