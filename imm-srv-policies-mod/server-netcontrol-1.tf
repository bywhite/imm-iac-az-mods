# =============================================================================
#  Network Control Policy
# -----------------------------------------------------------------------------

# https://registry.terraform.io/providers/CiscoDevNet/Intersight/latest/docs/resources/fabric_eth_network_control_policy
resource "intersight_fabric_eth_network_control_policy" "netcontrol_1" {
  name        = "${var.policy_prefix}-netcontrol-1"
  description = var.description
  cdp_enabled = true
  forge_mac   = "allow"
  lldp_settings {
    object_type      = "fabric.LldpSettings"
    receive_enabled  = true
    transmit_enabled = true
  }
  mac_registration_mode = "allVlans"
  uplink_fail_action    = "linkDown"
  organization {
    moid = var.organization
  }
  dynamic "tags" {
    for_each = var.tags
    content {
      key   = tags.value.key
      value = tags.value.value
    }
  }
}

