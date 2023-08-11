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

variable "server_policy_prefix" {
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
variable "is_x_series_profile" {
  type        = bool
  default     = true
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
variable "power_policy" {
  type        = string
  description = "server policy"
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


# =============================================================================
# Server VLANs per Nic Adapter
# -----------------------------------------------------------------------------

variable "vnic_vlan_sets" {
  type     = map(object({
    vnic_name    = string
    native_vlan  = number
    vlan_range   = string
    switch_id    = string
    pci_order    = number
    qos_moid     = string
    adapter      = string
    failover     = string
    netgroup     = string
    netcontrol   = string
  }))
  description = "Map of vNic interfaces paired with their vlan range"
  # default = {
  #   "eth0"  = {
  #     vnic_name   = "eth0"
  #     native_vlan = 44
  #     vlan_range  = "44,50,1000-1011"
  #     switch_id   = "A"
  #     pci_order   = 0
  #     qos_moid    = <whatever>
  #     adapter     = <whatever>
  #   }
  #   "eth1"  = {
  #     vnic_name   = "eth1"
  #     native_vlan = 44
  #     vlan_range  = "44,50,1000-1011"
  #     switch_id   = "B"
  #     pci_order   =  1
  #     qos_moid    = <whatever>
  #     adapter     = <whatever>
  #   }
  # }
}
# Usage: for_each var.vnic_vlan_sets  each.value["vnic_name"]  each.value["native_vlan"]  each.value["flan_range"]

# =============================================================================
# Server VSANs per HBA Adapter
# -----------------------------------------------------------------------------

variable "vhba_vsan_sets" {
  type       = map(object({
    vhba_name      = string
    vsan_moid      = string
    switch_id      = string
    wwpn_pool_moid = string
    pci_order      = number
    qos_moid       = string
    fcadapter      = string
  }))
  description = "Map of vNic interfaces paired with their vlan range"
}
# Usage: for_each var.vhba_vsan_sets  
#                 each.value["vhba_name"]  each.value["vsan_moid"]  each.value["switch_id"]   
#                 each.value["pci_order"]  each.value["wwpn_pool_moid"] each.value["qos_moid"] each.value["fcadapter"]

