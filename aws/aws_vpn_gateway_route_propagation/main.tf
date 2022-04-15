resource "aws_vpn_gateway_route_propagation" "default" {
  vpn_gateway_id = var.vpgw_id
  route_table_id = var.route_table_id
}
