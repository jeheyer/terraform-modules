resource "aws_subnet" "default" {
  vpc_id               = var.vpc_id
  cidr_block           = var.cidr_block
  availability_zone    = var.az
  availability_zone_id = var.az_id
  ipv6_cidr_block      = null
  ipv6_native          = false
  tags = {
    Name = var.name
    Tier = var.tier
  }
}
