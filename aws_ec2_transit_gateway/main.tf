resource "aws_ec2_transit_gateway" "example" {
  amazon_side_asn = var.asn
  description     = var.description
  tags = {
    Name = var.name
  }
}
