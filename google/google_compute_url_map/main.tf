resource "google_compute_url_map" "default" {
  name = coalesce(var.name, local.default_name)
  dynamic "default_url_redirect" {
    for_each = var.redirect_to_https == true ? [0] : []
    content {
      https_redirect = var.redirect_to_https == true ? true : null
      strip_query    = var.redirect_to_https == true ? var.strip_query_on_redirect : null
    }
  }
  default_service = var.redirect_to_https == true ? null : var.default_service_id
  dynamic "host_rule" {
    for_each = var.route_rules
    content {
      hosts        = host_rule.value.hostnames
      path_matcher = "path-matcher-${host_rule.key}"
    }
  }
  dynamic "path_matcher" {
    for_each = var.route_rules
    content {
      name            = "path-matcher-${path_matcher.key}"
      default_service = path_matcher.value.backend
    }
  }
}
locals {
  default_name = "urlmap"
}
