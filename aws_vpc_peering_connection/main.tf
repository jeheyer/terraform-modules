resource "aws_vpc_peering_connection" "default" {
  #provider      = aws.this
  #count         = local.same_region == false && var.create_peering == true ? 1 : 0
  vpc_id        = var.vpc_id
  peer_vpc_id   = var.peer_vpc_id
  peer_owner_id = var.peer_account_id
  auto_accept   = coalesce(var.auto_accept, local.same_account)
  tags          = var.tags
  peer_region   = local.same_region == false && var.auto_accept == false ? var.peer_region : null
}

locals {
  same_region = var.region == var.peer_region ? true : false
  same_account = var.peer_account_id == null ? true : false
}