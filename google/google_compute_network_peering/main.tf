resource "google_compute_network_peering" "default" {
  name                                = coalesce(var.name, local.default_name)
  network                             = local.our_network_url
  peer_network                        = local.peer_network_url
  import_custom_routes                = var.import_custom_routes
  export_custom_routes                = var.export_custom_routes
  import_subnet_routes_with_public_ip = var.import_subnet_routes_with_public_ip
  export_subnet_routes_with_public_ip = var.export_subnet_routes_with_public_ip
}

locals {
  default_name     = "${var.vpc_network_name}-${var.peer_network_name}"
  peer_project_id  = coalesce(var.peer_project_id, var.project_id)
  our_network_url  = "projects/${var.project_id}/global/networks/${var.vpc_network_name}"
  peer_network_url = "projects/${local.peer_project_id}/global/networks/${var.peer_network_name}"
}
