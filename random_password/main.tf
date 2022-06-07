resource "random_password" "default" {
  count   = var.number
  length  = var.length
  special = var.use_special_characters
}

