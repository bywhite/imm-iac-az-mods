# =============================================================================
#  This Module Creates Server QoS Related  Policies
#  - BestEffort QoS Policy
#  - Bronze QoS Policy
#  - Silver QoS Policy
#  - Gold QoS Policy
#  - Plantinum QoS Policy (Disabled)
#  - FC QoS Policy
# Each Domain Cluster creates its own Fabric System QoS Policy (CoS)
#   This is a policy bucket limitation of the Cluster Profile
# -----------------------------------------------------------------------------

# =============================================================================
# vNic QoS Policies for each class of service
# -----------------------------------------------------------------------------
resource "intersight_vnic_eth_qos_policy" "vnic_besteffort" {
  name           = "${var.policy_prefix}-vnic-besteffort"
  description    = "az QoS policy Best-Effort"
  mtu            = 1500
  rate_limit     = 0
  cos            = 0
  burst          = 1024
  priority       = "Best Effort"
  trust_host_cos = false
  organization {
    moid = var.organization
  }
}

resource "intersight_vnic_eth_qos_policy" "vnic_bronze" {
  name           = "${var.policy_prefix}-vnic-bronze"
  description    = "az QoS policy Bronze"
  mtu            = 1500
  rate_limit     = 0
  cos            = 1
  burst          = 1024
  priority       = "Bronze"
  trust_host_cos = false
  organization {
    moid = var.organization
  }
}

resource "intersight_vnic_eth_qos_policy" "vnic_silver" {
  name           = "${var.policy_prefix}-vnic-silver"
  description    = "az QoS policy Silver"
  mtu            = 9000       # Max value 9000
  rate_limit     = 0
  cos            = 2
  burst          = 1024
  priority       = "Silver"
  trust_host_cos = false
  organization {
    moid = var.organization
  }
}

resource "intersight_vnic_eth_qos_policy" "vnic_gold" {
  name           = "${var.policy_prefix}-vnic-gold"
  description    = "az QoS policy Gold"
  mtu            = 9000       # Max value 9000
  rate_limit     = 0
  cos            = 4
  burst          = 1024
  priority       = "Gold"
  trust_host_cos = false
  organization {
    moid = var.organization
  }
}

# Un-Comment and Enable when added to CoS above
# resource "intersight_vnic_eth_qos_policy" "vnic_platinum" {
#   name           = "${var.policy_prefix}-vnic-platinum"
#   description    = "az QoS policy Platinum"
#   mtu            = 9000       # Max value 9000
#   rate_limit     = 0
#   cos            = 5
#   burst          = 1024
#   priority       = "Platinum"
#   trust_host_cos = false
#   organization {
#     moid = var.organization
#   }
# }


resource "intersight_vnic_fc_qos_policy" "vnic_fc" {
  name                = "${var.policy_prefix}-vnic-fc"
  description         = "az QoS policy for FC"
  burst               = 10240
  rate_limit          = 0
  cos                 = 3
  max_data_field_size = 2112
  organization {
    object_type = "organization.Organization"
    moid        = var.organization
  }
}
