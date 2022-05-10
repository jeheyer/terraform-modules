resource "google_compute_interconnect_attachment" "default" {
  count         = length(var.circuits)
  name          = coalesce(var.circuits[count.index].attachment, "${var.name_prefix}-${count.index}")
  description   = var.circuits[count.index].description
  type          = upper(var.type)
  region        = var.region
  router        = coalesce(var.cloud_router_name, local.cloud_router_name)
  ipsec_internal_addresses = []
  encryption    = var.encryption
  mtu           = coalesce(var.circuits[count.index].mtu, 1500)
  admin_enabled = coalesce(var.circuits[count.index].enabled, true)
  project       = var.project_id
}

locals {
  cloud_router_name = "${var.vpc_network_name}-${var.region}"
}
