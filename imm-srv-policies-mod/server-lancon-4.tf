# =============================================================================
#  LAN Connectivity Policy 4
# -----------------------------------------------------------------------------

# =============================================================================
#  Server Network Configuration
#  - vNic Eth Interfaces  (eth0, eth1, etc)
#  - LAN Connectivity Policy per Server Profile Template
# -----------------------------------------------------------------------------

# =============================================================================
# LAN Connectivity Policy     per Server Profile Template
# -----------------------------------------------------------------------------

resource "intersight_vnic_lan_connectivity_policy" "lancon_4" {
  name                = "${var.policy_prefix}-lancon-4"
  description         = var.description
  iqn_allocation_type = "None"
  placement_mode      = "auto"
  target_platform     = "FIAttached"
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
# vNIC Interfaces added to lan connectivity policy: eth0, eth1, etc
# -----------------------------------------------------------------------------

# -----------------------------------------------------------------------------
#  eth0
# -----------------------------------------------------------------------------
resource "intersight_vnic_eth_if" "eth0-4" {
  name             = "${var.policy_prefix}-eth0-4"  #Need unique index per netcon
  order            = 0                  # must be unique across all vNic and vHBA
  failover_enabled = false
  mac_address_type = "POOL"
  mac_pool {
    moid = var.mac_pool_moid
  }
  placement {
    id        = "MLOM"                       # MLOM is same as slot 1 Range is (1-15) and MLOM
    pci_link  = 0                            # Ignored value for all but VIC1380
    switch_id = "A"
    # uplink    = 0                          #rack servers only
  }
  cdn {
    value     = "eth0"
    nr_source = "vnic"
  }
  # usnic_settings {
  #   cos      = 5
  #   nr_count = 0
  # }
  vmq_settings {
    enabled             = false
    multi_queue_support = false
    num_interrupts      = 16
    num_vmqs            = 4
  }
  lan_connectivity_policy {   # Groups eth[*] interfaces together and sets FI-attached
    moid        = intersight_vnic_lan_connectivity_policy.lancon_4.id
    object_type = "vnic.LanConnectivityPolicy"
  }
  eth_adapter_policy {        # Provides for adapter tuning to workload
    moid = intersight_vnic_eth_adapter_policy.adapter_1.id
  }
  eth_qos_policy {            # Unique per eth[*] - Sets Class of Service and MTU
    moid = intersight_vnic_eth_qos_policy.vnic_besteffort.moid

  }
  fabric_eth_network_group_policy {   # Unique per eth[*] - Sets VLAN list (2,4,7,1000-1011)
    moid = intersight_fabric_eth_network_group_policy.netgroup_1.moid
  }
  fabric_eth_network_control_policy {  # Sets CDP LLDP and link down behavior 
    moid = intersight_fabric_eth_network_control_policy.netcontrol_1.moid
  }
  dynamic "tags" {
    for_each = var.tags
    content {
      key   = tags.value.key
      value = tags.value.value
    }
  }
}


# -----------------------------------------------------------------------------
#  eth1
# -----------------------------------------------------------------------------
resource "intersight_vnic_eth_if" "eth1-4" {
  name             = "${var.policy_prefix}-eth1-4"  #Need unique index per netcon
  order            = 1                  # must be unique across all vNic and vHBA
  failover_enabled = false
  mac_address_type = "POOL"
  mac_pool {
    moid = var.mac_pool_moid
  }
  placement {
    id        = "MLOM"                       # MLOM is same as slot 1 Range is (1-15) and MLOM
    pci_link  = 0                            # Ignored value for all but VIC1380
    switch_id = "B"
    # uplink    = 0                          #rack servers only
  }
  cdn {
    value     = "eth1"
    nr_source = "vnic"
  }
  # usnic_settings {
  #   cos      = 5
  #   nr_count = 0
  # }
  vmq_settings {
    enabled             = false
    multi_queue_support = false
    num_interrupts      = 16
    num_vmqs            = 4
  }
  lan_connectivity_policy {   # Groups eth[*] interfaces together and sets FI-attached
    moid        = intersight_vnic_lan_connectivity_policy.lancon_4.id
    object_type = "vnic.LanConnectivityPolicy"
  }
  eth_adapter_policy {        # Provides for adapter tuning to workload
    moid = intersight_vnic_eth_adapter_policy.adapter_1.id
  }
  eth_qos_policy {            # Unique per eth[*] - Sets Class of Service and MTU
    moid = intersight_vnic_eth_qos_policy.vnic_besteffort.moid
  }
  fabric_eth_network_group_policy {   # Unique per eth[*] - Sets VLAN list (2,4,7,1000-1011)
    moid = intersight_fabric_eth_network_group_policy.netgroup_1.moid
  }
  fabric_eth_network_control_policy {  # Sets CDP LLDP and link down behavior 
    moid = intersight_fabric_eth_network_control_policy.netcontrol_1.moid
  }
  dynamic "tags" {
    for_each = var.tags
    content {
      key   = tags.value.key
      value = tags.value.value
    }
  }
}


# -----------------------------------------------------------------------------
#  eth2
# -----------------------------------------------------------------------------
resource "intersight_vnic_eth_if" "eth-4" {
  name             = "${var.policy_prefix}-eth2-4"  #Need unique index per netcon
  order            = 2                  # must be unique across all vNic and vHBA
  failover_enabled = false
  mac_address_type = "POOL"
  mac_pool {
    moid = var.mac_pool_moid
  }
  placement {
    id        = "MLOM"                       # MLOM is same as slot 1 Range is (1-15) and MLOM
    pci_link  = 0                            # Ignored value for all but VIC1380
    switch_id = "A"
    # uplink    = 0                          #rack servers only
  }
  cdn {
    value     = "eth2"
    nr_source = "vnic"
  }
  # usnic_settings {
  #   cos      = 5
  #   nr_count = 0
  # }
  vmq_settings {
    enabled             = false
    multi_queue_support = false
    num_interrupts      = 16
    num_vmqs            = 4
  }
  lan_connectivity_policy {   # Groups eth[*] interfaces together and sets FI-attached
    moid        = intersight_vnic_lan_connectivity_policy.lancon_4.id
    object_type = "vnic.LanConnectivityPolicy"
  }
  eth_adapter_policy {        # Provides for adapter tuning to workload
    moid = intersight_vnic_eth_adapter_policy.adapter_1.id
  }
  eth_qos_policy {            # Unique per eth[*] - Sets Class of Service and MTU
    moid = intersight_vnic_eth_qos_policy.vnic_besteffort.moid
  }
  fabric_eth_network_group_policy {   # Unique per eth[*] - Sets VLAN list (2,4,7,1000-1011)
    moid = intersight_fabric_eth_network_group_policy.netgroup_2.moid
  }
  fabric_eth_network_control_policy {  # Sets CDP LLDP and link down behavior 
    moid = intersight_fabric_eth_network_control_policy.netcontrol_1.moid
  }
  dynamic "tags" {
    for_each = var.tags
    content {
      key   = tags.value.key
      value = tags.value.value
    }
  }
}


# -----------------------------------------------------------------------------
#  eth3
# -----------------------------------------------------------------------------
resource "intersight_vnic_eth_if" "eth3-4" {
  name             = "${var.policy_prefix}-eth3-4"  #Need unique index per netcon
  order            = 3                  # must be unique across all vNic and vHBA
  failover_enabled = false
  mac_address_type = "POOL"
  mac_pool {
    moid = var.mac_pool_moid
  }
  placement {
    id        = "MLOM"                       # MLOM is same as slot 1 Range is (1-15) and MLOM
    pci_link  = 0                            # Ignored value for all but VIC1380
    switch_id = "B"
    # uplink    = 0                          #rack servers only
  }
  cdn {
    value     = "eth3"
    nr_source = "vnic"
  }
  # usnic_settings {
  #   cos      = 5
  #   nr_count = 0
  # }
  vmq_settings {
    enabled             = false
    multi_queue_support = false
    num_interrupts      = 16
    num_vmqs            = 4
  }
  lan_connectivity_policy {   # Groups eth[*] interfaces together and sets FI-attached
    moid        = intersight_vnic_lan_connectivity_policy.lancon_4.id
    object_type = "vnic.LanConnectivityPolicy"
  }
  eth_adapter_policy {        # Provides for adapter tuning to workload
    moid = intersight_vnic_eth_adapter_policy.adapter_1.id
  }
  eth_qos_policy {            # Unique per eth[*] - Sets Class of Service and MTU
    moid = intersight_vnic_eth_qos_policy.vnic_besteffort.moid
  }
  fabric_eth_network_group_policy {   # Unique per eth[*] - Sets VLAN list (2,4,7,1000-1011)
    moid = intersight_fabric_eth_network_group_policy.netgroup_2.moid
  }
  fabric_eth_network_control_policy {  # Sets CDP LLDP and link down behavior 
    moid = intersight_fabric_eth_network_control_policy.netcontrol_1.moid
  }
  dynamic "tags" {
    for_each = var.tags
    content {
      key   = tags.value.key
      value = tags.value.value
    }
  }
}
