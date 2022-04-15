resource "google_compute_instance_group" "default" {
  name      = var.name
  network   = "projects/${local.network_project_id}/global/networks/${var.vpc_network_name}"
  instances = formatlist("projects/${var.project_id}/zones/${var.zone}/instances/%s", var.instances)
  zone      = var.zone
}

locals {
  network_project_id = coalesce(var.network_project_id, var.project_id)
}
