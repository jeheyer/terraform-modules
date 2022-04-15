resource "aws_lb" "LB" {
  name               = var.name
  internal           = var.internal
  load_balancer_type = var.type
  security_groups    = var.security_groups
  subnets            = var.subnet_ids
}

