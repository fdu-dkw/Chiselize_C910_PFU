package gpfb.l1sm

import chisel3._

/*parameter L0_INIT_PF_ADDR = 3'b000,
 L0_ADD_PF_VA    = 3'b001,
 L0_REQ_PF       = 3'b100,
 L0_REQ_MMU      = 3'b101,
 L0_WAIT_PPN     = 3'b110,
 L0_DEAD         = 3'b111;*/
ttt
class l1smIO extends Bundle {
  val cp0_lsu_icg_en = Input(UInt(1.W))
  val cp0_lsu_pfu_mmu_dis = Input(UInt(1.W))
  val cp0_yy_clk_en = Input(Bool())
  val cpurst_b = Input(UInt(1.W))
  val entry_biu_pe_req = Input(UInt(1.W))
  val entry_biu_pe_req_grnt = Input(UInt(1.W))
  val entry_biu_pe_req_src = Input(UInt(2.W))
  val entry_clk = Input(UInt(1.W))
  val entry_create_dp_vld = Input(UInt(1.W))
  val entry_inst_new_va = Input(UInt(40.W))
  val entry_l1_dist_strideh = Input(UInt(40.W))
  val entry_mmu_pe_req = Input(UInt(1.W))
  val entry_mmu_pe_req_grnt = Input(UInt(1.W))
  val entry_mmu_pe_req_src = Input(UInt(2.W))
  val entry_pf_inst_vld = Input(UInt(1.W))
  val entry_pop_vld = Input(UInt(1.W))
  val entry_reinit_vld = Input(UInt(1.W))
  val entry_stride_neg = Input(UInt(1.W))
  val entry_strideh = Input(UInt(40.W))
  val entry_tsm_is_judge = Input(UInt(1.W))
  val forever_cpuclk = Input(UInt(1.W))
  val ld_da_page_sec_ff = Input(UInt(1.W))
  val ld_da_page_share_ff = Input(UInt(1.W))
  val ld_da_ppn_ff = Input(UInt(28.W))
  val pad_yy_icg_scan_en = Input(UInt(1.W))
  val pfu_biu_pe_req_sel_l1 = Input(UInt(1.W))
  val pfu_dcache_pref_en = Input(UInt(1.W))
  val pfu_get_page_sec = Input(UInt(1.W))
  val pfu_get_page_share = Input(UInt(1.W))
  val pfu_get_ppn = Input(UInt(28.W))
  val pfu_get_ppn_err = Input(UInt(1.W))
  val pfu_get_ppn_vld = Input(UInt(1.W))
  val pfu_mmu_pe_req_sel_l1 = Input(UInt(1.W))
  val entry_l1_biu_pe_req_set = Output(UInt(1.W))
  val entry_l1_cmp_va_vld = Output(UInt(1.W))
  val entry_l1_mmu_pe_req_set = Output(UInt(1.W))
  val entry_l1_page_sec = Output(UInt(1.W))
  val entry_l1_page_share = Output(UInt(1.W))
  val entry_l1_pf_addr = Output(UInt(40.W))
  val entry_l1_pf_va = Output(UInt(40.W))
  val entry_l1_pf_va_sub_inst_new_va = Output(UInt(40.W))
  val entry_l1_vpn = Output(UInt(28.W))
  val entry_l1sm_reinit_req = Output(UInt(1.W))
  val entry_l1sm_va_can_cmp = Output(UInt(1.W))
}
/*
class l1smwire extends Bundle{

  val cp0_lsu_icg_en		 = 	UInt(1.W)
  val cp0_lsu_pfu_mmu_dis		 = 	UInt(1.W)
  val cp0_yy_clk_en		 = 	UInt(1.W)
  val cpurst_b		 = 	UInt(1.W)
  val entry_biu_pe_req		 = 	UInt(1.W)
  val entry_biu_pe_req_grnt		 = 	UInt(1.W)
  val entry_biu_pe_req_src		 = 	UInt(2.W)
  val entry_clk		 = 	UInt(1.W)
  val entry_create_dp_vld		 = 	UInt(1.W)
  val entry_in_l1_pf_region_set		 = 	UInt(1.W)
  val entry_inst_new_va		 = 	UInt(40.W)
  val entry_inst_new_va_surpass_l1_pf_va_set		 = 	UInt(1.W)
  val entry_l1_biu_pe_req		 = 	UInt(1.W)
  val entry_l1_biu_pe_req_grnt		 = 	UInt(1.W)
  val entry_l1_biu_pe_req_set		 = 	UInt(1.W)
  val entry_l1_dist_strideh		 = 	UInt(40.W)
  val entry_l1_mmu_pe_req		 = 	UInt(1.W)
  val entry_l1_mmu_pe_req_grnt		 = 	UInt(1.W)
  val entry_l1_mmu_pe_req_set		 = 	UInt(1.W)
  val entry_l1_pf_addr		 = 	UInt(40.W)
  val entry_l1_pf_addr_init_vld		 = 	UInt(1.W)
  val entry_l1_pf_ppn_clk		 = 	UInt(1.W)
  val entry_l1_pf_ppn_clk_en		 = 	UInt(1.W)
  val entry_l1_pf_ppn_up_vld		 = 	UInt(1.W)
  val entry_l1_pf_va_add_gateclk_en		 = 	UInt(1.W)
  val entry_l1_pf_va_add_strideh		 = 	UInt(40.W)
  val entry_l1_pf_va_add_vld		 = 	UInt(1.W)
  val entry_l1_pf_va_clk		 = 	UInt(1.W)
  val entry_l1_pf_va_clk_en		 = 	UInt(1.W)
  val entry_l1_pf_va_cross_4k		 = 	UInt(1.W)
  val entry_l1_pf_va_eq_inst_new_va		 = 	UInt(1.W)
  val entry_l1_pf_va_sub_inst_new_va		 = 	UInt(40.W)
  val entry_l1_pf_va_sum_4k		 = 	UInt(13.W)
  val entry_l1_vpn		 = 	UInt(28.W)
  val entry_l1sm_diff_sub_dist_strideh		 = 	UInt(40.W)
  val entry_l1sm_is_add_pf_va		 = 	UInt(1.W)
  val entry_l1sm_is_init_pf_addr		 = 	UInt(1.W)
  val entry_l1sm_is_req_mmu		 = 	UInt(1.W)
  val entry_l1sm_is_req_pf		 = 	UInt(1.W)
  val entry_l1sm_is_wait_ppn		 = 	UInt(1.W)
  val entry_l1sm_reinit_req		 = 	UInt(1.W)
  val entry_l1sm_va_can_cmp		 = 	UInt(1.W)
  val entry_mmu_pe_req		 = 	UInt(1.W)
  val entry_mmu_pe_req_grnt		 = 	UInt(1.W)
  val entry_mmu_pe_req_src		 = 	UInt(2.W)
  val entry_pf_inst_vld		 = 	UInt(1.W)
  val entry_pop_vld		 = 	UInt(1.W)
  val entry_reinit_vld		 = 	UInt(1.W)
  val entry_stride_neg		 = 	UInt(1.W)
  val entry_strideh		 = 	UInt(40.W)
  val entry_tsm_is_judge		 = 	UInt(1.W)
  val forever_cpuclk		 = 	UInt(1.W)
  val ld_da_page_sec_ff		 = 	UInt(1.W)
  val ld_da_page_share_ff		 = 	UInt(1.W)
  val ld_da_ppn_ff		 = 	UInt(28.W)
  val pad_yy_icg_scan_en		 = 	UInt(1.W)
  val pfu_biu_pe_req_sel_l1		 = 	UInt(1.W)
  val pfu_dcache_pref_en		 = 	UInt(1.W)
  val pfu_get_page_sec		 = 	UInt(1.W)
  val pfu_get_page_share		 = 	UInt(1.W)
  val pfu_get_ppn		 = 	UInt(28.W)
  val pfu_get_ppn_err		 = 	UInt(1.W)
  val pfu_get_ppn_vld		 = 	UInt(1.W)
  val pfu_mmu_pe_req_sel_l1		 = 	UInt(1.W)
}*/


class l1sm extends RawModule{
  val io = IO(new l1smIO)

  val L0_INIT_PF_ADDR = "b001".U
  val L0_REQ_PF       = "b100".U
  val L0_REQ_MMU      = "b101".U
  val L0_WAIT_PPN     = "b110".U
  val L0_DEAD         = "b111".U

  // &Regs; @29
  reg             entry_in_l1_pf_region;
  reg             entry_inst_new_va_surpass_l1_pf_va;
  reg             entry_l1_cmp_va_vld;
  reg     3  entry_l1_next_state;
  reg             entry_l1_page_sec;
  reg             entry_l1_page_share;
  reg     28  entry_l1_pf_ppn;
  reg     40  entry_l1_pf_va;
  reg     3  entry_l1_state;

  // &Wires; @30

withClockAndReset(io.,io.){



}


}
