resource "google_compute_region_url_map" "default" {
  name            = coalesce(var.name, local.default_name)
  region          = var.region
  default_service = var.default_url_redirect == true ? null : var.default_service
  dynamic "default_url_redirect" {
    for_each = var.default_url_redirect == true ? [0] : []
    content {
      strip_query            = var.strip_query_on_redirect
      redirect_response_code = var.redirect_to_https == false ? var.redirect_response_code : null
      https_redirect         = var.redirect_to_https == true ? true : null
    }
  }
  dynamic "host_rule" {
    for_each = var.route_rules != null ? var.route_rules : []
    content {
      hosts        = host_rule.value.hostnames
      path_matcher = "path-matcher-${host_rule.key}"
    }
  }
  dynamic "path_matcher" {
    for_each = var.route_rules != null ? var.route_rules : []
    content {
      name            = "path-matcher-${path_matcher.key}"
      default_service = path_matcher.value["backend"]
    }
  }
}

locals {
  default_name         = "urlmap"
  default_url_redirect = var.redirect_to_https == true ? true : var.default_url_redirect
}
