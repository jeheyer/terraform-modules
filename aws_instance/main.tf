resource "aws_instance" "default" {
  count         = var.num_instances
  ami           = var.ami
  key_name      = var.key_name
  instance_type = var.instance_type
  network_interface {
    network_interface_id = var.eni_ids[count.index]
    device_index         = 0
  }
}
