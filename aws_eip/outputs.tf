output "public_ip" { value = aws_eip.default.public_ip }
output "allocation_id" { value = aws_eip.default.allocation_id }
output "association_id" { value = aws_eip.default.association_id }
