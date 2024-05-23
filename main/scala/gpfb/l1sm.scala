package gpfb.l1sm

import chisel3._
import chisel3.experimental.ChiselEnum
import chisel3.util._
/*parameter L0_INIT_PF_ADDR = 3'b000,
 L0_ADD_PF_VA    = 3'b001,
 L0_REQ_PF       = 3'b100,
 L0_REQ_MMU      = 3'b101,
 L0_WAIT_PPN     = 3'b110,
 L0_DEAD         = 3'b111;*/
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

class l1smwire extends Bundle{
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
}
/*
class l1smargs extends Bundle {
  val L0_INIT_PF_ADDR = "b001".U
  val L0_REQ_PF       = "b100".U
  val L0_REQ_MMU      = "b101".U
  val L0_WAIT_PPN     = "b110".U
  val L0_DEAD         = "b111".U
}
*/
object args extends ChiselEnum{

  val L1_INIT_PF_ADDR = Value("b001".U(3.W))
  val L1_ADD_PF_VA    = Value("b001".U(3.W))
  val L1_REQ_PF       = Value("b100".U(3.W))
  val L1_REQ_MMU      = Value("b101".U(3.W))
  val L1_WAIT_PPN     = Value("b110".U(3.W))
  val L1_DEAD         = Value("b111".U(3.W))
}
class l1sm extends RawModule {

  val io = IO(new l1smIO)
  val wire = Wire(new l1smwire)


  //compare info
  withClockAndReset(io.entry_clk.asBool.asClock,(!io.cpurst_b.asBool).asAsyncReset){ //注意asAsyncReset
    val entry_in_l0_pf_region = RegInit(1.U(1.W));
    val entry_inst_new_va_surpass_l1_pf_va = RegInit(0.U(1.W))
  when (io.entry_create_dp_vld.asBool || io.entry_reinit_vld.asBool ){
    entry_in_l0_pf_region := "b1".U
    entry_inst_new_va_surpass_l1_pf_va := "b0".U
  }.elsewhen(io.entry_l1_cmp_va_vld.asBool && io.entry_l1sm_va_can_cmp.asBool){
    entry_inst_new_va_surpass_l1_pf_va := wire.entry_inst_new_va_surpass_l1_pf_va_set
  }
}
  //有另外一种实现方法：使用regnext，将when的第一个判断和复位信号用或连接起来变成一个复位信号，otherwise始终跟随。上下两个同理
  withClockAndReset(io.entry_clk.asBool.asClock,io.cpurst_b.asBool.asAsyncReset){
    val entry_l1_state = RegInit(UInt(3.W),args.L1_INIT_PF_ADDR)
    when(io.entry_pop_vld.asBool || io.entry_reinit_vld.asBool || !io.pfu_dcache_pref_en.asBool){
      entry_l1_state := args.L1_INIT_PF_ADDR
    }.otherwise{
      entry_l1_state := entry_l1_next_state
    }
  }
//chisel的when语句包含了上升沿或者下降沿的检测概念，再加上switch，其实已经不需要将敏感列表列出，也不需要将其转为clock等取巧的方法

  val stateClock = io.pfu_dcache_pref_en.asBool || io.pfu_get_ppn_vld.asBool || entry_l1_state ||
  val entry_l1_next_state = withClock(stateClock.asClock){Reg(UInt(3.W))}

  /*未解决时钟问题与触发问题，先写了逻辑



   */


}
