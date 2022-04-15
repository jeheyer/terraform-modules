output "id" { value = google_compute_instance_group_named_port.default.*.id }
output "names" { value = google_compute_instance_group_named_port.default.*.name }
output "ports" { value = google_compute_instance_group_named_port.default.*.port }
