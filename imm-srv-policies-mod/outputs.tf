# =============================================================================
# Server Module Outputs
# -----------------------------------------------------------------------------


output "access_policy_map" {
    description = "List of policies" 
    value = {
      "access-1" = intersight_access_policy.access_1.moid
      "access-2" = intersight_access_policy.access_2.moid
    }
  }

output "bios_policy_map" {
    description = "List of policies"
    value = {
      "bios-1" = intersight_bios_policy.bios_1.moid
      "bios-2" = intersight_bios_policy.bios_2.moid
    }
  }

output "boot_policy_map" {
    description = "List of policies" 
    value = {
      "boot-1" = intersight_boot_precision_policy.boot_1.moid
      "boot-2" = intersight_boot_precision_policy.boot_2.moid
    }
  }

output "ipmi_policy_map" {
    description = "List of policies" 
    value = {
      "ipmi-1" = intersight_ipmioverlan_policy.ipmi_1.moid
    }
  }

output "kvm_policy_map" {
    description = "List of policies" 
    value = {
      "kvm-1" = intersight_kvm_policy.kvm_1.moid
    }
  }

output "netcontrol_policy_map" {
    description = "List of policies" 
    value = {
      "netcontrol-1" = intersight_fabric_eth_network_control_policy.netcontrol_1.moid
    }
  }

output "netgroup_policy_map" {
    description = "List of policies" 
    value = {
      "netgroup-1" = intersight_fabric_eth_network_group_policy.netgroup_1.moid
      "netgroup-2" = intersight_fabric_eth_network_group_policy.netgroup_2.moid
    }
  }

output "power_policy_map" {
    description = "List of policies" 
    value = {
      "power-1" = intersight_power_policy.power_1.moid
      "power-2" = intersight_power_policy.power_2.moid
      "power-3" = intersight_power_policy.power_3.moid
    }
  }

output "snmp_policy_map" {
    description = "List of policies" 
    value = {
      "snmp-1" = intersight_snmp_policy.snmp_1.moid
    }
  }

output "sol_policy_map" {
    description = "List of policies" 
    value = {
      "sol-1" = intersight_sol_policy.sol_1.moid
    }
  }

output "stor_policy_map" {
    description = "List of policies" 
    value = {
      "stor-1" = intersight_storage_storage_policy.stor_1.moid
      "stor-2" = intersight_storage_storage_policy.stor_2.moid
    }
  }

output "syslog_policy_map" {
    description = "List of policies" 
    value = {
      "syslog-1" = intersight_syslog_policy.syslog_1.moid
    }
  }

output "vmedia_policy_map" {
    description = "List of policies" 
    value = {
      "vmedia-1" = intersight_vmedia_policy.vmedia_1.moid
    }
  }

output "adapter_policy_map" {
    description = "List of policies" 
    value = {
      "adapter-1" = intersight_vnic_eth_adapter_policy.adapter_1.moid
      "adapter-2" = intersight_vnic_eth_adapter_policy.adapter_2.moid
    }
  }

output "fcadapter_policy_map" {
    description = "List of policies" 
    value = {
      "fcadapter-1" = intersight_vnic_fc_adapter_policy.fcadapter_1.moid
      "fcadapter-2" = intersight_vnic_fc_adapter_policy.fcadapter_2.moid
    }
  }



