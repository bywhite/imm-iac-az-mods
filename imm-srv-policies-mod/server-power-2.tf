# =============================================================================
# Power Related Server Policies
#  - Power Policy
# -----------------------------------------------------------------------------

# =============================================================================
# Server Power Policy
# -----------------------------------------------------------------------------
resource "intersight_power_policy" "power_2" {
  name        = "${var.policy_prefix}-power-2"
  description              = var.description
  power_priority = "Medium"
  power_profiling = "Enabled"
  power_restore_state = "AlwaysOff"
  organization {
    moid        = var.organization
    object_type = "organization.Organization"
  }
  dynamic "tags" {
    for_each = var.tags
    content {
      key   = tags.value.key
      value = tags.value.value
    }
  }

}

