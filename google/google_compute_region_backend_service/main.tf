resource "google_compute_region_backend_service" "default" {
  name                  = coalesce(var.name, "${local.default_name_prefix}-${var.port}")
  load_balancing_scheme = var.lb_scheme
  region                = var.region
  port_name             = var.lb_scheme == "INTERNAL_MANAGED" ? coalesce(var.named_port, local.default_named_port) : null
  protocol              = coalesce(var.protocol, local.default_backend_protocol)
  health_checks         = ["projects/${var.project_id}/global/healthChecks/${var.healthcheck_name}"]
  timeout_sec           = coalesce(var.backend_timeout, local.default_backend_timeout)
  dynamic "backend" {
    for_each = var.instance_groups
    content {
      group                 = "projects/${var.project_id}/zones/${var.instance_groups_zones[backend.key]}/instanceGroups/${var.instance_groups[backend.key]}"
      balancing_mode        = coalesce(var.balancing_mode, local.default_balancing_mode)
      max_rate_per_instance = var.balancing_mode == "UTILIZATION" ? var.max_rate_per_instance : local.max_rate_per_instance
      capacity_scaler       = var.lb_scheme == "INTERNAL_MANAGED" ? 1.0 : null
      #max_utilization       = var.balancing_mode == "UTILIZATION" ? var.max_utilization : local.max_utilization
      max_utilization = var.balancing_mode == "UTILIZATION" && var.lb_scheme == "INTERNAL_MANAGED" ? var.max_utilization : null
    }
  }
  dynamic "log_config" {
    for_each = var.enable_logging == true ? [0] : []
    content {
      enable      = var.enable_logging
      sample_rate = coalesce(var.log_sample_rate, local.default_log_sample_rate)
    }
  }
  locality_lb_policy = var.lb_scheme == "INTERNAL_MANAGED" ? var.lb_policy : null
  session_affinity   = coalesce(var.affinity_type, local.default_affinity_type)
}

locals {
  default_name_prefix      = "backend-service"
  default_balancing_mode   = var.protocol == "TCP" ? "CONNECTION" : "UTILIZATION"
  max_utilization          = var.balancing_mode == "UTILIZATION" ? 1.0 : null
  max_rate_per_instance    = var.balancing_mode == "RATE" ? 500 : null
  default_named_port       = "http"
  default_backend_protocol = "TCP"
  default_backend_port     = 80
  default_backend_timeout  = 30
  default_log_sample_rate  = 1.0
  default_affinity_type    = var.protocol == "TCP" ? "CLIENT_IP_PORT_PROTO" : "NONE"
}
