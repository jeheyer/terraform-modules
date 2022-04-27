resource "google_compute_service_attachment" "default" {
  count                 = var.name != null ? 1 : 0
  name                  = var.name
  region                = var.region
  description           = var.description
  enable_proxy_protocol = false
  connection_preference = "ACCEPT_AUTOMATIC"
  nat_subnets           = var.nat_subnet_ids
  target_service        = var.target_service_id
}
