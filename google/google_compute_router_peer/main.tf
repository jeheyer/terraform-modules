resource "google_compute_router_peer" "default" {
  count                     = length(var.bgp_peers)
  name                      = coalesce(var.name, "${local.cloud_router_name}-${var.peer_vpn_gateway_name}-${count.index}")
  region                    = var.region
  router                    = local.cloud_router_name
  interface                 = "${local.cloud_router_name}-${var.peer_vpn_gateway_name}-${count.index}"
  peer_ip_address           = var.bgp_peers[count.index].bgp_peer_ip
  peer_asn                  = coalesce(var.bgp_peers[count.index].peer_bgp_asn, local.peer_bgp_asn)
  advertised_route_priority = coalesce(var.bgp_peers[count.index].advertised_priority, local.advertised_priority)
  advertised_groups         = coalesce(var.bgp_peers[count.index].advertised_groups, local.advertised_groups)
  advertise_mode            = var.bgp_peers[count.index].advertised_ip_ranges != null ? "CUSTOM" : local.advertise_mode
  dynamic "advertised_ip_ranges" {
    for_each = coalesce(var.bgp_peers[count.index].advertised_ip_ranges, local.advertised_ip_ranges)
    content {
      range = advertised_ip_ranges.value
    }
  }
  dynamic "bfd" {
    for_each = var.enable_bfd ? [1] : []
    content {
      min_receive_interval        = var.bfd_parameters[0]
      min_transmit_interval       = var.bfd_parameters[1]
      multiplier                  = var.bfd_parameters[2]
      session_initialization_mode = "ACTIVE"
    }
  }
}

locals {
  cloud_router_name    = coalesce(var.cloud_router_name, "${var.vpc_network_name}-${var.region}")
  peer_bgp_asn         = coalesce(var.peer_bgp_asn, 65000)
  advertised_groups    = coalesce(var.advertised_groups, [])
  advertised_priority  = coalesce(var.advertised_priority, 100)
  advertise_mode       = var.advertised_ip_ranges != null ? "CUSTOM" : "DEFAULT"
  advertised_ip_ranges = coalesce(var.advertised_ip_ranges, [])
  enabled              = coalesce(var.enabled, true)
}
