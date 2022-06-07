resource "google_compute_router_interface" "default" {
  count = length(var.interfaces)
  #name                    = coalesce("${var.name_prefix}-${count.index}", "${local.name_prefix}-${count.index}")
  name                    = local.type == "vpn" ? "${local.name_prefix}-${count.index}" : var.interfaces[count.index].name
  region                  = var.region
  router                  = var.cloud_router_name
  ip_range                = var.interfaces[count.index].cloud_router_ip
  vpn_tunnel              = local.type == "vpn" ? coalesce(var.interfaces[count.index].name, "${local.name_prefix}-${count.index}") : null
  #interconnect_attachment = local.type == "interconnect" ? coalesce(var.interconnect_attachments[count.index], var.interfaces[count.index].attachment) : null
  interconnect_attachment = local.type == "interconnect" ? coalesce(var.interfaces[count.index].attachment, var.interfaces[count.index].name) : null
  project                 = var.project_id
}

locals {
  type              = lower(var.type)
  name_prefix       = var.peer_vpn_gateway_name != null ? "${var.cloud_router_name}-${var.peer_vpn_gateway_name}" : var.cloud_router_name
}

