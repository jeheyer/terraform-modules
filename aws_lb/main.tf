resource "aws_lb" "default" {
  name               = var.name
  internal           = var.internal
  load_balancer_type = var.type
  security_groups    = var.security_group_ids
  subnets            = var.subnet_ids
}

