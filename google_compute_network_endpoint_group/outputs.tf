output "ids" {
  value = google_compute_network_endpoint_group.default.*.id
}
output "self_links" {
  value = google_compute_network_endpoint_group.default.*.self_link
}
