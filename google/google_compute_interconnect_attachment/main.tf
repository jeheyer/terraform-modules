resource "google_compute_interconnect_attachment" "default" {
  name          = var.name
  type          = upper(var.type)
  region        = var.region
  router        = coalesce(var.cloud_router_name, local.default_cloud_router_name)
  encryption    = null
  mtu           = var.mtu
  admin_enabled = var.enabled
  project       = var.project_id
}

locals {
  default_cloud_router_name = "${var.vpc_network_name}-${var.region}"
}
