# =============================================================================
# Server Fiber Channel Configuration
#  - SAN Connectivity Policy    per Server Template
#  - FC Interface Policy (VSAN, WWPN, QoS, etc)
# -----------------------------------------------------------------------------

# =============================================================================
# SAN Connectivity Policy  per Server Profile Template
# -----------------------------------------------------------------------------

resource "intersight_vnic_san_connectivity_policy" "vnic_san_con_1" {
  name                = "${var.server_policy_prefix}-san-connectivity"
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
}


# =============================================================================
# vHBA FC Interfacea   fc0, fc1, etc.
# -----------------------------------------------------------------------------
resource "intersight_vnic_fc_if" "fc_if" { 
  for_each = var.vhba_vsan_sets  
  # each.value["vhba_name"]  each.value["vsan_moid"]  each.value["switch_id"]   each.value["pci_order"]
  name            = each.value["vhba_name"]
  order           = each.value["pci_order"]   # PCI Link order must be unique across all vNic's and vHBA's
  placement {
    id            = "1"
    auto_slot_id  = false
    pci_link      = 0
    auto_pci_link = false
    uplink        = 0
    switch_id     = each.value["switch_id"]
    object_type   = "vnic.PlacementSettings"
  }
  persistent_bindings = true
  wwpn_address_type   = "POOL"
  wwpn_pool {
    moid        = each.value["wwpn_pool_moid"]
    object_type = "fcpool.Pool"
  }
  san_connectivity_policy {
    moid        = intersight_vnic_san_connectivity_policy.vnic_san_con_1.moid
    object_type = "vnic.SanConnectivityPolicy"
  }
  fc_network_policy {
    moid        = each.value["vsan_moid"]
    object_type = "vnic.FcNetworkPolicy"
  }
  fc_adapter_policy {
    moid        = each.value["fcadapter"]
    object_type = "vnic.FcAdapterPolicy"
  }
  fc_qos_policy {
    moid = each.value["qos_moid"]
    object_type = "vnic.FcQosPolicy"
  }
}
