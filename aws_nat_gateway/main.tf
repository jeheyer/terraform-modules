resource "aws_nat_gateway" "default" {
  allocation_id     = var.eip_allocation_id
  subnet_id         = var.subnet_id
  connectivity_type = var.eip_allocation_id == null ? "private" : "public"
  tags = {
    Name = var.name
  }
}
