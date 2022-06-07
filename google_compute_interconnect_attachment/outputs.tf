output "ids" { value = google_compute_interconnect_attachment.default.*.id }
output "names" { value = google_compute_interconnect_attachment.default.*.name }
output "pairing_keys" { value = google_compute_interconnect_attachment.default.*.pairing_key }
output "states" { value = google_compute_interconnect_attachment.default.*.state }
output "cloud_router_ips" { value = google_compute_interconnect_attachment.default.*.cloud_router_ip_address }
output "customer_router_ips" { value = google_compute_interconnect_attachment.default.*.customer_router_ip_address }

