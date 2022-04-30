output "gcp_router_ips" {
  value = google_compute_router_peer.default.*.ip_address
}
