output "names" {
  value = google_compute_router_interface.default.*.name
}
output "ids" {
  value = google_compute_router_interface.default.*.id
}
output "ip_ranges" {
  value = google_compute_router_interface.default.*.ip_range
}

output "router_interfaces" {
  value = {
    "names"     = google_compute_router_interface.default.*.name
    "ids"       = google_compute_router_interface.default.*.id
    "ip_ranges" = google_compute_router_interface.default.*.ip_range
  }
}
