# =============================================================================
#  Network Group Policy (VLANs)            -tied to each vNIC policy Ex: eth0
#  Used by "intersight_vnic_eth_if" resource to create "eth0", "eth1", etc
# -----------------------------------------------------------------------------
# https://registry.terraform.io/providers/CiscoDevNet/Intersight/latest/docs/resources/fabric_eth_network_group_policy
resource "intersight_fabric_eth_network_group_policy" "netgroup_2" {
  name        = "${var.policy_prefix}-netgroup-2"
  description = var.description
  vlan_settings {
    native_vlan   = "10"
    allowed_vlans = "10-200"
  }
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
