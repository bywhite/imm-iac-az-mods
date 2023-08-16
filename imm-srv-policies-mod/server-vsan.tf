

resource "intersight_vnic_fc_network_policy" "vsan_100" {
  name                = "${var.policy_prefix}-vsan-100"
  description         = var.description
  vsan_settings {
    id          = 100
    object_type = "vnic.VsanSettings"
  }
  organization {
    object_type = "organization.Organization"
    moid        = var.organization
  }
}

resource "intersight_vnic_fc_network_policy" "vsan_101" {
  name                = "${var.policy_prefix}-vsan-101"
  description         = var.description
  vsan_settings {
    id          = 101
    object_type = "vnic.VsanSettings"
  }
  organization {
    object_type = "organization.Organization"
    moid        = var.organization
  }
}

resource "intersight_vnic_fc_network_policy" "vsan_102" {
  name                = "${var.policy_prefix}-vsan-102"
  description         = var.description
  vsan_settings {
    id          = 102
    object_type = "vnic.VsanSettings"
  }
  organization {
    object_type = "organization.Organization"
    moid        = var.organization
  }
}

resource "intersight_vnic_fc_network_policy" "vsan_200" {
  name                = "${var.policy_prefix}-vsan-200"
  description         = var.description
  vsan_settings {
    id          = 200
    object_type = "vnic.VsanSettings"
  }
  organization {
    object_type = "organization.Organization"
    moid        = var.organization
  }
}

resource "intersight_vnic_fc_network_policy" "vsan_201" {
  name                = "${var.policy_prefix}-vsan-201"
  description         = var.description
  vsan_settings {
    id          = 201
    object_type = "vnic.VsanSettings"
  }
  organization {
    object_type = "organization.Organization"
    moid        = var.organization
  }
}

resource "intersight_vnic_fc_network_policy" "vsan_202" {
  name                = "${var.policy_prefix}-vsan-202"
  description         = var.description
  vsan_settings {
    id          = 202
    object_type = "vnic.VsanSettings"
  }
  organization {
    object_type = "organization.Organization"
    moid        = var.organization
  }
}
