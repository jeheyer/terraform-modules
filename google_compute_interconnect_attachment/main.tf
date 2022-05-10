resource "google_compute_interconnect_attachment" "default" {
  count                    = length(var.circuits)
  name                     = coalesce(var.circuits[count.index].attachment, "${var.name_prefix}-${count.index}")
  description              = var.circuits[count.index].description
  type                     = local.type
  region                   = var.region
  router                   = var.cloud_router_name
  ipsec_internal_addresses = []
  encryption               = var.encryption
  mtu                      = coalesce(var.circuits[count.index].mtu, 1440)
  admin_enabled            = coalesce(var.circuits[count.index].enabled, true)
  project                  = var.project_id
  interconnect             = local.type == "DEDICATED" ? var.interconnect : null
}

locals {
  type = upper(var.type)
}
