resource "aws_route" "default" {
  count                     = length(var.routes)
  route_table_id            = var.route_table_id
  destination_cidr_block    = var.routes[count.index].destination
  vpc_peering_connection_id = substr(var.routes[count.index].target, 0, 4) == "pcx-" ? var.routes[count.index].target : null
  gateway_id                = substr(var.routes[count.index].target, 0, 4) == "vgw-" ? var.routes[count.index].target : null
  network_interface_id      = substr(var.routes[count.index].target, 0, 4) == "eni-" ? var.routes[count.index].target : null
  nat_gateway_id            = substr(var.routes[count.index].target, 0, 4) == "nat-" ? var.routes[count.index].target : null
  vpc_endpoint_id           = substr(var.routes[count.index].target, 0, 5) == "vpce-" ? var.routes[count.index].target : null
}

