resource "google_compute_instance_group_named_port" "default" {
  count = length(var.instance_groups)
  group = "projects/${var.project_id}/zones/${var.instance_groups_zones[count.index]}/instanceGroups/${var.instance_groups[count.index]}"
  name  = coalesce(var.name, local.default_name)
  port  = var.port
}

locals {
  protocol     = lower(var.protocol)
  default_name = var.protocol != null ? "port-${var.port}-${local.protocol}" : "port-${var.port}"
}
