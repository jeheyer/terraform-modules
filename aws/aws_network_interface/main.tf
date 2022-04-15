resource "aws_network_interface" "default" {
  count           = length(var.subnet_ids)
  subnet_id       = var.subnet_ids[count.index]
  security_groups = var.security_group_ids
}
