resource "aws_route" "default" {
  count                     = length(var.routes)
  route_table_id            = var.route_table_id
  destination_cidr_block    = var.routes[count.index]
  gateway_id                = substr(var.target, 0, 4) == "igw-" ? var.target : null
  vpc_peering_connection_id = substr(var.target, 0, 4) == "pcx-" ? var.target : null
  #gateway_id                = substr(var.target, 0, 4) == "vgw-" ? var.target : null
  network_interface_id = substr(var.target, 0, 4) == "eni-" ? var.target : null
  nat_gateway_id       = substr(var.target, 0, 4) == "nat-" ? var.target : null
  vpc_endpoint_id      = substr(var.target, 0, 5) == "vpce-" ? var.target : null
}
