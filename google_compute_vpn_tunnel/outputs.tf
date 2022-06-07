output "ike_psks" {
  value = google_compute_vpn_tunnel.default.*.shared_secret
  #sensitive = true
}
output "names" {
  value = google_compute_vpn_tunnel.default.*.name
}
output "vpn_tunnel_self_links" {
  value = google_compute_vpn_tunnel.default.*.self_link
}

