# =============================================================================
#  Server Storage Policies
# -----------------------------------------------------------------------------

resource "intersight_storage_storage_policy" "stor_2" {
  name                     = "${var.policy_prefix}-stor-2"
  description              = var.description
  m2_virtual_drive {
    enable      = false
    controller_slot = "MSTOR-RAID-1"
    object_type = "storage.M2VirtualDriveConfig"
  }
  use_jbod_for_vd_creation = false
  unused_disks_state       = "NoChange"
  organization {
    object_type = "organization.Organization"
    moid        = var.organization
  }
  
}
