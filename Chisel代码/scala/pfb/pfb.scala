Package pfbTOP

import chisel3._
import chisel3.util._

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
class pfbreg extends Bundle{
  val pfu_pfb_entry_confidence_reg = RegInit(0.U(3.W))
  val pfu_pfb_entry_evict_reg = RegInit(false.B)
  val pfu_pfb_entry_no_req_cnt_reg = RegInit(0.U(6.W))
  val pfu_pfb_entry_pc_reg = RegInit(0.U(15.W))
  val pfu_pfb_entry_stride_reg = RegInit(0.U(11.W))
  val pfu_pfb_entry_stride_neg_reg = RegInit(false.B)
  val pfu_pfb_entry_strideh_6to0_reg = RegInit(0.U(7.W))
  val pfu_pfb_entry_timeout_cnt_reg = RegInit(0.U(8.W))
  val pfu_pfb_entry_type_ld_reg = RegInit(false.B)
}

class pfbwire extends Bundle{
  val l1_pref_en = Bool()
  val pfu_pfb_entry_act_vld = Bool()
  val pfu_pfb_entry_all_pf_inst_clk = Bool()
  val pfu_pfb_entry_all_pf_inst_clk_en = Bool()
  val pfu_pfb_entry_biu_pe_req = Bool()
  val pfu_pfb_entry_biu_pe_req_grnt = Bool()
  val pfu_pfb_entry_biu_pe_req_src = 0.U(2.W)
  val pfu_pfb_entry_clk = Bool()
  val pfu_pfb_entry_clk_en = Bool()
  val pfu_pfb_entry_confidence_add1 = 0.U(3.W)
  val pfu_pfb_entry_confidence_add_vld = Bool()
  val pfu_pfb_entry_confidence_high = Bool()
  val pfu_pfb_entry_confidence_low = Bool()
  val pfu_pfb_entry_confidence_next = 0.U(3.W)
  val pfu_pfb_entry_confidence_set = Bool()
  val pfu_pfb_entry_confidence_sub1 = 0.U(3.W)
  val pfu_pfb_entry_confidence_zero = Bool()
  val pfu_pfb_entry_create_clk = Bool()
  val pfu_pfb_entry_create_clk_en = Bool()
  val pfu_pfb_entry_create_dp_vld = Bool()
  val pfu_pfb_entry_create_gateclk_en = Bool()
  val pfu_pfb_entry_create_vld = Bool()
  val pfu_pfb_entry_dcache_hit_pop_req = Bool()
  val  pfu_pfb_entry_evict_clr = Bool()
  val pfu_pfb_entry_evict_set = Bool()
  val pfu_pfb_entry_from_lfb_dcache_hit = Bool()
  val pfu_pfb_entry_from_lfb_dcache_miss = Bool()
  val pfu_pfb_entry_hit_pc = Bool()
  val pfu_pfb_entry_hit_pc_for_new = Bool()
  val pfu_pfb_entry_inst_new_va = 0.U(40.W)
  val pfu_pfb_entry_inst_new_va_hit_pipe = Bool()
  val pfu_pfb_entry_l1_biu_pe_req_set = Bool()
  val pfu_pfb_entry_l1_cmp_va_vld = Bool()
  val pfu_pfb_entry_l1_dist_strideh = 0.U(40.W)
  val pfu_pfb_entry_l1_mmu_pe_req_set = Bool()
  val pfu_pfb_entry_l1_page_sec = Bool()
  val pfu_pfb_entry_l1_page_share = Bool()
  val pfu_pfb_entry_l1_pf_addr = 0.U(40.W)
  val pfu_pfb_entry_l1_pf_va = 0.U(40.W)
  val pfu_pfb_entry_l1_pf_va_sub_inst_new_va = 0.U(40.W)
  val pfu_pfb_entry_l1_vpn = 0.U(28.W)
  val pfu_pfb_entry_l1sm_reinit_req = Bool()
  val pfu_pfb_entry_l1sm_va_can_cmp = Bool()
  val pfu_pfb_entry_l2_biu_pe_req_set = Bool()
  val pfu_pfb_entry_l2_cmp_va_vld = Bool()
  val pfu_pfb_entry_l2_dist_strideh = 0.U(40.W)
  val pfu_pfb_entry_l2_mmu_pe_req_set = Bool()
  val pfu_pfb_entry_l2_page_sec = Bool()
  val pfu_pfb_entry_l2_page_share = Bool()
  val pfu_pfb_entry_l2_pf_addr = 0.U(40.W)
  val pfu_pfb_entry_l2_pf_va_sub_l1_pf_va = 0.U(40.W)
  val pfu_pfb_entry_l2_vpn = 0.U(28.W)
  val  pfu_pfb_entry_l2sm_reinit_req = Bool()
  val pfu_pfb_entry_l2sm_va_can_cmp = Bool()
  val pfu_pfb_entry_mmu_pe_req = Bool()
  val pfu_pfb_entry_mmu_pe_req_grnt = Bool()
  val pfu_pfb_entry_mmu_pe_req_src = 0.U(2.W)
  val pfu_pfb_entry_no_req_cnt_full = Bool()
  val pfu_pfb_entry_pf_inst_vld = Bool()
  val pfu_pfb_entry_pop_vld = Bool()
  val pfu_pfb_entry_priv_mode = 0.U(2.W)
  val pfu_pfb_entry_reinit_vld = Bool()
  val pfu_pfb_entry_strideh = 0.U(40.W)
  val pfu_pfb_entry_timeout_cnt_full = Bool()
  val pfu_pfb_entry_tsm_is_judge = Bool()
  val pfu_pfb_entry_vld = Bool()
  val pfu_pop_st_all = Bool()
  val pipe_act_vld = Bool()
  val pipe_cmp_inst_vld = Bool()
  val pipe_cmp_pc = 0.U(15.W)
  val pipe_evict_cnt_vld = Bool()
  val pipe_page_sec = Bool()
  val pipe_page_share = Bool()
  val pipe_ppfu_va = 0.U(40.W)
  val pipe_ppn = 0.U(28.W)
}

val TIMEOUT_BW = 8.U
val PC_LEN = 15.U

class pfb(PA_WIDTH: Int) extends RawModule {
  val io = IO(new pfbIO)
  val wire = Wire(new pfbwire)
  val reg = new pfbreg
  //==========================================================
  //                 Instance of Gated Cell
  //==========================================================
  wire.pfu_pfb_entry_clk_en := IO.pfu_pfb_entry_vld
         ||  wire.pfu_pfb_entry_create_gateclk_en;
  wire.pfu_pfb_entry_create_clk_en := wire.pfu_pfb_entry_create_gateclk_en;
  wire.pfu_pfb_entry_all_pf_inst_clk_en:=wire.pfu_pfb_entry_vld
         &&  (wire.ld_da_pfu_pf_inst_vld || wire.st_da_pfu_pf_inst_vld)
         || wire.pfu_pfb_entry_biu_pe_req
           ||wire.pfu_pfb_entry_create_gateclk_en
  val gated_clk_inst = VecInit(Seq.fill(3)(Module(new gated_clk_cell).io))
  for (i <- 0 to 2) {
    gated_clk_inst(i).clk_in := io.lsu_special_clk
    gated_clk_inst(i).external_en := 0.U(1.W)
    gated_clk_inst(i).global_en := io.cp0_yy_clk_en
    gated_clk_inst(i).module_en := io.cp0_lsu_icg_en
    gated_clk_inst(i).pad_yy_icg_scan_en := io.pad_yy_icg_scan_en
    if (i === 0) {
      wire.pfu_pfb_entry_clk := gated_clk_inst(i).clk_out
      gated_clk_inst(i).local_en := wire.pfu_pfb_entry_clk_en
    } else if(i===1) {
      wire.pfu_pfb_entry_create_clk := gated_clk_inst(i).clk_out
      gated_clk_inst(i).local_en := wire.pfu_pfb_entry_create_clk_en
    }else if(i===2){
      wire.pfu_pfb_entry_all_pf_inst_clk := gated_clk_inst(i).clk_out
      gated_clk_inst(i).local_en=wire.pfu_pfb_entry_all_pf_inst_clk_en
    }
  }
  //==========================================================
  //                 Register
  //==========================================================
  //+--------+----------------------+
  //| stride | stride_be_cache_line |
  //+--------+----------------------+
  withClockAndReset(wire.pfu_pfb_entry_create_clk, !io.cpurst_b) {
    val pc = RegInit(0.U(PC_LEN.W))
    val stride = RegInit(0.U(11.W))
    val strideh_6to0 = RegInit(0.U(7.W))
    val stride_neg = RegInit(false.B)
    val type_ld = RegInit(false.B)

    when(!io.cpurst_b) {
      pc := 0.U
      stride := 0.U
      strideh_6to0 := 0.U
      stride_neg := false.B
      type_ld := false.B
    } .elsewhen(wire.pfu_pfb_entry_create_dp_vld) {
      pc := io.pfu_pfb_create_pc(PC_LEN-1:0)
      stride := io.pfu_pfb_create_stride
      strideh_6to0 := io.pfu_pfb_create_strideh_6to0
      stride_neg := io.pfu_pfb_create_stride_neg
      type_ld := io.pfu_pfb_create_type_ld
    }

    reg.pfu_pfb_entry_pc := pc
    reg.pfu_pfb_entry_stride := stride
    reg.pfu_pfb_entry_strideh_6to0 := strideh_6to0
    reg.pfu_pfb_entry_stride_neg := stride_neg
    reg.pfu_pfb_entry_type_ld := type_ld
  }
}

  }

  //+-------------+
  //| timeout_cnt |
  //+-------------+
  withClockAndReset(wire.pfu_pfb_entry_all_pf_inst_clk, !io.cpurst_b) {
    val timeoutCnt = RegInit(0.U(TIMEOUT_BW.W))

    when(!io.cpurst_b) {
      timeoutCnt := 0.U
    } .elsewhen(wire.pfu_pfb_entry_create_dp_vld || wire.pfu_pfb_entry_pf_inst_vld) {
      timeoutCnt := 0.U
    } .elsewhen(wire.pipe_evict_cnt_vld && !wire.pfu_pfb_entry_timeout_cnt_full) {
      timeoutCnt := timeoutCnt + 1.U
    }

    reg.pfu_pfb_entry_timeout_cnt := timeoutCnt
  //+-------------+
  //| no_req_cnt |
  //+-------------+
  withClockAndReset(wire.pfu_pfb_entry_all_pf_inst_clk, !io.cpurst_b) {
    val noReqCnt = RegInit(0.U(6.W))

    when(!io.cpurst_b) {
      noReqCnt := 0.U
    } .elsewhen(wire.pfu_pfb_entry_create_dp_vld || wire.pfu_pfb_entry_biu_pe_req) {
      noReqCnt := 0.U
    } .elsewhen(wire.pfu_pfb_entry_pf_inst_vld && !wire.pfu_pfb_entry_no_req_cnt_full) {
      noReqCnt := noReqCnt + 1.U
    }

    reg.pfu_pfb_entry_no_req_cnt := noReqCnt
  }
}
  //+-------+
  //| evict |
  //+-------+
  withClockAndReset(io.pfu_pfb_entry_clk, !io.cpurst_b){
    when(!io.cpurst_b){
      reg.pfu_pfb_entry_evict := 0.U
    }.elsewhen(wire.pfu_pfb_entry_create_dp_vld ||  wire.pfu_pfb_entry_evict_clr){
      reg.pfu_pfb_entry_evict := 0.U
    }.elsewhen(pfu_pfb_entry_evict_set){
      reg.pfu_pfb_entry_evict := 1.U
    }
  }
  //+------------+
  //| confidence |
  //+------------+
  withClockAndReset(wire.pfu_pfb_entry_clk, !io.cpurst_b) {
    val confidence = RegInit(0.U(3.W))

    when(!io.cpurst_b) {
      confidence := 0.U
    } .elsewhen(wire.pfu_pfb_entry_create_dp_vld) {
      confidence := "b110".U
    } .elsewhen(wire.pfu_pfb_entry_confidence_set) {
      confidence := wire.pfu_pfb_entry_confidence_next
    }

    reg.pfu_pfb_entry_confidence := confidence
  }
}
  //==========================================================
  //                 pipe info select
  //==========================================================
  wire.pipe_cmp_inst_vld := Mux(reg.pfu_pfb_entry_type_ld ,io.ld_da_pfu_pf_inst_vld
    ,io.st_da_pfu_pf_inst_vld)

  wire.pipe_cmp_pc(PC_LEN-1:0) := Mux(reg.pfu_pfb_entry_type_ld,io.ld_da_ldfifo_pc(PC_LEN-1:0)
  ,io.st_da_pc(PC_LEN-1:0))

  wire.pipe_evict_cnt_vld := io.ld_da_pfu_evict_cnt_vld || io.st_da_pfu_evict_cnt_vld;

  wire.pipe_act_vld       := Mux(reg.pfu_pfb_entry_type_ld ,io.ld_da_pfu_act_vld
    ,io.st_da_pfu_act_vld)

  wire.pipe_ppfu_va(`PA_WIDTH-1:0)  := Mux(reg.pfu_pfb_entry_type_ld , io.ld_da_ppfu_va(`PA_WIDTH-1:0)
  , io.st_da_ppfu_va(`PA_WIDTH-1:0))

  wire.pipe_page_sec    := Mux(reg.pfu_pfb_entry_type_ld
  , io.ld_da_page_sec_ff
    ,io.st_da_page_sec_ff)

  mire.pipe_page_share  := Mux(reg.pfu_pfb_entry_type_ld
  ,io.ld_da_page_share_ff
      ,io.st_da_page_share_ff)

  wire.pipe_ppn(`PA_WIDTH-13:0) := Mux(reg.pfu_pfb_entry_type_ld
  ,io.ld_da_ppn_ff(`PA_WIDTH-13:0)
  ,io.st_da_ppn_ff([)`PA_WIDTH-13:0))

  //st will not trigger l1 prefetch
 wire.l1_pref_en := io.pfu_dcache_pref_en
  && wire.pfu_pfb_entry_vld
    && reg.pfu_pfb_entry_type_ld
  //==========================================================
  //                 Caucalate pf_inst signal
  //==========================================================
  wire.pfu_pfb_entry_hit_pc       := wire.pfu_pfb_entry_vld
  &&  (wire.pipe_cmp_pc(PC_LEN-1:0)
  ===  reg.pfu_pfb_entry_pc(PC_LEN-1:0));
  wire.pfu_pfb_entry_pf_inst_vld  := wire.pfu_pfb_entry_hit_pc
  &&  wire.pipe_cmp_inst_vld;
  wire.pfu_pfb_entry_act_vld      = wire.pfu_pfb_entry_hit_pc
  &&  wire.pipe_act_vld;
  //for new inst create
  wire.pfu_pfb_entry_hit_pc_for_new = wire.pfu_pfb_entry_hit_pc
  && !(reg.pfu_pfb_entry_type_ld ^ io.ld_da_pfu_act_dp_vld);
  //==========================================================
  //                 no req evict
  //==========================================================
  //when pfb entry not send req for many inst,then set evict
  wire.pfu_pfb_entry_no_req_cnt_full := (reg.pfu_pfb_entry_no_req_cnt(5:0)
  === io.pfb_no_req_cnt_val(5:0));
  //==========================================================
  //                Instance state machine
  //==========================================================
  // &ConnRule(s/^entry_/pfu_pfb_entry_/); @211
  // &Instance("ct_lsu_pfu_pfb_tsm","x_ct_lsu_pfu_pfu_entry_tsm"); @212
  private val tsm = Module(new tsm(PA_WIDTH)).io
  tsm.cp0_lsu_icg_en := io.cp0_lsu_icg_en
  tsm.cp0_yy_clk_en := io.cp0_yy_clk_en
  tsm.cp0_yy_priv_mode := io.cp0_yy_priv_mode
  tsm.cpurst_b := io.cpurst_b
  tsm.entry_act_vld := wire.pfu_pfb_entry_act_vld
  io.pfu_pfb_entry_biu_pe_req := tsm.entry_biu_pe_req
  tsm.entry_biu_pe_req_grnt := io.pfu_pfb_entry_biu_pe_req_grnt
  io.pfu_pfb_entry_biu_pe_req_src := tsm.entry_biu_pe_req_src
  tsm.entry_clk := wire.pfu_pfb_entry_clk
  tsm.entry_create_dp_vld := wire.pfu_pfb_entry_create_dp_vld
  tsm.entry_create_vld := wire.pfu_pfb_entry_create_vld
  wire.pfu_pfb_entry_dcache_hit_pop_req := tsm.entry_dcache_hit_pop_req
  tsm.entry_from_lfb_dcache_hit := io.pfu_pfb_entry_from_lfb_dcache_hit
  tsm.entry_from_lfb_dcache_miss := io.pfu_pfb_entry_from_lfb_dcache_miss
  wire.pfu_pfb_entry_inst_new_va := tsm.entry_inst_new_va
  tsm.entry_l1_biu_pe_req_set := wire.pfu_pfb_entry_l1_biu_pe_req_set
  tsm.entry_l1_mmu_pe_req_set := wire.pfu_pfb_entry_l1_mmu_pe_req_set
  tsm.entry_l2_biu_pe_req_set := wire.pfu_pfb_entry_l2_biu_pe_req_set
  tsm.entry_l2_mmu_pe_req_set := wire.pfu_pfb_entry_l2_mmu_pe_req_set
  io.pfu_pfb_entry_mmu_pe_req  := tsm.entry_mmu_pe_req
  tsm.entry_mmu_pe_req_grnt := io.pfu_pfb_entry_mmu_pe_req_grnt
  io.pfu_pfb_entry_mmu_pe_req_src := tsm.entry_mmu_pe_req_src
  tsm.entry_pf_inst_vld := wire.pfu_pfb_entry_pf_inst_vld
  tsm.entry_pop_vld := wire.pfu_pfb_entry_pop_vld
  io.pfu_pfb_entry_priv_mode := tsm.entry_priv_mode
  tsm.entry_reinit_vld := wire.pfu_pfb_entry_reinit_vld
  tsm.entry_stride := wire.pfu_pfb_entry_stride
  tsm.entry_stride_neg := wire.pfu_pfb_entry_stride_neg
  wire.pfu_pfb_entry_tsm_is_judge := tsm.entry_tsm_is_judge
  io.pfu_pfb_entry_vld := tsm.entry_vld
  tsm.forever_cpuclk := io.lsu_special_clk
  tsm.pad_yy_icg_scan_en := io.pad_yy_icg_scan_en
  tsm.pipe_va := wire.pipe_ppfu_va
  // &Connect(.forever_cpuclk      (lsu_special_clk      ), @218
  //          .pfu_dcache_pref_en  (l1_pref_en           )); @219
  // &Force("nonport","pfu_pfb_entry_l1_pf_va_sub_inst_new_va"); @220
  // &Force("nonport","pfu_pfb_entry_l1_cmp_va_vld"); @221
  // &Force("nonport","pfu_pfb_entry_l1sm_va_can_cmp"); @222

  // &ConnRule(s/^entry_/pfu_pfb_entry_/); @224
  // &Instance("ct_lsu_pfu_pfb_l2sm","x_ct_lsu_pfu_pfb_entry_l2sm"); @225
  private val lsm = List(Module(new l1sm(PA_WIDTH, 0)).io, Module(new l1sm(PA_WIDTH, 1)).io)
  for (i <- 0 to 1) {
    lsm(i).cp0_lsu_icg_en := io.cp0_lsu_icg_en
    lsm(i).cp0_lsu_pfu_mmu_dis := io.cp0_lsu_pfu_mmu_dis
    lsm(i).cp0_yy_clk_en := io.cp0_yy_clk_en
    lsm(i).cpurst_b := io.cpurst_b
    lsm(i).entry_biu_pe_req := io.pfu_pfb_entry_biu_pe_req
    lsm(i).entry_biu_pe_req_grnt := io.pfu_pfb_entry_biu_pe_req_grnt
    lsm(i).entry_biu_pe_req_src := io.pfu_pfb_entry_biu_pe_req_src
    lsm(i).entry_clk := wire.pfu_pfb_entry_clk
    lsm(i).entry_create_dp_vld := wire.pfu_pfb_entry_create_dp_vld
    lsm(i).entry_inst_new_va  := wire.pfu_pfb_entry_inst_new_va
    lsm(i).entry_mmu_pe_req := io.pfu_pfb_entry_mmu_pe_req
    lsm(i).entry_mmu_pe_req_grnt := io.pfu_pfb_entry_mmu_pe_req_grnt
    lsm(i).entry_mmu_pe_req_src := io.pfu_pfb_entry_mmu_pe_req_src
    lsm(i).entry_pf_inst_vld := wire.pfu_pfb_entry_pf_inst_vld
    lsm(i).entry_pop_vld := wire.pfu_pfb_entry_pop_vld
    lsm(i).entry_reinit_vld := wire.pfu_gpfb_reinit_vld
    lsm(i).entry_stride_neg := wire.pfu_pfb_entry_stride_neg
    lsm(i).entry_strideh := wire.pfu_pfb_entry_strideh
    lsm(i).entry_tsm_is_judge := wire.pfu_pfb_entry_tsm_is_judge
    lsm(i).forever_cpuclk := io.lsu_special_clk
    lsm(i).ld_da_page_sec_ff := wire.pipe_page_sec
    lsm(i).ld_da_page_share_ff := wire.pipe_page_share
    lsm(i).ld_da_ppn_ff := wire.pipe_ppn
    lsm(i).pad_yy_icg_scan_en := io.pad_yy_icg_scan_en
    lsm(i).pfu_biu_pe_req_sel_l1 := io.pfu_biu_pe_req_sel_l1
    lsm(i).pfu_get_page_sec := io.pfu_get_page_sec
    lsm(i).pfu_get_page_share := io.pfu_get_page_share
    lsm(i).pfu_get_ppn := io.pfu_get_ppn
    lsm(i).pfu_get_ppn_err := io.pfu_get_ppn_err
    lsm(i).pfu_get_ppn_vld := io.pfu_get_ppn_vld
    lsm(i).pfu_mmu_pe_req_sel_l1 := io.pfu_mmu_pe_req_sel_l1

    lsm(i).entry_inst_new_va := wire.pfu_gpfb_inst_new_va

    if (i == 0) {
      lsm(i).pfu_dcache_pref_en := io.l1_pref_en

      wire.pfu_pfb_entry_l1_pf_va  := lsm(i).entry_l1_pf_va.get

      wire.pfu_pfb_entry_l1sm_reinit_req  := lsm(i).entry_l1sm_reinit_req
      wire.pfu_pfb_entry_l1sm_va_can_cmp := lsm(i).entry_l1sm_va_can_cmp
      lsm(i).entry_l1_dist_strideh := wire.pfu_pfb_entry_l1_dist_strideh
      wire.pfu_pfb_entry_l1_biu_pe_req_set := lsm(i).entry_l1_biu_pe_req_set
      wire.pfu_pfb_entry_l1_cmp_va_vld   := lsm(i).entry_l1_cmp_va_vld
      wire.pfu_pfb_entry_l1_mmu_pe_req_set := lsm(i).entry_l1_mmu_pe_req_set
      io.pfu_pfb_entry_l1_page_sec  := lsm(i).entry_l1_page_sec
      io.pfu_pfb_entry_l1_page_share := lsm(i).entry_l1_page_share
      io.pfu_pfb_entry_l1_pf_addr  := lsm(i).entry_l1_pf_addr
      wire.pfu_pfb_entry_l1_pf_va_sub_inst_new_va := lsm(i).entry_l1_pf_va_sub_inst_new_va ///
      io.pfu_pfb_entry_l1_vpn := lsm(i).entry_l1_vpn
    } else {
      lsm(i).pfu_l2_pref_en := io.pfu_l2_pref_en //

      lsm(i).entry_l1_pf_va.get := wire.p_pfb_entry_l1_pf_va

      wire.pfu_pfb_entry_l2sm_reinit_req := lsm(i).entry_l2sm_reinit_req
      wire.pfu_pfb_entry_l2sm_va_can_cmp := lsm(i).entry_l2sm_va_can_cmp
      lsm(i).entry_l2_dist_strideh  := wire.pfu_pfb_entry_l2_dist_strideh
      wire.pfu_pfb_entry_l2_mmu_pe_req_set  := lsm(i).entry_l2_mmu_pe_req_set
      wire.pfu_pfb_entry_l2_cmp_va_vld := lsm(i).entry_l2_cmp_va_vld
      wire.pfu_pfb_entry_l2_biu_pe_req_set  := lsm(i).entry_l2_biu_pe_req_set
      io.pfu_pfb_entry_l2_page_sec := lsm(i).entry_l2_page_sec
      io.pfu_pfb_entry_l2_page_share := lsm(i).entry_l2_page_share
      io.pfu_pfb_entry_l2_pf_addr  := lsm(i).entry_l2_pf_addr
      wire.pfu_pfb_entry_l2_pf_va_sub_l1_pf_va := lsm(i).entry_l2_pf_va_sub_l1_pf_va  ///
      io.pfu_pfb_entry_l2_vpn := lsm(i).entry_l2_vpn

    }
  }

  //==========================================================
  //                Generate some compare info
  //==========================================================
  //------------------generate strideh------------------------
wire.pfu_pfb_entry_strideh(`PA_WIDTH-1:0) := Cat(
  Fill(paWidth - 11, reg.pfu_pfb_entry_stride_neg),
  reg.pfu_pfb_entry_stride(10, 7),
  reg.pfu_pfb_entry_strideh_6to0
)
  wire.pfu_pfb_entry_l1_dist_strideh := (Fill(wire.pfu_pfb_entry_l1_dist_strideh.getWidth - PA_WIDTH, 0.U(1.W)) ##
    (Fill(PA_WIDTH, io.lsu_pfu_l1_dist_sel(3)) & (wire.pfu_pfb_entry_strideh(PA_WIDTH - 4, 0) ## 0.U(3.W))
      | Fill(PA_WIDTH, io.lsu_pfu_l1_dist_sel(2)) & (wire.pfu_pfb_entry_strideh(PA_WIDTH - 3, 0) ## 0.U(2.W))
      | Fill(PA_WIDTH, io.lsu_pfu_l1_dist_sel(1)) & (wire.pfu_pfb_entry_strideh(PA_WIDTH - 2, 0) ## 0.U(1.W))
      | Fill(PA_WIDTH, io.lsu_pfu_l1_dist_sel(0)) & (wire.pfu_pfb_entry_strideh(PA_WIDTH - 1, 0) )))

  wire.pfu_pfb_entry_l2_dist_strideh := (Fill(wire.pfu_gpfb_l1_dist_strideh.getWidth - PA_WIDTH, 0.U(1.W)) ##
    (Fill(PA_WIDTH, io.lsu_pfu_l2_dist_sel(3)) & (wire.pfu_pfb_entry_strideh(PA_WIDTH - 6, 0) ## 0.U(5.W))
      | Fill(PA_WIDTH, io.lsu_pfu_l2_dist_sel(2)) & (wire.pfu_pfb_entry_strideh(PA_WIDTH - 5, 0) ## 0.U(4.W))
      | Fill(PA_WIDTH, io.lsu_pfu_l2_dist_sel(1)) & (wire.pfu_pfb_entry_strideh(PA_WIDTH - 4, 0) ## 0.U(3.W))
      | Fill(PA_WIDTH, io.lsu_pfu_l2_dist_sel(0)) & (wire.pfu_pfb_entry_strideh(PA_WIDTH - 3, 0) ## 0.U(2.W))))
  //==========================================================
  //                    Set confidence
  //==========================================================
  wire.pfu_pfb_entry_inst_new_va_hit_pipe := wire.pipe_ppfu_va(`PA_WIDTH-1:0)
  ===  wire.pfu_pfb_entry_inst_new_va(`PA_WIDTH-1:0)
  //--------------------confidence set------------------------
  wire.pfu_pfb_entry_confidence_high     := &reg.pfu_pfb_entry_confidence(2:0)
  wire.pfu_pfb_entry_confidence_low      := !(|reg.pfu_pfb_entry_confidence(2:0))

  wire.pfu_pfb_entry_confidence_set      := wire.pfu_pfb_entry_tsm_is_judge
  &&  !(wire.pfu_pfb_entry_confidence_high
    &&  wire.pfu_pfb_entry_confidence_add_vld)
  &&  !(wire.pfu_pfb_entry_confidence_low
    &&  !wire.pfu_pfb_entry_confidence_add_vld)
  &&  wire.pfu_pfb_entry_pf_inst_vld

  wire.pfu_pfb_entry_confidence_add1(2:0) := reg.pfu_pfb_entry_confidence(2:0) + 3'b1
  wire.pfu_pfb_entry_confidence_sub1(2:0) := reg.pfu_pfb_entry_confidence(2:0) - 3'b1

  wire.pfu_pfb_entry_confidence_add_vld   := wire.pfu_pfb_entry_inst_new_va_hit_pipe

  wire.pfu_pfb_entry_confidence_next(2:0) := Mux(wire.pfu_pfb_entry_confidence_add_vld,wire.pfu_pfb_entry_confidence_add1(2:0),wire.pfu_pfb_entry_confidence_sub1(2:0))

  //--------------set confidence thdreshold------------------
  wire.pfu_pfb_entry_confidence_zero      := reg.pfu_pfb_entry_confidence(2:0)
  ===  3'b0;
  //==========================================================
  //                    Set/clr evict
  //==========================================================
 wire.pfu_pfb_entry_timeout_cnt_full := (reg.pfu_pfb_entry_timeout_cnt(TIMEOUT_BW-1:0)
  === wire.pfb_timeout_cnt_val(TIMEOUT_BW-1:0))

 wire.pfu_pfb_entry_evict_set := wire.pfu_pfb_entry_vld
  &&  (wire.pfu_pfb_entry_timeout_cnt_full
    || wire.pfu_pfb_entry_no_req_cnt_full)

  wire.pfu_pfb_entry_evict_clr := !wire.pfu_pfb_entry_timeout_cnt_full
  && !wire.pfu_pfb_entry_no_req_cnt_full
  //==========================================================
  //                Generate  pop signal
  //==========================================================
 wire.pfu_pfb_entry_reinit_vld = wire.pfu_pfb_entry_l1sm_reinit_req
  ||  wire.pfu_pfb_entry_l2sm_reinit_req
    ||  wire.pfu_pfb_entry_create_vld
    ||  wire.pfu_pfb_entry_tsm_is_judge
    &&  wire.pfu_pfb_entry_pf_inst_vld
    &&  !wire.pfu_pfb_entry_inst_new_va_hit_pipe
  //st pref pop
 wire.pfu_pop_st_all := wire.pfu_pfb_entry_vld
  && !reg.pfu_pfb_entry_type_ld
  && (!wire.cp0_lsu_l2_st_pref_en || wire.amr_wa_cancel)

wire.pfu_pfb_entry_pop_vld := wire.pfu_pop_all_part_vld
  ||  wire.pfu_pop_st_all
    ||  wire.pfu_pfb_entry_vld
    &&  (wire.pfu_pfb_entry_dcache_hit_pop_req
      ||  wire.pfu_pfb_entry_confidence_zero)
  //==========================================================
  //                 Generate interface
  //==========================================================
  //------------------input-----------------------------------
  //-----------create signal--------------
  wire.pfu_pfb_entry_create_vld := wire.pfu_pfb_entry_create_vld_x
  wire.pfu_pfb_entry_create_dp_vld := wire.pfu_pfb_entry_create_dp_vld_x
  wire.pfu_pfb_entry_create_gateclk_en := wire.pfu_pfb_entry_create_gateclk_en_x
  //---------grnt/done signal-------------
  wire.pfu_pfb_entry_biu_pe_req_grnt := wire.pfu_pfb_entry_biu_pe_req_grnt_x
  wire.pfu_pfb_entry_mmu_pe_req_grnt := wire.pfu_pfb_entry_mmu_pe_req_grnt_x
  //-----------reply signal---------------
  wire.pfu_pfb_entry_from_lfb_dcache_hit := wire.pfu_pfb_entry_from_lfb_dcache_hit_x
  wire.pfu_pfb_entry_from_lfb_dcache_miss := wire.pfu_pfb_entry_from_lfb_dcache_miss_x
  //------------------output----------------------------------
  //-----------entry signal---------------
  wire.pfu_pfb_entry_vld_x := wire.pfu_pfb_entry_vld
  wire.pfu_pfb_entry_l1_vpn_v[`PA_WIDTH-13:0]
  //-----------hit signal-----------------
  wire.pfu_pfb_entry_hit_pc_x := wire.pfu_pfb_entry_hit_pc_for_new
}


