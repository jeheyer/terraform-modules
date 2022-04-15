resource "google_compute_global_address" "default" {
  count         = length(var.prefixes) > 0 ? length(var.prefixes) : length(var.addresses) > 0 ? length(var.addresses) : 0
  name          = length(var.names) > 0 ? var.names[count.index] : count.index > 0 ? "${var.name_prefix}-${count.index}" : var.name_prefix
  address       = length(var.addresses) > 0 ? var.addresses[count.index] : length(var.prefixes) > 0 ? element(split("/", var.prefixes[count.index]), 0) : null
  prefix_length = length(var.prefixes) > 0 ? element(split("/", var.prefixes[count.index]), 1) : null
  description   = length(var.descriptions) > 0 ? var.descriptions[count.index] : null
  ip_version    = var.ip_version
  address_type  = var.address_type
  purpose       = var.purpose
  network       = var.vpc_network_name
}

