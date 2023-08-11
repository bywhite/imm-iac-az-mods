# =============================================================================
#  Server Network Configuration
#  - vNic Eth Interfaces  (eth0, eth1, etc)
#  - LAN Connectivity Policy per Server Profile Template
# -----------------------------------------------------------------------------

# =============================================================================
# LAN Connectivity Policy     per Server Profile Template
# -----------------------------------------------------------------------------

resource "intersight_vnic_lan_connectivity_policy" "vnic_lan_1" {
  name                = "${var.server_policy_prefix}-lan-connectivity"
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
# vNIC Interfaces    eth0, eth1, etc
# -----------------------------------------------------------------------------
resource "intersight_vnic_eth_if" "eth_if" {
  for_each = var.vnic_vlan_sets

  name             = each.value["vnic_name"]   # was "${var.server_policy_prefix}-${each.value["vnic_name"]}"
  order            = each.value["pci_order"]   # must be unique across all vNic and vHBA
  failover_enabled = each.value["failover"]
  mac_address_type = "POOL"
  mac_pool {
    moid = var.mac_pool_moid
  }
  placement {
    id        = "MLOM"                       # MLOM is same as slot 1 Range is (1-15) and MLOM
    pci_link  = 0                            # Ignored value for all but VIC1380
    switch_id = each.value["switch_id"]
    # uplink    = 0                          #rack servers only
  }
  cdn {
    value     = each.value["vnic_name"]    # was "${var.server_policy_prefix}-${each.value["vnic_name"]}"
    nr_source = "vnic"
  }
  usnic_settings {
    cos      = 5
    nr_count = 0
  }
  vmq_settings {
    enabled             = false
    multi_queue_support = false
    num_interrupts      = 16
    num_vmqs            = 4
  }
  lan_connectivity_policy {   # Groups eth[*] interfaces together and sets FI-attached
    moid        = intersight_vnic_lan_connectivity_policy.vnic_lan_1.id
    object_type = "vnic.LanConnectivityPolicy"
  }
  eth_adapter_policy {        # Provides for adapter tuning to workload
    moid = each.value["adapter"] 
  }
  eth_qos_policy {            # Unique per eth[*] - Sets Class of Service and MTU
    # Use az-wide vNic QoS policy
    moid = each.value["qos_moid"]
    # moid = intersight_vnic_eth_qos_policy.v_eth_qos1.id

  }
  fabric_eth_network_group_policy {   # Unique per eth[*] - Sets VLAN list (2,4,7,1000-1011)
    moid = each.value["netgroup"]
  }
  fabric_eth_network_control_policy {  # Sets CDP LLDP and link down behavior 
    moid = each.value["netcontrol"]
  }
  dynamic "tags" {
    for_each = var.tags
    content {
      key   = tags.value.key
      value = tags.value.value
    }
  }
}
