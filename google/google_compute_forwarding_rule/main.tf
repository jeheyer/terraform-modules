resource "google_compute_forwarding_rule" "default" {
  name                  = coalesce(var.name, local.default_name)
  ip_address            = var.ip_address
  ip_protocol           = "TCP"
  target                = var.tproxy_id
  backend_service       = var.backend_service_name != null && var.tproxy_id == null ? local.backend_service_id : null
  load_balancing_scheme = var.lb_scheme
  port_range            = var.port_range
  ports                 = length(var.ports) > 0 ? var.ports : null
  all_ports             = length(var.ports) > 0 || var.port_range != null ? false : true
  subnetwork            = var.lb_scheme == "EXTERNAL" ? null : local.subnet_id
  network_tier          = var.lb_scheme == "EXTERNAL" ? var.network_tier : local.default_network_tier
  region                = var.region
  allow_global_access   = var.allow_global_access
}

locals {
  default_name         = "fwdrule"
  default_network_tier = var.lb_scheme == "EXTERNAL" ? "PREMIUM" : null
  subnet_id            = "projects/${var.network_project_id}/regions/${var.region}/subnetworks/${var.subnet_name}"
  backend_service_id   = var.backend_service_name != null ? "projects/${var.network_project_id}/regions/${var.region}/backendServices/${var.backend_service_name}" : null
}
