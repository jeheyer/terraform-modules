output "names" { value = google_compute_address.default.*.name }
output "addresses" { value = google_compute_address.default.*.address }
output "self_links" { value = google_compute_address.default.*.self_link }
