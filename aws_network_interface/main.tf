resource "aws_network_interface" "default" {
  #count           = length(var.subnet_ids)
  count           = var.num_interfaces
  subnet_id       = element(var.subnet_ids, count.index)
  security_groups = var.security_group_ids
}
