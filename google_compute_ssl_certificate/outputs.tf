output "id" {
  value = google_compute_ssl_certificate.default.id
}
output "ids" {
  value = google_compute_ssl_certificate.default.*.id
}
#output "name" {
#  value = google_compute_ssl_certificate.default.name
#}
output "self_link" {
  value = google_compute_ssl_certificate.default.self_link
}
