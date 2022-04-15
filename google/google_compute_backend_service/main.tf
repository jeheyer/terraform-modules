resource "google_compute_backend_service" "default" {
  name          = coalesce(var.name, "${local.default_name_prefix}-${var.port}")
  port_name     = coalesce(var.named_port, local.default_named_port)
  protocol      = coalesce(var.protocol, local.default_backend_protocol)
  health_checks = ["projects/${var.project_id}/global/healthChecks/${var.healthcheck_name}"]
  timeout_sec   = coalesce(var.backend_timeout, local.default_backend_timeout)
  dynamic "backend" {
    for_each = var.instance_groups
    content {
      group                 = "projects/${var.project_id}/zones/${var.instance_groups_zones[backend.key]}/instanceGroups/${var.instance_groups[backend.key]}"
      balancing_mode        = coalesce(var.balancing_mode, local.default_balancing_mode)
      max_rate_per_instance = var.balancing_mode == "RATE" ? var.max_rate_per_instance : local.max_rate_per_instance
      max_utilization       = var.balancing_mode == "UTILIZATION" ? var.max_utilization : local.max_utilization
    }
  }
  dynamic "log_config" {
    for_each = var.enable_logging == true ? [0] : []
    content {
      enable      = var.enable_logging
      sample_rate = coalesce(var.log_sample_rate, local.default_log_sample_rate)
    }
  }
  session_affinity = coalesce(var.affinity_type, local.default_affinity_type)
  security_policy  = var.security_policy

  # Cloud CDN Settings
  enable_cdn = var.enable_cdn
  dynamic "cdn_policy" {
    for_each = var.enable_cdn == true ? [0] : []
    content {
      cache_mode                   = coalesce(var.cdn_cache_mode, local.default_cdn_cache_mode)
      signed_url_cache_max_age_sec = 3600
      default_ttl                  = var.cdn_cache_mode != "USE_ORIGIN_HEADERS" ? local.default_cdn_default_ttl : null
      client_ttl                   = var.cdn_cache_mode != "USE_ORIGIN_HEADERS" ? local.default_cdn_client_ttl : null
      max_ttl                      = var.cdn_cache_mode == "CACHE_ALL_STATIC" ? local.default_cdn_max_ttl : null
      negative_caching             = false
      cache_key_policy {
        include_host           = true
        include_protocol       = true
        include_query_string   = true
        query_string_blacklist = []
        query_string_whitelist = []
      }
    }
  }
}

locals {
  default_name_prefix      = "backend-service"
  default_balancing_mode   = "UTILIZATION"
  max_utilization          = var.balancing_mode == "UTILIZATION" ? var.max_utilization : null
  max_rate_per_instance    = var.balancing_mode == "RATE" ? var.max_rate_per_instance : null
  default_named_port       = "https"
  default_backend_protocol = "HTTPS"
  default_backend_port     = 443
  default_backend_timeout  = 30
  default_affinity_type    = "NONE"
  default_log_sample_rate  = 1.0
  default_cdn_cache_mode   = "CACHE_ALL_STATIC"
  default_cdn_default_ttl  = 3600
  default_cdn_min_ttl      = 60
  default_cdn_max_ttl      = 14400
  default_cdn_client_ttl   = 3600
}
