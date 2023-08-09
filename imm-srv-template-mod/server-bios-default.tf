# =============================================================================
# Server BIOS Policies for FI-Attached server template
# -----------------------------------------------------------------------------
# Reference: https://registry.terraform.io/providers/CiscoDevNet/Intersight/latest/docs/resources/bios_policy

resource "intersight_bios_policy" "bios_default_policy" {
  count = (var.spt_type == "vmw1") ? 1 : 0

  name        = "${var.server_policy_prefix}-bios-default-policy"
  description = var.description
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
  
  acs_control_gpu1state                 = "platform-default"
  acs_control_gpu2state                 = "platform-default"
  acs_control_gpu3state                 = "platform-default"
  acs_control_gpu4state                 = "platform-default"
  acs_control_gpu5state                 = "platform-default"
  acs_control_gpu6state                 = "platform-default"
  acs_control_gpu7state                 = "platform-default"
  acs_control_gpu8state                 = "platform-default"
  acs_control_slot11state               = "platform-default"
  acs_control_slot12state               = "platform-default"
  acs_control_slot13state               = "platform-default"
  acs_control_slot14state               = "platform-default"
  adjacent_cache_line_prefetch          = "platform-default"
  advanced_mem_test                     = "platform-default"
  all_usb_devices                       = "platform-default"
  altitude                              = "platform-default"
  aspm_support                          = "platform-default"
  assert_nmi_on_perr                    = "platform-default"
  assert_nmi_on_serr                    = "platform-default"
  auto_cc_state                         = "platform-default"
  autonumous_cstate_enable              = "platform-default"
  baud_rate                             = "platform-default"
  bme_dma_mitigation                    = "platform-default"
  boot_option_num_retry                 = "platform-default"
  boot_option_re_cool_down              = "platform-default"
  boot_option_retry                     = "platform-default"
  boot_performance_mode                 = "platform-default"
  burst_and_postponed_refresh           = "platform-default"
  c1auto_demotion                       = "platform-default"
  c1auto_un_demotion                    = "platform-default"
  cbs_cmn_apbdis                        = "platform-default"
  cbs_cmn_cpu_cpb                       = "platform-default"
  cbs_cmn_cpu_gen_downcore_ctrl         = "platform-default"
  cbs_cmn_cpu_global_cstate_ctrl        = "platform-default"
  cbs_cmn_cpu_l1stream_hw_prefetcher    = "platform-default"
  cbs_cmn_cpu_l2stream_hw_prefetcher    = "platform-default"
  cbs_cmn_cpu_smee                      = "platform-default"
  cbs_cmn_cpu_streaming_stores_ctrl     = "platform-default"
  cbs_cmn_determinism_slider            = "platform-default"
  cbs_cmn_efficiency_mode_en            = "platform-default"
  cbs_cmn_fixed_soc_pstate              = "platform-default"
  cbs_cmn_gnb_nb_iommu                  = "platform-default"
  cbs_cmn_gnb_smu_df_cstates            = "platform-default"
  cbs_cmn_gnb_smucppc                   = "platform-default"
  cbs_cmn_mem_ctrl_bank_group_swap_ddr4 = "platform-default"
  cbs_cmn_mem_map_bank_interleave_ddr4  = "platform-default"
  cbs_cmnc_tdp_ctl                      = "platform-default"
  cbs_cpu_ccd_ctrl_ssp                  = "platform-default"
  cbs_cpu_core_ctrl                     = "platform-default"
  cbs_cpu_smt_ctrl                      = "platform-default"
  cbs_dbg_cpu_snp_mem_cover             = "platform-default"
  cbs_dbg_cpu_snp_mem_size_cover        = "platform-default"
  cbs_df_cmn_acpi_srat_l3numa           = "platform-default"
  cbs_df_cmn_dram_nps                   = "platform-default"
  cbs_df_cmn_mem_intlv                  = "platform-default"
  cbs_df_cmn_mem_intlv_size             = "platform-default"
  cbs_sev_snp_support                   = "platform-default"
  cdn_enable                            = "platform-default"
  cdn_support                           = "platform-default"
  channel_inter_leave                   = "platform-default"
  cisco_adaptive_mem_training           = "platform-default"
  cisco_debug_level                     = "platform-default"
  cisco_oprom_launch_optimization       = "platform-default"
  cisco_xgmi_max_speed                  = "platform-default"
  cke_low_policy                        = "platform-default"
  closed_loop_therm_throtl              = "platform-default"
  cmci_enable                           = "platform-default"
  config_tdp                            = "platform-default"
  config_tdp_level                      = "platform-default"
  console_redirection                   = "platform-default"
  core_multi_processing                 = "platform-default"
  cpu_energy_performance                = "platform-default"
  cpu_frequency_floor                   = "platform-default"
  cpu_performance                       = "platform-default"
  cpu_perf_enhancement                  = "platform-default"
  cpu_power_management                  = "platform-default"
  cr_qos                                = "platform-default"
  crfastgo_config                       = "platform-default"
  dcpmm_firmware_downgrade              = "platform-default"
  demand_scrub                          = "platform-default"
  direct_cache_access                   = "platform-default"
  dram_clock_throttling                 = "platform-default"
  dram_refresh_rate                     = "platform-default"
  dram_sw_thermal_throttling            = "platform-default"
  eadr_support                          = "platform-default"
  edpc_en                               = "platform-default"
  enable_clock_spread_spec              = "platform-default"
  enable_mktme                          = "platform-default"
  enable_sgx                            = "platform-default"
  enable_tme                            = "platform-default"
  energy_efficient_turbo                = "platform-default"
  eng_perf_tuning                       = "platform-default"
  enhanced_intel_speed_step_tech        = "platform-default"
  epoch_update                          = "platform-default"
  epp_enable                            = "platform-default"
  epp_profile                           = "platform-default"
  execute_disable_bit                   = "platform-default"
  extended_apic                         = "platform-default"
  flow_control                          = "platform-default"
  frb2enable                            = "platform-default"
  hardware_prefetch                     = "platform-default"
  hwpm_enable                           = "platform-default"
  imc_interleave                        = "platform-default"
  intel_dynamic_speed_select            = "platform-default"
  intel_hyper_threading_tech            = "platform-default"
  intel_speed_select                    = "platform-default"
  intel_turbo_boost_tech                = "platform-default"
  intel_virtualization_technology       = "platform-default"
  intel_vt_for_directed_io              = "platform-default"
  intel_vtd_coherency_support           = "platform-default"
  intel_vtd_interrupt_remapping         = "platform-default"
  intel_vtd_pass_through_dma_support    = "platform-default"
  intel_vtdats_support                  = "platform-default"
  ioh_error_enable                      = "platform-default"
  ioh_resource                          = "platform-default"
  ip_prefetch                           = "platform-default"
  ipv4http                              = "platform-default"
  ipv4pxe                               = "platform-default"
  ipv6http                              = "platform-default"
  ipv6pxe                               = "platform-default"
  kti_prefetch                          = "platform-default"
  legacy_os_redirection                 = "platform-default"
  legacy_usb_support                    = "platform-default"
  llc_alloc                             = "platform-default"
  llc_prefetch                          = "platform-default"
  lom_port0state                        = "platform-default"
  lom_port1state                        = "platform-default"
  lom_port2state                        = "platform-default"
  lom_port3state                        = "platform-default"
  lom_ports_all_state                   = "platform-default"
  lv_ddr_mode                           = "platform-default"
  make_device_non_bootable              = "platform-default"
  memory_bandwidth_boost                = "platform-default"
  memory_inter_leave                    = "platform-default"
  memory_mapped_io_above4gb             = "platform-default"
  memory_refresh_rate                   = "platform-default"
  memory_size_limit                     = "platform-default"
  memory_thermal_throttling             = "platform-default"
  mirroring_mode                        = "platform-default"
  mmcfg_base                            = "platform-default"
  network_stack                         = "platform-default"
  numa_optimized                        = "platform-default"
  nvmdimm_perform_config                = "platform-default"
  onboard_gbit_lom                      = "platform-default"
  onboard_scu_storage_support           = "platform-default"
  onboard_scu_storage_sw_stack          = "platform-default"
  onboard10gbit_lom                     = "platform-default"
  operation_mode                        = "platform-default"
  os_boot_watchdog_timer                = "platform-default"
  os_boot_watchdog_timer_policy         = "platform-default"
  os_boot_watchdog_timer_timeout        = "platform-default"
  out_of_band_mgmt_port                 = "platform-default"
  package_cstate_limit                  = "platform-default"
  panic_high_watermark                  = "platform-default"
  partial_cache_line_sparing            = "platform-default"
  partial_mirror_mode_config            = "platform-default"
  partial_mirror_percent                = "platform-default"
  partial_mirror_value1                 = "platform-default"
  partial_mirror_value2                 = "platform-default"
  partial_mirror_value3                 = "platform-default"
  partial_mirror_value4                 = "platform-default"
  patrol_scrub                          = "platform-default"
  patrol_scrub_duration                 = "platform-default"
  pc_ie_ras_support                     = "platform-default"
  pc_ie_ssd_hot_plug_support            = "platform-default"
  pch_usb30mode                         = "platform-default"
  pci_option_ro_ms                      = "platform-default"
  pci_rom_clp                           = "platform-default"
  pcie_ari_support                      = "platform-default"
  pcie_pll_ssc                          = "platform-default"
  pcie_slot_mraid1link_speed            = "platform-default"
  pcie_slot_mraid1option_rom            = "platform-default"
  pcie_slot_mraid2link_speed            = "platform-default"
  pcie_slot_mraid2option_rom            = "platform-default"
  pcie_slot_mstorraid_link_speed        = "platform-default"
  pcie_slot_mstorraid_option_rom        = "platform-default"
  pcie_slot_nvme1link_speed             = "platform-default"
  pcie_slot_nvme1option_rom             = "platform-default"
  pcie_slot_nvme2link_speed             = "platform-default"
  pcie_slot_nvme2option_rom             = "platform-default"
  pcie_slot_nvme3link_speed             = "platform-default"
  pcie_slot_nvme3option_rom             = "platform-default"
  pcie_slot_nvme4link_speed             = "platform-default"
  pcie_slot_nvme4option_rom             = "platform-default"
  pcie_slot_nvme5link_speed             = "platform-default"
  pcie_slot_nvme5option_rom             = "platform-default"
  pcie_slot_nvme6link_speed             = "platform-default"
  pcie_slot_nvme6option_rom             = "platform-default"
  pcie_slots_cdn_enable                 = "platform-default"
  pop_support                           = "platform-default"
  post_error_pause                      = "platform-default"
  post_package_repair                   = "platform-default"
  processor_c1e                         = "platform-default"
  processor_c3report                    = "platform-default"
  processor_c6report                    = "platform-default"
  processor_cstate                      = "platform-default"
  psata                                 = "platform-default"
  pstate_coord_type                     = "platform-default"
  putty_key_pad                         = "platform-default"
  pwr_perf_tuning                       = "platform-default"
  qpi_link_frequency                    = "platform-default"
  qpi_link_speed                        = "platform-default"
  qpi_snoop_mode                        = "platform-default"
  rank_inter_leave                      = "platform-default"
  redirection_after_post                = "platform-default"
  sata_mode_select                      = "platform-default"
  select_memory_ras_configuration       = "platform-default"
  select_ppr_type                       = "platform-default"
  serial_port_aenable                   = "platform-default"
  sev                                   = "platform-default"
  sgx_auto_registration_agent           = "platform-default"
  sgx_epoch0                            = "platform-default"
  sgx_epoch1                            = "platform-default"
  sgx_factory_reset                     = "platform-default"
  sgx_le_pub_key_hash0                  = "platform-default"
  sgx_le_pub_key_hash1                  = "platform-default"
  sgx_le_pub_key_hash2                  = "platform-default"
  sgx_le_pub_key_hash3                  = "platform-default"
  sgx_le_wr                             = "platform-default"
  sgx_package_info_in_band_access       = "platform-default"
  sgx_qos                               = "platform-default"
  sha1pcr_bank                          = "platform-default"
  sha256pcr_bank                        = "platform-default"
  single_pctl_enable                    = "platform-default"
  slot_flom_link_speed                  = "platform-default"
  slot_front_nvme10link_speed           = "platform-default"
  slot_front_nvme10option_rom           = "platform-default"
  slot_front_nvme11link_speed           = "platform-default"
  slot_front_nvme11option_rom           = "platform-default"
  slot_front_nvme12link_speed           = "platform-default"
  slot_front_nvme12option_rom           = "platform-default"
  slot_front_nvme13option_rom           = "platform-default"
  slot_front_nvme14option_rom           = "platform-default"
  slot_front_nvme15option_rom           = "platform-default"
  slot_front_nvme16option_rom           = "platform-default"
  slot_front_nvme17option_rom           = "platform-default"
  slot_front_nvme18option_rom           = "platform-default"
  slot_front_nvme19option_rom           = "platform-default"
  slot_front_nvme1link_speed            = "platform-default"
  slot_front_nvme1option_rom            = "platform-default"
  slot_front_nvme20option_rom           = "platform-default"
  slot_front_nvme21option_rom           = "platform-default"
  slot_front_nvme22option_rom           = "platform-default"
  slot_front_nvme23option_rom           = "platform-default"
  slot_front_nvme24option_rom           = "platform-default"
  slot_front_nvme2link_speed            = "platform-default"
  slot_front_nvme2option_rom            = "platform-default"
  slot_front_nvme3link_speed            = "platform-default"
  slot_front_nvme3option_rom            = "platform-default"
  slot_front_nvme4link_speed            = "platform-default"
  slot_front_nvme4option_rom            = "platform-default"
  slot_front_nvme5link_speed            = "platform-default"
  slot_front_nvme5option_rom            = "platform-default"
  slot_front_nvme6link_speed            = "platform-default"
  slot_front_nvme6option_rom            = "platform-default"
  slot_front_nvme7link_speed            = "platform-default"
  slot_front_nvme7option_rom            = "platform-default"
  slot_front_nvme8link_speed            = "platform-default"
  slot_front_nvme8option_rom            = "platform-default"
  slot_front_nvme9link_speed            = "platform-default"
  slot_front_nvme9option_rom            = "platform-default"
  slot_front_slot5link_speed            = "platform-default"
  slot_front_slot6link_speed            = "platform-default"
  slot_gpu1state                        = "platform-default"
  slot_gpu2state                        = "platform-default"
  slot_gpu3state                        = "platform-default"
  slot_gpu4state                        = "platform-default"
  slot_gpu5state                        = "platform-default"
  slot_gpu6state                        = "platform-default"
  slot_gpu7state                        = "platform-default"
  slot_gpu8state                        = "platform-default"
  slot_hba_link_speed                   = "platform-default"
  slot_hba_state                        = "platform-default"
  slot_lom1link                         = "platform-default"
  slot_lom2link                         = "platform-default"
  slot_mezz_state                       = "platform-default"
  slot_mlom_link_speed                  = "platform-default"
  slot_mlom_state                       = "platform-default"
  slot_mraid_link_speed                 = "platform-default"
  slot_mraid_state                      = "platform-default"
  slot_n10state                         = "platform-default"
  slot_n11state                         = "platform-default"
  slot_n12state                         = "platform-default"
  slot_n13state                         = "platform-default"
  slot_n14state                         = "platform-default"
  slot_n15state                         = "platform-default"
  slot_n16state                         = "platform-default"
  slot_n17state                         = "platform-default"
  slot_n18state                         = "platform-default"
  slot_n19state                         = "platform-default"
  slot_n1state                          = "platform-default"
  slot_n20state                         = "platform-default"
  slot_n21state                         = "platform-default"
  slot_n22state                         = "platform-default"
  slot_n23state                         = "platform-default"
  slot_n24state                         = "platform-default"
  slot_n2state                          = "platform-default"
  slot_n3state                          = "platform-default"
  slot_n4state                          = "platform-default"
  slot_n5state                          = "platform-default"
  slot_n6state                          = "platform-default"
  slot_n7state                          = "platform-default"
  slot_n8state                          = "platform-default"
  slot_n9state                          = "platform-default"
  slot_raid_link_speed                  = "platform-default"
  slot_raid_state                       = "platform-default"
  slot_rear_nvme1link_speed             = "platform-default"
  slot_rear_nvme1state                  = "platform-default"
  slot_rear_nvme2link_speed             = "platform-default"
  slot_rear_nvme2state                  = "platform-default"
  slot_rear_nvme3link_speed             = "platform-default"
  slot_rear_nvme3state                  = "platform-default"
  slot_rear_nvme4link_speed             = "platform-default"
  slot_rear_nvme4state                  = "platform-default"
  slot_rear_nvme5state                  = "platform-default"
  slot_rear_nvme6state                  = "platform-default"
  slot_rear_nvme7state                  = "platform-default"
  slot_rear_nvme8state                  = "platform-default"
  slot_riser1link_speed                 = "platform-default"
  slot_riser1slot1link_speed            = "platform-default"
  slot_riser1slot2link_speed            = "platform-default"
  slot_riser1slot3link_speed            = "platform-default"
  slot_riser2link_speed                 = "platform-default"
  slot_riser2slot4link_speed            = "platform-default"
  slot_riser2slot5link_speed            = "platform-default"
  slot_riser2slot6link_speed            = "platform-default"
  slot_sas_state                        = "platform-default"
  slot_ssd_slot1link_speed              = "platform-default"
  slot_ssd_slot2link_speed              = "platform-default"
  slot10link_speed                      = "platform-default"
  slot10state                           = "platform-default"
  slot11link_speed                      = "platform-default"
  slot11state                           = "platform-default"
  slot12link_speed                      = "platform-default"
  slot12state                           = "platform-default"
  slot13state                           = "platform-default"
  slot14state                           = "platform-default"
  slot1link_speed                       = "platform-default"
  slot1state                            = "platform-default"
  slot2link_speed                       = "platform-default"
  slot2state                            = "platform-default"
  slot3link_speed                       = "platform-default"
  slot3state                            = "platform-default"
  slot4link_speed                       = "platform-default"
  slot4state                            = "platform-default"
  slot5link_speed                       = "platform-default"
  slot5state                            = "platform-default"
  slot6link_speed                       = "platform-default"
  slot6state                            = "platform-default"
  slot7link_speed                       = "platform-default"
  slot7state                            = "platform-default"
  slot8link_speed                       = "platform-default"
  slot8state                            = "platform-default"
  slot9link_speed                       = "platform-default"
  slot9state                            = "platform-default"
  smee                                  = "platform-default"
  smt_mode                              = "platform-default"
  snc                                   = "platform-default"
  snoopy_mode_for_ad                    = "platform-default"
  snoopy_mode_for2lm                    = "platform-default"
  sparing_mode                          = "platform-default"
  sr_iov                                = "platform-default"
  streamer_prefetch                     = "platform-default"
  svm_mode                              = "platform-default"
  terminal_type                         = "platform-default"
  tpm_control                           = "platform-default"
  tpm_pending_operation                 = "platform-default"
  tpm_support                           = "platform-default"
  tsme                                  = "platform-default"
  txt_support                           = "platform-default"
  ucsm_boot_order_rule                  = "platform-default"
  ufs_disable                           = "platform-default"
  uma_based_clustering                  = "platform-default"
  upi_link_enablement                   = "platform-default"
  upi_power_management                  = "platform-default"
  usb_emul6064                          = "platform-default"
  usb_port_front                        = "platform-default"
  usb_port_internal                     = "platform-default"
  usb_port_kvm                          = "platform-default"
  usb_port_rear                         = "platform-default"
  usb_port_sd_card                      = "platform-default"
  usb_port_vmedia                       = "platform-default"
  usb_xhci_support                      = "platform-default"
  vga_priority                          = "platform-default"
  virtual_numa                          = "platform-default"
  vmd_enable                            = "platform-default"
  vol_memory_mode                       = "platform-default"
  work_load_config                      = "platform-default"
  xpt_prefetch                          = "platform-default"
  xpt_remote_prefetch                   = "platform-default"
}
