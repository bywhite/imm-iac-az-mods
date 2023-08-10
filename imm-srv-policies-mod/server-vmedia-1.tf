# =============================================================================
# vMedia Related Server Policies
#  - vMedia Policy 1
# -----------------------------------------------------------------------------

resource "intersight_vmedia_policy" "vmedia_1" {
  name          = "${var.policy_prefix}-vmedia-1"
  description   = var.description
  enabled       = true
  encryption    = true
  low_power_usb = true
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
