# =============================================================================
#  LAN Connectivity Policy 1
# -----------------------------------------------------------------------------

# =============================================================================
#  Server Network Configuration
#  - vNic Eth Interfaces  (eth0, eth1, etc)
#  - LAN Connectivity Policy per Server Profile Template
# -----------------------------------------------------------------------------

# =============================================================================
# LAN Connectivity Policy     per Server Profile Template
# -----------------------------------------------------------------------------

resource "intersight_vnic_lan_connectivity_policy" "lancon_1" {
  name                = "${var.policy_prefix}-lancon-1"
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
resource "intersight_vnic_eth_if" "eth0_1" {
  name             = "eth0"      #"${var.policy_prefix}-eth0-1"  #Need unique index per netcon
  order            = 0                  # must be unique across all vNic and vHBA
  failover_enabled = true
  mac_address_type = "POOL"
  mac_pool {
    moid = var.mac_pool_moid
  }
  placement {
    # auto_pci_link = true                   # Only applies to 13xx series VICs
    # auto_slot_id  = true                   # vNics applied to first VIC automatically if enabled
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
    moid        = intersight_vnic_lan_connectivity_policy.lancon_1.id
    object_type = "vnic.LanConnectivityPolicy"
  }
  eth_adapter_policy {        # Provides for adapter tuning to workload
    moid = intersight_vnic_eth_adapter_policy.adapter_1.id
  }
  eth_qos_policy {            # Unique per eth[*] - Sets Class of Service and MTU
    # Use az-wide vNic QoS policy
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
