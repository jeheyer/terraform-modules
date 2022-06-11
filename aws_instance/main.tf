resource "aws_instance" "default" {
  count         = var.num_instances
  ami           = coalesce(var.ami, "ami-0fa49cc9dc8d62c84")
  key_name      = var.key_name
  instance_type = var.instance_type
  network_interface {
    network_interface_id = var.eni_ids[count.index]
    device_index         = 0
  }
  tags = {
    Name = "${var.naming_prefix}-${count.index}"
  }
}
