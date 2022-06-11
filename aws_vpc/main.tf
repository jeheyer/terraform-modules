resource "aws_vpc" "default" {
  cidr_block = var.cidr_block
  tags = {
    Name = var.name
  }
}

