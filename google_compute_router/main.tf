resource "google_compute_router" "default" {
  name        = coalesce(var.name, local.default_name)
  description = var.description
  network     = var.vpc_network_name
  region      = var.region
  bgp {
    #asn            = coalesce(var.bgp_asn, local.default_bgp_asn)
    asn            = var.bgp_asn
    advertise_mode = var.bgp_advertised_ip_ranges != null ? "CUSTOM" : "DEFAULT"
    dynamic "advertised_ip_ranges" {
      for_each = var.bgp_advertised_ip_ranges != null ? var.bgp_advertised_ip_ranges : []
      content {
        range       = advertised_ip_ranges.value.range
        description = advertised_ip_ranges.value.description
      }
    }
  }
}

locals {
  default_name    = "${var.vpc_network_name}-${var.region}"
  default_bgp_asn = 64512
}
