output "ids" { value = google_compute_global_address.default.*.id }
output "names" { value = google_compute_global_address.default.*.name }
output "addresses" { value = google_compute_global_address.default.*.address }
output "self_links" { value = google_compute_global_address.default.*.self_link }

