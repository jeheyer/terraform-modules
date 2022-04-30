output "name" {
  value = google_compute_external_vpn_gateway.default.name
}
output "ip_addresses" {
  value = google_compute_external_vpn_gateway.default.interface.*.ip_address
}
output "details" {
  value = {
    name         = google_compute_external_vpn_gateway.default.name
    description  = google_compute_external_vpn_gateway.default.description
    ip_addresses = google_compute_external_vpn_gateway.default.interface.*.ip_address
  }
}
