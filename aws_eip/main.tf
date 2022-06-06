resource "aws_eip" "default" {
  vpc = true
  tags = {
    Name = var.name
  }
}
