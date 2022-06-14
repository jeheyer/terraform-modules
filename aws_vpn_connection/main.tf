resource "aws_vpn_connection" "default" {
  transit_gateway_id  = var.tgw_id
  vpn_gateway_id      = var.vpgw_id
  customer_gateway_id = var.cgw_id
  type                = var.type
  static_routes_only  = false

  # Tunnel 1 Settings
  tunnel1_inside_cidr                  = var.tunnel_settings[0].inside_ipv4_cidr
  tunnel1_preshared_key                = var.tunnel_settings[0].preshared_key
  tunnel1_ike_versions                 = lookup(local.ike_versions, var.ike_version, ["ikev1", "ikev2"])
  tunnel1_phase1_lifetime_seconds      = var.phase1_settings.lifetime
  tunnel1_phase1_encryption_algorithms = var.phase1_settings.encryption
  tunnel1_phase1_integrity_algorithms  = var.phase1_settings.integrity
  tunnel1_phase1_dh_group_numbers      = var.phase1_settings.dh_groups
  tunnel1_phase2_lifetime_seconds      = var.phase2_settings.lifetime
  tunnel1_phase2_encryption_algorithms = var.phase2_settings.encryption
  tunnel1_phase2_integrity_algorithms  = var.phase2_settings.integrity
  tunnel1_phase2_dh_group_numbers      = var.phase2_settings.dh_groups

  # Tunnel 2 Settings
  tunnel2_inside_cidr                  = var.tunnel_settings[1].inside_ipv4_cidr
  tunnel2_preshared_key                = var.tunnel_settings[1].preshared_key
  tunnel2_ike_versions                 = lookup(local.ike_versions, var.ike_version, ["ikev1", "ikev2"])
  tunnel2_phase1_lifetime_seconds      = var.phase1_settings.lifetime
  tunnel2_phase1_encryption_algorithms = var.phase1_settings.encryption
  tunnel2_phase1_integrity_algorithms  = var.phase1_settings.integrity
  tunnel2_phase1_dh_group_numbers      = var.phase1_settings.dh_groups
  tunnel2_phase2_lifetime_seconds      = var.phase2_settings.lifetime
  tunnel2_phase2_encryption_algorithms = var.phase2_settings.encryption
  tunnel2_phase2_integrity_algorithms  = var.phase2_settings.integrity
  tunnel2_phase2_dh_group_numbers      = var.phase2_settings.dh_groups

  tags = {
    Name = var.name
  }
}

locals {
  ike_versions = {
    1 = ["ikev1"]
    2 = ["ikev2"]
  }
}
