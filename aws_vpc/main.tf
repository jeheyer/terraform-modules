resource "aws_vpc" "default" {
  cidr_block = var.cidr_block
assign_generated_ipv6_cidr_block = false
  tags = {
    Name = var.name
  }
}

