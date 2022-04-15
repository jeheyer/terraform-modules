resource "google_compute_subnetwork" "default" {
  network     = var.vpc_network_name
  name        = coalesce(var.name, local.default_name)
  description = var.description
  region      = var.region
  #stack_type               = var.stack_type
  ip_cidr_range            = var.ip_range
  purpose                  = var.purpose
  role                     = var.purpose == "INTERNAL_HTTPS_LOAD_BALANCER" ? "ACTIVE" : null
  private_ip_google_access = local.enable_private_access
  dynamic "log_config" {
    for_each = var.enable_flow_logs == true && var.purpose == "PRIVATE" ? [0] : []
    content {
      aggregation_interval = coalesce(var.log_aggregation_interval, local.default_log_aggregation_interval)
      flow_sampling        = coalesce(var.log_sample_rate, local.default_log_sample_rate)
      metadata             = local.default_log_metadata
      metadata_fields      = []
    }
  }
  dynamic "secondary_ip_range" {
    for_each = coalesce(var.secondary_ranges, {})
    content {
      range_name    = secondary_ip_range.key
      ip_cidr_range = secondary_ip_range.value["range"]
    }
  }
}

locals {
  default_name                     = "${var.vpc_network_name}-${var.region}"
  default_log_aggregation_interval = var.enable_flow_logs == true ? "INTERVAL_5_SEC" : null
  default_log_sample_rate          = var.enable_flow_logs == true ? 0.5 : null
  default_log_metadata             = var.enable_flow_logs == true ? "INCLUDE_ALL_METADATA" : null
  enable_private_access            = var.purpose == "PRIVATE" ? var.enable_private_access : false
}

