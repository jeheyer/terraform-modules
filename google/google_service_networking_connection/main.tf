resource "google_service_networking_connection" "default" {
  network                 = var.vpc_network_name
  reserved_peering_ranges = var.ranges
  service                 = coalesce(var.service, "servicenetworking.googleapis.com")
}

