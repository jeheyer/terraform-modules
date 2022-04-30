resource "google_compute_network_endpoint_group" "default" {
  name    = var.name
  network = var.vpc_network_name
  #subnetwork   = google_compute_subnetwork.default.id
  #default_port = var.port
  zone = var.zone
}
