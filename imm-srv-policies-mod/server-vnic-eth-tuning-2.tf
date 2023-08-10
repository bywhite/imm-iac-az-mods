# =============================================================================
# vNic Eth Adapter Policy (adapter tuning)
# -----------------------------------------------------------------------------
# this policy is actually quite complex but we are taking all the defaults
# Adapter can be tuned for VMware vs Windows Bare Metal vs other (EX: tx-offload)
resource "intersight_vnic_eth_adapter_policy" "eth_tuning_2" {
  name        = "${var.policy_prefix}-eth-tuning-2"
  description = var.description
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
