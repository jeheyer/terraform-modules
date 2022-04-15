output "ids" {
  value = aws_instance.default.*.id
}

