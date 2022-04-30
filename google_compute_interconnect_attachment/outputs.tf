output "id" { value = google_compute_interconnect_attachment.default.id }
output "pairing_key" { value = google_compute_interconnect_attachment.default.pairing_key }
output "state" { value = google_compute_interconnect_attachment.default.state }
output "cloud_router_ip" { value = google_compute_interconnect_attachment.default.cloud_router_ip_address }
output "customer_router_ip" { value = google_compute_interconnect_attachment.default.customer_router_ip_address }

