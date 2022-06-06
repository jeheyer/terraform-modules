resource "aws_vpn_gateway" "default" {
  count  = var.number
  vpc_id = var.vpc_id
  tags = {
    Name = coalesce(var.names[count.index], "vgw-${var.vpc_id}-${count.index}")
  }
}
