resource "google_compute_address" "default" {
  count         = var.num_addresses
  name          = length(var.names) > 0 ? var.names[count.index] : count.index > 0 ? "${var.name_prefix}-${count.index}" : var.name_prefix
  description   = length(var.descriptions) > 0 ? var.descriptions[count.index] : null
  region        = var.region
  purpose       = var.address_type == "INTERNAL" ? var.purpose : null
  network_tier  = var.address_type == "EXTERNAL" ? var.network_tier : local.network_tier
  address       = length(var.addresses) > 0 ? var.addresses[count.index] : null
  address_type  = var.address_type
  subnetwork    = local.subnet_id
  prefix_length = length(var.prefixes) > 0 ? element(split("/", var.prefixes[count.index]), 1) : null
}

locals {
  subnet_id    = var.address_type == "INTERNAL" ? "projects/${var.network_project_id}/regions/${var.region}/subnetworks/${var.subnet_name}" : null
  network_tier = var.address_type == "EXTERNAL" ? "PREMIUM" : null
}

