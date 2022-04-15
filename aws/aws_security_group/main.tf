resource "aws_security_group" "SECURITY_GROUP" {
  name            = var.name
  vpc_id          = var.vpc_id
  dynamic "ingress" {
    for_each = var.inbound_rules
    content {
      protocol    = ingress.value["protocol"]
      from_port   = ingress.value["from_port"]
      to_port     = ingress.value["to_port"]
      cidr_blocks = ingress.value["cidr_blocks"]
      description = ingress.value["description"]
    }
  }
  description     = var.description
}

