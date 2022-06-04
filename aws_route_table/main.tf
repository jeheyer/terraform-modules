resource "aws_route_table" "default" {
  vpc_id = var.vpc_id
  #route = var.routes
  tags = {
    Name = var.name
  }
}
