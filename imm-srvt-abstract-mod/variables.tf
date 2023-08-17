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

variable "server_template_name" {
  type        = string
  description = "prefix for all servers and server template created"
  #default     = "tf-server"
}
variable "description" {
  type        = string
  description = "description field for all policies"
  default     = "Created bt Terraform"
}
variable "tags" {
  type        = list(map(string))
  description = "user tags to be applied to all policies"
  default     = []
}

# =============================================================================
# Special policy considerations
# -----------------------------------------------------------------------------
variable "is_x_series_profile" {
  type = bool
  description = "Is this an X-Series Server?  If so, extra policies apply."
  default = true
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

# =============================================================================
# az server policies used by server template policy buckets
# -----------------------------------------------------------------------------

variable "access_policy" {
  type        = string
  description = "server policy"
}
variable "bios_policy" {
  type        = string
  description = "server policy"
}
variable "boot_policy" {
  type        = string
  description = "server policy"
}
variable "ipmi_policy" {
  type        = string
  description = "server policy"
  default     = "none"
}
variable "kvm_policy" {
  type        = string
  description = "server policy"
}
variable "lancon_policy" {
  type        = string
  default     = "server policy"
}
variable "power_policy" {
  type        = string
  description = "server policy"
}
variable "sancon_policy" {
  type        = string
  default     = "server policy"
}
variable "snmp_policy" {
  type        = string
  description = "server policy"
}
variable "sol_policy" {
  type        = string
  description = "server policy"
}
variable "stor_policy" {
  type        = string
  description = "server policy"
}
variable "syslog_policy" {
  type        = string
  description = "server policy"
}
variable "vmedia_policy" {
  type        = string
  description = "server policy"
}
# Provided by imm-imc-user-mod
variable "user_policy" {
  type        = string
  description = "Sets local IMC user ID's, passwords and policies"
}
