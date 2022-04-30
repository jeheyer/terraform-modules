resource "google_compute_security_policy" "CLOUDARMOR_POLICY" {
  name    = var.name
  project = var.project_id
  dynamic "rule" {
    for_each = var.rules
    content {
      action   = coalesce(rule.value["action"], local.default_action)
      priority = coalesce(rule.value["priority"], local.default_priority)
      match {
        versioned_expr = rule.value["ip_ranges"] != null ? "SRC_IPS_V1" : null
        dynamic "config" {
          for_each = rule.value["ip_ranges"] != null ? [0] : []
          content {
            src_ip_ranges = coalesce(rule.value["ip_ranges"], local.default_ip_ranges)
          }
        }
        dynamic "expr" {
          for_each = rule.value["expr"] != null ? [0] : []
          content {
            expression = rule.value["expr"]
          }
        }
      }
      description = rule.value["description"]
    }
  }
  rule {
    action = "deny(403)"
    match {
      versioned_expr = "SRC_IPS_V1"
      config {
        src_ip_ranges = ["*"]
      }
    }
    description = "Default rule, higher priority overrides it"
    priority    = 2147483647
  }
}

locals {
  default_action    = "allow"
  default_priority  = 2147483646
  default_ip_ranges = ["*"]
}
