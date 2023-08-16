# =============================================================================
#  SAN Connectivity Policy 1
# Can only be used with a 4 Eth Port Config
# -----------------------------------------------------------------------------

# =============================================================================
#  Server Network Configuration
#  - vNic FC Interfaces  (fc0, fc1, etc)
#  - Shared SAN Connectivity Policy
# -----------------------------------------------------------------------------


# =============================================================================
# SAN Connectivity Policy
# -----------------------------------------------------------------------------
resource "intersight_vnic_san_connectivity_policy" "sancon_2" {
  name                = "${var.policy_prefix}-sancon-2"
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
resource "intersight_vnic_fc_if" "fc_if_fc0" { 
  name            = "fc0"
  order           = 4  # PCI Link order must be unique across all vNic's and vHBA's
                      # Can only be used with a 4 Eth Port Config
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
    moid        = intersight_vnic_san_connectivity_policy.sancon_2.moid
    object_type = "vnic.SanConnectivityPolicy"
  }
  fc_network_policy {
    moid        = intersight_vnic_fc_network_policy.vsan_101.moid
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

# -----------------------------------------------------------------------------
#  fc1
# -----------------------------------------------------------------------------
resource "intersight_vnic_fc_if" "fc_if_fc1" { 
  name            = "fc1"
  order           = 5  # PCI Link order must be unique across all vNic's and vHBA's
  placement {
    id            = "1"
    auto_slot_id  = false
    pci_link      = 0
    auto_pci_link = false
    uplink        = 0
    switch_id     = "B"
    object_type   = "vnic.PlacementSettings"
  }
  persistent_bindings = true
  wwpn_address_type   = "POOL"
  wwpn_pool {
    moid        = var.wwpn_pool_a_moid
    object_type = "fcpool.Pool"
  }
  san_connectivity_policy {
    moid        = intersight_vnic_san_connectivity_policy.sancon_2.moid
    object_type = "vnic.SanConnectivityPolicy"
  }
  fc_network_policy {
    moid        = intersight_vnic_fc_network_policy.vsan_201.moid
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

# -----------------------------------------------------------------------------
#  fc2
# -----------------------------------------------------------------------------
resource "intersight_vnic_fc_if" "fc_if_fc2" { 
  name            = "fc2"
  order           = 6  # PCI Link order must be unique across all vNic's and vHBA's
                      # Can only be used with a 4 Eth Port Config
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
    moid        = intersight_vnic_san_connectivity_policy.sancon_2.moid
    object_type = "vnic.SanConnectivityPolicy"
  }
  fc_network_policy {
    moid        = intersight_vnic_fc_network_policy.vsan_102.moid
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

# -----------------------------------------------------------------------------
#  fc3
# -----------------------------------------------------------------------------
resource "intersight_vnic_fc_if" "fc_if_fc3" { 
  name            = "fc3"
  order           = 7  # PCI Link order must be unique across all vNic's and vHBA's
  placement {
    id            = "1"
    auto_slot_id  = false
    pci_link      = 0
    auto_pci_link = false
    uplink        = 0
    switch_id     = "B"
    object_type   = "vnic.PlacementSettings"
  }
  persistent_bindings = true
  wwpn_address_type   = "POOL"
  wwpn_pool {
    moid        = var.wwpn_pool_a_moid
    object_type = "fcpool.Pool"
  }
  san_connectivity_policy {
    moid        = intersight_vnic_san_connectivity_policy.sancon_2.moid
    object_type = "vnic.SanConnectivityPolicy"
  }
  fc_network_policy {
    moid        = intersight_vnic_fc_network_policy.vsan_202.moid
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
