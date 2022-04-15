resource "google_compute_instance_group" "default" {
  count     = length(var.instances)
  name      = length(var.instances) == 1 ? var.name : "${var.name}-${count.index + 1}"
  network   = "projects/${local.network_project_id}/global/networks/${var.vpc_network_name}"
  instances = [var.instances[count.index]]
  #instances                    = ["projects/${var.project_id}/zones/${var.instance_zones[count.index]}/instances/${var.instances[count.index]}"]
  zone = var.zones[count.index]
}

locals {
  network_project_id = coalesce(var.network_project_id, var.project_id)
}
