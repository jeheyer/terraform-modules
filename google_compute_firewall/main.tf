resource "google_compute_firewall" "default" {
  name          = var.rule_name
  description   = var.rule_description
  network       = var.vpc_network_name
  priority      = var.priority
  direction     = var.direction != null ? upper(var.direction) : local.direction
  source_ranges = var.source_ranges != null ? var.source_ranges : local.source_ranges
  source_tags   = var.source_tags
  dynamic "allow" {
    for_each = var.allow != null ? var.allow : (var.deny == null ? local.all_traffic : [])
    content {
      protocol = allow.value.protocol != null ? allow.value.protocol : "all"
      ports    = allow.value.ports
    }
  }
  dynamic "deny" {
    for_each = var.deny != null ? var.deny : []
    content {
      protocol = deny.value.protocol != null ? deny.value.protocol : "all"
      ports    = deny.value.ports
    }
  }
  dynamic "log_config" {
    for_each = var.enable_logging == true ? [0] : []
    content {
      metadata = "INCLUDE_ALL_METADATA"
    }
  }
  destination_ranges      = var.destination_ranges != null ? var.destination_ranges : local.destination_ranges
  target_tags             = var.target_tags
  target_service_accounts = var.service_accounts
}

locals {
  direction          = var.destination_ranges != null ? "EGRESS" : "INGRESS"
  source_ranges      = local.direction == "INGRESS" && var.source_tags == null ? ["0.0.0.0/0"] : null
  destination_ranges = local.direction == "EGRESS" ? coalesce(var.destination_ranges, ["0.0.0.0/0"]) : null
  all_traffic = [
    {
      protocol = "all"
      ports    = null
    }
  ]
}
