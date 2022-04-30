resource "google_compute_route" "default" {
  count                  = length(var.dest_ranges) > 0 ? length(var.dest_ranges) : 1
  network                = var.vpc_network_name
  name                   = length(var.dest_ranges) > 0 ? "${var.name}-${count.index}" : var.name
  description            = var.description
  dest_range             = length(var.dest_ranges) > 0 ? var.dest_ranges[count.index] : var.dest_range
  priority               = var.priority
  tags                   = var.instance_tags
  next_hop_gateway       = var.next_hop == null ? "default-internet-gateway" : null
  next_hop_ip            = local.next_hop_type == "ip" ? var.next_hop : null
  next_hop_instance      = local.next_hop_type == "instance" ? var.next_hop : null
  next_hop_instance_zone = local.next_hop_type == "instance" ? var.next_hop_zone : null
}

locals {
  next_hop_type = can(regex("^[1-2]", var.next_hop)) ? "ip" : "instance"
}
