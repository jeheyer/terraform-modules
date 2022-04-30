resource "google_compute_firewall" "default" {
  name               = var.rule_name
  description        = var.rule_description
  network            = var.vpc_network_name
  priority           = var.priority
  direction          = local.direction
  source_ranges      = var.source_ranges
  destination_ranges = var.destination_ranges
  dynamic "allow" {
    for_each = var.allow != null ? var.allow : local.default_allow
    content {
      protocol = allow.value.protocol != null ? allow.value.protocol : "all"
      ports    = allow.value.ports
    }
  }
  dynamic "log_config" {
    for_each = var.enable_logging == true ? [0] : []
    content {
      metadata = "INCLUDE_ALL_METADATA"
    }
  }
  target_tags             = var.network_tags
  target_service_accounts = var.service_accounts
}

locals {
  direction = var.source_ranges != null ? "INGRESS" : "EGRESS"
  default_allow = [
    {
      protocol = "all"
      ports    = null
    }
  ]
}
