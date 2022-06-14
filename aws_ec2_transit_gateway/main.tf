resource "aws_ec2_transit_gateway" "default" {
  amazon_side_asn = var.asn
  description     = var.description
  tags = {
    Name = var.name
  }
}
