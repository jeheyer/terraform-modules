output "names" {
  value = google_sql_database_instance.default.*.name
}
