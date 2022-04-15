output "names" { value = google_compute_instance_group.default.*.name }
output "zones" { value = google_compute_instance_group.default.*.zone }
