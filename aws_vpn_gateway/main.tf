resource "aws_vpn_gateway" "default" {
  vpc_id          = var.vpc_id
  amazon_side_asn = var.asn
  tags = {
    Name = var.name
  }
}
