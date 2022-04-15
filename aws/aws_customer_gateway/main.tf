resource "aws_customer_gateway" "default" {
  bgp_asn     = var.bgp_asn
  ip_address  = var.ip_address
  type        = var.type
  device_name = var.device_name
  tags = {
    Name = var.name
  }
}
