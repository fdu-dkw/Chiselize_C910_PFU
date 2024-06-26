package IOinst

import chisel3._


class gpfbIO extends Bundle{
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
class gpfbwire(PA_WIDTH:Int) extends Bundle{
  val pfb_gpfb_128strideh = UInt(PA_WIDTH.W)
  val pfb_gpfb_32strideh = UInt(PA_WIDTH.W)
  val pfu_gpfb_act_vld = Bool()
  val pfu_gpfb_clk = Clock()
  val pfu_gpfb_clk_en = Bool()
  val pfu_gpfb_create_clk = Clock()
  val pfu_gpfb_create_clk_en = Bool()
  val pfu_gpfb_create_dp_vld = Bool()
  val pfu_gpfb_create_gateclk_en = Bool()
  val pfu_gpfb_create_vld = Bool()
  val pfu_gpfb_dcache_hit_pop_req = Bool()
  val pfu_gpfb_inst_new_va = UInt(40.W)
  val pfu_gpfb_inst_new_va_too_far_l1_pf_va_set = Bool()
  val pfu_gpfb_l1_biu_pe_req_set = Bool()
  val pfu_gpfb_l1_cmp_va_vld = Bool()
  val pfu_gpfb_l1_dist_strideh = UInt(PA_WIDTH.W)
  val pfu_gpfb_l1_mmu_pe_req_set = Bool()
  val pfu_gpfb_l1_pf_va = UInt(40.W)
  val pfu_gpfb_l1_pf_va_sub_inst_new_va = UInt(40.W)
  val pfu_gpfb_l1_pf_va_too_far_l2_pf_va_set = Bool()
  val pfu_gpfb_l1sm_diff_sub_32strideh = UInt(PA_WIDTH.W)
  val pfu_gpfb_l1sm_reinit_req = Bool()
  val pfu_gpfb_l1sm_va_can_cmp = Bool()
  val pfu_gpfb_l2_biu_pe_req_set = Bool()
  val pfu_gpfb_l2_cmp_va_vld = Bool()
  val pfu_gpfb_l2_dist_strideh = UInt(PA_WIDTH.W)
  val pfu_gpfb_l2_mmu_pe_req_set = Bool()
  val pfu_gpfb_l2_pf_va_sub_l1_pf_va = UInt(40.W)
  val pfu_gpfb_l2sm_diff_sub_128strideh = UInt(PA_WIDTH.W)
  val pfu_gpfb_l2sm_reinit_req = Bool()
  val pfu_gpfb_l2sm_va_can_cmp = Bool()
  val pfu_gpfb_pf_inst_vld = Bool()
  val pfu_gpfb_pop_vld = Bool()
  val pfu_gpfb_reinit_vld = Bool()
  val pfu_gpfb_stride = UInt(11.W)
  val pfu_gpfb_stride_neg = Bool()
  val pfu_gpfb_strideh = UInt(PA_WIDTH.W)
  val pfu_gpfb_tsm_is_judge = Bool()
}
class gpfbreg extends Bundle{
  val pfu_gpfb_inst_new_va_too_far_l1_pf_va = UInt(1.W)
  val pfu_gpfb_l1_pf_va_too_far_l2_pf_va = UInt(1.W)
  val pfu_gpfb_strideh_6to0 = UInt(7.W)
}



class tsmIO extends Bundle{
  val cp0_lsu_icg_en = Input(Bool())
  val cp0_yy_clk_en = Input(Bool())
  val cp0_yy_priv_mode = Input(UInt(2.W))
  val cpurst_b = Input(AsyncReset())
  val entry_act_vld = Input(Bool())
  val entry_biu_pe_req_grnt = Input(Bool())
  val entry_clk = Input(Clock())
  val entry_create_dp_vld = Input(Bool())
  val entry_create_vld = Input(Bool())
  val entry_from_lfb_dcache_hit = Input(Bool())
  val entry_from_lfb_dcache_miss = Input(Bool())
  val entry_l1_biu_pe_req_set = Input(UInt(1.W))
  val entry_l1_mmu_pe_req_set = Input(UInt(1.W))
  val entry_l2_biu_pe_req_set = Input(UInt(1.W))
  val entry_l2_mmu_pe_req_set = Input(UInt(1.W))
  val entry_mmu_pe_req_grnt = Input(Bool())
  val entry_pf_inst_vld = Input(Bool())
  val entry_pop_vld = Input(Bool())
  val entry_reinit_vld = Input(Bool())
  val entry_stride = Input(UInt(11.W))
  val entry_stride_neg = Input(UInt(1.W))
  val forever_cpuclk = Input(Clock())
  val pad_yy_icg_scan_en = Input(Bool())
  val pipe_va = Input(UInt(40.W))
  val entry_biu_pe_req = Output(Bool())
  val entry_biu_pe_req_src = Output(UInt(2.W))
  val entry_dcache_hit_pop_req = Output(Bool())
  val entry_inst_new_va = Output(UInt(40.W))
  val entry_mmu_pe_req = Output(Bool())
  val entry_mmu_pe_req_src = Output(UInt(2.W))
  val entry_priv_mode = Output(UInt(2.W))
  val entry_tsm_is_judge = Output(Bool())
  val entry_vld = Output(Bool())
}
class tsmwire(PA_WIDTH:Int) extends Bundle{
  val entry_biu_pe_req_set = UInt(1.W)
  val entry_biu_pe_req_set_src = UInt(2.W)
  val entry_inst_new_va_cross_4k = Bool()
  val entry_mmu_pe_req_set = UInt(1.W)
  val entry_mmu_pe_req_set_src = UInt(2.W)
  val entry_pf_inst_vld_clk = Clock()
  val entry_pf_inst_vld_clk_en = Bool()
  val entry_pipe_va_add_stride = UInt(PA_WIDTH.W)
  val entry_stride_ext = UInt(PA_WIDTH.W)
  val entry_sum_4k = UInt(13.W)
}
class tsmreg extends Bundle{
  val entry_already_dcache_hit = UInt(1.W)
  val entry_biu_pe_req = UInt(1.W)
  val entry_biu_pe_req_src = UInt(2.W)
  val entry_inst_new_va = UInt(40.W)
  val entry_mmu_pe_req = UInt(1.W)
  val entry_mmu_pe_req_src = UInt(2.W)
  val entry_priv_mode = UInt(2.W)

  val entry_top_state = UInt(2.W)
}


//l1sm

class l1smIO(private val chose:Int,PA_WIDTH:Int) extends Bundle {
  val cp0_lsu_icg_en = Input(UInt(1.W))
  val cp0_lsu_pfu_mmu_dis = Input(UInt(1.W))
  val cp0_yy_clk_en = Input(Bool())
  val cpurst_b = Input(AsyncReset())
  val entry_biu_pe_req = Input(Bool())
  val entry_biu_pe_req_grnt = Input(Bool())
  val entry_biu_pe_req_src = Input(UInt(2.W))
  val entry_clk = Input(Clock())
  val entry_create_dp_vld = Input(UInt(1.W))
  val entry_inst_new_va = Input(UInt(40.W))
  val entry_l1_dist_strideh = Input(UInt(40.W))
  val entry_mmu_pe_req = Input(Bool())
  val entry_mmu_pe_req_grnt = Input(Bool())
  val entry_mmu_pe_req_src = Input(UInt(2.W))
  val entry_pf_inst_vld = Input(Bool())
  val entry_pop_vld = Input(Bool())
  val entry_reinit_vld = Input(Bool())
  val entry_stride_neg = Input(UInt(1.W))
  val entry_strideh = Input(UInt(40.W))
  val entry_tsm_is_judge = Input(UInt(1.W))
  val forever_cpuclk = Input(Clock())
  val ld_da_page_sec_ff = Input(UInt(1.W))
  val ld_da_page_share_ff = Input(UInt(1.W))
  val ld_da_ppn_ff = Input(UInt(28.W))
  val pad_yy_icg_scan_en = Input(UInt(1.W))
  val pfu_biu_pe_req_sel_l1 = Input(Bool())
  val pfu_dcache_pref_en = Input(Bool())
  val pfu_get_page_sec = Input(UInt(1.W))
  val pfu_get_page_share = Input(UInt(1.W))
  val pfu_get_ppn = Input(UInt(28.W))
  val pfu_get_ppn_err = Input(UInt(1.W))
  val pfu_get_ppn_vld = Input(Bool())
  val pfu_mmu_pe_req_sel_l1 = Input(Bool())
  val entry_l1_biu_pe_req_set = Output(UInt(1.W))
  val entry_l1_cmp_va_vld = Output(Bool())
  val entry_l1_mmu_pe_req_set = Output(UInt(1.W))
  val entry_l1_page_sec = Output(UInt(1.W))
  val entry_l1_page_share = Output(UInt(1.W))
  val entry_l1_pf_addr = Output(UInt(PA_WIDTH.W))
  val entry_l1_pf_va_sub_inst_new_va = Output(UInt(PA_WIDTH.W))
  val entry_l1_vpn = Output(UInt((PA_WIDTH-12).W))
  val entry_l1sm_reinit_req = Output(UInt(1.W))
  val entry_l1sm_va_can_cmp = Output(Bool())

  val entry_l1_pf_va = if(chose == 0) Some(Output(UInt(40.W))) else None
  val entry_l1_pf_va_t =if(chose == 1) Some(Input(UInt(40.W))) else None

}

class l1smwire (private val chose:Int,PA_WIDTH:Int) extends Bundle{
  val entry_in_l1_pf_region_set		 = 	UInt(1.W)
  val entry_inst_new_va_surpass_l1_pf_va_set		 = 	UInt(1.W)
  val entry_l1_biu_pe_req		 = 	UInt(1.W)
  val entry_l1_biu_pe_req_grnt		 = Bool()
  val entry_l1_mmu_pe_req		 = 	UInt(1.W)
  val entry_l1_mmu_pe_req_grnt		 = 	UInt(1.W)
  val entry_l1_pf_addr_init_vld		 = 	Bool()
  val entry_l1_pf_ppn_clk		 = 	Clock()
  val entry_l1_pf_ppn_clk_en		 = 	Bool()
  val entry_l1_pf_ppn_up_vld		 = 	Bool()
  val entry_l1_pf_va_add_gateclk_en		 = 	Bool()
  val entry_l1_pf_va_add_strideh		 = 	UInt(PA_WIDTH.W)
  val entry_l1_pf_va_add_vld		 = Bool()
  val entry_l1_pf_va_clk		 = 	Clock()
  val entry_l1_pf_va_clk_en		 = 	Bool()
  val entry_l1_pf_va_cross_4k		 = 	UInt(1.W)
  val entry_l1_pf_va_eq_inst_new_va		 = Bool()
  val entry_l1_pf_va_sum_4k		 = 	UInt(13.W)
  val entry_l1sm_diff_sub_dist_strideh		 = 	UInt(PA_WIDTH.W)

  val entry_l1_pf_va =if(chose == 1) Some(UInt(40.W)) else None

}
class l1smreg(PA_WIDTH:Int) extends Bundle{
  val entry_in_l1_pf_region = UInt(1.W);
  val entry_inst_new_va_surpass_l1_pf_va = UInt(1.W);
  val entry_l1_cmp_va_vld = UInt(1.W);
  val entry_l1_page_sec = UInt(1.W);
  val entry_l1_page_share = UInt(1.W);
  val entry_l1_pf_ppn = UInt((PA_WIDTH-12).W);
  val entry_l1_pf_va = UInt(PA_WIDTH.W);
  val entry_l1_state = UInt(3.W);
}

class gated_clk_cell_IO extends Bundle{
  val clk_in = Input(Clock())
  val global_en = Input(Bool())
  val module_en = Input(Bool())
  val local_en = Input(Bool())
  val external_en = Input(Bool())
  val pad_yy_icg_scan_en = Input(Bool())
  val clk_out = Output(Clock())
}