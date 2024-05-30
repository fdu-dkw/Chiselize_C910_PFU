package pfu

import chisel3._
import chisel3.util._

class MyIO extends Bundle {
  val amr_wa_cancel = Input(UInt(1.W))
  val bus_arb_pfu_ar_grnt = Input(Bool())
  val bus_arb_pfu_ar_ready = Input(Bool())
  val cp0_lsu_dcache_en = Input(Bool())
  val cp0_lsu_dcache_pref_en = Input(Bool())
  val cp0_lsu_icg_en = Input(UInt(1.W))
  val cp0_lsu_l2_pref_en = Input(UInt(1.W))
  val cp0_lsu_l2_st_pref_en = Input(UInt(1.W))
  val cp0_lsu_no_op_req = Input(Bool())
  val cp0_lsu_pfu_mmu_dis = Input(UInt(1.W))
  val cp0_lsu_timeout_cnt = Input(UInt(30.W))
  val cp0_yy_clk_en = Input(UInt(1.W))
  val cp0_yy_dcache_pref_en = Input(UInt(1.W))
  val cp0_yy_priv_mode = Input(UInt(2.W))
  val cpurst_b = Input(Bool())
  val forever_cpuclk = Input(Clock())
  val icc_idle = Input(Bool())
  val ld_da_iid = Input(UInt(7.W))
  val ld_da_ldfifo_pc = Input(UInt(15.W))
  val ld_da_page_sec_ff = Input(UInt(1.W))
  val ld_da_page_share_ff = Input(UInt(1.W))
  val ld_da_pfu_act_dp_vld = Input(Bool())
  val ld_da_pfu_act_vld = Input(Bool())
  val ld_da_pfu_biu_req_hit_idx = Input(Bool())
  val ld_da_pfu_evict_cnt_vld = Input(UInt(1.W))
  val ld_da_pfu_pf_inst_vld = Input(UInt(1.W))
  val ld_da_pfu_va = Input(UInt(40.W))
  val ld_da_ppfu_va = Input(UInt(40.W))
  val ld_da_ppn_ff = Input(UInt(28.W))
  val lfb_addr_full = Input(Bool())
  val lfb_addr_less2 = Input(Bool())
  val lfb_pfu_biu_req_hit_idx = Input(Bool())
  val lfb_pfu_create_id = Input(UInt(5.W))
  val lfb_pfu_dcache_hit = Input(UInt(9.W))
  val lfb_pfu_dcache_miss = Input(UInt(9.W))
  val lfb_pfu_rready_grnt = Input(Bool())
  val lm_pfu_biu_req_hit_idx = Input(Bool())
  val lsu_pfu_l1_dist_sel = Input(UInt(4.W))
  val lsu_pfu_l2_dist_sel = Input(UInt(4.W))
  val lsu_special_clk = Input(Clock())
  val mmu_lsu_pa2 = Input(UInt(28.W))
  val mmu_lsu_pa2_err = Input(UInt(1.W))
  val mmu_lsu_pa2_vld = Input(UInt(1.W))
  val mmu_lsu_sec2 = Input(UInt(1.W))
  val mmu_lsu_share2 = Input(UInt(1.W))
  val pad_yy_icg_scan_en = Input(UInt(1.W))
  val rb_pfu_biu_req_hit_idx = Input(Bool())
  val rb_pfu_nc_no_pending = Input(Bool())
  val rtu_yy_xx_commit0 = Input(UInt(1.W))
  val rtu_yy_xx_commit0_iid = Input(UInt(7.W))
  val rtu_yy_xx_commit1 = Input(UInt(1.W))
  val rtu_yy_xx_commit1_iid = Input(UInt(7.W))
  val rtu_yy_xx_commit2 = Input(UInt(1.W))
  val rtu_yy_xx_commit2_iid = Input(UInt(7.W))
  val rtu_yy_xx_flush = Input(UInt(1.W))
  val sq_pfu_pop_synci_inst = Input(Bool())
  val st_da_iid = Input(UInt(7.W))
  val st_da_page_sec_ff = Input(UInt(1.W))
  val st_da_page_share_ff = Input(UInt(1.W))
  val st_da_pc = Input(UInt(15.W))
  val st_da_pfu_act_dp_vld = Input(Bool())
  val st_da_pfu_act_vld = Input(Bool())
  val st_da_pfu_biu_req_hit_idx = Input(Bool())
  val st_da_pfu_evict_cnt_vld = Input(UInt(1.W))
  val st_da_pfu_pf_inst_vld = Input(UInt(1.W))
  val st_da_ppfu_va = Input(UInt(40.W))
  val st_da_ppn_ff = Input(UInt(28.W))
  val vb_pfu_biu_req_hit_idx = Input(Bool())
  val wmb_pfu_biu_req_hit_idx = Input(Bool())
  val lsu_mmu_va2 = Output(UInt(28.W))
  val lsu_mmu_va2_vld = Output(UInt(1.W))
  val pfu_biu_ar_addr = Output(UInt(40.W))
  val pfu_biu_ar_bar = Output(UInt(2.W))
  val pfu_biu_ar_burst = Output(UInt(2.W))
  val pfu_biu_ar_cache = Output(UInt(4.W))
  val pfu_biu_ar_domain = Output(UInt(2.W))
  val pfu_biu_ar_dp_req = Output(Bool())
  val pfu_biu_ar_id = Output(UInt(5.W))
  val pfu_biu_ar_len = Output(UInt(2.W))
  val pfu_biu_ar_lock = Output(UInt(1.W))
  val pfu_biu_ar_prot = Output(UInt(3.W))
  val pfu_biu_ar_req = Output(Bool())
  val pfu_biu_ar_req_gateclk_en = Output(Bool())
  val pfu_biu_ar_size = Output(UInt(3.W))
  val pfu_biu_ar_snoop = Output(UInt(4.W))
  val pfu_biu_ar_user = Output(UInt(3.W))
  val pfu_biu_req_addr = Output(UInt(40.W))
  val pfu_icc_ready = Output(UInt(1.W))
  val pfu_lfb_create_dp_vld = Output(UInt(1.W))
  val pfu_lfb_create_gateclk_en = Output(UInt(1.W))
  val pfu_lfb_create_req = Output(Bool())
  val pfu_lfb_create_vld = Output(Bool())
  val pfu_lfb_id = Output(UInt(4.W))
  val pfu_part_empty = Output(UInt(1.W))
  val pfu_pfb_empty = Output(Bool())
  val pfu_sdb_create_gateclk_en = Output(Bool())
  val pfu_sdb_empty = Output(Bool())
}

class ct_lsu_pfu() extends RawModule {
  val io = IO(new MyIO)

  val pfu_biu_pe_req_ptr_priority_0 = Wire(UInt(9.W))
  val pfu_biu_pe_req_ptr_priority_1 = Wire(UInt(9.W))
  val pfu_biu_req_addr_tto6 = Wire(UInt(34.W))
  val pfu_biu_req_l1 = Wire(Bool())
  val pfu_biu_req_page_sec = Wire(UInt(1.W))
  val pfu_biu_req_page_share = Wire(UInt(1.W))
  val pfu_biu_req_priority = Wire(UInt(9.W))
  val pfu_biu_req_priv_mode = Wire(UInt(2.W))
  val pfu_biu_req_ptr = Wire(UInt(9.W))
  val pfu_biu_req_unmask = Wire(Bool())
  val pfu_mmu_pe_req_ptr = Wire(UInt(9.W))
  val pfu_mmu_req = Wire(Bool())
  val pfu_mmu_req_l1 = Wire(UInt(1.W))
  val pfu_mmu_req_ptr = Wire(UInt(9.W))
  val pfu_mmu_req_vpn = Wire(UInt(28.W))
  val pfu_pfb_empty_create_ptr = Wire(UInt(8.W))
  val pfu_pfb_evict_create_ptr = Wire(UInt(8.W))
  val pfu_pmb_empty_create_ptr = Wire(UInt(8.W))
  val pfu_pmb_evict_create_ptr = Wire(UInt(8.W))
  val pfu_pmb_pop_ptr = Wire(UInt(8.W))
  val pfu_sdb_empty_create_ptr = Wire(UInt(2.W))
  val pfu_sdb_evict_create_ptr = Wire(UInt(2.W))
  val pfu_sdb_pop_ptr = Wire(UInt(2.W))


  val pfb_no_req_cnt_val = Wire(UInt(6.W))
  val pfb_timeout_cnt_val = Wire(UInt(8.W))
  val pfu_all_pfb_biu_pe_req = Wire(UInt(9.W))
  val pfu_all_pfb_biu_pe_req_ptiority_0 = Wire(UInt(9.W))
  val pfu_all_pfb_biu_pe_req_ptiority_1 = Wire(UInt(9.W))
  val pfu_all_pfb_mmu_pe_req = Wire(UInt(9.W))

  val pfu_biu_l1_pe_req_addr_tto6 = Wire(UInt(34.W))
  val pfu_biu_l1_pe_req_page_sec = Wire(UInt(1.W))
  val pfu_biu_l1_pe_req_page_share = Wire(UInt(1.W))
  val pfu_biu_l2_pe_req_addr_tto6 = Wire(UInt(34.W))
  val pfu_biu_l2_pe_req_page_sec = Wire(UInt(1.W))
  val pfu_biu_l2_pe_req_page_share = Wire(UInt(1.W))
  val pfu_biu_pe_clk = Wire(Clock())
  val pfu_biu_pe_clk_en = Wire(Bool())
  val pfu_biu_pe_req = Wire(Bool())
  val pfu_biu_pe_req_addr_tto6 = Wire(UInt(34.W))
  val pfu_biu_pe_req_grnt = Wire(Bool())
  val pfu_biu_pe_req_page_sec = Wire(UInt(1.W))
  val pfu_biu_pe_req_page_share = Wire(UInt(1.W))
  val pfu_biu_pe_req_priv_mode = Wire(UInt(2.W))
  val pfu_biu_pe_req_ptiority_0 = Wire(Bool())
  val pfu_biu_pe_req_ptr = Wire(UInt(9.W))
  val pfu_biu_pe_req_sel_l1 = Wire(Bool())
  val pfu_biu_pe_req_src = Wire(UInt(2.W))
  val pfu_biu_pe_update_permit = Wire(Bool())
  val pfu_biu_pe_update_vld = Wire(Bool())
  val pfu_biu_req_bus_grnt = Wire(Bool())
  val pfu_biu_req_grnt = Wire(Bool())
  val pfu_biu_req_hit_idx = Wire(Bool())
  val pfu_biu_req_priority_next = Wire(UInt(9.W))
  val pfu_dcache_pref_en = Wire(Bool())
  val pfu_get_page_sec = Wire(UInt(1.W))
  val pfu_get_page_share = Wire(UInt(1.W))
  val pfu_get_ppn = Wire(UInt(28.W))
  val pfu_get_ppn_err = Wire(UInt(1.W))
  val pfu_get_ppn_vld = Wire(Bool())

  val pfu_gpfb_biu_pe_req = Wire(UInt(1.W))
  val pfu_gpfb_biu_pe_req_grnt = Wire(UInt(1.W))
  val pfu_gpfb_biu_pe_req_src = Wire(UInt(2.W))
  val pfu_gpfb_from_lfb_dcache_hit = Wire(UInt(1.W))
  val pfu_gpfb_from_lfb_dcache_miss = Wire(UInt(1.W))
  val pfu_gpfb_l1_page_sec = Wire(UInt(1.W))
  val pfu_gpfb_l1_page_share = Wire(UInt(1.W))
  val pfu_gpfb_l1_pf_addr = Wire(UInt(40.W))
  val pfu_gpfb_l1_vpn = Wire(UInt(28.W))
  val pfu_gpfb_l2_page_sec = Wire(UInt(1.W))
  val pfu_gpfb_l2_page_share = Wire(UInt(1.W))
  val pfu_gpfb_l2_pf_addr = Wire(UInt(40.W))
  val pfu_gpfb_l2_vpn = Wire(UInt(28.W))
  val pfu_gpfb_mmu_pe_req = Wire(UInt(1.W))
  val pfu_gpfb_mmu_pe_req_grnt = Wire(Bool())
  val pfu_gpfb_mmu_pe_req_src = Wire(UInt(2.W))
  val pfu_gpfb_priv_mode = Wire(UInt(2.W))
  val pfu_gpfb_vld = Wire(Bool())
  val pfu_gsdb_gpfb_create_vld = Wire(Bool())
  val pfu_gsdb_gpfb_pop_req = Wire(Bool())
  val pfu_gsdb_stride = Wire(UInt(11.W))
  val pfu_gsdb_stride_neg = Wire(UInt(1.W))
  val pfu_gsdb_strideh_6to0 = Wire(UInt(7.W))
  val pfu_hit_pc = Wire(Bool())
  val pfu_l2_pref_en = Wire(Bool())
  val pfu_mmu_l1_pe_req_vpn = Wire(UInt(28.W))
  val pfu_mmu_l2_pe_req_vpn = Wire(UInt(28.W))
  val pfu_mmu_pe_clk = Wire(Clock())
  val pfu_mmu_pe_clk_en = Wire(UInt(1.W))
  val pfu_mmu_pe_req = Wire(Bool())
  val pfu_mmu_pe_req_sel_l1 = Wire(Bool())
  val pfu_mmu_pe_req_src = Wire(UInt(2.W))
  val pfu_mmu_pe_req_vpn = Wire(UInt(28.W))
  val pfu_mmu_pe_update_permit = Wire(Bool())
  val pfu_pfb_create_dp_vld = Wire(Bool())
  val pfu_pfb_create_gateclk_en = Wire(Bool())
  val pfu_pfb_create_pc = Wire(UInt(15.W))
  val pfu_pfb_create_ptr = Wire(UInt(8.W))
  val pfu_pfb_create_stride = Wire(UInt(11.W))
  val pfu_pfb_create_stride_neg = Wire(UInt(1.W))
  val pfu_pfb_create_strideh_6to0 = Wire(UInt(7.W))
  val pfu_pfb_create_type_ld = Wire(UInt(1.W))
  val pfu_pfb_create_vld = Wire(Bool())
  val pfu_pfb_entry_biu_pe_req = Wire(Vec(8, UInt(1.W)))
  val pfu_pfb_entry_biu_pe_req_grnt = Wire(UInt(8.W))
  val pfu_pfb_entry_biu_pe_req_src = Wire(Vec(8, UInt(2.W)))
  val pfu_pfb_entry_create_dp_vld = Wire(UInt(8.W))
  val pfu_pfb_entry_create_gateclk_en = Wire(UInt(8.W))
  val pfu_pfb_entry_create_vld = Wire(UInt(8.W))
  val pfu_pfb_entry_evict = Wire(Vec(8, UInt(1.W)))
  val pfu_pfb_entry_from_lfb_dcache_hit = Wire(UInt(8.W))
  val pfu_pfb_entry_from_lfb_dcache_miss = Wire(UInt(8.W))
  val pfu_pfb_entry_hit_pc = Wire(Vec(8, UInt(1.W)))
  val pfu_pfb_entry_l1_page_sec = Wire(Vec(8, UInt(1.W)))
  val pfu_pfb_entry_l1_page_share = Wire(Vec(8, UInt(1.W)))
  val pfu_pfb_entry_l1_pf_addr = Wire(Vec(8, UInt(40.W)))
  val pfu_pfb_entry_l1_vpn = Wire(Vec(8, UInt(28.W)))
  val pfu_pfb_entry_l2_page_sec = Wire(Vec(8, UInt(1.W)))
  val pfu_pfb_entry_l2_page_share = Wire(Vec(8, UInt(1.W)))
  val pfu_pfb_entry_l2_pf_addr = Wire(Vec(8, UInt(40.W)))
  val pfu_pfb_entry_l2_vpn = Wire(Vec(8, UInt(28.W)))
  val pfu_pfb_entry_mmu_pe_req = Wire(Vec(8, UInt(1.W)))
  val pfu_pfb_entry_mmu_pe_req_grnt = Wire(UInt(8.W))
  val pfu_pfb_entry_mmu_pe_req_src = Wire(Vec(8, UInt(2.W)))
  val pfu_pfb_entry_priv_mode = Wire(Vec(8, UInt(2.W)))
  val pfu_pfb_entry_vld = Wire(Vec(8, UInt(1.W)))
  val pfu_pfb_full = Wire(Bool())
  val pfu_pfb_has_evict = Wire(Bool())
  val pfu_pfb_hit_pc = Wire(Bool())
  val pfu_pmb_create_dp_vld = Wire(Bool())
  val pfu_pmb_create_gateclk_en = Wire(Bool())
  val pfu_pmb_create_ptr = Wire(UInt(8.W))
  val pfu_pmb_create_vld = Wire(Bool())
  val pfu_pmb_empty = Wire(Bool())
  val pfu_pmb_entry_create_dp_vld = Wire(UInt(8.W))
  val pfu_pmb_entry_create_gateclk_en = Wire(UInt(8.W))
  val pfu_pmb_entry_create_vld = Wire(UInt(8.W))
  val pfu_pmb_entry_evict = Wire(Vec(8, UInt(1.W)))
  val pfu_pmb_entry_hit_pc = Wire(Vec(8, UInt(1.W)))
  val pfu_pmb_entry_pc = Wire(Vec(8, UInt(15.W)))
  val pfu_pmb_entry_ready = Wire(Vec(8, UInt(1.W)))
  val pfu_pmb_entry_ready_grnt = Wire(UInt(8.W))
  val pfu_pmb_entry_type_ld = Wire(Vec(8, UInt(1.W)))
  val pfu_pmb_entry_vld = Wire(Vec(8, UInt(1.W)))
  val pfu_pmb_full = Wire(UInt(1.W))
  val pfu_pmb_hit_pc = Wire(Bool())
  val pfu_pmb_ready_grnt = Wire(Bool())
  val pfu_pop_all_part_vld = Wire(Bool())
  val pfu_pop_all_vld = Wire(Bool())
  val pfu_sdb_create_dp_vld = Wire(UInt(1.W))
  val pfu_sdb_create_gateclk_en = Wire(Bool())
  val pfu_sdb_create_pc = Wire(UInt(15.W))
  val pfu_sdb_create_ptr = Wire(UInt(2.W))
  val pfu_sdb_create_type_ld = Wire(UInt(1.W))
  val pfu_sdb_create_vld = Wire(Bool())
  val pfu_sdb_entry_create_dp_vld = Wire(UInt(2.W))
  val pfu_sdb_entry_create_gateclk_en = Wire(UInt(2.W))
  val pfu_sdb_entry_create_vld = Wire(UInt(2.W))
  val pfu_sdb_entry_evict = Wire(Vec(2, UInt(1.W)))
  val pfu_sdb_entry_hit_pc = Wire(Vec(2, UInt(1.W)))
  val pfu_sdb_entry_pc = Wire(Vec(2, UInt(15.W)))
  val pfu_sdb_entry_ready = Wire(Vec(2, UInt(1.W)))
  val pfu_sdb_entry_ready_grnt = Wire(UInt(2.W))
  val pfu_sdb_entry_stride = Wire(Vec(2, UInt(11.W)))
  val pfu_sdb_entry_stride_neg = Wire(Vec(2, UInt(1.W)))
  val pfu_sdb_entry_strideh_6to0 = Wire(Vec(2, UInt(7.W)))
  val pfu_sdb_entry_type_ld = Wire(Vec(2, UInt(1.W)))
  val pfu_sdb_entry_vld = Wire(Vec(2, UInt(1.W)))
  val pfu_sdb_full = Wire(Bool())
  val pfu_sdb_has_evict = Wire(Bool())
  val pfu_sdb_hit_pc = Wire(Bool())
  val pfu_sdb_ready_grnt = Wire(UInt(1.W))
  val pipe_create_dp_vld = Wire(Bool())
  val pipe_create_pc = Wire(UInt(15.W))
  val pipe_create_vld = Wire(Bool())
  val pmb_timeout_cnt_val = Wire(UInt(8.W))
  val sdb_timeout_cnt_val = Wire(UInt(8.W))

  val PMB_ENTRY = 8.U
  val SDB_ENTRY = 2.U
  val PFB_ENTRY = 8.U
  val PC_LEN = 15.U
  val BIU_R_L2PREF_ID = 25.U

  //=========================================================
  //                Instance of Gated Cell  
  //=========================================================
  //-------------------mmu req pop entry---------------------
  pfu_mmu_pe_clk_en := pfu_get_ppn_vld.asBool || pfu_mmu_pe_req

  val x_lsu_pfu_mmu_pe_gated_clk = Module(new gated_clk_cell)
  x_lsu_pfu_mmu_pe_gated_clk.io.clk_in := io.forever_cpuclk
  pfu_mmu_pe_clk := x_lsu_pfu_mmu_pe_gated_clk.io.clk_out
  x_lsu_pfu_mmu_pe_gated_clk.io.external_en := 0.U.asBool
  x_lsu_pfu_mmu_pe_gated_clk.io.global_en := io.cp0_yy_clk_en
  pfu_mmu_pe_clk_en := x_lsu_pfu_mmu_pe_gated_clk.io.local_en
  x_lsu_pfu_mmu_pe_gated_clk.io.module_en := io.cp0_lsu_icg_en
  x_lsu_pfu_mmu_pe_gated_clk.io.pad_yy_icg_scan_en := io.pad_yy_icg_scan_en

  //--------------------biu req pop entry---------------------
  pfu_biu_pe_clk_en := pfu_biu_pe_req || pfu_biu_req_unmask

  val x_lsu_pfu_biu_pe_gated_clk = Module(new gated_clk_cell)
  x_lsu_pfu_biu_pe_gated_clk.io.clk_in := io.forever_cpuclk
  pfu_biu_pe_clk := x_lsu_pfu_biu_pe_gated_clk.io.clk_out
  x_lsu_pfu_biu_pe_gated_clk.io.external_en := 0.U.asBool
  x_lsu_pfu_biu_pe_gated_clk.io.global_en := io.cp0_yy_clk_en
  pfu_biu_pe_clk_en := x_lsu_pfu_biu_pe_gated_clk.io.local_en
  x_lsu_pfu_biu_pe_gated_clk.io.module_en := io.cp0_lsu_icg_en
  x_lsu_pfu_biu_pe_gated_clk.io.pad_yy_icg_scan_en := io.pad_yy_icg_scan_en

  //==========================================================
  //                 Instance pmb entry
  //==========================================================
  //  val x_ct_lsu_pfu_pmb_entry = VecInit(Seq.fill(8)(Module(new ct_lsu_pfu_pmb_entry).io))
  val x_ct_lsu_pfu_pmb_entry = List(
    Module(new ct_lsu_pfu_pmb_entry).io,
    Module(new ct_lsu_pfu_pmb_entry).io,
    Module(new ct_lsu_pfu_pmb_entry).io,
    Module(new ct_lsu_pfu_pmb_entry).io,
    Module(new ct_lsu_pfu_pmb_entry).io,
    Module(new ct_lsu_pfu_pmb_entry).io,
    Module(new ct_lsu_pfu_pmb_entry).io,
    Module(new ct_lsu_pfu_pmb_entry).io
  )
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
    x_ct_lsu_pfu_pmb_entry(i).pfu_pmb_entry_create_dp_vld_x := pfu_pmb_entry_create_dp_vld(i)
    x_ct_lsu_pfu_pmb_entry(i).pfu_pmb_entry_create_gateclk_en_x := pfu_pmb_entry_create_gateclk_en(i)
    x_ct_lsu_pfu_pmb_entry(i).pfu_pmb_entry_create_vld_x := pfu_pmb_entry_create_vld(i)
    pfu_pmb_entry_evict(i) := x_ct_lsu_pfu_pmb_entry(i).pfu_pmb_entry_evict_x
    pfu_pmb_entry_hit_pc(i) := x_ct_lsu_pfu_pmb_entry(i).pfu_pmb_entry_hit_pc_x
    pfu_pmb_entry_pc(i) := x_ct_lsu_pfu_pmb_entry(i).pfu_pmb_entry_pc_v
    x_ct_lsu_pfu_pmb_entry(i).pfu_pmb_entry_ready_grnt_x := pfu_pmb_entry_ready_grnt(i)
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
  pfu_pmb_empty_create_ptr := MuxCase(default = 0.U(8.W), (0 to 7).map { i =>
    pfu_pmb_entry_vld(i).asBool -> (1.U(8.W) << i)
  })
  pfu_pmb_evict_create_ptr := MuxCase(default = 0.U(8.W), (0 to 7).map { i =>
    pfu_pmb_entry_evict(i).asBool -> (1.U(8.W) << i)
  })
  pfu_pmb_full := pfu_pmb_entry_vld.asUInt.andR
  pfu_pmb_create_ptr := pfu_pmb_empty_create_ptr
  when(pfu_pmb_full === 1.U) {
    pfu_pmb_create_ptr := pfu_pmb_evict_create_ptr
  }

  //==========================================================
  //            pipe info create select
  //==========================================================
  //when ld and st create pmu simultaneously,ld has higher priority
  pipe_create_pc := io.st_da_pc
  when(io.ld_da_pfu_act_dp_vld === 1.U) {
    pipe_create_pc := io.ld_da_ldfifo_pc
  }

  pipe_create_vld := io.ld_da_pfu_act_vld || io.st_da_pfu_act_vld && !io.ld_da_pfu_act_dp_vld

  pipe_create_dp_vld := io.ld_da_pfu_act_dp_vld || io.st_da_pfu_act_dp_vld

  //------------------------hit pc----------------------------
  pfu_pmb_hit_pc := pfu_pmb_entry_hit_pc.asUInt.orR
  pfu_sdb_hit_pc := pfu_sdb_entry_hit_pc.asUInt.orR
  pfu_pfb_hit_pc := pfu_pfb_entry_hit_pc.asUInt.orR
  pfu_hit_pc := pfu_pmb_hit_pc || pfu_sdb_hit_pc || pfu_pfb_hit_pc
  //-------------------create signal--------------------------
  pfu_pmb_create_vld := pipe_create_vld && !pfu_hit_pc && !pfu_gpfb_vld
  pfu_pmb_create_dp_vld := pipe_create_dp_vld && !pfu_hit_pc && !pfu_gpfb_vld
  pfu_pmb_create_gateclk_en := pipe_create_dp_vld && !pfu_gpfb_vld

  pfu_pmb_entry_create_vld := Mux(pfu_pmb_create_vld, pfu_pmb_create_ptr, 0.U)
  pfu_pmb_entry_create_dp_vld := Mux(pfu_pmb_create_dp_vld, pfu_pmb_create_ptr, 0.U)
  pfu_pmb_entry_create_gateclk_en := Mux(pfu_pmb_create_gateclk_en, pfu_pmb_create_ptr, 0.U)


  //==========================================================
  //                 Instance sdb entry
  //==========================================================
  //  val x_ct_lsu_pfu_sdb_entry = VecInit(Seq.fill(2)(Module(new ct_lsu_pfu_sdb_entry).io))
  val x_ct_lsu_pfu_sdb_entry = List(Module(new ct_lsu_pfu_sdb_entry).io, Module(new ct_lsu_pfu_sdb_entry).io)
  for (i <- 0 to 1) {
    x_ct_lsu_pfu_sdb_entry(i).amr_wa_cancel := io.amr_wa_cancel
    x_ct_lsu_pfu_sdb_entry(i).cp0_lsu_icg_en := io.cp0_lsu_icg_en
    x_ct_lsu_pfu_sdb_entry(i).cp0_lsu_l2_st_pref_en := io.cp0_lsu_l2_st_pref_en
    x_ct_lsu_pfu_sdb_entry(i).cp0_yy_clk_en := io.cp0_yy_clk_en
    x_ct_lsu_pfu_sdb_entry(i).cpurst_b := io.cpurst_b
    x_ct_lsu_pfu_sdb_entry(i).ld_da_iid := io.ld_da_iid
    x_ct_lsu_pfu_sdb_entry(i).ld_da_ldfifo_pc := io.ld_da_ldfifo_pc
    x_ct_lsu_pfu_sdb_entry(i).ld_da_pfu_act_dp_vld := io.ld_da_pfu_act_dp_vld
    x_ct_lsu_pfu_sdb_entry(i).ld_da_pfu_evict_cnt_vld := io.ld_da_pfu_evict_cnt_vld
    x_ct_lsu_pfu_sdb_entry(i).ld_da_pfu_pf_inst_vld := io.ld_da_pfu_pf_inst_vld
    x_ct_lsu_pfu_sdb_entry(i).ld_da_ppfu_va := io.ld_da_ppfu_va
    x_ct_lsu_pfu_sdb_entry(i).lsu_special_clk := io.lsu_special_clk
    x_ct_lsu_pfu_sdb_entry(i).pad_yy_icg_scan_en := io.pad_yy_icg_scan_en
    x_ct_lsu_pfu_sdb_entry(i).pfu_pop_all_part_vld := pfu_pop_all_part_vld
    x_ct_lsu_pfu_sdb_entry(i).pfu_sdb_create_pc := pfu_sdb_create_pc
    x_ct_lsu_pfu_sdb_entry(i).pfu_sdb_create_type_ld := pfu_sdb_create_type_ld
    x_ct_lsu_pfu_sdb_entry(i).pfu_sdb_entry_create_dp_vld_x := pfu_sdb_entry_create_dp_vld(i)
    x_ct_lsu_pfu_sdb_entry(i).pfu_sdb_entry_create_gateclk_en_x := pfu_sdb_entry_create_gateclk_en(i)
    x_ct_lsu_pfu_sdb_entry(i).pfu_sdb_entry_create_vld_x := pfu_sdb_entry_create_vld(i)
    pfu_sdb_entry_evict(i) := x_ct_lsu_pfu_sdb_entry(i).pfu_sdb_entry_evict_x
    pfu_sdb_entry_hit_pc(i) := x_ct_lsu_pfu_sdb_entry(i).pfu_sdb_entry_hit_pc_x
    pfu_sdb_entry_pc(i) := x_ct_lsu_pfu_sdb_entry(i).pfu_sdb_entry_pc_v
    x_ct_lsu_pfu_sdb_entry(i).pfu_sdb_entry_ready_grnt_x := pfu_sdb_entry_ready_grnt(i)
    pfu_sdb_entry_ready(i) := x_ct_lsu_pfu_sdb_entry(i).pfu_sdb_entry_ready_x
    pfu_sdb_entry_stride_neg(i) := x_ct_lsu_pfu_sdb_entry(i).pfu_sdb_entry_stride_neg_x
    pfu_sdb_entry_stride(i) := x_ct_lsu_pfu_sdb_entry(i).pfu_sdb_entry_stride_v
    pfu_sdb_entry_strideh_6to0(i) := x_ct_lsu_pfu_sdb_entry(i).pfu_sdb_entry_strideh_6to0_v
    pfu_sdb_entry_type_ld(i) := x_ct_lsu_pfu_sdb_entry(i).pfu_sdb_entry_type_ld_x
    pfu_sdb_entry_vld(i) := x_ct_lsu_pfu_sdb_entry(i).pfu_sdb_entry_vld_x
    x_ct_lsu_pfu_sdb_entry(i).rtu_yy_xx_commit0 := io.rtu_yy_xx_commit0
    x_ct_lsu_pfu_sdb_entry(i).rtu_yy_xx_commit0_iid := io.rtu_yy_xx_commit0_iid
    x_ct_lsu_pfu_sdb_entry(i).rtu_yy_xx_commit1 := io.rtu_yy_xx_commit1
    x_ct_lsu_pfu_sdb_entry(i).rtu_yy_xx_commit1_iid := io.rtu_yy_xx_commit1_iid
    x_ct_lsu_pfu_sdb_entry(i).rtu_yy_xx_commit2 := io.rtu_yy_xx_commit2
    x_ct_lsu_pfu_sdb_entry(i).rtu_yy_xx_commit2_iid := io.rtu_yy_xx_commit2_iid
    x_ct_lsu_pfu_sdb_entry(i).rtu_yy_xx_flush := io.rtu_yy_xx_flush
    sdb_timeout_cnt_val := x_ct_lsu_pfu_sdb_entry(i).sdb_timeout_cnt_val
    x_ct_lsu_pfu_sdb_entry(i).st_da_iid := io.st_da_iid
    x_ct_lsu_pfu_sdb_entry(i).st_da_pc := io.st_da_pc
    x_ct_lsu_pfu_sdb_entry(i).st_da_pfu_evict_cnt_vld := io.st_da_pfu_evict_cnt_vld
    x_ct_lsu_pfu_sdb_entry(i).st_da_pfu_pf_inst_vld := io.st_da_pfu_pf_inst_vld
    x_ct_lsu_pfu_sdb_entry(i).st_da_ppfu_va := io.st_da_ppfu_va
  }

  //==========================================================
  //            Generate full/create signal of sdb
  //==========================================================
  //------------------pop pointer of pmb----------------------
  pfu_pmb_pop_ptr := MuxCase(default = 0.U(8.W), (0 to 7).map { i =>
    pfu_pmb_entry_ready(i).asBool -> (1.U(8.W) << i)
  })

  pfu_sdb_create_pc := (0 to 7).map { i =>
    Mux(pfu_pmb_pop_ptr(i).asBool, pfu_pmb_entry_pc(i), 0.U)
  }.reduce(_ | _)

  pfu_sdb_create_type_ld := (pfu_pmb_pop_ptr & pfu_pmb_entry_type_ld.asUInt).orR

  //---------------------create pointer-----------------------
  //if it has empty entry, then create signal to empty entry,
  //else create signal to evict entry,
  //else wait
  pfu_sdb_empty_create_ptr := MuxCase(0.U(2.W), Seq(
    (pfu_sdb_entry_vld(0) === 0.U) -> 1.U(2.W),
    (pfu_sdb_entry_vld(1) === 0.U) -> 2.U(2.W)
  ))

  pfu_sdb_evict_create_ptr := MuxCase(0.U(2.W), Seq(
    (pfu_sdb_entry_evict(0) === 1.U) -> 1.U(2.W),
    (pfu_sdb_entry_evict(1) === 1.U) -> 2.U(2.W)
  ))


  pfu_sdb_full := pfu_sdb_entry_vld.asUInt.andR
  pfu_sdb_has_evict := pfu_sdb_entry_evict.asUInt.orR
  pfu_sdb_create_ptr := pfu_sdb_empty_create_ptr
  when(pfu_sdb_full === true.B) {
    pfu_sdb_create_ptr := pfu_sdb_evict_create_ptr
  }.otherwise {
    pfu_sdb_create_ptr := pfu_sdb_empty_create_ptr
  }

  //-------------------grnt signal of pmb---------------------
  pfu_pmb_ready_grnt := !pfu_sdb_full || pfu_sdb_has_evict
  pfu_pmb_entry_ready_grnt := (0 to 7).map { i =>
    pfu_pmb_ready_grnt.asUInt & pfu_pmb_pop_ptr(i)
  }.reduce(_ ## _)

  //------------------create signal of sdb--------------------
  pfu_sdb_create_vld := pfu_pmb_entry_ready.reduce(_ | _).asBool
  pfu_sdb_create_dp_vld := pfu_sdb_create_vld
  pfu_sdb_create_gateclk_en := pfu_sdb_create_dp_vld
  io.pfu_sdb_create_gateclk_en := pfu_sdb_create_gateclk_en
  pfu_sdb_entry_create_vld := (pfu_sdb_create_vld ## pfu_sdb_create_vld) & pfu_sdb_create_ptr
  pfu_sdb_entry_create_dp_vld := (pfu_sdb_create_dp_vld ## pfu_sdb_create_dp_vld) & pfu_sdb_create_ptr
  pfu_sdb_entry_create_gateclk_en := (pfu_sdb_create_gateclk_en ## pfu_sdb_create_gateclk_en) & pfu_sdb_create_ptr

  //==========================================================
  //                 Instance pfb entry
  //==========================================================
  //  val x_ct_lsu_pfu_pfb_entry = VecInit(Seq.fill(8)(Module(new ct_lsu_pfu_pfb_entry).io))
  val x_ct_lsu_pfu_pfb_entry = List(
    Module(new ct_lsu_pfu_pfb_entry).io,
    Module(new ct_lsu_pfu_pfb_entry).io,
    Module(new ct_lsu_pfu_pfb_entry).io,
    Module(new ct_lsu_pfu_pfb_entry).io,
    Module(new ct_lsu_pfu_pfb_entry).io,
    Module(new ct_lsu_pfu_pfb_entry).io,
    Module(new ct_lsu_pfu_pfb_entry).io,
    Module(new ct_lsu_pfu_pfb_entry).io
  )
  for (i <- 0 to 7) {
    x_ct_lsu_pfu_pfb_entry(i).amr_wa_cancel := io.amr_wa_cancel
    x_ct_lsu_pfu_pfb_entry(i).cp0_lsu_icg_en := io.cp0_lsu_icg_en
    x_ct_lsu_pfu_pfb_entry(i).cp0_lsu_l2_st_pref_en := io.cp0_lsu_l2_st_pref_en
    x_ct_lsu_pfu_pfb_entry(i).cp0_lsu_pfu_mmu_dis := io.cp0_lsu_pfu_mmu_dis
    x_ct_lsu_pfu_pfb_entry(i).cp0_yy_clk_en := io.cp0_yy_clk_en
    x_ct_lsu_pfu_pfb_entry(i).cp0_yy_priv_mode := io.cp0_yy_priv_mode
    x_ct_lsu_pfu_pfb_entry(i).cpurst_b := io.cpurst_b
    x_ct_lsu_pfu_pfb_entry(i).ld_da_ldfifo_pc := io.ld_da_ldfifo_pc
    x_ct_lsu_pfu_pfb_entry(i).ld_da_page_sec_ff := io.ld_da_page_sec_ff
    x_ct_lsu_pfu_pfb_entry(i).ld_da_page_share_ff := io.ld_da_page_share_ff
    x_ct_lsu_pfu_pfb_entry(i).ld_da_pfu_act_dp_vld := io.ld_da_pfu_act_dp_vld
    x_ct_lsu_pfu_pfb_entry(i).ld_da_pfu_act_vld := io.ld_da_pfu_act_vld
    x_ct_lsu_pfu_pfb_entry(i).ld_da_pfu_evict_cnt_vld := io.ld_da_pfu_evict_cnt_vld
    x_ct_lsu_pfu_pfb_entry(i).ld_da_pfu_pf_inst_vld := io.ld_da_pfu_pf_inst_vld
    x_ct_lsu_pfu_pfb_entry(i).ld_da_ppfu_va := io.ld_da_ppfu_va
    x_ct_lsu_pfu_pfb_entry(i).ld_da_ppn_ff := io.ld_da_ppn_ff
    x_ct_lsu_pfu_pfb_entry(i).lsu_pfu_l1_dist_sel := io.lsu_pfu_l1_dist_sel
    x_ct_lsu_pfu_pfb_entry(i).lsu_pfu_l2_dist_sel := io.lsu_pfu_l2_dist_sel
    x_ct_lsu_pfu_pfb_entry(i).lsu_special_clk := io.lsu_special_clk.asBool
    x_ct_lsu_pfu_pfb_entry(i).pad_yy_icg_scan_en := io.pad_yy_icg_scan_en
    pfb_no_req_cnt_val := x_ct_lsu_pfu_pfb_entry(i).pfb_no_req_cnt_val
    pfb_timeout_cnt_val := x_ct_lsu_pfu_pfb_entry(i).pfb_timeout_cnt_val
    pfu_biu_pe_req_sel_l1 := x_ct_lsu_pfu_pfb_entry(i).pfu_biu_pe_req_sel_l1
    pfu_dcache_pref_en := x_ct_lsu_pfu_pfb_entry(i).pfu_dcache_pref_en
    pfu_get_page_sec := x_ct_lsu_pfu_pfb_entry(i).pfu_get_page_sec
    pfu_get_page_share := x_ct_lsu_pfu_pfb_entry(i).pfu_get_page_share
    pfu_get_ppn := x_ct_lsu_pfu_pfb_entry(i).pfu_get_ppn
    pfu_get_ppn_err := x_ct_lsu_pfu_pfb_entry(i).pfu_get_ppn_err
    pfu_get_ppn_vld := x_ct_lsu_pfu_pfb_entry(i).pfu_get_ppn_vld
    pfu_l2_pref_en := x_ct_lsu_pfu_pfb_entry(i).pfu_l2_pref_en
    pfu_mmu_pe_req_sel_l1 := x_ct_lsu_pfu_pfb_entry(i).pfu_mmu_pe_req_sel_l1
    pfu_pfb_create_pc := x_ct_lsu_pfu_pfb_entry(i).pfu_pfb_create_pc
    pfu_pfb_create_stride := x_ct_lsu_pfu_pfb_entry(i).pfu_pfb_create_stride
    pfu_pfb_create_stride_neg := x_ct_lsu_pfu_pfb_entry(i).pfu_pfb_create_stride_neg
    pfu_pfb_create_strideh_6to0 := x_ct_lsu_pfu_pfb_entry(i).pfu_pfb_create_strideh_6to0
    pfu_pfb_create_type_ld := x_ct_lsu_pfu_pfb_entry(i).pfu_pfb_create_type_ld
    x_ct_lsu_pfu_pfb_entry(i).pfu_pfb_entry_biu_pe_req_grnt_x := pfu_pfb_entry_biu_pe_req_grnt(i)
    pfu_pfb_entry_biu_pe_req_src(i) := x_ct_lsu_pfu_pfb_entry(i).pfu_pfb_entry_biu_pe_req_src_v
    pfu_pfb_entry_biu_pe_req(i) := x_ct_lsu_pfu_pfb_entry(i).pfu_pfb_entry_biu_pe_req_x
    x_ct_lsu_pfu_pfb_entry(i).pfu_pfb_entry_create_dp_vld_x := pfu_pfb_entry_create_dp_vld(i)
    x_ct_lsu_pfu_pfb_entry(i).pfu_pfb_entry_create_gateclk_en_x := pfu_pfb_entry_create_gateclk_en(i)
    x_ct_lsu_pfu_pfb_entry(i).pfu_pfb_entry_create_vld_x := pfu_pfb_entry_create_vld(i)
    pfu_pfb_entry_evict(i) := x_ct_lsu_pfu_pfb_entry(i).pfu_pfb_entry_evict_x
    x_ct_lsu_pfu_pfb_entry(i).pfu_pfb_entry_from_lfb_dcache_hit_x := pfu_pfb_entry_from_lfb_dcache_hit(i)
    x_ct_lsu_pfu_pfb_entry(i).pfu_pfb_entry_from_lfb_dcache_miss_x := pfu_pfb_entry_from_lfb_dcache_miss(i)
    pfu_pfb_entry_hit_pc(i) := x_ct_lsu_pfu_pfb_entry(i).pfu_pfb_entry_hit_pc_x
    pfu_pfb_entry_l1_page_sec(i) := x_ct_lsu_pfu_pfb_entry(i).pfu_pfb_entry_l1_page_sec_x
    pfu_pfb_entry_l1_page_share(i) := x_ct_lsu_pfu_pfb_entry(i).pfu_pfb_entry_l1_page_share_x
    pfu_pfb_entry_l1_pf_addr(i) := x_ct_lsu_pfu_pfb_entry(i).pfu_pfb_entry_l1_pf_addr_v
    pfu_pfb_entry_l1_vpn(i) := x_ct_lsu_pfu_pfb_entry(i).pfu_pfb_entry_l1_vpn_v
    pfu_pfb_entry_l2_page_sec(i) := x_ct_lsu_pfu_pfb_entry(i).pfu_pfb_entry_l2_page_sec_x
    pfu_pfb_entry_l2_page_share(i) := x_ct_lsu_pfu_pfb_entry(i).pfu_pfb_entry_l2_page_share_x
    pfu_pfb_entry_l2_pf_addr(i) := x_ct_lsu_pfu_pfb_entry(i).pfu_pfb_entry_l2_pf_addr_v
    pfu_pfb_entry_l2_vpn(i) := x_ct_lsu_pfu_pfb_entry(i).pfu_pfb_entry_l2_vpn_v
    x_ct_lsu_pfu_pfb_entry(i).pfu_pfb_entry_mmu_pe_req_grnt_x := pfu_pfb_entry_mmu_pe_req_grnt(i)
    pfu_pfb_entry_mmu_pe_req_src(i) := x_ct_lsu_pfu_pfb_entry(i).pfu_pfb_entry_mmu_pe_req_src_v
    pfu_pfb_entry_mmu_pe_req(i) := x_ct_lsu_pfu_pfb_entry(i).pfu_pfb_entry_mmu_pe_req_x
    pfu_pfb_entry_priv_mode(i) := x_ct_lsu_pfu_pfb_entry(i).pfu_pfb_entry_priv_mode_v
    pfu_pfb_entry_vld(i) := x_ct_lsu_pfu_pfb_entry(i).pfu_pfb_entry_vld_x
    pfu_pop_all_part_vld := x_ct_lsu_pfu_pfb_entry(i).pfu_pop_all_part_vld
    x_ct_lsu_pfu_pfb_entry(i).st_da_page_sec_ff := io.st_da_page_sec_ff
    x_ct_lsu_pfu_pfb_entry(i).st_da_page_share_ff := io.st_da_page_share_ff
    x_ct_lsu_pfu_pfb_entry(i).st_da_pc := io.st_da_pc
    x_ct_lsu_pfu_pfb_entry(i).st_da_pfu_act_vld := io.st_da_pfu_act_vld
    x_ct_lsu_pfu_pfb_entry(i).st_da_pfu_evict_cnt_vld := io.st_da_pfu_evict_cnt_vld
    x_ct_lsu_pfu_pfb_entry(i).st_da_pfu_pf_inst_vld := io.st_da_pfu_pf_inst_vld
    x_ct_lsu_pfu_pfb_entry(i).st_da_ppfu_va := io.st_da_ppfu_va
    x_ct_lsu_pfu_pfb_entry(i).st_da_ppn_ff := io.st_da_ppn_ff
  }

  //==========================================================
  //            Generate full/create signal of pfb
  //==========================================================
  //------------------pop pointer of sdb----------------------
  pfu_sdb_pop_ptr := MuxCase(0.U(2.W), Seq(
    (pfu_sdb_entry_ready(0) === 0.U) -> 1.U(2.W),
    (pfu_sdb_entry_ready(1) === 0.U) -> 2.U(2.W)
  ))
  pfu_pfb_create_pc := (0 to 1).map { i =>
    Mux(pfu_sdb_pop_ptr(i).asBool, pfu_sdb_entry_pc(i), 0.U)
  }.reduce(_ | _)
  pfu_pfb_create_stride := (0 to 1).map { i =>
    Mux(pfu_sdb_pop_ptr(i).asBool, pfu_sdb_entry_stride(i), 0.U)
  }.reduce(_ | _)
  pfu_pfb_create_stride := (0 to 1).map { i =>
    Mux(pfu_sdb_pop_ptr(i).asBool, pfu_sdb_entry_strideh_6to0(i), 0.U)
  }.reduce(_ | _)
  pfu_pfb_create_stride_neg := (pfu_sdb_pop_ptr & pfu_sdb_entry_stride_neg.asUInt).orR
  pfu_pfb_create_type_ld := (pfu_sdb_pop_ptr & pfu_sdb_entry_type_ld.asUInt).orR

  //---------------------create pointer-----------------------
  //if it has empty entry, then create signal to empty entry,
  //else create siganl to evict entry,
  //else create fail
  pfu_pfb_empty_create_ptr := MuxCase(default = 0.U(8.W), (0 to 7).map { i =>
    !pfu_pfb_entry_vld(i).asBool -> (1.U(8.W) << i)
  })

  pfu_pfb_evict_create_ptr := MuxCase(default = 0.U(8.W), (0 to 7).map { i =>
    pfu_pfb_entry_evict(i).asBool -> (1.U(8.W) << i)
  })

  pfu_pfb_full := pfu_pfb_entry_vld.asUInt.andR
  pfu_pfb_has_evict := pfu_pfb_entry_evict.asUInt.orR
  pfu_pfb_create_ptr := Mux(pfu_pfb_full, pfu_pfb_evict_create_ptr, pfu_pfb_empty_create_ptr)

  //-------------------grnt signal of pmb---------------------

  pfu_sdb_ready_grnt := !pfu_pfb_full || pfu_pfb_has_evict
  pfu_sdb_entry_ready_grnt := (pfu_sdb_ready_grnt.asUInt ## pfu_sdb_ready_grnt.asUInt) & pfu_sdb_pop_ptr

  //------------------create signal of sdb--------------------
  pfu_pfb_create_vld := pfu_sdb_entry_ready.asUInt.orR
  pfu_pfb_create_dp_vld := pfu_pfb_create_vld
  pfu_pfb_create_gateclk_en := pfu_pfb_create_dp_vld

  pfu_pfb_entry_create_vld := Mux(pfu_pfb_create_vld, pfu_pfb_create_ptr, 0.U)
  pfu_pfb_entry_create_dp_vld := Mux(pfu_pfb_create_dp_vld, pfu_pfb_create_ptr, 0.U)
  pfu_pfb_entry_create_gateclk_en := Mux(pfu_pfb_create_gateclk_en, pfu_pfb_create_ptr, 0.U)

  //==========================================================
  //                      Global PFU
  //==========================================================
  val x_ct_lsu_pfu_gsdb = Module(new ct_lsu_pfu_gsdb)
  x_ct_lsu_pfu_gsdb.io.cp0_lsu_icg_en := io.cp0_lsu_icg_en
  x_ct_lsu_pfu_gsdb.io.cp0_yy_clk_en := io.cp0_yy_clk_en
  x_ct_lsu_pfu_gsdb.io.cp0_yy_dcache_pref_en := io.cp0_yy_dcache_pref_en
  x_ct_lsu_pfu_gsdb.io.cpurst_b := io.cpurst_b
  x_ct_lsu_pfu_gsdb.io.forever_cpuclk := io.forever_cpuclk
  x_ct_lsu_pfu_gsdb.io.ld_da_iid := io.ld_da_iid
  x_ct_lsu_pfu_gsdb.io.ld_da_pfu_act_vld := io.ld_da_pfu_act_vld
  x_ct_lsu_pfu_gsdb.io.ld_da_pfu_pf_inst_vld := io.ld_da_pfu_pf_inst_vld
  x_ct_lsu_pfu_gsdb.io.ld_da_pfu_va := io.ld_da_pfu_va
  x_ct_lsu_pfu_gsdb.io.pad_yy_icg_scan_en := io.pad_yy_icg_scan_en
  x_ct_lsu_pfu_gsdb.io.pfu_gpfb_vld := pfu_gpfb_vld
  pfu_gsdb_gpfb_create_vld := x_ct_lsu_pfu_gsdb.io.pfu_gsdb_gpfb_create_vld
  pfu_gsdb_gpfb_pop_req := x_ct_lsu_pfu_gsdb.io.pfu_gsdb_gpfb_pop_req
  pfu_gsdb_stride := x_ct_lsu_pfu_gsdb.io.pfu_gsdb_stride
  pfu_gsdb_stride_neg := x_ct_lsu_pfu_gsdb.io.pfu_gsdb_stride_neg
  pfu_gsdb_strideh_6to0 := x_ct_lsu_pfu_gsdb.io.pfu_gsdb_strideh_6to0
  x_ct_lsu_pfu_gsdb.io.pfu_pop_all_vld := pfu_pop_all_vld
  x_ct_lsu_pfu_gsdb.io.rtu_yy_xx_commit0 := io.rtu_yy_xx_commit0
  x_ct_lsu_pfu_gsdb.io.rtu_yy_xx_commit0_iid := io.rtu_yy_xx_commit0_iid
  x_ct_lsu_pfu_gsdb.io.rtu_yy_xx_commit1 := io.rtu_yy_xx_commit1
  x_ct_lsu_pfu_gsdb.io.rtu_yy_xx_commit1_iid := io.rtu_yy_xx_commit1_iid
  x_ct_lsu_pfu_gsdb.io.rtu_yy_xx_commit2 := io.rtu_yy_xx_commit2
  x_ct_lsu_pfu_gsdb.io.rtu_yy_xx_commit2_iid := io.rtu_yy_xx_commit2_iid
  x_ct_lsu_pfu_gsdb.io.rtu_yy_xx_flush := io.rtu_yy_xx_flush

  val x_ct_lsu_pfu_gpfb = Module(new ct_lsu_pfu_gpfb)
  x_ct_lsu_pfu_gpfb.io.cp0_lsu_icg_en := io.cp0_lsu_icg_en
  x_ct_lsu_pfu_gpfb.io.cp0_lsu_pfu_mmu_dis := io.cp0_lsu_pfu_mmu_dis
  x_ct_lsu_pfu_gpfb.io.cp0_yy_clk_en := io.cp0_yy_clk_en
  x_ct_lsu_pfu_gpfb.io.cp0_yy_priv_mode := io.cp0_yy_priv_mode
  x_ct_lsu_pfu_gpfb.io.cpurst_b := io.cpurst_b.asAsyncReset
  x_ct_lsu_pfu_gpfb.io.forever_cpuclk := io.forever_cpuclk
  x_ct_lsu_pfu_gpfb.io.ld_da_page_sec_ff := io.ld_da_page_sec_ff
  x_ct_lsu_pfu_gpfb.io.ld_da_page_share_ff := io.ld_da_page_share_ff
  x_ct_lsu_pfu_gpfb.io.ld_da_pfu_act_vld := io.ld_da_pfu_act_vld
  x_ct_lsu_pfu_gpfb.io.ld_da_pfu_pf_inst_vld := io.ld_da_pfu_pf_inst_vld
  x_ct_lsu_pfu_gpfb.io.ld_da_pfu_va := io.ld_da_pfu_va
  x_ct_lsu_pfu_gpfb.io.ld_da_ppn_ff := io.ld_da_ppn_ff
  x_ct_lsu_pfu_gpfb.io.lsu_pfu_l1_dist_sel := io.lsu_pfu_l1_dist_sel
  x_ct_lsu_pfu_gpfb.io.lsu_pfu_l2_dist_sel := io.lsu_pfu_l2_dist_sel
  x_ct_lsu_pfu_gpfb.io.pad_yy_icg_scan_en := io.pad_yy_icg_scan_en
  x_ct_lsu_pfu_gpfb.io.pfu_biu_pe_req_sel_l1 := pfu_biu_pe_req_sel_l1
  x_ct_lsu_pfu_gpfb.io.pfu_dcache_pref_en := pfu_dcache_pref_en
  x_ct_lsu_pfu_gpfb.io.pfu_get_page_sec := pfu_get_page_sec
  x_ct_lsu_pfu_gpfb.io.pfu_get_page_share := pfu_get_page_share
  x_ct_lsu_pfu_gpfb.io.pfu_get_ppn := pfu_get_ppn
  x_ct_lsu_pfu_gpfb.io.pfu_get_ppn_err := pfu_get_ppn_err
  x_ct_lsu_pfu_gpfb.io.pfu_get_ppn_vld := pfu_get_ppn_vld
  pfu_gpfb_biu_pe_req := x_ct_lsu_pfu_gpfb.io.pfu_gpfb_biu_pe_req
  x_ct_lsu_pfu_gpfb.io.pfu_gpfb_biu_pe_req_grnt := pfu_gpfb_biu_pe_req_grnt
  pfu_gpfb_biu_pe_req_src := x_ct_lsu_pfu_gpfb.io.pfu_gpfb_biu_pe_req_src
  x_ct_lsu_pfu_gpfb.io.pfu_gpfb_from_lfb_dcache_hit := pfu_gpfb_from_lfb_dcache_hit
  x_ct_lsu_pfu_gpfb.io.pfu_gpfb_from_lfb_dcache_miss := pfu_gpfb_from_lfb_dcache_miss
  pfu_gpfb_l1_page_sec := x_ct_lsu_pfu_gpfb.io.pfu_gpfb_l1_page_sec
  pfu_gpfb_l1_page_share := x_ct_lsu_pfu_gpfb.io.pfu_gpfb_l1_page_share
  pfu_gpfb_l1_pf_addr := x_ct_lsu_pfu_gpfb.io.pfu_gpfb_l1_pf_addr
  pfu_gpfb_l1_vpn := x_ct_lsu_pfu_gpfb.io.pfu_gpfb_l1_vpn
  pfu_gpfb_l2_page_sec := x_ct_lsu_pfu_gpfb.io.pfu_gpfb_l2_page_sec
  pfu_gpfb_l2_page_share := x_ct_lsu_pfu_gpfb.io.pfu_gpfb_l2_page_share
  pfu_gpfb_l2_pf_addr := x_ct_lsu_pfu_gpfb.io.pfu_gpfb_l2_pf_addr
  pfu_gpfb_l2_vpn := x_ct_lsu_pfu_gpfb.io.pfu_gpfb_l2_vpn
  pfu_gpfb_mmu_pe_req := x_ct_lsu_pfu_gpfb.io.pfu_gpfb_mmu_pe_req
  x_ct_lsu_pfu_gpfb.io.pfu_gpfb_mmu_pe_req_grnt := pfu_gpfb_mmu_pe_req_grnt
  pfu_gpfb_mmu_pe_req_src := x_ct_lsu_pfu_gpfb.io.pfu_gpfb_mmu_pe_req_src
  pfu_gpfb_priv_mode := x_ct_lsu_pfu_gpfb.io.pfu_gpfb_priv_mode
  pfu_gpfb_vld := x_ct_lsu_pfu_gpfb.io.pfu_gpfb_vld
  x_ct_lsu_pfu_gpfb.io.pfu_gsdb_gpfb_create_vld := pfu_gsdb_gpfb_create_vld
  x_ct_lsu_pfu_gpfb.io.pfu_gsdb_gpfb_pop_req := pfu_gsdb_gpfb_pop_req
  x_ct_lsu_pfu_gpfb.io.pfu_gsdb_stride := pfu_gsdb_stride
  x_ct_lsu_pfu_gpfb.io.pfu_gsdb_stride_neg := pfu_gsdb_stride_neg
  x_ct_lsu_pfu_gpfb.io.pfu_gsdb_strideh_6to0 := pfu_gsdb_strideh_6to0
  x_ct_lsu_pfu_gpfb.io.pfu_l2_pref_en := pfu_l2_pref_en
  x_ct_lsu_pfu_gpfb.io.pfu_mmu_pe_req_sel_l1 := pfu_mmu_pe_req_sel_l1
  x_ct_lsu_pfu_gpfb.io.pfu_pop_all_vld := pfu_pop_all_vld


  //==========================================================
  //         
  //==========================================================
  //----------------------registers---------------------------
  //+-----+-----+----+
  //| req | vpn | id |
  //+-----+-----+----+

  withClockAndReset(pfu_mmu_pe_clk, (!io.cpurst_b) asTypeOf AsyncReset()) {
    val pfu_mmu_req_reg = RegInit(false.B)

    pfu_mmu_req := pfu_mmu_req_reg

    when(pfu_pop_all_vld) {
      pfu_mmu_req_reg := false.B
    }
      .elsewhen(pfu_mmu_pe_update_permit && pfu_mmu_pe_req) {
        pfu_mmu_req_reg := true.B
      }
      .elsewhen(pfu_get_ppn_vld) {
        pfu_mmu_req_reg := false.B
      }
  }

  withClockAndReset(pfu_mmu_pe_clk, (!io.cpurst_b) asTypeOf AsyncReset()) {

    val pfu_mmu_req_l1_reg = RegInit(0.U)
    val pfu_mmu_req_ptr_reg = RegInit(0.U)
    val pfu_mmu_req_vpn_reg = RegInit(0.U)

    pfu_mmu_req_l1 := pfu_mmu_req_l1_reg
    pfu_mmu_req_ptr := pfu_mmu_req_ptr_reg
    pfu_mmu_req_vpn := pfu_mmu_req_vpn_reg

    when(pfu_mmu_pe_update_permit && pfu_mmu_pe_req) {
      pfu_mmu_req_l1_reg := pfu_mmu_pe_req_sel_l1
      pfu_mmu_req_ptr_reg := pfu_mmu_pe_req_ptr
      pfu_mmu_req_vpn_reg := pfu_mmu_pe_req_vpn
    }
  }

  //---------------------update signal------------------------
  pfu_all_pfb_mmu_pe_req := pfu_gpfb_mmu_pe_req ## pfu_pfb_entry_mmu_pe_req.asUInt
  pfu_mmu_pe_req := pfu_all_pfb_mmu_pe_req.orR
  pfu_mmu_pe_update_permit := !pfu_mmu_req || pfu_get_ppn_vld

  //---------------------grnt and resp signal-----------------
  pfu_pfb_entry_mmu_pe_req_grnt := Mux(pfu_mmu_pe_update_permit, pfu_mmu_pe_req_ptr, 0.U)
  pfu_gpfb_mmu_pe_req_grnt := pfu_mmu_pe_update_permit && pfu_mmu_pe_req_ptr(8).asBool
  pfu_mmu_pe_req_ptr := MuxCase(default = 0.U(9.W), (0 to 8).map { i =>
    pfu_all_pfb_mmu_pe_req(i).asBool -> (1.U(9.W) << i)
  })

  //------------sel info to pop entry---------------
  pfu_mmu_l1_pe_req_vpn := (0 to 7).map { i =>
    Mux(pfu_mmu_pe_req_ptr(i).asBool, pfu_pfb_entry_l1_vpn(i), 0.U)
  }.reduce(_ | _) | Mux(pfu_mmu_pe_req_ptr(8).asBool, pfu_gpfb_l1_vpn, 0.U)

  pfu_mmu_l2_pe_req_vpn := (0 to 7).map { i =>
    Mux(pfu_mmu_pe_req_ptr(i).asBool, pfu_pfb_entry_l2_vpn(i), 0.U)
  }.reduce(_ | _) | Mux(pfu_mmu_pe_req_ptr(8).asBool, pfu_gpfb_l2_vpn, 0.U)

  pfu_mmu_pe_req_src := (0 to 7).map { i =>
    Mux(pfu_mmu_pe_req_ptr(i).asBool, pfu_pfb_entry_mmu_pe_req_src(i), 0.U)
  }.reduce(_ | _) | Mux(pfu_mmu_pe_req_ptr(8).asBool, pfu_gpfb_mmu_pe_req_src, 0.U)

  pfu_mmu_pe_req_sel_l1 := pfu_mmu_pe_req_src(0)

  pfu_mmu_pe_req_vpn := Mux(pfu_mmu_pe_req_sel_l1, pfu_mmu_l1_pe_req_vpn, pfu_mmu_l2_pe_req_vpn)

  io.lsu_mmu_va2_vld := pfu_mmu_req
  io.lsu_mmu_va2 := pfu_mmu_req_vpn
  pfu_get_ppn_vld := io.mmu_lsu_pa2_vld
  pfu_get_ppn_err := io.mmu_lsu_pa2_err
  pfu_get_ppn := io.mmu_lsu_pa2
  pfu_get_page_sec := io.mmu_lsu_sec2
  pfu_get_page_share := io.mmu_lsu_share2

  //==========================================================
  //          Instance biu pop entry and logic
  //==========================================================
  //----------------------registers---------------------------
  //+-----+------+---------+----------+
  //| req | addr | req_ptr | priority |
  //+-----+------+---------+----------+

  withClockAndReset(pfu_biu_pe_clk, (!io.cpurst_b) asTypeOf AsyncReset()) {
    val pfu_biu_req_unmask_reg = RegInit(false.B)
    pfu_biu_req_unmask := pfu_biu_req_unmask_reg
    when(pfu_pop_all_vld) {
      pfu_biu_req_unmask_reg := false.B
    }
      .elsewhen(pfu_biu_pe_req_grnt) {
        pfu_biu_req_unmask_reg := true.B
      }
      .elsewhen(pfu_biu_req_grnt) {
        pfu_biu_req_unmask_reg := false.B
      }
  }

  withClockAndReset(pfu_biu_pe_clk, (!io.cpurst_b) asTypeOf AsyncReset()) {
    val pfu_biu_req_l1_reg = RegInit(false.B)
    val pfu_biu_req_addr_tto6_reg = RegInit(0.U)
    val pfu_biu_req_page_sec_reg = RegInit(0.U)
    val pfu_biu_req_page_share_reg = RegInit(0.U)
    val pfu_biu_req_priv_mode_reg = RegInit(0.U)
    val pfu_biu_req_ptr_reg = RegInit(0.U)
    val pfu_biu_req_priority_reg = RegInit(0.U)

    pfu_biu_req_l1 := pfu_biu_req_l1_reg
    pfu_biu_req_addr_tto6 := pfu_biu_req_addr_tto6_reg
    pfu_biu_req_page_sec := pfu_biu_req_page_sec_reg
    pfu_biu_req_page_share := pfu_biu_req_page_share_reg
    pfu_biu_req_priv_mode := pfu_biu_req_priv_mode_reg
    pfu_biu_req_ptr := pfu_biu_req_ptr_reg
    pfu_biu_req_priority := pfu_biu_req_priority_reg

    when(pfu_biu_pe_update_vld) {
      pfu_biu_req_l1_reg := pfu_biu_pe_req_sel_l1
      pfu_biu_req_addr_tto6_reg := pfu_biu_pe_req_addr_tto6
      pfu_biu_req_page_sec_reg := pfu_biu_pe_req_page_sec
      pfu_biu_req_page_share_reg := pfu_biu_pe_req_page_share
      pfu_biu_req_priv_mode_reg := pfu_biu_pe_req_priv_mode
      pfu_biu_req_ptr_reg := pfu_biu_pe_req_ptr
      pfu_biu_req_priority_reg := pfu_biu_req_priority_next
    }
  }

  //---------------------update signal------------------------ //更新信号
  pfu_all_pfb_biu_pe_req := pfu_gpfb_biu_pe_req ## pfu_pfb_entry_biu_pe_req.asUInt
  pfu_biu_pe_req := pfu_all_pfb_biu_pe_req.orR
  pfu_biu_req_grnt := io.bus_arb_pfu_ar_grnt || pfu_biu_req_unmask && pfu_biu_req_l1 && pfu_biu_req_hit_idx
  //for timing,create bus grant without hit_idx
  pfu_biu_req_bus_grnt := io.bus_arb_pfu_ar_ready && (!io.lfb_addr_full && (io.lfb_pfu_rready_grnt || io.rb_pfu_nc_no_pending) || !pfu_biu_req_l1)

  //for timing, do not use pipe
  pfu_biu_pe_update_permit := !pfu_biu_req_unmask || pfu_biu_req_bus_grnt
  pfu_biu_pe_update_vld := pfu_biu_pe_update_permit && pfu_biu_pe_req

  //if grnt entry only req l1, and lfb_addr_less 2, then do not grnt
  pfu_biu_pe_req_grnt := pfu_biu_pe_update_permit && (pfu_biu_pe_req_sel_l1 || pfu_biu_pe_req_src(0).asBool)

  //--------------------- grnt signal -------------------------- //选中信号
  //for timing grnt signal add gateclk
  pfu_pfb_entry_biu_pe_req_grnt := Mux(pfu_biu_pe_req_grnt, pfu_biu_pe_req_ptr, 0.U)
  pfu_gpfb_biu_pe_req_grnt := pfu_biu_pe_req_grnt && pfu_biu_pe_req_ptr(8).asBool
  //---------------------update info--------------------------
  pfu_all_pfb_biu_pe_req_ptiority_0 := pfu_all_pfb_biu_pe_req & (~pfu_biu_req_priority)
  pfu_all_pfb_biu_pe_req_ptiority_1 := pfu_all_pfb_biu_pe_req & pfu_biu_req_priority

  pfu_biu_pe_req_ptiority_0 := pfu_all_pfb_biu_pe_req_ptiority_0.orR
  //----------------req_ptr---------------
  //sel priority 0 first, then priority 1
  pfu_biu_pe_req_ptr_priority_0 := MuxCase(default = 0.U(9.W), (0 to 8).map { i =>
    pfu_all_pfb_biu_pe_req_ptiority_0(i).asBool -> (1.U(9.W) << i)
  })
  pfu_biu_pe_req_ptr_priority_1 := MuxCase(default = 0.U(9.W), (0 to 8).map { i =>
    pfu_all_pfb_biu_pe_req_ptiority_1(i).asBool -> (1.U(9.W) << i)
  })
  pfu_biu_pe_req_ptr := Mux(pfu_biu_pe_req_ptiority_0, pfu_biu_pe_req_ptr_priority_0, pfu_biu_pe_req_ptr_priority_1)

  //------------sel info to pop entry---------------
  pfu_biu_l1_pe_req_addr_tto6 := (0 to 7).map { i =>
    Mux(pfu_biu_pe_req_ptr(i).asBool, pfu_pfb_entry_l1_pf_addr(i)(39, 6), 0.U)
  }.reduce(_ | _) | Mux(pfu_mmu_pe_req_ptr(8).asBool, pfu_gpfb_l1_pf_addr(39, 6), 0.U)

  pfu_biu_l2_pe_req_addr_tto6 := (0 to 7).map { i =>
    Mux(pfu_biu_pe_req_ptr(i).asBool, pfu_pfb_entry_l2_pf_addr(i)(39, 6), 0.U)
  }.reduce(_ | _) | Mux(pfu_mmu_pe_req_ptr(8).asBool, pfu_gpfb_l2_pf_addr(39, 6), 0.U)

  pfu_biu_l1_pe_req_page_sec := (pfu_biu_pe_req_ptr & (pfu_gpfb_l1_page_sec ## pfu_pfb_entry_l1_page_sec.asUInt)).orR
  pfu_biu_l2_pe_req_page_sec := (pfu_biu_pe_req_ptr & (pfu_gpfb_l2_page_sec ## pfu_pfb_entry_l2_page_sec.asUInt)).orR
  pfu_biu_l1_pe_req_page_share := (pfu_biu_pe_req_ptr & (pfu_gpfb_l1_page_share ## pfu_pfb_entry_l1_page_share.asUInt)).orR
  pfu_biu_l2_pe_req_page_share := (pfu_biu_pe_req_ptr & (pfu_gpfb_l2_page_share ## pfu_pfb_entry_l2_page_share.asUInt)).orR

  pfu_biu_pe_req_src := (0 to 7).map { i =>
    Mux(pfu_biu_pe_req_ptr(i).asBool, pfu_pfb_entry_biu_pe_req_src(i), 0.U)
  }.reduce(_ | _) | Mux(pfu_mmu_pe_req_ptr(8).asBool, pfu_gpfb_biu_pe_req_src, 0.U)

  pfu_biu_pe_req_sel_l1 := pfu_biu_pe_req_src(0).asBool && !io.lfb_addr_less2

  pfu_biu_pe_req_addr_tto6 := Mux(pfu_biu_pe_req_sel_l1, pfu_biu_l1_pe_req_addr_tto6, pfu_biu_l2_pe_req_addr_tto6)
  pfu_biu_pe_req_page_sec := Mux(pfu_biu_pe_req_sel_l1, pfu_biu_l1_pe_req_page_sec, pfu_biu_l2_pe_req_page_sec)
  pfu_biu_pe_req_page_share := Mux(pfu_biu_pe_req_sel_l1, pfu_biu_l1_pe_req_page_share, pfu_biu_l2_pe_req_page_share)

  pfu_biu_pe_req_priv_mode := (0 to 7).map { i =>
    Mux(pfu_biu_pe_req_ptr(i).asBool, pfu_pfb_entry_priv_mode(i), 0.U)
  }.reduce(_ | _) | Mux(pfu_mmu_pe_req_ptr(8).asBool, pfu_gpfb_priv_mode, 0.U)

  //----------------priority_next---------------
  //set pfu_biu_pe_req_ptr 0~x to 1
  pfu_biu_req_priority_next := (0 to 8).map { i =>
    Mux(pfu_biu_pe_req_ptr(i).asBool, (1023 >> i).U, 0.U)
  }.reduce(_ | _)

  //--------------------page_sel------------------------------
  //--------------------hit index signal----------------------
  io.pfu_biu_req_addr := pfu_biu_req_addr_tto6 ## 0.U(6.W)
  pfu_biu_req_hit_idx := io.ld_da_pfu_biu_req_hit_idx || io.st_da_pfu_biu_req_hit_idx || io.lfb_pfu_biu_req_hit_idx ||
    io.vb_pfu_biu_req_hit_idx || io.rb_pfu_biu_req_hit_idx || io.wmb_pfu_biu_req_hit_idx || io.lm_pfu_biu_req_hit_idx

  //----------------------req bus_arb-------------------------
  io.pfu_biu_ar_req := pfu_biu_req_unmask && !io.cp0_lsu_no_op_req && (!pfu_biu_req_hit_idx && !io.lfb_addr_full &&
    (io.lfb_pfu_rready_grnt || io.rb_pfu_nc_no_pending) || !pfu_biu_req_l1)

  io.pfu_biu_ar_dp_req := pfu_biu_req_unmask && !io.cp0_lsu_no_op_req && (!io.lfb_addr_full &&
    (io.lfb_pfu_rready_grnt || io.rb_pfu_nc_no_pending) || !pfu_biu_req_l1)

  io.pfu_biu_ar_req_gateclk_en := pfu_biu_req_unmask
  io.pfu_biu_ar_id := Mux(pfu_biu_req_l1, io.lfb_pfu_create_id, BIU_R_L2PREF_ID)

  io.pfu_biu_ar_addr := pfu_biu_req_addr_tto6 ## 0.U(6.W)
  io.pfu_biu_ar_len := 3.U
  io.pfu_biu_ar_size := 4.U
  io.pfu_biu_ar_burst := 2.U
  io.pfu_biu_ar_lock := 0.U
  io.pfu_biu_ar_cache := 15.U
  io.pfu_biu_ar_prot := 0.U ## pfu_biu_req_page_sec ## pfu_biu_req_priv_mode(0)
  io.pfu_biu_ar_user := !pfu_biu_req_l1.asUInt ## io.cp0_yy_priv_mode(1) ## 0.U
  io.pfu_biu_ar_snoop := Mux(pfu_biu_req_page_share.asBool, 1.U(4.W), 0.U(4.W))
  io.pfu_biu_ar_domain := 0.U ## pfu_biu_req_page_share
  io.pfu_biu_ar_bar := 2.U
  //------------------------req lfb---------------------------
  io.pfu_lfb_id := (0 to 8).map { i =>
    Mux(pfu_biu_req_ptr(i).asBool, i.U(4.W), 0.U)
  }.reduce(_ | _)
  //TODO: treat as one-hot decoding

  io.pfu_lfb_create_req := pfu_biu_req_unmask && pfu_biu_req_l1
  io.pfu_lfb_create_vld := io.pfu_biu_ar_req && pfu_biu_req_l1 && io.bus_arb_pfu_ar_ready
  io.pfu_lfb_create_dp_vld := io.pfu_biu_ar_req && pfu_biu_req_l1
  io.pfu_lfb_create_gateclk_en := pfu_biu_req_unmask && pfu_biu_req_l1
  //---------------------lfb back signal----------------------
  pfu_gpfb_from_lfb_dcache_hit := io.lfb_pfu_dcache_hit(8)
  pfu_pfb_entry_from_lfb_dcache_hit := io.lfb_pfu_dcache_hit(7, 0)
  pfu_gpfb_from_lfb_dcache_miss := io.lfb_pfu_dcache_miss(8)
  pfu_pfb_entry_from_lfb_dcache_miss := io.lfb_pfu_dcache_miss(7, 0)

  //==========================================================
  //                  Generate pop signal
  //==========================================================
  pfu_dcache_pref_en := io.cp0_lsu_dcache_en && io.cp0_lsu_dcache_pref_en
  pfu_l2_pref_en := io.cp0_lsu_l2_pref_en
  pfu_pop_all_vld := !io.icc_idle || !(pfu_dcache_pref_en || pfu_l2_pref_en) || io.cp0_lsu_no_op_req || io.sq_pfu_pop_synci_inst

  pfu_pop_all_part_vld := pfu_pop_all_vld || pfu_gpfb_vld

  pfu_pmb_empty := !pfu_pmb_entry_vld.reduce(_ | _)
  io.pfu_sdb_empty := !pfu_pmb_entry_vld.reduce(_ | _)
  io.pfu_pfb_empty := !pfu_pfb_entry_vld.asUInt.orR.asBool
  io.pfu_icc_ready := !pfu_biu_req_unmask
  io.pfu_part_empty := pfu_pmb_empty && io.pfu_sdb_empty && io.pfu_pfb_empty
  //==========================================================
  //                  for cp0 control
  //==========================================================
  //timeout cnt
  pmb_timeout_cnt_val := io.cp0_lsu_timeout_cnt(7, 0)
  sdb_timeout_cnt_val := io.cp0_lsu_timeout_cnt(15, 8)
  pfb_timeout_cnt_val := io.cp0_lsu_timeout_cnt(23, 16)
  pfb_no_req_cnt_val := io.cp0_lsu_timeout_cnt(29, 24)
}


class ct_lsu_pfu_pmb_entry extends BlackBox {
  val io = IO(new Bundle {
    val amr_wa_cancel = Input(Bool())
    val cp0_lsu_icg_en = Input(Bool())
    val cp0_lsu_l2_st_pref_en = Input(Bool())
    val cp0_yy_clk_en = Input(Bool())
    val cpurst_b = Input(Bool())
    val ld_da_ldfifo_pc = Input(UInt(15.W))
    val ld_da_pfu_act_dp_vld = Input(Bool())
    val ld_da_pfu_evict_cnt_vld = Input(Bool())
    val ld_da_pfu_pf_inst_vld = Input(Bool())
    val lsu_special_clk = Input(Clock())
    val pad_yy_icg_scan_en = Input(Bool())
    val pfu_pmb_entry_create_dp_vld_x = Input(Bool())
    val pfu_pmb_entry_create_gateclk_en_x = Input(Bool())
    val pfu_pmb_entry_create_vld_x = Input(Bool())
    val pfu_pmb_entry_ready_grnt_x = Input(Bool())
    val pfu_pop_all_part_vld = Input(Bool())
    val pipe_create_pc = Input(UInt(15.W))
    val pmb_timeout_cnt_val = Input(UInt(8.W))
    val st_da_pc = Input(UInt(15.W))
    val st_da_pfu_evict_cnt_vld = Input(Bool())
    val st_da_pfu_pf_inst_vld = Input(Bool())
    val pfu_pmb_entry_evict_x = Output(Bool())
    val pfu_pmb_entry_hit_pc_x = Output(Bool())
    val pfu_pmb_entry_pc_v = Output(UInt(15.W))
    val pfu_pmb_entry_ready_x = Output(Bool())
    val pfu_pmb_entry_type_ld_x = Output(Bool())
    val pfu_pmb_entry_vld_x = Output(Bool())
  })
}

class ct_lsu_pfu_sdb_entry extends BlackBox {
  val io = IO(new Bundle {
    val amr_wa_cancel = Input(Bool())
    val cp0_lsu_icg_en = Input(Bool())
    val cp0_lsu_l2_st_pref_en = Input(Bool())
    val cp0_yy_clk_en = Input(Bool())
    val cpurst_b = Input(Bool())
    val ld_da_iid = Input(UInt(7.W))
    val ld_da_ldfifo_pc = Input(UInt(15.W))
    val ld_da_pfu_act_dp_vld = Input(Bool())
    val ld_da_pfu_evict_cnt_vld = Input(Bool())
    val ld_da_pfu_pf_inst_vld = Input(Bool())
    val ld_da_ppfu_va = Input(UInt(40.W))
    val lsu_special_clk = Input(Clock())
    val pad_yy_icg_scan_en = Input(Bool())
    val pfu_pop_all_part_vld = Input(Bool())
    val pfu_sdb_create_pc = Input(UInt(15.W))
    val pfu_sdb_create_type_ld = Input(Bool())
    val pfu_sdb_entry_create_dp_vld_x = Input(Bool())
    val pfu_sdb_entry_create_gateclk_en_x = Input(Bool())
    val pfu_sdb_entry_create_vld_x = Input(Bool())
    val pfu_sdb_entry_ready_grnt_x = Input(Bool())
    val rtu_yy_xx_commit0 = Input(Bool())
    val rtu_yy_xx_commit0_iid = Input(UInt(7.W))
    val rtu_yy_xx_commit1 = Input(Bool())
    val rtu_yy_xx_commit1_iid = Input(UInt(7.W))
    val rtu_yy_xx_commit2 = Input(Bool())
    val rtu_yy_xx_commit2_iid = Input(UInt(7.W))
    val rtu_yy_xx_flush = Input(Bool())
    val sdb_timeout_cnt_val = Input(UInt(8.W))
    val st_da_iid = Input(UInt(7.W))
    val st_da_pc = Input(UInt(15.W))
    val st_da_pfu_evict_cnt_vld = Input(Bool())
    val st_da_pfu_pf_inst_vld = Input(Bool())
    val st_da_ppfu_va = Input(UInt(40.W))
    val pfu_sdb_entry_evict_x = Output(Bool())
    val pfu_sdb_entry_hit_pc_x = Output(Bool())
    val pfu_sdb_entry_pc_v = Output(UInt(15.W))
    val pfu_sdb_entry_ready_x = Output(Bool())
    val pfu_sdb_entry_stride_neg_x = Output(Bool())
    val pfu_sdb_entry_stride_v = Output(UInt(11.W))
    val pfu_sdb_entry_strideh_6to0_v = Output(UInt(7.W))
    val pfu_sdb_entry_type_ld_x = Output(Bool())
    val pfu_sdb_entry_vld_x = Output(Bool())
  })
}

class pfbIO extends Bundle {
  val amr_wa_cancel = Input(Bool())
  val cp0_lsu_icg_en = Input(Bool())
  val cp0_lsu_l2_st_pref_en = Input(Bool())
  val cp0_lsu_pfu_mmu_dis = Input(Bool())
  val cp0_yy_clk_en = Input(Bool())
  val cp0_yy_priv_mode = Input(UInt(2.W))
  val cpurst_b = Input(Bool())
  val ld_da_ldfifo_pc = Input(UInt(15.W))
  val ld_da_page_sec_ff = Input(Bool())
  val ld_da_page_share_ff = Input(Bool())
  val ld_da_pfu_act_dp_vld = Input(Bool())
  val ld_da_pfu_act_vld = Input(Bool())
  val ld_da_pfu_evict_cnt_vld = Input(Bool())
  val ld_da_pfu_pf_inst_vld = Input(Bool())
  val ld_da_ppfu_va = Input(UInt(40.W))
  val ld_da_ppn_ff = Input(UInt(28.W))
  val lsu_pfu_l1_dist_sel = Input(UInt(4.W))
  val lsu_pfu_l2_dist_sel = Input(UInt(4.W))
  val lsu_special_clk = Input(Bool())
  val pad_yy_icg_scan_en = Input(Bool())
  val pfb_no_req_cnt_val = Input(UInt(6.W))
  val pfb_timeout_cnt_val = Input(UInt(8.W))
  val pfu_biu_pe_req_sel_l1 = Input(Bool())
  val pfu_dcache_pref_en = Input(Bool())
  val pfu_get_page_sec = Input(Bool())
  val pfu_get_page_share = Input(Bool())
  val pfu_get_ppn = Input(UInt(28.W))
  val pfu_get_ppn_err = Input(Bool())
  val pfu_get_ppn_vld = Input(Bool())
  val pfu_l2_pref_en = Input(Bool())
  val pfu_mmu_pe_req_sel_l1 = Input(Bool())
  val pfu_pfb_create_pc = Input(UInt(15.W))
  val pfu_pfb_create_stride = Input(UInt(11.W))
  val pfu_pfb_create_stride_neg = Input(Bool())
  val pfu_pfb_create_strideh_6to0 = Input(UInt(7.W))
  val pfu_pfb_create_type_ld = Input(Bool())
  val pfu_pfb_entry_biu_pe_req_grnt_x = Input(Bool())
  val pfu_pfb_entry_create_dp_vld_x = Input(Bool())
  val pfu_pfb_entry_create_gateclk_en_x = Input(Bool())
  val pfu_pfb_entry_create_vld_x = Input(Bool())
  val pfu_pfb_entry_from_lfb_dcache_hit_x = Input(Bool())
  val pfu_pfb_entry_from_lfb_dcache_miss_x = Input(Bool())
  val pfu_pfb_entry_mmu_pe_req_grnt_x = Input(Bool())
  val pfu_pop_all_part_vld = Input(Bool())
  val st_da_page_sec_ff = Input(Bool())
  val st_da_page_share_ff = Input(Bool())
  val st_da_pc = Input(UInt(15.W))
  val st_da_pfu_act_vld = Input(Bool())
  val st_da_pfu_evict_cnt_vld = Input(Bool())
  val st_da_pfu_pf_inst_vld = Input(Bool())
  val st_da_ppfu_va = Input(UInt(40.W))
  val st_da_ppn_ff = Input(UInt(28.W))
  val pfu_pfb_entry_biu_pe_req_src_v = Output(UInt(2.W))
  val pfu_pfb_entry_biu_pe_req_x = Output(Bool())
  val pfu_pfb_entry_evict_x = Output(Bool())
  val pfu_pfb_entry_hit_pc_x = Output(Bool())
  val pfu_pfb_entry_l1_page_sec_x = Output(Bool())
  val pfu_pfb_entry_l1_page_share_x = Output(Bool())
  val pfu_pfb_entry_l1_pf_addr_v = Output(UInt(40.W))
  val pfu_pfb_entry_l1_vpn_v = Output(UInt(28.W))
  val pfu_pfb_entry_l2_page_sec_x = Output(Bool())
  val pfu_pfb_entry_l2_page_share_x = Output(Bool())
  val pfu_pfb_entry_l2_pf_addr_v = Output(UInt(40.W))
  val pfu_pfb_entry_l2_vpn_v = Output(UInt(28.W))
  val pfu_pfb_entry_mmu_pe_req_src_v = Output(UInt(2.W))
  val pfu_pfb_entry_mmu_pe_req_x = Output(Bool())
  val pfu_pfb_entry_priv_mode_v = Output(UInt(2.W))
  val pfu_pfb_entry_vld_x = Output(Bool())
}

class ct_lsu_pfu_pfb_entry extends BlackBox {
  val io = IO(new pfbIO)
}

class ct_lsu_pfu_gsdb extends BlackBox {
  val io = IO(new Bundle {
    val cp0_lsu_icg_en = Input(Bool())
    val cp0_yy_clk_en = Input(Bool())
    val cp0_yy_dcache_pref_en = Input(Bool())
    val cpurst_b = Input(Bool())
    val forever_cpuclk = Input(Clock())
    val ld_da_iid = Input(UInt(7.W))
    val ld_da_pfu_act_vld = Input(Bool())
    val ld_da_pfu_pf_inst_vld = Input(Bool())
    val ld_da_pfu_va = Input(UInt(40.W))
    val pad_yy_icg_scan_en = Input(Bool())
    val pfu_gpfb_vld = Input(Bool())
    val pfu_pop_all_vld = Input(Bool())
    val rtu_yy_xx_commit0 = Input(Bool())
    val rtu_yy_xx_commit0_iid = Input(UInt(7.W))
    val rtu_yy_xx_commit1 = Input(Bool())
    val rtu_yy_xx_commit1_iid = Input(UInt(7.W))
    val rtu_yy_xx_commit2 = Input(Bool())
    val rtu_yy_xx_commit2_iid = Input(UInt(7.W))
    val rtu_yy_xx_flush = Input(Bool())
    val pfu_gsdb_gpfb_create_vld = Output(Bool())
    val pfu_gsdb_gpfb_pop_req = Output(Bool())
    val pfu_gsdb_stride = Output(UInt(11.W))
    val pfu_gsdb_stride_neg = Output(Bool())
    val pfu_gsdb_strideh_6to0 = Output(UInt(7.W))
  })
}

class gpfbIO extends Bundle {
  val cp0_lsu_icg_en = Input(Bool())
  val cp0_lsu_pfu_mmu_dis = Input(Bool())
  val cp0_yy_clk_en = Input(Bool())
  val cp0_yy_priv_mode = Input(UInt(2.W))
  val cpurst_b = Input(AsyncReset())
  val forever_cpuclk = Input(Clock())
  val ld_da_page_sec_ff = Input(Bool())
  val ld_da_page_share_ff = Input(Bool())
  val ld_da_pfu_act_vld = Input(Bool())
  val ld_da_pfu_pf_inst_vld = Input(Bool())
  val ld_da_pfu_va = Input(UInt(40.W))
  val ld_da_ppn_ff = Input(UInt(28.W))
  val lsu_pfu_l1_dist_sel = Input(UInt(4.W))
  val lsu_pfu_l2_dist_sel = Input(UInt(4.W))
  val pad_yy_icg_scan_en = Input(Bool())
  val pfu_biu_pe_req_sel_l1 = Input(Bool())
  val pfu_dcache_pref_en = Input(Bool())
  val pfu_get_page_sec = Input(Bool())
  val pfu_get_page_share = Input(Bool())
  val pfu_get_ppn = Input(UInt(28.W))
  val pfu_get_ppn_err = Input(Bool())
  val pfu_get_ppn_vld = Input(Bool())
  val pfu_gpfb_biu_pe_req_grnt = Input(Bool())
  val pfu_gpfb_from_lfb_dcache_hit = Input(Bool())
  val pfu_gpfb_from_lfb_dcache_miss = Input(Bool())
  val pfu_gpfb_mmu_pe_req_grnt = Input(Bool())
  val pfu_gsdb_gpfb_create_vld = Input(Bool())
  val pfu_gsdb_gpfb_pop_req = Input(Bool())
  val pfu_gsdb_stride = Input(UInt(11.W))
  val pfu_gsdb_stride_neg = Input(Bool())
  val pfu_gsdb_strideh_6to0 = Input(UInt(7.W))
  val pfu_l2_pref_en = Input(Bool())
  val pfu_mmu_pe_req_sel_l1 = Input(Bool())
  val pfu_pop_all_vld = Input(Bool())
  val pfu_gpfb_biu_pe_req = Output(Bool())
  val pfu_gpfb_biu_pe_req_src = Output(UInt(2.W))
  val pfu_gpfb_l1_page_sec = Output(Bool())
  val pfu_gpfb_l1_page_share = Output(Bool())
  val pfu_gpfb_l1_pf_addr = Output(UInt(40.W))
  val pfu_gpfb_l1_vpn = Output(UInt(28.W))
  val pfu_gpfb_l2_page_sec = Output(Bool())
  val pfu_gpfb_l2_page_share = Output(Bool())
  val pfu_gpfb_l2_pf_addr = Output(UInt(40.W))
  val pfu_gpfb_l2_vpn = Output(UInt(28.W))
  val pfu_gpfb_mmu_pe_req = Output(Bool())
  val pfu_gpfb_mmu_pe_req_src = Output(UInt(2.W))
  val pfu_gpfb_priv_mode = Output(UInt(2.W))
  val pfu_gpfb_vld = Output(Bool())
}

class ct_lsu_pfu_gpfb extends BlackBox {
  val io = IO(new gpfbIO)
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

class gated_clk_cell extends BlackBox {
  val io = IO(new gated_clk_cell_IO)
}