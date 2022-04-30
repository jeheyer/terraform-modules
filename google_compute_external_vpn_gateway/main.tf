resource "google_compute_external_vpn_gateway" "default" {
  name            = var.name
  description     = var.description
  redundancy_type = lookup(local.redundancy_type_map, length(var.ip_addresses))
  dynamic "interface" {
    for_each = var.ip_addresses
    content {
      id         = interface.key
      ip_address = interface.value
    }
  }
}

locals {
  redundancy_type_map = {
    1 = "SINGLE_IP_INTERNALLY_REDUNDANT",
    2 = "TWO_IPS_REDUNDANCY",
    3 = "TWO_IPS_REDUNDANCY",
    4 = "FOUR_IPS_REDUNDANCY"
  }
}

