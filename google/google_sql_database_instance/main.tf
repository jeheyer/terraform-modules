resource "google_sql_database_instance" "default" {
  name             = var.name
  region           = var.region
  database_version = coalesce(var.db_version, local.db_version)
  settings {
    tier = var.tier
    ip_configuration {
      ipv4_enabled    = var.private_network_id == null ? true : false
      private_network = var.private_network_id
    }
  }
  project = var.project_id
}

locals {
  db_version = var.type == "mysql" ? "MYSQL_5_7" : null
}
