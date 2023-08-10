# =============================================================================
# vMedia Related Server Policies
#  - KVM Policy 1
# -----------------------------------------------------------------------------

# =============================================================================
# KVM Policy
# -----------------------------------------------------------------------------
resource "intersight_kvm_policy" "kvm_1" {
  name                      = "${var.policy_prefix}-kvm-1"
  description               = var.description
  enable_local_server_video = true
  enable_video_encryption   = true
  enabled                   = true
  maximum_sessions          = 4
  organization {
    moid = var.organization
  }
  #attached under policy template policy bucket
  remote_port = 2068
  dynamic "tags" {
    for_each = var.tags
    content {
      key   = tags.value.key
      value = tags.value.value
    }
  }
}

