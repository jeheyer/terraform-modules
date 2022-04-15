output "names" { value = google_compute_route.default.*.name }
output "ids" { value = google_compute_route.default.*.id }
