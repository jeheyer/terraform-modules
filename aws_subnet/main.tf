resource "aws_subnet" "default" {
  vpc_id               = var.vpc_id
  cidr_block           = var.cidr_block
  availability_zone    = var.az
  availability_zone_id = var.az_id
  ipv6_cidr_block      = var.ipv6_cidr_block
  ipv6_native          = false
  #map_customer_owned_ip_on_launch = false
  #map_public_ip_on_launch         = false
  #outpost_arn                     = null
  tags = {
    Name = var.name
    Tier = var.tier
  }
}
