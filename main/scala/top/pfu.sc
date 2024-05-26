package pfu

import chisel3._
import chisel3.util._

class MyIO extends Bundle {
  val amr_wa_cancel = Input(UInt(1.W));
  val bus_arb_pfu_ar_grnt = Input(UInt(1.W));
  val bus_arb_pfu_ar_ready = Input(UInt(1.W));
  val cp0_lsu_dcache_en = Input(UInt(1.W));
  val cp0_lsu_dcache_pref_en = Input(UInt(1.W));
  val cp0_lsu_icg_en = Input(UInt(1.W));
  val cp0_lsu_l2_pref_en = Input(UInt(1.W));
  val cp0_lsu_l2_st_pref_en = Input(UInt(1.W));
  val cp0_lsu_no_op_req = Input(UInt(1.W));
  val cp0_lsu_pfu_mmu_dis = Input(UInt(1.W));
  val cp0_lsu_timeout_cnt = Input(UInt(30.W));
  val cp0_yy_clk_en = Input(UInt(1.W));
  val cp0_yy_dcache_pref_en = Input(UInt(1.W));
  val cp0_yy_priv_mode = Input(UInt(2.W));
  val cpurst_b = Input(UInt(1.W));
  val forever_cpuclk = Input(UInt(1.W));
  val icc_idle = Input(UInt(1.W));
  val ld_da_iid = Input(UInt(7.W));
  val ld_da_ldfifo_pc = Input(UInt(15.W));
  val ld_da_page_sec_ff = Input(UInt(1.W));
  val ld_da_page_share_ff = Input(UInt(1.W));
  val ld_da_pfu_act_dp_vld = Input(UInt(1.W));
  val ld_da_pfu_act_vld = Input(UInt(1.W));
  val ld_da_pfu_biu_req_hit_idx = Input(UInt(1.W));
  val ld_da_pfu_evict_cnt_vld = Input(UInt(1.W));
  val ld_da_pfu_pf_inst_vld = Input(UInt(1.W));
  val ld_da_pfu_va = Input(UInt(40.W));
  val ld_da_ppfu_va = Input(UInt(40.W));
  val ld_da_ppn_ff = Input(UInt(28.W));
  val lfb_addr_full = Input(UInt(1.W));
  val lfb_addr_less2 = Input(UInt(1.W));
  val lfb_pfu_biu_req_hit_idx = Input(UInt(1.W));
  val lfb_pfu_create_id = Input(UInt(5.W));
  val lfb_pfu_dcache_hit = Input(UInt(9.W));
  val lfb_pfu_dcache_miss = Input(UInt(9.W));
  val lfb_pfu_rready_grnt = Input(UInt(1.W));
  val lm_pfu_biu_req_hit_idx = Input(UInt(1.W));
  val lsu_pfu_l1_dist_sel = Input(UInt(4.W));
  val lsu_pfu_l2_dist_sel = Input(UInt(4.W));
  val lsu_special_clk = Input(UInt(1.W));
  val mmu_lsu_pa2 = Input(UInt(28.W));
  val mmu_lsu_pa2_err = Input(UInt(1.W));
  val mmu_lsu_pa2_vld = Input(UInt(1.W));
  val mmu_lsu_sec2 = Input(UInt(1.W));
  val mmu_lsu_share2 = Input(UInt(1.W));
  val pad_yy_icg_scan_en = Input(UInt(1.W));
  val rb_pfu_biu_req_hit_idx = Input(UInt(1.W));
  val rb_pfu_nc_no_pending = Input(UInt(1.W));
  val rtu_yy_xx_commit0 = Input(UInt(1.W));
  val rtu_yy_xx_commit0_iid = Input(UInt(7.W));
  val rtu_yy_xx_commit1 = Input(UInt(1.W));
  val rtu_yy_xx_commit1_iid = Input(UInt(7.W));
  val rtu_yy_xx_commit2 = Input(UInt(1.W));
  val rtu_yy_xx_commit2_iid = Input(UInt(7.W));
  val rtu_yy_xx_flush = Input(UInt(1.W));
  val sq_pfu_pop_synci_inst = Input(UInt(1.W));
  val st_da_iid = Input(UInt(7.W));
  val st_da_page_sec_ff = Input(UInt(1.W));
  val st_da_page_share_ff = Input(UInt(1.W));
  val st_da_pc = Input(UInt(15.W));
  val st_da_pfu_act_dp_vld = Input(UInt(1.W));
  val st_da_pfu_act_vld = Input(UInt(1.W));
  val st_da_pfu_biu_req_hit_idx = Input(UInt(1.W));
  val st_da_pfu_evict_cnt_vld = Input(UInt(1.W));
  val st_da_pfu_pf_inst_vld = Input(UInt(1.W));
  val st_da_ppfu_va = Input(UInt(40.W));
  val st_da_ppn_ff = Input(UInt(28.W));
  val vb_pfu_biu_req_hit_idx = Input(UInt(1.W));
  val wmb_pfu_biu_req_hit_idx = Input(UInt(1.W));
  val lsu_mmu_va2 = Output(UInt(28.W));
  val lsu_mmu_va2_vld = Output(UInt(1.W));
  val pfu_biu_ar_addr = Output(UInt(40.W));
  val pfu_biu_ar_bar = Output(UInt(2.W));
  val pfu_biu_ar_burst = Output(UInt(2.W));
  val pfu_biu_ar_cache = Output(UInt(4.W));
  val pfu_biu_ar_domain = Output(UInt(2.W));
  val pfu_biu_ar_dp_req = Output(UInt(1.W));
  val pfu_biu_ar_id = Output(UInt(5.W));
  val pfu_biu_ar_len = Output(UInt(2.W));
  val pfu_biu_ar_lock = Output(UInt(1.W));
  val pfu_biu_ar_prot = Output(UInt(3.W));
  val pfu_biu_ar_req = Output(UInt(1.W));
  val pfu_biu_ar_req_gateclk_en = Output(UInt(1.W));
  val pfu_biu_ar_size = Output(UInt(3.W));
  val pfu_biu_ar_snoop = Output(UInt(4.W));
  val pfu_biu_ar_user = Output(UInt(3.W));
  val pfu_biu_req_addr = Output(UInt(40.W));
  val pfu_icc_ready = Output(UInt(1.W));
  val pfu_lfb_create_dp_vld = Output(UInt(1.W));
  val pfu_lfb_create_gateclk_en = Output(UInt(1.W));
  val pfu_lfb_create_req = Output(UInt(1.W));
  val pfu_lfb_create_vld = Output(UInt(1.W));
  val pfu_lfb_id = Output(UInt(4.W));
  val pfu_part_empty = Output(UInt(1.W));
  val pfu_pfb_empty = Output(UInt(1.W));
  val pfu_sdb_create_gateclk_en = Output(UInt(1.W));
  val pfu_sdb_empty = Output(UInt(1.W));
}

class ct_lsu_pfu() extends Module {
  val io = IO(new MyIO);

  val pfu_biu_pe_req_ptr_priority_0 = Reg(UInt(9.W));
  val pfu_biu_pe_req_ptr_priority_1 = Reg(UInt(9.W));
  val pfu_biu_req_addr_tto6 = Reg(UInt(34.W));
  val pfu_biu_req_l1 = Reg(UInt(1.W));
  val pfu_biu_req_page_sec = Reg(UInt(1.W));
  val pfu_biu_req_page_share = Reg(UInt(1.W));
  val pfu_biu_req_priority = Reg(UInt(9.W));
  val pfu_biu_req_priv_mode = Reg(UInt(2.W));
  val pfu_biu_req_ptr = Reg(UInt(9.W));
  val pfu_biu_req_unmask = Reg(Bool());
  val pfu_mmu_pe_req_ptr = Reg(UInt(9.W));
  val pfu_mmu_req = Reg(UInt(1.W));
  val pfu_mmu_req_l1 = Reg(UInt(1.W));
  val pfu_mmu_req_ptr = Reg(UInt(9.W));
  val pfu_mmu_req_vpn = Reg(UInt(28.W));
  val pfu_pfb_empty_create_ptr = Reg(UInt(8.W));
  val pfu_pfb_evict_create_ptr = Reg(UInt(8.W));
  val pfu_pmb_empty_create_ptr = Reg(Vec(8, UInt(1.W)));
  val pfu_pmb_evict_create_ptr = Reg(Vec(8, UInt(1.W)));
  val pfu_pmb_pop_ptr = Reg(Vec(8, UInt(1.W)));
  val pfu_sdb_empty_create_ptr = Reg(Vec(2, UInt(1.W)));
  val pfu_sdb_evict_create_ptr = Reg(Vec(2, UInt(1.W)));
  val pfu_sdb_pop_ptr = Reg(UInt(2.W));

  val amr_wa_cancel = Wire(UInt(1.W));
  val bus_arb_pfu_ar_grnt = Wire(UInt(1.W));
  val bus_arb_pfu_ar_ready = Wire(UInt(1.W));
  val cp0_lsu_dcache_en = Wire(UInt(1.W));
  val cp0_lsu_dcache_pref_en = Wire(UInt(1.W));
  val cp0_lsu_icg_en = Wire(UInt(1.W));
  val cp0_lsu_l2_pref_en = Wire(UInt(1.W));
  val cp0_lsu_l2_st_pref_en = Wire(UInt(1.W));
  val cp0_lsu_no_op_req = Wire(UInt(1.W));
  val cp0_lsu_pfu_mmu_dis = Wire(UInt(1.W));
  val cp0_lsu_timeout_cnt = Wire(UInt(30.W));
  val cp0_yy_clk_en = Wire(UInt(1.W));
  val cp0_yy_dcache_pref_en = Wire(UInt(1.W));
  val cp0_yy_priv_mode = Wire(UInt(2.W));
  val cpurst_b = Wire(UInt(1.W));
  val forever_cpuclk = Wire(UInt(1.W));
  val icc_idle = Wire(UInt(1.W));
  val ld_da_iid = Wire(UInt(7.W));
  val ld_da_ldfifo_pc = Wire(UInt(15.W));
  val ld_da_page_sec_ff = Wire(UInt(1.W));
  val ld_da_page_share_ff = Wire(UInt(1.W));
  val ld_da_pfu_act_dp_vld = Wire(UInt(1.W));
  val ld_da_pfu_act_vld = Wire(UInt(1.W));
  val ld_da_pfu_biu_req_hit_idx = Wire(UInt(1.W));
  val ld_da_pfu_evict_cnt_vld = Wire(UInt(1.W));
  val ld_da_pfu_pf_inst_vld = Wire(UInt(1.W));
  val ld_da_pfu_va = Wire(UInt(40.W));
  val ld_da_ppfu_va = Wire(UInt(40.W));
  val ld_da_ppn_ff = Wire(UInt(28.W));
  val lfb_addr_full = Wire(UInt(1.W));
  val lfb_addr_less2 = Wire(UInt(1.W));
  val lfb_pfu_biu_req_hit_idx = Wire(UInt(1.W));
  val lfb_pfu_create_id = Wire(UInt(5.W));
  val lfb_pfu_dcache_hit = Wire(UInt(9.W));
  val lfb_pfu_dcache_miss = Wire(UInt(9.W));
  val lfb_pfu_rready_grnt = Wire(UInt(1.W));
  val lm_pfu_biu_req_hit_idx = Wire(UInt(1.W));
  val lsu_mmu_va2 = Wire(UInt(28.W));
  val lsu_mmu_va2_vld = Wire(UInt(1.W));
  val lsu_pfu_l1_dist_sel = Wire(UInt(4.W));
  val lsu_pfu_l2_dist_sel = Wire(UInt(4.W));
  val lsu_special_clk = Wire(UInt(1.W));
  val mmu_lsu_pa2 = Wire(UInt(28.W));
  val mmu_lsu_pa2_err = Wire(UInt(1.W));
  val mmu_lsu_pa2_vld = Wire(UInt(1.W));
  val mmu_lsu_sec2 = Wire(UInt(1.W));
  val mmu_lsu_share2 = Wire(UInt(1.W));
  val pad_yy_icg_scan_en = Wire(UInt(1.W));
  val pfb_no_req_cnt_val = Wire(UInt(6.W));
  val pfb_timeout_cnt_val = Wire(UInt(8.W));
  val pfu_all_pfb_biu_pe_req = Wire(UInt(9.W));
  val pfu_all_pfb_biu_pe_req_ptiority_0 = Wire(UInt(9.W));
  val pfu_all_pfb_biu_pe_req_ptiority_1 = Wire(UInt(9.W));
  val pfu_all_pfb_mmu_pe_req = Wire(UInt(9.W));
  val pfu_biu_ar_addr = Wire(UInt(40.W));
  val pfu_biu_ar_bar = Wire(UInt(2.W));
  val pfu_biu_ar_burst = Wire(UInt(2.W));
  val pfu_biu_ar_cache = Wire(UInt(4.W));
  val pfu_biu_ar_domain = Wire(UInt(2.W));
  val pfu_biu_ar_dp_req = Wire(UInt(1.W));
  val pfu_biu_ar_id = Wire(UInt(5.W));
  val pfu_biu_ar_len = Wire(UInt(2.W));
  val pfu_biu_ar_lock = Wire(UInt(1.W));
  val pfu_biu_ar_prot = Wire(UInt(3.W));
  val pfu_biu_ar_req = Wire(UInt(1.W));
  val pfu_biu_ar_req_gateclk_en = Wire(UInt(1.W));
  val pfu_biu_ar_size = Wire(UInt(3.W));
  val pfu_biu_ar_snoop = Wire(UInt(4.W));
  val pfu_biu_ar_user = Wire(UInt(3.W));
  val pfu_biu_l1_pe_req_addr_tto6 = Wire(UInt(34.W));
  val pfu_biu_l1_pe_req_page_sec = Wire(UInt(1.W));
  val pfu_biu_l1_pe_req_page_share = Wire(UInt(1.W));
  val pfu_biu_l2_pe_req_addr_tto6 = Wire(UInt(34.W));
  val pfu_biu_l2_pe_req_page_sec = Wire(UInt(1.W));
  val pfu_biu_l2_pe_req_page_share = Wire(UInt(1.W));
  val pfu_biu_pe_clk = Wire(UInt(1.W));
  val pfu_biu_pe_clk_en = Wire(Bool());
  val pfu_biu_pe_req = Wire(Bool());
  val pfu_biu_pe_req_addr_tto6 = Wire(UInt(34.W));
  val pfu_biu_pe_req_grnt = Wire(UInt(1.W));
  val pfu_biu_pe_req_page_sec = Wire(UInt(1.W));
  val pfu_biu_pe_req_page_share = Wire(UInt(1.W));
  val pfu_biu_pe_req_priv_mode = Wire(UInt(2.W));
  val pfu_biu_pe_req_ptiority_0 = Wire(UInt(1.W));
  val pfu_biu_pe_req_ptr = Wire(UInt(9.W));
  val pfu_biu_pe_req_sel_l1 = Wire(UInt(1.W));
  val pfu_biu_pe_req_src = Wire(UInt(2.W));
  val pfu_biu_pe_update_permit = Wire(UInt(1.W));
  val pfu_biu_pe_update_vld = Wire(UInt(1.W));
  val pfu_biu_req_addr = Wire(UInt(40.W));
  val pfu_biu_req_bus_grnt = Wire(UInt(1.W));
  val pfu_biu_req_grnt = Wire(UInt(1.W));
  val pfu_biu_req_hit_idx = Wire(UInt(1.W));
  val pfu_biu_req_priority_next = Wire(UInt(9.W));
  val pfu_dcache_pref_en = Wire(UInt(1.W));
  val pfu_get_page_sec = Wire(UInt(1.W));
  val pfu_get_page_share = Wire(UInt(1.W));
  val pfu_get_ppn = Wire(UInt(28.W));
  val pfu_get_ppn_err = Wire(UInt(1.W));
  val pfu_get_ppn_vld = Wire(UInt(1.W));

  val pfu_gpfb_biu_pe_req = Wire(UInt(1.W));
  val pfu_gpfb_biu_pe_req_grnt = Wire(UInt(1.W));
  val pfu_gpfb_biu_pe_req_src = Wire(UInt(2.W));
  val pfu_gpfb_from_lfb_dcache_hit = Wire(UInt(1.W));
  val pfu_gpfb_from_lfb_dcache_miss = Wire(UInt(1.W));
  val pfu_gpfb_l1_page_sec = Wire(UInt(1.W));
  val pfu_gpfb_l1_page_share = Wire(UInt(1.W));
  val pfu_gpfb_l1_pf_addr = Wire(UInt(40.W));
  val pfu_gpfb_l1_vpn = Wire(UInt(28.W));
  val pfu_gpfb_l2_page_sec = Wire(UInt(1.W));
  val pfu_gpfb_l2_page_share = Wire(UInt(1.W));
  val pfu_gpfb_l2_pf_addr = Wire(UInt(40.W));
  val pfu_gpfb_l2_vpn = Wire(UInt(28.W));
  val pfu_gpfb_mmu_pe_req = Wire(UInt(1.W));
  val pfu_gpfb_mmu_pe_req_grnt = Wire(UInt(1.W));
  val pfu_gpfb_mmu_pe_req_src = Wire(UInt(2.W));
  val pfu_gpfb_priv_mode = Wire(UInt(2.W));
  val pfu_gpfb_vld = Wire(UInt(1.W));
  val pfu_gsdb_gpfb_create_vld = Wire(UInt(1.W));
  val pfu_gsdb_gpfb_pop_req = Wire(UInt(1.W));
  val pfu_gsdb_stride = Wire(UInt(11.W));
  val pfu_gsdb_stride_neg = Wire(UInt(1.W));
  val pfu_gsdb_strideh_6to0 = Wire(UInt(7.W));
  val pfu_hit_pc = Wire(UInt(1.W));
  val pfu_icc_ready = Wire(UInt(1.W));
  val pfu_l2_pref_en = Wire(UInt(1.W));
  val pfu_lfb_create_dp_vld = Wire(UInt(1.W));
  val pfu_lfb_create_gateclk_en = Wire(UInt(1.W));
  val pfu_lfb_create_req = Wire(UInt(1.W));
  val pfu_lfb_create_vld = Wire(UInt(1.W));
  val pfu_lfb_id = Wire(UInt(4.W));
  val pfu_mmu_l1_pe_req_vpn = Wire(UInt(28.W));
  val pfu_mmu_l2_pe_req_vpn = Wire(UInt(28.W));
  val pfu_mmu_pe_clk = Wire(UInt(1.W));
  val pfu_mmu_pe_clk_en = Wire(UInt(1.W));
  val pfu_mmu_pe_req = Wire(UInt(1.W));
  val pfu_mmu_pe_req_sel_l1 = Wire(UInt(1.W));
  val pfu_mmu_pe_req_src = Wire(UInt(2.W));
  val pfu_mmu_pe_req_vpn = Wire(UInt(28.W));
  val pfu_mmu_pe_update_permit = Wire(UInt(1.W));
  val pfu_part_empty = Wire(UInt(1.W));
  val pfu_pfb_create_dp_vld = Wire(UInt(1.W));
  val pfu_pfb_create_gateclk_en = Wire(UInt(1.W));
  val pfu_pfb_create_pc = Wire(UInt(15.W));
  val pfu_pfb_create_ptr = Wire(UInt(8.W));
  val pfu_pfb_create_stride = Wire(UInt(11.W));
  val pfu_pfb_create_stride_neg = Wire(UInt(1.W));
  val pfu_pfb_create_strideh_6to0 = Wire(UInt(7.W));
  val pfu_pfb_create_type_ld = Wire(UInt(1.W));
  val pfu_pfb_create_vld = Wire(UInt(1.W));
  val pfu_pfb_empty = Wire(UInt(1.W));
  val pfu_pfb_entry_biu_pe_req = Wire(UInt(8.W));
  val pfu_pfb_entry_biu_pe_req_grnt = Wire(UInt(8.W));
  val pfu_pfb_entry_biu_pe_req_src = VecInit(Seq.fill(8)(Wire(UInt(2.W))));
  val pfu_pfb_entry_create_dp_vld = Wire(UInt(8.W));
  val pfu_pfb_entry_create_gateclk_en = Wire(UInt(8.W));
  val pfu_pfb_entry_create_vld = Wire(UInt(8.W));
  val pfu_pfb_entry_evict = Wire(UInt(8.W));
  val pfu_pfb_entry_from_lfb_dcache_hit = Wire(UInt(8.W));
  val pfu_pfb_entry_from_lfb_dcache_miss = Wire(UInt(8.W));
  val pfu_pfb_entry_hit_pc = Wire(UInt(8.W));
  val pfu_pfb_entry_l1_page_sec = Wire(UInt(8.W));
  val pfu_pfb_entry_l1_page_share = Wire(UInt(8.W));
  val pfu_pfb_entry_l1_pf_addr = VecInit(Seq.fill(8)(Wire(UInt(40.W))));
  val pfu_pfb_entry_l1_vpn = VecInit(Seq.fill(8)(Wire(UInt(28.W))));
  val pfu_pfb_entry_l2_page_sec = Wire(UInt(8.W));
  val pfu_pfb_entry_l2_page_share = Wire(UInt(8.W));
  val pfu_pfb_entry_l2_pf_addr_7 = VecInit(Seq.fill(8)(Wire(UInt(40.W))));
  val pfu_pfb_entry_l2_vpn_7 = VecInit(Seq.fill(8)(Wire(UInt(28.W))));
  val pfu_pfb_entry_mmu_pe_req = Wire(UInt(8.W));
  val pfu_pfb_entry_mmu_pe_req_grnt = Wire(UInt(8.W));
  val pfu_pfb_entry_mmu_pe_req_src_7 = VecInit(Seq.fill(8)(Wire(UInt(2.W))));
  val pfu_pfb_entry_priv_mode_7 = VecInit(Seq.fill(8)(Wire(UInt(2.W))));
  val pfu_pfb_entry_vld = Wire(UInt(8.W));
  val pfu_pfb_full = Wire(UInt(1.W));
  val pfu_pfb_has_evict = Wire(UInt(1.W));
  val pfu_pfb_hit_pc = Wire(UInt(1.W));
  val pfu_pmb_create_dp_vld = Wire(UInt(1.W));
  val pfu_pmb_create_gateclk_en = Wire(UInt(1.W));
  val pfu_pmb_create_ptr = Wire(UInt(8.W));
  val pfu_pmb_create_vld = Wire(UInt(1.W));
  val pfu_pmb_empty = Wire(UInt(1.W));
  val pfu_pmb_entry_create_dp_vld = Wire(UInt(8.W));
  val pfu_pmb_entry_create_gateclk_en = Wire(UInt(8.W));
  val pfu_pmb_entry_create_vld = Wire(UInt(8.W));
  val pfu_pmb_entry_evict = Wire(Vec(8, UInt(1.W)));
  val pfu_pmb_entry_hit_pc = Wire(UInt(8.W));
  val pfu_pmb_entry_pc = VecInit(Seq.fill(8)(Wire(UInt(15.W))));
  val pfu_pmb_entry_ready = Wire(UInt(8.W));
  val pfu_pmb_entry_ready_grnt = Wire(UInt(8.W));
  val pfu_pmb_entry_type_ld = Wire(UInt(8.W));
  val pfu_pmb_entry_vld = Wire(Vec(8, UInt(1.W)));
  val pfu_pmb_full = Wire(UInt(1.W));
  val pfu_pmb_hit_pc = Wire(UInt(1.W));
  val pfu_pmb_ready_grnt = Wire(Bool());
  val pfu_pop_all_part_vld = Wire(UInt(1.W));
  val pfu_pop_all_vld = Wire(UInt(1.W));
  val pfu_sdb_create_dp_vld = Wire(UInt(1.W));
  val pfu_sdb_create_gateclk_en = Wire(Bool());
  val pfu_sdb_create_pc = Wire(UInt(15.W));
  val pfu_sdb_create_ptr = Wire(UInt(2.W));
  val pfu_sdb_create_type_ld = Wire(UInt(1.W));
  val pfu_sdb_create_vld = Wire(Bool());
  val pfu_sdb_empty = Wire(UInt(1.W));
  val pfu_sdb_entry_create_dp_vld = Wire(UInt(2.W));
  val pfu_sdb_entry_create_gateclk_en = Wire(UInt(2.W));
  val pfu_sdb_entry_create_vld = Wire(UInt(2.W));
  val pfu_sdb_entry_evict = Wire(Vec(2, UInt(1.W)));
  val pfu_sdb_entry_hit_pc = Wire(UInt(2.W));
  val pfu_sdb_entry_pc_0 = Wire(UInt(15.W));
  val pfu_sdb_entry_pc_1 = Wire(UInt(15.W));
  val pfu_sdb_entry_ready = Wire(UInt(2.W));
  val pfu_sdb_entry_ready_grnt = Wire(UInt(2.W));
  val pfu_sdb_entry_stride_0 = Wire(UInt(11.W));
  val pfu_sdb_entry_stride_1 = Wire(UInt(11.W));
  val pfu_sdb_entry_stride_neg = Wire(UInt(2.W));
  val pfu_sdb_entry_strideh_6to0_0 = Wire(UInt(7.W));
  val pfu_sdb_entry_strideh_6to0_1 = Wire(UInt(7.W));
  val pfu_sdb_entry_type_ld = Wire(UInt(2.W));
  val pfu_sdb_entry_vld = Wire(Vec(2, UInt(1.W)));
  val pfu_sdb_full = Wire(Bool());
  val pfu_sdb_has_evict = Wire(Bool());
  val pfu_sdb_hit_pc = Wire(UInt(1.W));
  val pfu_sdb_ready_grnt = Wire(UInt(1.W));
  val pipe_create_dp_vld = Wire(UInt(1.W));
  val pipe_create_pc = Wire(UInt(15.W));
  val pipe_create_vld = Wire(UInt(1.W));
  val pmb_timeout_cnt_val = Wire(UInt(8.W));
  val rb_pfu_biu_req_hit_idx = Wire(UInt(1.W));
  val rb_pfu_nc_no_pending = Wire(UInt(1.W));
  val rtu_yy_xx_commit0 = Wire(UInt(1.W));
  val rtu_yy_xx_commit0_iid = Wire(UInt(7.W));
  val rtu_yy_xx_commit1 = Wire(UInt(1.W));
  val rtu_yy_xx_commit1_iid = Wire(UInt(7.W));
  val rtu_yy_xx_commit2 = Wire(UInt(1.W));
  val rtu_yy_xx_commit2_iid = Wire(UInt(7.W));
  val rtu_yy_xx_flush = Wire(UInt(1.W));
  val sdb_timeout_cnt_val = Wire(UInt(8.W));
  val sq_pfu_pop_synci_inst = Wire(UInt(1.W));
  val st_da_iid = Wire(UInt(7.W));
  val st_da_page_sec_ff = Wire(UInt(1.W));
  val st_da_page_share_ff = Wire(UInt(1.W));
  val st_da_pc = Wire(UInt(15.W));
  val st_da_pfu_act_dp_vld = Wire(UInt(1.W));
  val st_da_pfu_act_vld = Wire(UInt(1.W));
  val st_da_pfu_biu_req_hit_idx = Wire(UInt(1.W));
  val st_da_pfu_evict_cnt_vld = Wire(UInt(1.W));
  val st_da_pfu_pf_inst_vld = Wire(UInt(1.W));
  val st_da_ppfu_va = Wire(UInt(40.W));
  val st_da_ppn_ff = Wire(UInt(28.W));
  val vb_pfu_biu_req_hit_idx = Wire(UInt(1.W));
  val wmb_pfu_biu_req_hit_idx = Wire(UInt(1.W));

  val PMB_ENTRY = 8.U;
  val SDB_ENTRY = 2.U;
  val PFB_ENTRY = 8.U;
  val PC_LEN = 15.U;
  val BIU_R_L2PREF_ID = 25.U;

  //=========================================================
  //                Instance of Gated Cell  
  //=========================================================
  //-------------------mmu req pop entry---------------------
  pfu_mmu_pe_clk_en := pfu_get_ppn_vld.asBool || pfu_mmu_pe_req.asBool;

  val x_lsu_pfu_mmu_pe_gated_clk = Module(new gated_clk_cell)
  x_lsu_pfu_mmu_pe_gated_clk.io.clk_in := forever_cpuclk
  pfu_mmu_pe_clk := x_lsu_pfu_mmu_pe_gated_clk.io.clk_out
  x_lsu_pfu_mmu_pe_gated_clk.io.external_en := 0.U.asBool
  x_lsu_pfu_mmu_pe_gated_clk.io.global_en := io.cp0_yy_clk_en
  pfu_mmu_pe_clk_en := x_lsu_pfu_mmu_pe_gated_clk.io.local_en
  x_lsu_pfu_mmu_pe_gated_clk.io.module_en := cp0_lsu_icg_en
  x_lsu_pfu_mmu_pe_gated_clk.io.pad_yy_icg_scan_en := pad_yy_icg_scan_en

  // &Connect(.clk_in        (forever_cpuclk     ), @46
  //          .external_en   (1'b0               ), @47
  //          .global_en     (cp0_yy_clk_en      ), @48
  //          .module_en     (cp0_lsu_icg_en     ), @49
  //          .local_en      (pfu_mmu_pe_clk_en ), @50
  //          .clk_out       (pfu_mmu_pe_clk    )); @51

  //--------------------biu req pop entry---------------------
  pfu_biu_pe_clk_en := pfu_biu_pe_req || pfu_biu_req_unmask;

  // &Instance("gated_clk_cell", "x_lsu_pfu_biu_pe_gated_clk"); @57
  val x_lsu_pfu_biu_pe_gated_clk = Module(new gated_clk_cell)
  x_lsu_pfu_biu_pe_gated_clk.io.clk_in := io.forever_cpuclk
  pfu_biu_pe_clk := x_lsu_pfu_biu_pe_gated_clk.io.clk_out
  x_lsu_pfu_biu_pe_gated_clk.io.external_en := 0.U.asBool
  x_lsu_pfu_biu_pe_gated_clk.io.global_en := io.cp0_yy_clk_en
  pfu_biu_pe_clk_en := x_lsu_pfu_biu_pe_gated_clk.io.local_en
  x_lsu_pfu_biu_pe_gated_clk.io.module_en := io.cp0_lsu_icg_en
  x_lsu_pfu_biu_pe_gated_clk.io.pad_yy_icg_scan_en := io.pad_yy_icg_scan_en

  // &Connect(.clk_in        (forever_cpuclk     ), @58
  //          .external_en   (1'b0               ), @59
  //          .global_en     (cp0_yy_clk_en      ), @60
  //          .module_en     (cp0_lsu_icg_en     ), @61
  //          .local_en      (pfu_biu_pe_clk_en ), @62
  //          .clk_out       (pfu_biu_pe_clk    )); @63

  //==========================================================
  //                 Instance pmb entry
  //==========================================================

  val x_ct_lsu_pfu_pmb_entry = VecInit(Seq.fill(8)(Module(new ct_lsu_pfu_pmb_entry).io));
  for (i <- 0 to 7) {
    x_ct_lsu_pfu_pmb_entry(i).amr_wa_cancel := io.amr_wa_cancel
    x_ct_lsu_pfu_pmb_entry(i).cp0_lsu_icg_en := io.cp0_lsu_icg_en
    x_ct_lsu_pfu_pmb_entry(i).cp0_lsu_l2_st_pref_en := io.cp0_lsu_l2_st_pref_en
    x_ct_lsu_pfu_pmb_entry(i).cp0_yy_clk_en := io.cp0_yy_clk_en
    x_ct_lsu_pfu_pmb_entry(i).cpurst_b := io.cpurst_b
    x_ct_lsu_pfu_pmb_entry(i).ld_da_ldfifo_pc := io.ld_da_ldfifo_pc
    x_ct_lsu_pfu_pmb_entry(i).ld_da_pfu_act_dp_vld := io.ld_da_pfu_act_dp_vld
    x_ct_lsu_pfu_pmb_entry(i).ld_da_pfu_evict_cnt_vld := io.ld_da_pfu_evict_cnt_vld
    x_ct_lsu_pfu_pmb_entry(i).ld_da_pfu_pf_inst_vld := io.ld_da_pfu_pf_inst_vld
    x_ct_lsu_pfu_pmb_entry(i).lsu_special_clk := io.lsu_special_clk
    x_ct_lsu_pfu_pmb_entry(i).pad_yy_icg_scan_en := io.pad_yy_icg_scan_en
    pfu_pmb_entry_create_dp_vld(i) := x_ct_lsu_pfu_pmb_entry(i).pfu_pmb_entry_create_dp_vld_x
    pfu_pmb_entry_create_gateclk_en(i) := x_ct_lsu_pfu_pmb_entry(i).pfu_pmb_entry_create_gateclk_en_x
    pfu_pmb_entry_create_vld(i) := x_ct_lsu_pfu_pmb_entry(i).pfu_pmb_entry_create_vld_x
    pfu_pmb_entry_evict(i) := x_ct_lsu_pfu_pmb_entry(i).pfu_pmb_entry_evict_x
    pfu_pmb_entry_hit_pc(i) := x_ct_lsu_pfu_pmb_entry(i).pfu_pmb_entry_hit_pc_x
    pfu_pmb_entry_pc(i) := x_ct_lsu_pfu_pmb_entry(i).pfu_pmb_entry_pc_v
    pfu_pmb_entry_ready_grnt(i) := x_ct_lsu_pfu_pmb_entry(i).pfu_pmb_entry_ready_grnt_x
    pfu_pmb_entry_ready(i) := x_ct_lsu_pfu_pmb_entry(i).pfu_pmb_entry_ready_x
    pfu_pmb_entry_type_ld(i) := x_ct_lsu_pfu_pmb_entry(i).pfu_pmb_entry_type_ld_x
    pfu_pmb_entry_vld(i) := x_ct_lsu_pfu_pmb_entry(i).pfu_pmb_entry_vld_x
    pfu_pop_all_part_vld := x_ct_lsu_pfu_pmb_entry(i).pfu_pop_all_part_vld
    pipe_create_pc := x_ct_lsu_pfu_pmb_entry(i).pipe_create_pc
    pmb_timeout_cnt_val := x_ct_lsu_pfu_pmb_entry(i).pmb_timeout_cnt_val
    x_ct_lsu_pfu_pmb_entry(i).st_da_pc := io.st_da_pc
    x_ct_lsu_pfu_pmb_entry(i).st_da_pfu_evict_cnt_vld := io.st_da_pfu_evict_cnt_vld
    x_ct_lsu_pfu_pmb_entry(i).st_da_pfu_pf_inst_vld := io.st_da_pfu_pf_inst_vld
  }

  //==========================================================
  //            Generate full/create signal of pmb
  //==========================================================
  //---------------------create pointer-----------------------
  //if it has empty entry, then create signal to empty entry,
  //else create siganl to evict entry,
  //else create fail
  // &CombBeg; @108
  pfu_pmb_empty_create_ptr := 0
  when(pfu_pmb_entry_vld(0) === 1.U) {
    pfu_pmb_empty_create_ptr(0) := 1.U
  }
    .elsewhen(pfu_pmb_entry_vld(1) === 1.U) {
      pfu_pmb_empty_create_ptr(1) := 1.U
    }
    .elsewhen(pfu_pmb_entry_vld(2) === 1.U) {
      pfu_pmb_empty_create_ptr(2) := 1.U
    }
    .elsewhen(pfu_pmb_entry_vld(3) === 1.U) {
      pfu_pmb_empty_create_ptr(3) := 1.U
    }
    .elsewhen(pfu_pmb_entry_vld(4) === 1.U) {
      pfu_pmb_empty_create_ptr(4) := 1.U
    }
    .elsewhen(pfu_pmb_entry_vld(5) === 1.U) {
      pfu_pmb_empty_create_ptr(5) := 1.U
    }
    .elsewhen(pfu_pmb_entry_vld(6) === 1.U) {
      pfu_pmb_empty_create_ptr(6) := 1.U
    }
    .elsewhen(pfu_pmb_entry_vld(7) === 1.U) {
      pfu_pmb_empty_create_ptr(7) := 1.U
    }
    .otherwise {
      pfu_pmb_empty_create_ptr := 0.U
    }
  // &CombEnd; @121


  // &CombBeg; @123
  pfu_pmb_evict_create_ptr := 0
  when(pfu_pmb_entry_evict(0) === 1.U) {
    pfu_pmb_evict_create_ptr(0) := 1.U
  }
    .elsewhen(pfu_pmb_entry_evict(1) === 1.U) {
      pfu_pmb_evict_create_ptr(1) := 1.U
    }
    .elsewhen(pfu_pmb_entry_evict(2) === 1.U) {
      pfu_pmb_evict_create_ptr(2) := 1.U
    }
    .elsewhen(pfu_pmb_entry_evict(3) === 1.U) {
      pfu_pmb_evict_create_ptr(3) := 1.U
    }
    .elsewhen(pfu_pmb_entry_evict(4) === 1.U) {
      pfu_pmb_evict_create_ptr(4) := 1.U
    }
    .elsewhen(pfu_pmb_entry_evict(5) === 1.U) {
      pfu_pmb_evict_create_ptr(5) := 1.U
    }
    .elsewhen(pfu_pmb_entry_evict(6) === 1.U) {
      pfu_pmb_evict_create_ptr(6) := 1.U
    }
    .elsewhen(pfu_pmb_entry_evict(7) === 1.U) {
      pfu_pmb_evict_create_ptr(7) := 1.U
    }
    .otherwise {
      pfu_pmb_evict_create_ptr := 0.U
    }

  pfu_pmb_full := pfu_pmb_entry_vld.asUInt.andR
  pfu_pmb_create_ptr := pfu_pmb_empty_create_ptr
  when(pfu_pmb_full === 1.U) {
    pfu_pmb_create_ptr := pfu_pmb_evict_create_ptr
  }

  //==========================================================
  //            pipe info create select
  //==========================================================
  //when ld and st create pmu simultaneously,ld has higher priority
  pipe_create_pc := st_da_pc
  when(ld_da_pfu_act_dp_vld === 1.U) {
    pipe_create_pc := ld_da_ldfifo_pc
  }

  pipe_create_vld := ld_da_pfu_act_vld | st_da_pfu_act_vld & !ld_da_pfu_act_dp_vld;

  pipe_create_dp_vld := ld_da_pfu_act_dp_vld | st_da_pfu_act_dp_vld;

  //------------------------hit pc----------------------------
  pfu_pmb_hit_pc := pfu_pmb_entry_hit_pc.orR
  pfu_sdb_hit_pc := pfu_sdb_entry_hit_pc.orR
  pfu_pfb_hit_pc := pfu_pfb_entry_hit_pc.orR
  pfu_hit_pc := pfu_pmb_hit_pc | pfu_sdb_hit_pc | pfu_pfb_hit_pc;
  //-------------------create signal--------------------------
  pfu_pmb_create_vld := pipe_create_vld & !pfu_hit_pc & !pfu_gpfb_vld;
  pfu_pmb_create_dp_vld := pipe_create_dp_vld & !pfu_hit_pc & !pfu_gpfb_vld;
  pfu_pmb_create_gateclk_en := pipe_create_dp_vld & !pfu_gpfb_vld;

  pfu_pmb_entry_create_vld := (pfu_pmb_create_vld ## pfu_pmb_create_vld ## pfu_pmb_create_vld ## pfu_pmb_create_vld ## pfu_pmb_create_vld ## pfu_pmb_create_vld ## pfu_pmb_create_vld ## pfu_pmb_create_vld) & pfu_pmb_create_ptr
  pfu_pmb_entry_create_dp_vld := (pfu_pmb_create_dp_vld ## pfu_pmb_create_dp_vld ## pfu_pmb_create_dp_vld ## pfu_pmb_create_dp_vld ## pfu_pmb_create_dp_vld ## pfu_pmb_create_dp_vld ## pfu_pmb_create_dp_vld ## pfu_pmb_create_dp_vld) & pfu_pmb_create_ptr
  pfu_pmb_entry_create_gateclk_en := (pfu_pmb_create_gateclk_en ## pfu_pmb_create_gateclk_en ## pfu_pmb_create_gateclk_en ## pfu_pmb_create_gateclk_en ## pfu_pmb_create_gateclk_en ## pfu_pmb_create_gateclk_en ## pfu_pmb_create_gateclk_en ## pfu_pmb_create_gateclk_en) & pfu_pmb_create_ptr;

  //==========================================================
  //                 Instance sdb entry
  //==========================================================

  // &ConnRule(s/_x$/(0)/); @182
  // &ConnRule(s/_v$/_0/); @183
  // &Instance("ct_lsu_pfu_sdb_entry","x_ct_lsu_pfu_sdb_entry_0"); @184
  val x_ct_lsu_pfu_sdb_entry = VecInit(Seq.fill(2)(Module(new ct_lsu_pfu_sdb_entry).io));
  x_ct_lsu_pfu_sdb_entry(0).amr_wa_cancel := io.amr_wa_cancel
  x_ct_lsu_pfu_sdb_entry(0).cp0_lsu_icg_en := io.cp0_lsu_icg_en
  x_ct_lsu_pfu_sdb_entry(0).cp0_lsu_l2_st_pref_en := io.cp0_lsu_l2_st_pref_en
  x_ct_lsu_pfu_sdb_entry(0).cp0_yy_clk_en := io.cp0_yy_clk_en
  x_ct_lsu_pfu_sdb_entry(0).cpurst_b := io.cpurst_b
  x_ct_lsu_pfu_sdb_entry(0).ld_da_iid := io.ld_da_iid
  x_ct_lsu_pfu_sdb_entry(0).ld_da_ldfifo_pc := io.ld_da_ldfifo_pc
  x_ct_lsu_pfu_sdb_entry(0).ld_da_pfu_act_dp_vld := io.ld_da_pfu_act_dp_vld
  x_ct_lsu_pfu_sdb_entry(0).ld_da_pfu_evict_cnt_vld := io.ld_da_pfu_evict_cnt_vld
  x_ct_lsu_pfu_sdb_entry(0).ld_da_pfu_pf_inst_vld := io.ld_da_pfu_pf_inst_vld
  x_ct_lsu_pfu_sdb_entry(0).ld_da_ppfu_va := io.ld_da_ppfu_va
  x_ct_lsu_pfu_sdb_entry(0).lsu_special_clk := io.lsu_special_clk
  x_ct_lsu_pfu_sdb_entry(0).pad_yy_icg_scan_en := io.pad_yy_icg_scan_en
  pfu_pop_all_part_vld := x_ct_lsu_pfu_sdb_entry(0).pfu_pop_all_part_vld
  pfu_sdb_create_pc := x_ct_lsu_pfu_sdb_entry(0).pfu_sdb_create_pc
  pfu_sdb_create_type_ld := x_ct_lsu_pfu_sdb_entry(0).pfu_sdb_create_type_ld
  pfu_sdb_entry_create_dp_vld(0) := x_ct_lsu_pfu_sdb_entry(0).pfu_sdb_entry_create_dp_vld_x
  pfu_sdb_entry_create_gateclk_en(0) := x_ct_lsu_pfu_sdb_entry(0).pfu_sdb_entry_create_gateclk_en_x
  pfu_sdb_entry_create_vld(0) := x_ct_lsu_pfu_sdb_entry(0).pfu_sdb_entry_create_vld_x
  pfu_sdb_entry_evict(0) := x_ct_lsu_pfu_sdb_entry(0).pfu_sdb_entry_evict_x
  pfu_sdb_entry_hit_pc(0) := x_ct_lsu_pfu_sdb_entry(0).pfu_sdb_entry_hit_pc_x
  pfu_sdb_entry_pc_0 := x_ct_lsu_pfu_sdb_entry(0).pfu_sdb_entry_pc_v
  pfu_sdb_entry_ready_grnt(0) := x_ct_lsu_pfu_sdb_entry(0).pfu_sdb_entry_ready_grnt_x
  pfu_sdb_entry_ready(0) := x_ct_lsu_pfu_sdb_entry(0).pfu_sdb_entry_ready_x
  pfu_sdb_entry_stride_neg(0) := x_ct_lsu_pfu_sdb_entry(0).pfu_sdb_entry_stride_neg_x
  pfu_sdb_entry_stride_0 := x_ct_lsu_pfu_sdb_entry(0).pfu_sdb_entry_stride_v
  pfu_sdb_entry_strideh_6to0_0 := x_ct_lsu_pfu_sdb_entry(0).pfu_sdb_entry_strideh_6to0_v
  pfu_sdb_entry_type_ld(0) := x_ct_lsu_pfu_sdb_entry(0).pfu_sdb_entry_type_ld_x
  pfu_sdb_entry_vld(0) := x_ct_lsu_pfu_sdb_entry(0).pfu_sdb_entry_vld_x
  x_ct_lsu_pfu_sdb_entry(0).rtu_yy_xx_commit0 := io.rtu_yy_xx_commit0
  x_ct_lsu_pfu_sdb_entry(0).rtu_yy_xx_commit0_iid := io.rtu_yy_xx_commit0_iid
  x_ct_lsu_pfu_sdb_entry(0).rtu_yy_xx_commit1 := io.rtu_yy_xx_commit1
  x_ct_lsu_pfu_sdb_entry(0).rtu_yy_xx_commit1_iid := io.rtu_yy_xx_commit1_iid
  x_ct_lsu_pfu_sdb_entry(0).rtu_yy_xx_commit2 := io.rtu_yy_xx_commit2
  x_ct_lsu_pfu_sdb_entry(0).rtu_yy_xx_commit2_iid := io.rtu_yy_xx_commit2_iid
  x_ct_lsu_pfu_sdb_entry(0).rtu_yy_xx_flush := io.rtu_yy_xx_flush
  sdb_timeout_cnt_val := x_ct_lsu_pfu_sdb_entry(0).sdb_timeout_cnt_val
  x_ct_lsu_pfu_sdb_entry(0).st_da_iid := io.st_da_iid
  x_ct_lsu_pfu_sdb_entry(0).st_da_pc := io.st_da_pc
  x_ct_lsu_pfu_sdb_entry(0).st_da_pfu_evict_cnt_vld := io.st_da_pfu_evict_cnt_vld
  x_ct_lsu_pfu_sdb_entry(0).st_da_pfu_pf_inst_vld := io.st_da_pfu_pf_inst_vld
  x_ct_lsu_pfu_sdb_entry(0).st_da_ppfu_va := io.st_da_ppfu_va

  // &ConnRule(s/_x$/[1]/); @186
  // &ConnRule(s/_v$/_1/); @187
  // &Instance("ct_lsu_pfu_sdb_entry","x_ct_lsu_pfu_sdb_entry_1"); @188
  x_ct_lsu_pfu_sdb_entry(1).amr_wa_cancel := io.amr_wa_cancel
  x_ct_lsu_pfu_sdb_entry(1).cp0_lsu_icg_en := io.cp0_lsu_icg_en
  x_ct_lsu_pfu_sdb_entry(1).cp0_lsu_l2_st_pref_en := io.cp0_lsu_l2_st_pref_en
  x_ct_lsu_pfu_sdb_entry(1).cp0_yy_clk_en := io.cp0_yy_clk_en
  x_ct_lsu_pfu_sdb_entry(1).cpurst_b := io.cpurst_b
  x_ct_lsu_pfu_sdb_entry(1).ld_da_iid := io.ld_da_iid
  x_ct_lsu_pfu_sdb_entry(1).ld_da_ldfifo_pc := io.ld_da_ldfifo_pc
  x_ct_lsu_pfu_sdb_entry(1).ld_da_pfu_act_dp_vld := io.ld_da_pfu_act_dp_vld
  x_ct_lsu_pfu_sdb_entry(1).ld_da_pfu_evict_cnt_vld := io.ld_da_pfu_evict_cnt_vld
  x_ct_lsu_pfu_sdb_entry(1).ld_da_pfu_pf_inst_vld := io.ld_da_pfu_pf_inst_vld
  x_ct_lsu_pfu_sdb_entry(1).ld_da_ppfu_va := io.ld_da_ppfu_va
  x_ct_lsu_pfu_sdb_entry(1).lsu_special_clk := io.lsu_special_clk
  x_ct_lsu_pfu_sdb_entry(1).pad_yy_icg_scan_en := io.pad_yy_icg_scan_en
  pfu_pop_all_part_vld := x_ct_lsu_pfu_sdb_entry(1).pfu_pop_all_part_vld
  pfu_sdb_create_pc := x_ct_lsu_pfu_sdb_entry(1).pfu_sdb_create_pc
  pfu_sdb_create_type_ld := x_ct_lsu_pfu_sdb_entry(1).pfu_sdb_create_type_ld
  pfu_sdb_entry_create_dp_vld(1) := x_ct_lsu_pfu_sdb_entry(1).pfu_sdb_entry_create_dp_vld_x
  pfu_sdb_entry_create_gateclk_en(1) := x_ct_lsu_pfu_sdb_entry(1).pfu_sdb_entry_create_gateclk_en_x
  pfu_sdb_entry_create_vld(1) := x_ct_lsu_pfu_sdb_entry(1).pfu_sdb_entry_create_vld_x
  pfu_sdb_entry_evict(1) := x_ct_lsu_pfu_sdb_entry(1).pfu_sdb_entry_evict_x
  pfu_sdb_entry_hit_pc(1) := x_ct_lsu_pfu_sdb_entry(1).pfu_sdb_entry_hit_pc_x
  pfu_sdb_entry_pc_1 := x_ct_lsu_pfu_sdb_entry(1).pfu_sdb_entry_pc_v
  pfu_sdb_entry_ready_grnt(1) := x_ct_lsu_pfu_sdb_entry(1).pfu_sdb_entry_ready_grnt_x
  pfu_sdb_entry_ready(1) := x_ct_lsu_pfu_sdb_entry(1).pfu_sdb_entry_ready_x
  pfu_sdb_entry_stride_neg(1) := x_ct_lsu_pfu_sdb_entry(1).pfu_sdb_entry_stride_neg_x
  pfu_sdb_entry_stride_1 := x_ct_lsu_pfu_sdb_entry(1).pfu_sdb_entry_stride_v
  pfu_sdb_entry_strideh_6to0_1 := x_ct_lsu_pfu_sdb_entry(1).pfu_sdb_entry_strideh_6to0_v
  pfu_sdb_entry_type_ld(1) := x_ct_lsu_pfu_sdb_entry(1).pfu_sdb_entry_type_ld_x
  pfu_sdb_entry_vld(1) := x_ct_lsu_pfu_sdb_entry(1).pfu_sdb_entry_vld_x
  x_ct_lsu_pfu_sdb_entry(1).rtu_yy_xx_commit0 := io.rtu_yy_xx_commit0
  x_ct_lsu_pfu_sdb_entry(1).rtu_yy_xx_commit0_iid := io.rtu_yy_xx_commit0_iid
  x_ct_lsu_pfu_sdb_entry(1).rtu_yy_xx_commit1 := io.rtu_yy_xx_commit1
  x_ct_lsu_pfu_sdb_entry(1).rtu_yy_xx_commit1_iid := io.rtu_yy_xx_commit1_iid
  x_ct_lsu_pfu_sdb_entry(1).rtu_yy_xx_commit2 := io.rtu_yy_xx_commit2
  x_ct_lsu_pfu_sdb_entry(1).rtu_yy_xx_commit2_iid := io.rtu_yy_xx_commit2_iid
  x_ct_lsu_pfu_sdb_entry(1).rtu_yy_xx_flush := io.rtu_yy_xx_flush
  sdb_timeout_cnt_val := x_ct_lsu_pfu_sdb_entry(1).sdb_timeout_cnt_val
  x_ct_lsu_pfu_sdb_entry(1).st_da_iid := io.st_da_iid
  x_ct_lsu_pfu_sdb_entry(1).st_da_pc := io.st_da_pc
  x_ct_lsu_pfu_sdb_entry(1).st_da_pfu_evict_cnt_vld := io.st_da_pfu_evict_cnt_vld
  x_ct_lsu_pfu_sdb_entry(1).st_da_pfu_pf_inst_vld := io.st_da_pfu_pf_inst_vld
  x_ct_lsu_pfu_sdb_entry(1).st_da_ppfu_va := io.st_da_ppfu_va

  //==========================================================
  //            Generate full/create signal of sdb
  //==========================================================
  //------------------pop pointer of pmb----------------------
  // &CombBeg; @194
  pfu_pmb_pop_ptr := 0.U
  when(pfu_pmb_entry_ready(0) === 1.U) {
    pfu_pmb_pop_ptr(0) := 1.U
  }
    .elsewhen(pfu_pmb_entry_ready(1) === 1.U) {
      pfu_pmb_pop_ptr(1) := 1.U
    }
    .elsewhen(pfu_pmb_entry_ready(2) === 1.U) {
      pfu_pmb_pop_ptr(2) := 1.U
    }
    .elsewhen(pfu_pmb_entry_ready(3) === 1.U) {
      pfu_pmb_pop_ptr(3) := 1.U
    }
    .elsewhen(pfu_pmb_entry_ready(4) === 1.U) {
      pfu_pmb_pop_ptr(4) := 1.U
    }
    .elsewhen(pfu_pmb_entry_ready(5) === 1.U) {
      pfu_pmb_pop_ptr(5) := 1.U
    }
    .elsewhen(pfu_pmb_entry_ready(6) === 1.U) {
      pfu_pmb_pop_ptr(6) := 1.U
    }
    .elsewhen(pfu_pmb_entry_ready(7) === 1.U) {
      pfu_pmb_pop_ptr(7) := 1.U
    }
    .otherwise {
      pfu_pmb_pop_ptr := 0.U
    }
  // &CombEnd; @207

  pfu_sdb_create_pc := (0 to 7).map { i =>
    Seq.fill(15)(pfu_pmb_pop_ptr(i)).reduce(_ ## _) & pfu_pmb_entry_pc(i)
  }.reduce(_ | _)

  pfu_sdb_create_type_ld := (pfu_pmb_pop_ptr.asUInt & pfu_pmb_entry_type_ld).orR

  //---------------------create pointer-----------------------
  //if it has empty entry, then create signal to empty entry,
  //else create siganl to evict entry,
  //else wait
  // &CombBeg; @225

  pfu_sdb_empty_create_ptr := 0.U
  when(pfu_sdb_entry_vld(0) === 0.U) {
    pfu_sdb_empty_create_ptr(0) := 1.U
  }
    .elsewhen(pfu_sdb_entry_vld(1) === 0.U) {
      pfu_sdb_empty_create_ptr(1) := 1.U
    }
    .otherwise {
      pfu_sdb_empty_create_ptr := 0
    }
  // &CombEnd; @232

  pfu_sdb_evict_create_ptr := 0.U
  when(pfu_sdb_entry_evict(0) === 0.U) {
    pfu_sdb_evict_create_ptr(0) := 1.U
  }
    .elsewhen(pfu_sdb_entry_evict(1) === 0.U) {
      pfu_sdb_evict_create_ptr(1) := 1.U
    }
    .otherwise {
      pfu_sdb_evict_create_ptr := 0
    }
  // &CombEnd; @241

  pfu_sdb_full := pfu_sdb_entry_vld.asUInt.andR
  pfu_sdb_has_evict := pfu_sdb_entry_evict.asUInt.orR
  pfu_sdb_create_ptr := pfu_sdb_empty_create_ptr
  when(pfu_sdb_full === 1.U.asBool) {
    pfu_sdb_create_ptr := pfu_sdb_create_ptr
  }

  //-------------------grnt signal of pmb---------------------
  pfu_pmb_ready_grnt := !pfu_sdb_full || pfu_sdb_has_evict
  pfu_pmb_entry_ready_grnt := (0 to 7).map(i => pfu_pmb_ready_grnt & pfu_pmb_pop_ptr(i)).reduce(_ ## _)

  //------------------create signal of sdb--------------------
  pfu_sdb_create_vld := pfu_pmb_entry_ready.orR
  pfu_sdb_create_dp_vld := pfu_sdb_create_vld;
  // &Force("output","pfu_sdb_create_gateclk_en"); @258
  pfu_sdb_create_gateclk_en := pfu_sdb_create_dp_vld;

  pfu_sdb_entry_create_vld := (pfu_sdb_create_vld ## pfu_sdb_create_vld) & pfu_sdb_create_ptr
  pfu_sdb_entry_create_dp_vld := (pfu_sdb_create_dp_vld ## pfu_sdb_create_dp_vld) & pfu_sdb_create_ptr
  pfu_sdb_entry_create_gateclk_en := (pfu_sdb_create_gateclk_en ## pfu_sdb_create_gateclk_en) & pfu_sdb_create_ptr

  //==========================================================
  //                 Instance pfb entry
  //==========================================================
  // &ConnRule(s/_x$/(0)/); @271
  // &ConnRule(s/_v$/_0/); @272
  // &Instance("ct_lsu_pfu_pfb_entry","x_ct_lsu_pfu_pfb_entry_0"); @273
  val x_ct_lsu_pfu_pfb_entry = VecInit(Seq.fill(8)(Module(new ct_lsu_pfu_pfb_entry).io));
  for (i <- 0 to 7) {
    ct_lsu_pfu_pfb_entry(i).amr_wa_cancel := io.amr_wa_cancel
    ct_lsu_pfu_pfb_entry(i).cp0_lsu_icg_en := io.cp0_lsu_icg_en
    ct_lsu_pfu_pfb_entry(i).cp0_lsu_l2_st_pref_en := io.cp0_lsu_l2_st_pref_en
    ct_lsu_pfu_pfb_entry(i).cp0_lsu_pfu_mmu_dis := io.cp0_lsu_pfu_mmu_dis
    ct_lsu_pfu_pfb_entry(i).cp0_yy_clk_en := io.cp0_yy_clk_en
    ct_lsu_pfu_pfb_entry(i).cp0_yy_priv_mode := io.cp0_yy_priv_mode
    ct_lsu_pfu_pfb_entry(i).cpurst_b := io.cpurst_b
    ct_lsu_pfu_pfb_entry(i).ld_da_ldfifo_pc := io.ld_da_ldfifo_pc
    ct_lsu_pfu_pfb_entry(i).ld_da_page_sec_ff := io.ld_da_page_sec_ff
    ct_lsu_pfu_pfb_entry(i).ld_da_page_share_ff := io.ld_da_page_share_ff
    ct_lsu_pfu_pfb_entry(i).ld_da_pfu_act_dp_vld := io.ld_da_pfu_act_dp_vld
    ct_lsu_pfu_pfb_entry(i).ld_da_pfu_act_vld := io.ld_da_pfu_act_vld
    ct_lsu_pfu_pfb_entry(i).ld_da_pfu_evict_cnt_vld := io.ld_da_pfu_evict_cnt_vld
    ct_lsu_pfu_pfb_entry(i).ld_da_pfu_pf_inst_vld := io.ld_da_pfu_pf_inst_vld
    ct_lsu_pfu_pfb_entry(i).ld_da_ppfu_va := io.ld_da_ppfu_va
    ct_lsu_pfu_pfb_entry(i).ld_da_ppn_ff := io.ld_da_ppn_ff
    ct_lsu_pfu_pfb_entry(i).lsu_pfu_l1_dist_sel := io.lsu_pfu_l1_dist_sel
    ct_lsu_pfu_pfb_entry(i).lsu_pfu_l2_dist_sel := io.lsu_pfu_l2_dist_sel
    ct_lsu_pfu_pfb_entry(i).lsu_special_clk := io.lsu_special_clk
    ct_lsu_pfu_pfb_entry(i).pad_yy_icg_scan_en := io.pad_yy_icg_scan_en
    io.pfb_no_req_cnt_val := ct_lsu_pfu_pfb_entry(i).pfb_no_req_cnt_val
    io.pfb_timeout_cnt_val := ct_lsu_pfu_pfb_entry(i).pfb_timeout_cnt_val
    io.pfu_biu_pe_req_sel_l1 := ct_lsu_pfu_pfb_entry(i).pfu_biu_pe_req_sel_l1
    io.pfu_dcache_pref_en := ct_lsu_pfu_pfb_entry(i).pfu_dcache_pref_en
    io.pfu_get_page_sec := ct_lsu_pfu_pfb_entry(i).pfu_get_page_sec
    io.pfu_get_page_share := ct_lsu_pfu_pfb_entry(i).pfu_get_page_share
    io.pfu_get_ppn := ct_lsu_pfu_pfb_entry(i).pfu_get_ppn
    io.pfu_get_ppn_err := ct_lsu_pfu_pfb_entry(i).pfu_get_ppn_err
    io.pfu_get_ppn_vld := ct_lsu_pfu_pfb_entry(i).pfu_get_ppn_vld
    io.pfu_l2_pref_en := ct_lsu_pfu_pfb_entry(i).pfu_l2_pref_en
    io.pfu_mmu_pe_req_sel_l1 := ct_lsu_pfu_pfb_entry(i).pfu_mmu_pe_req_sel_l1
    io.pfu_pfb_create_pc := ct_lsu_pfu_pfb_entry(i).pfu_pfb_create_pc
    io.pfu_pfb_create_stride := ct_lsu_pfu_pfb_entry(i).pfu_pfb_create_stride
    io.pfu_pfb_create_stride_neg := ct_lsu_pfu_pfb_entry(i).pfu_pfb_create_stride_neg
    io.pfu_pfb_create_strideh_6to0 := ct_lsu_pfu_pfb_entry(i).pfu_pfb_create_strideh_6to0
    io.pfu_pfb_create_type_ld := ct_lsu_pfu_pfb_entry(i).pfu_pfb_create_type_ld
    io.pfu_pfb_entry_biu_pe_req_grnt(i) := ct_lsu_pfu_pfb_entry(i).pfu_pfb_entry_biu_pe_req_grnt_x
    io.pfu_pfb_entry_biu_pe_req_src(i) := ct_lsu_pfu_pfb_entry(i).pfu_pfb_entry_biu_pe_req_src_v
    io.pfu_pfb_entry_biu_pe_req(i) := ct_lsu_pfu_pfb_entry(i).pfu_pfb_entry_biu_pe_req_x
    io.pfu_pfb_entry_create_dp_vld(i) := ct_lsu_pfu_pfb_entry(i).pfu_pfb_entry_create_dp_vld_x
    io.pfu_pfb_entry_create_gateclk_en(i) := ct_lsu_pfu_pfb_entry(i).pfu_pfb_entry_create_gateclk_en_x
    io.pfu_pfb_entry_create_vld(i) := ct_lsu_pfu_pfb_entry(i).pfu_pfb_entry_create_vld_x
    io.pfu_pfb_entry_evict(i) := ct_lsu_pfu_pfb_entry(i).pfu_pfb_entry_evict_x
    io.pfu_pfb_entry_from_lfb_dcache_hit(i) := ct_lsu_pfu_pfb_entry(i).pfu_pfb_entry_from_lfb_dcache_hit_x
    io.pfu_pfb_entry_from_lfb_dcache_miss(i) := ct_lsu_pfu_pfb_entry(i).pfu_pfb_entry_from_lfb_dcache_miss_x
    io.pfu_pfb_entry_hit_pc(i) := ct_lsu_pfu_pfb_entry(i).pfu_pfb_entry_hit_pc_x
    io.pfu_pfb_entry_l1_page_sec(i) := ct_lsu_pfu_pfb_entry(i).pfu_pfb_entry_l1_page_sec_x
    io.pfu_pfb_entry_l1_page_share(i) := ct_lsu_pfu_pfb_entry(i).pfu_pfb_entry_l1_page_share_x
    io.pfu_pfb_entry_l1_pf_addr(i) := ct_lsu_pfu_pfb_entry(i).pfu_pfb_entry_l1_pf_addr_v
    io.pfu_pfb_entry_l1_vpn(i) := ct_lsu_pfu_pfb_entry(i).pfu_pfb_entry_l1_vpn_v
    io.pfu_pfb_entry_l2_page_sec(i) := ct_lsu_pfu_pfb_entry(i).pfu_pfb_entry_l2_page_sec_x
    io.pfu_pfb_entry_l2_page_share(i) := ct_lsu_pfu_pfb_entry(i).pfu_pfb_entry_l2_page_share_x
    io.pfu_pfb_entry_l2_pf_addr(i) := ct_lsu_pfu_pfb_entry(i).pfu_pfb_entry_l2_pf_addr_v
    io.pfu_pfb_entry_l2_vpn(i) := ct_lsu_pfu_pfb_entry(i).pfu_pfb_entry_l2_vpn_v
    io.pfu_pfb_entry_mmu_pe_req_grnt(i) := ct_lsu_pfu_pfb_entry(i).pfu_pfb_entry_mmu_pe_req_grnt_x
    io.pfu_pfb_entry_mmu_pe_req_src(i) := ct_lsu_pfu_pfb_entry(i).pfu_pfb_entry_mmu_pe_req_src_v
    io.pfu_pfb_entry_mmu_pe_req(i) := ct_lsu_pfu_pfb_entry(i).pfu_pfb_entry_mmu_pe_req_x
    io.pfu_pfb_entry_priv_mode(i) := ct_lsu_pfu_pfb_entry(i).pfu_pfb_entry_priv_mode_v
    io.pfu_pfb_entry_vld(i) := ct_lsu_pfu_pfb_entry(i).pfu_pfb_entry_vld_x
    io.pfu_pop_all_part_vld := ct_lsu_pfu_pfb_entry(i).pfu_pop_all_part_vld
    ct_lsu_pfu_pfb_entry(i).st_da_page_sec_ff := io.st_da_page_sec_ff
    ct_lsu_pfu_pfb_entry(i).st_da_page_share_ff := io.st_da_page_share_ff
    ct_lsu_pfu_pfb_entry(i).st_da_pc := io.st_da_pc
    ct_lsu_pfu_pfb_entry(i).st_da_pfu_act_vld := io.st_da_pfu_act_vld
    ct_lsu_pfu_pfb_entry(i).st_da_pfu_evict_cnt_vld := io.st_da_pfu_evict_cnt_vld
    ct_lsu_pfu_pfb_entry(i).st_da_pfu_pf_inst_vld := io.st_da_pfu_pf_inst_vld
    ct_lsu_pfu_pfb_entry(i).st_da_ppfu_va := io.st_da_ppfu_va
    ct_lsu_pfu_pfb_entry(i).st_da_ppn_ff := io.st_da_ppn_ff
  }

  //==========================================================
  //            Generate full/create signal of pfb
  //==========================================================
  //------------------pop pointer of sdb----------------------
  // &CombBeg; @307

}

class gated_clk_cell_IO extends Bundle {
  val clk_in = Input(Clock());
  val global_en = Input(Bool());
  val module_en = Input(Bool());
  val local_en = Input(Bool());
  val external_en = Input(Bool());
  val pad_yy_icg_scan_en = Input(Bool());
  val clk_out = Output(Clock());
}

class gated_clk_cell extends RawModule {
  val io = IO(new gated_clk_cell_IO)

  private val clk_en_bf_latch = Wire(UInt(1.W));
  private val SE = Wire(UInt(1.W));

  clk_en_bf_latch := (io.global_en && (io.module_en || io.local_en)) || io.external_en
  SE := io.pad_yy_icg_scan_en
  io.clk_out := io.clk_in
}

class gated_clk_cell_IO extends Bundle {
  val clk_in = Input(Clock())
  val global_en = Input(Bool())
  val module_en = Input(Bool())
  val local_en = Input(Bool())
  val external_en = Input(Bool())
  val pad_yy_icg_scan_en = Input(Bool())
  val clk_out = Output(Clock())
}

class gated_clk_cell extends RawModule {
  val io = IO(new gated_clk_cell_IO)

  private val clk_en_bf_latch = Wire(UInt(1.W))
  private val SE = Wire(UInt(1.W))

  clk_en_bf_latch := (io.global_en && (io.module_en || io.local_en)) || io.external_en
  SE := io.pad_yy_icg_scan_en
  io.clk_out := io.clk_in
}