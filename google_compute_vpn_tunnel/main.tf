resource "google_compute_vpn_tunnel" "default" {
  count                           = length(var.tunnels)
  name                            = coalesce(var.tunnels[count.index].name, "${local.name_prefix}-${count.index}")
  description                     = var.tunnels[count.index].description
  region                          = var.region
  router                          = var.cloud_router_name
  vpn_gateway                     = local.cloud_vpn_gateway_name
  peer_external_gateway           = var.peer_vpn_gateway_name
  shared_secret                   = var.tunnels[count.index].ike_psk
  ike_version                     = coalesce(var.tunnels[count.index].ike_version, 2)
  vpn_gateway_interface           = coalesce(var.tunnels[count.index].interface_index, count.index)
  peer_external_gateway_interface = coalesce(var.tunnels[count.index].interface_index, count.index)
  project                         = var.project_id
}

locals {
  name_prefix            = "${local.cloud_vpn_gateway_name}-${var.peer_vpn_gateway_name}"
  cloud_vpn_gateway_name = coalesce(var.cloud_vpn_gateway_name, "${var.vpc_network_name}-${var.region}")
}
