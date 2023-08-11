# =============================================================================
#  Server Storage Policies
# -----------------------------------------------------------------------------

resource "intersight_storage_storage_policy" "stor_3" {
  name                     = "${var.policy_prefix}-stor-3"
  description              = var.description
  m2_virtual_drive {
    enable      = false
    object_type = "storage.M2VirtualDriveConfig"
  }
  use_jbod_for_vd_creation = true
  unused_disks_state       = "Jbod"
  organization {
    object_type = "organization.Organization"
    moid        = var.organization
  }
  
}
