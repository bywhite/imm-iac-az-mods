# =============================================================================
# External references
# -----------------------------------------------------------------------------

variable "organization" {
  type        = string
  description = "moid for organization in which to create the policies"
}


# =============================================================================
# Naming and tagging
# -----------------------------------------------------------------------------

variable "policy_prefix" {
  type        = string
  description = "prefix for all servers and server template created"
  default     = "az"
}
variable "description" {
  type        = string
  description = "Common Server az Policy"
  default     = "Created bt Terraform"
}
variable "tags" {
  type        = list(map(string))
  description = "user tags to be applied to all policies"
  default     = []
}

# =============================================================================
# Server VLANs per Nic Adapter
# -----------------------------------------------------------------------------

variable "vlan_groups" {
  type       = map(object({
    net_group_name    = string
    native_vlan       = number
    vlan_range        = string
  }))
  description = "Map of vNic interfaces paired with their vlan range"
  default = {
    "esx7u3_v1"  = {
      net_group_name   = "vlan-group-01"
      native_vlan = 44
      vlan_range  = "44,50,1000-1011"
    }
    "winsrv2022_v1"  = {
      net_group_name   = "vlan-group-02"
      native_vlan = 44
      vlan_range  = "44,50,1000-1011"
    }
  }
}
# Usage: for_each var.vlan_groups  each.value["net_group_name"]  each.value["native_vlan"]  each.value["vlan_range"]

# =============================================================================
# IMC Access (intersight_access_policy)
# -----------------------------------------------------------------------------

variable "imc_access_vlan" {
  type        = number
  description = "ID of VLAN for IMC access"
}

# =============================================================================
# az Pools used by server template
# -----------------------------------------------------------------------------

variable "mac_pool_moid" {
  type         = string
  description = "MAC Pool MOID"
} 
variable "imc_ip_pool_moid" {
  type = string
  description = "moid of IP_Pool to be assigned to IMC Access Policy"
}
variable "wwnn_pool_moid" {
  type = string
  description = "moid of WWNN Pool"
}
variable "wwpn_pool_a_moid" {
  type = string
  description = "moid of WWPN A fabric Pool"
}
variable "wwpn_pool_b_moid" {
  type = string
  description = "moid of WWPN B fabric Pool"
}
variable "server_uuid_pool_moid" {
  type = string
  description = "moid of UUID Pool"
}
variable "server_uuid_pool_name" {
  type = string
  description = "name of UUID Pool"
}

# =============================================================================
# SNMP (intersight_snmp_policy)
# -----------------------------------------------------------------------------

variable "snmp_password" {
  type        = string
  default     = "C1sc0123!"
}
variable "snmp_ip"  {
  type        = string
  default     = "10.10.10.10"
}

# =============================================================================
# Syslog (intersight_syslog_policy)
# -----------------------------------------------------------------------------

variable "syslog_remote_host"  {
  type        = string
  default     = "10.10.10.10"
}

