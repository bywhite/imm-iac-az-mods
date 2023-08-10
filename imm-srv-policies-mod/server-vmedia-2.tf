# =============================================================================
# vMedia Related Server Policies
#  - vMedia Policy 2
# -----------------------------------------------------------------------------

resource "intersight_vmedia_policy" "vmedia_2" {
  name          = "${var.policy_prefix}-vmedia-2"
  description   = var.description
  enabled       = true
  encryption    = false
  low_power_usb = true
  mappings = [{
    additional_properties   = ""
    authentication_protocol = "none"
    class_id                = "vmedia.Mapping"
    device_type             = "cdd"
    file_location           = "infra-chx.auslab.cisco.com/software/linux/ubuntu-18.04.5-server-amd64.iso"
    host_name               = "infra-chx.auslab.cisco.com"
    is_password_set         = 
    mount_options           = "RO"
    mount_protocol          = "nfs"
    object_type             = "vmedia.Mapping"
    password                = ""
    remote_file             = "ubuntu-18.04.5-server-amd64.iso"
    remote_path             = "/iso/software/linux"
    sanitized_file_location = ""
    username                = ""
    volume_name             = "IMC_DVD"
  }]
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
