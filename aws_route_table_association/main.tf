resource "aws_route_table_association" "default" {
  subnet_id      = aws_subnet.foo.id
  route_table_id = aws_route_table.bar.id
}