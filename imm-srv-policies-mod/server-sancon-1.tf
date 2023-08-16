# =============================================================================
#  SAN Connectivity Policy 1
# Can only be used with a 2 Eth Port Config
# -----------------------------------------------------------------------------

# =============================================================================
#  Server Network Configuration
#  - vNic FC Interfaces  (fc0, fc1, etc)
#  - Shared SAN Connectivity Policy
# -----------------------------------------------------------------------------


# =============================================================================
# SAN Connectivity Policy
# -----------------------------------------------------------------------------
resource "intersight_vnic_san_connectivity_policy" "sancon_1" {
  name                = "${var.policy_prefix}-sancon-1"
  description         = var.description
  target_platform = "FIAttached"
  placement_mode = "auto"
  wwnn_address_type = "POOL"
  wwnn_pool {
    moid = var.wwnn_pool_moid
    object_type = "fcpool.Pool"
  }
  organization {
    object_type = "organization.Organization"
    moid        = var.organization
  }
  dynamic "tags" {
    for_each = var.tags
    content {
      key   = tags.value.key
      value = tags.value.value
    }
  }
}


# =============================================================================
# vNIC FC Interfaces added to san connectivity policy: fc0, fc1, etc
# -----------------------------------------------------------------------------

# -----------------------------------------------------------------------------
#  fc0
# -----------------------------------------------------------------------------
# =============================================================================
# vHBA FC Interfacea   fc0, fc1, etc.
# -----------------------------------------------------------------------------
resource "intersight_vnic_fc_if" "fc_if_fc0_1" { 
  name            = "fc0"
  order           = 2  # PCI Link order must be unique across all vNic's and vHBA's
                       # Can only be used with a 2 Eth Port config
  placement {
    id            = "1"
    auto_slot_id  = false
    pci_link      = 0
    auto_pci_link = false
    uplink        = 0
    switch_id     = "A"
    object_type   = "vnic.PlacementSettings"
  }
  persistent_bindings = true
  wwpn_address_type   = "POOL"
  wwpn_pool {
    moid        = var.wwpn_pool_a_moid
    object_type = "fcpool.Pool"
  }
  san_connectivity_policy {
    moid        = intersight_vnic_san_connectivity_policy.sancon_1.moid
    object_type = "vnic.SanConnectivityPolicy"
  }
  fc_network_policy {
    moid        = intersight_vnic_fc_network_policy.vsan_100.moid
    object_type = "vnic.FcNetworkPolicy"
  }
  fc_adapter_policy {
    moid        = intersight_vnic_fc_adapter_policy.fcadapter_1.moid
    object_type = "vnic.FcAdapterPolicy"
  }
  fc_qos_policy {
    moid = intersight_vnic_fc_qos_policy.vnic_fc.moid
    object_type = "vnic.FcQosPolicy"
  }
}





