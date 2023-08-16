# =============================================================================
# The purpose of this module is to create a Server Profile Template
# Server Profiles must be derived elsewhere - GUI, Ansible, API, PowerShell
#  As profiles are created, they will consume physical servers from pool
# -----------------------------------------------------------------------------

# =============================================================================
# Server Profile template
# -----------------------------------------------------------------------------

resource "intersight_server_profile_template" "server_template_1" {
  description     = var.description
  name            = var.server_template_name
  action          = "No-op"
  target_platform = "FIAttached"

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

  uuid_address_type = "POOL"
  uuid_pool {
      moid        = var.server_uuid_pool_moid
      object_type = "uuidpool.Pool"
    }

  # policies are assigned to the template via input variables contining policy moids
  policy_bucket {
    moid = var.access_policy
    object_type = "access.Policy"
  }
  policy_bucket {
    moid = var.bios_policy
    object_type = "bios.Policy"
  }
  policy_bucket {
    moid        = var.boot_policy
    object_type = "boot.PrecisionPolicy"
  }
# policy_bucket {
#    moid        = var.ipmi_policy == "none" ? "" : var.ipmi_policy
#    object_type = var.ipmi_policy == "none" ? "" : "ipmioverlan.Policy"
#  }
  policy_bucket {
   moid        = var.ipmi_policy
   object_type = "ipmioverlan.Policy"
  }
policy_bucket {
    moid = var.kvm_policy
    object_type = "kvm.Policy"
  }
#   # policy_bucket {
#   #   moid        = var.is_x_series_profile == true ? var.power_policy : ""
#   #   object_type = var.is_x_series_profile == true ? "power.Policy" : ""
#   # }
  policy_bucket {
    moid        = var.snmp_policy
    object_type = "snmp.Policy"
  }
  policy_bucket {
   moid        = var.sol_policy
   object_type = "sol.Policy"
  }
  policy_bucket {
   moid        = var.stor_policy
   object_type = "storage.StoragePolicy"
  }
  policy_bucket {
    moid        = var.syslog_policy
    object_type = "syslog.Policy"
  }
  policy_bucket {
    moid        = var.vmedia_policy
    object_type = "vmedia.Policy"
  }
  policy_bucket {
    moid        = var.user_policy
    object_type = "iam.EndPointUserPolicy"
  }
  policy_bucket {
    moid = var.lancon_policy
    object_type = "vnic.LanConnectivityPolicy"
  }
  policy_bucket {
    moid        = var.sancon_policy
    object_type = "vnic.SanConnectivityPolicy"
  }

}
