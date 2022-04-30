output "name" {
  value = google_compute_ha_vpn_gateway.default.name
}
output "region" {
  value = google_compute_ha_vpn_gateway.default.region
}
output "ip_addresses" {
  value = google_compute_ha_vpn_gateway.default.vpn_interfaces.*.ip_address
}

output "details" {
  value = {
    "name"         = google_compute_ha_vpn_gateway.default.name
    "region"       = google_compute_ha_vpn_gateway.default.region
    "ip_addresses" = google_compute_ha_vpn_gateway.default.vpn_interfaces.*.ip_address
  }
}
