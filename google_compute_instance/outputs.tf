output "names" { value = google_compute_instance.default.*.name }
output "zones" { value = google_compute_instance.default.*.zone }
output "self_links" { value = google_compute_instance.default.*.self_link }
