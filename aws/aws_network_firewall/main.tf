resource "aws_networkfirewall_firewall" "default" {
  name                = var.name
  firewall_policy_arn = var.firewall_policy_arn
  vpc_id              = var.vpc_id
  subnet_mapping {
    subnet_id = var.subnet_id
  }
}
