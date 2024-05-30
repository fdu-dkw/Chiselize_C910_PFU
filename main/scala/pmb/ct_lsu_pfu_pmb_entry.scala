package ct_lsu_pfu_pmb_entry_package


import chisel3._
import chisel3.util._

class ct_lsu_pfu_pmb_entry extends Module {
  //io all below
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
  // Wires @29

  val entry_hit_pc = Wire(Bool())
  val pfu_pmb_entry_all_pf_inst_clk = Wire(Clock())
  val pfu_pmb_entry_all_pf_inst_clk_en = Wire(Bool())
  val pfu_pmb_entry_clk = Wire(Clock())
  val pfu_pmb_entry_clk_en = Wire(Bool())
  val pfu_pmb_entry_create_clk = Wire(Clock())
  val pfu_pmb_entry_create_clk_en = Wire(Bool())
  val pfu_pmb_entry_create_dp_vld = Wire(Bool())
  val pfu_pmb_entry_create_gateclk_en = Wire(Bool())
  val pfu_pmb_entry_create_vld = Wire(Bool())
  val pfu_pmb_entry_evict_pop = Wire(Bool())
  val pfu_pmb_entry_hit_pc = Wire(Bool())
  val pfu_pmb_entry_hit_pc_for_new = Wire(Bool())
  val pfu_pmb_entry_pop_vld = Wire(Bool())
  val pfu_pmb_entry_ready_grnt = Wire(Bool())
  val pfu_pmb_entry_timeout_cnt_full = Wire(Bool())
  val pfu_pop_st_all = Wire(Bool())
  val pfu_sdb_entry_evict_clr = Wire(Bool())
  val pfu_sdb_entry_evict_set = Wire(Bool())
  val pipe_cmp_inst_vld = Wire(Bool())
  val pipe_cmp_pc = Wire(UInt())
  val pipe_evict_cnt_vld = Wire(Bool())
//reg wires
  val pfu_pmb_entry_cnt = Wire(UInt(1.W))
  val pfu_pmb_entry_evict = Wire(UInt(1.W))
  val pfu_pmb_entry_pc = Wire(UInt(15.W))
  val pfu_pmb_entry_ready = Wire(UInt(1.W))
  val pfu_pmb_entry_timeout_cnt = Wire(UInt(8.W))
  val pfu_pmb_entry_type_ld = Wire(UInt(1.W))
  val pfu_pmb_entry_vld = Wire(UInt(1.W))

  //gate signal

  val x_lsu_pfu_pmb_entry_gated_clk = Module (new gated_clk_cell)
  x_lsu_pfu_pmb_entry_gated_clk.io.clk_in := io.lsu_special_clk
  pfu_pmb_entry_clk := x_lsu_pfu_pmb_entry_gated_clk.io.clk_out
  x_lsu_pfu_pmb_entry_gated_clk.io.external_en :=  false.B
  x_lsu_pfu_pmb_entry_gated_clk.io.global_en :=  io.cp0_yy_clk_en
  x_lsu_pfu_pmb_entry_gated_clk.io.local_en :=  pfu_pmb_entry_clk_en
  x_lsu_pfu_pmb_entry_gated_clk.io.module_en :=   io.cp0_lsu_icg_en
  x_lsu_pfu_pmb_entry_gated_clk.io.pad_yy_icg_scan_en := io.pad_yy_icg_scan_en

  pfu_pmb_entry_create_clk_en := pfu_pmb_entry_create_gateclk_en

  val x_lsu_pfu_pmb_entry_create_gated_clk = Module(new gated_clk_cell)
  x_lsu_pfu_pmb_entry_create_gated_clk.io.clk_in :=  io.lsu_special_clk
  pfu_pmb_entry_create_clk := x_lsu_pfu_pmb_entry_create_gated_clk.io.clk_out
  x_lsu_pfu_pmb_entry_create_gated_clk.io.external_en :=  false.B
  x_lsu_pfu_pmb_entry_create_gated_clk.io.global_en :=   io.cp0_yy_clk_en
  x_lsu_pfu_pmb_entry_create_gated_clk.io.local_en :=  pfu_pmb_entry_create_clk_en
  x_lsu_pfu_pmb_entry_create_gated_clk.io.module_en :=  io.cp0_lsu_icg_en
  x_lsu_pfu_pmb_entry_create_gated_clk.io.pad_yy_icg_scan_en := io.pad_yy_icg_scan_en

  pfu_pmb_entry_all_pf_inst_clk_en := (pfu_pmb_entry_vld.asBool && ( io.ld_da_pfu_pf_inst_vld ||  io.st_da_pfu_pf_inst_vld))|| pfu_pmb_entry_create_gateclk_en

  val x_lsu_pfu_pmb_entry_all_pf_inst_gated_clk = Module(new gated_clk_cell)
  x_lsu_pfu_pmb_entry_all_pf_inst_gated_clk.io.clk_in :=   io.lsu_special_clk
  pfu_pmb_entry_all_pf_inst_clk := x_lsu_pfu_pmb_entry_all_pf_inst_gated_clk.io.clk_out
  x_lsu_pfu_pmb_entry_all_pf_inst_gated_clk.io.external_en :=  false.B
  x_lsu_pfu_pmb_entry_all_pf_inst_gated_clk.io.global_en :=   io.cp0_yy_clk_en
  x_lsu_pfu_pmb_entry_all_pf_inst_gated_clk.io.local_en :=  pfu_pmb_entry_all_pf_inst_clk_en
  x_lsu_pfu_pmb_entry_all_pf_inst_gated_clk.io.module_en :=  io.cp0_lsu_icg_en
  x_lsu_pfu_pmb_entry_all_pf_inst_gated_clk.io.pad_yy_icg_scan_en := io.pad_yy_icg_scan_en

  //regs

  withClockAndReset(pfu_pmb_entry_clk, !io.cpurst_b) {
    // Regs @28
    val pfu_pmb_entry_vld_reg = RegInit(0.U(1.W))
    val pfu_pmb_entry_ready_reg = RegInit(0.U(1.W))
    val pfu_pmb_entry_evict_reg = RegInit(0.U(1.W))
    pfu_pmb_entry_vld := pfu_pmb_entry_vld_reg
    pfu_pmb_entry_ready := pfu_pmb_entry_ready_reg
    pfu_pmb_entry_evict := pfu_pmb_entry_evict_reg

    //vld
    when(pfu_pmb_entry_pop_vld){
      pfu_pmb_entry_vld_reg := 0.U(1.W)}
      .elsewhen(pfu_pmb_entry_create_vld){
        pfu_pmb_entry_vld_reg := 1.U(1.W)}
    //ready
    when(pfu_pmb_entry_create_dp_vld ||  pfu_pmb_entry_pop_vld){
      pfu_pmb_entry_ready_reg := 0.U(1.W)}
      .elsewhen(pfu_pmb_entry_cnt.asBool & pfu_pmb_entry_hit_pc){
        pfu_pmb_entry_ready_reg := 1.U(1.W)}
    //evict
    when(pfu_pmb_entry_create_dp_vld ||  pfu_pmb_entry_pop_vld ||  pfu_sdb_entry_evict_clr){
      pfu_pmb_entry_evict_reg := 0.U(1.W)}
      .elsewhen(pfu_sdb_entry_evict_set){
        pfu_pmb_entry_evict_reg := 1.U(1.W)}
  }

    withClockAndReset(pfu_pmb_entry_create_clk, !io.cpurst_b) {
      val pfu_pmb_entry_pc_reg = RegInit(0.U(15.W))
      val pfu_pmb_entry_type_ld_reg = RegInit(0.U(1.W))
      pfu_pmb_entry_pc := pfu_pmb_entry_pc_reg
      pfu_pmb_entry_type_ld := pfu_pmb_entry_type_ld_reg
      //pc
      when(pfu_pmb_entry_create_dp_vld){
        pfu_pmb_entry_pc_reg := io.pipe_create_pc}
      //pref_type
      when(pfu_pmb_entry_create_dp_vld){
        pfu_pmb_entry_type_ld_reg := io.ld_da_pfu_act_dp_vld
      }
    }

    withClockAndReset(pfu_pmb_entry_all_pf_inst_clk, !io.cpurst_b) {
      val pfu_pmb_entry_timeout_cnt_reg = RegInit(0.U(8.W))
      val pfu_pmb_entry_cnt_reg = RegInit(0.U(1.W))
      pfu_pmb_entry_timeout_cnt := pfu_pmb_entry_timeout_cnt_reg
      pfu_pmb_entry_cnt := pfu_pmb_entry_cnt_reg
      //cnt
      when(pfu_pmb_entry_create_dp_vld) {
        pfu_pmb_entry_cnt_reg := 0.U(1.W)
      }
        .elsewhen(!pfu_pmb_entry_cnt && pfu_pmb_entry_hit_pc) {
          pfu_pmb_entry_cnt_reg := ~pfu_pmb_entry_cnt
        }

      //time_out_cnt
      when(pfu_pmb_entry_create_dp_vld || pfu_pmb_entry_hit_pc) {
        pfu_pmb_entry_timeout_cnt_reg := 0.U(8.W)
      }
        .elsewhen(pipe_evict_cnt_vld && !pfu_pmb_entry_timeout_cnt_full) {
          pfu_pmb_entry_timeout_cnt_reg := pfu_pmb_entry_timeout_cnt+1.U(8.W)
        }
    }

          pfu_pmb_entry_clk_en := pfu_pmb_entry_vld.asBool || pfu_pmb_entry_create_gateclk_en
          pipe_cmp_inst_vld := Mux(pfu_pmb_entry_type_ld.asBool,io.ld_da_pfu_pf_inst_vld,io.st_da_pfu_pf_inst_vld)
          pipe_cmp_pc := Mux(pfu_pmb_entry_type_ld.asBool,io.ld_da_ldfifo_pc,io.st_da_pc)
          pipe_evict_cnt_vld :=  io.ld_da_pfu_evict_cnt_vld ||  io.st_da_pfu_evict_cnt_vld
          //==========================================================
          //                 Caucalate hit pc signal
          //==========================================================
          entry_hit_pc := pfu_pmb_entry_vld.asBool && (pipe_cmp_pc ===  pfu_pmb_entry_pc)
          //for maintance
          pfu_pmb_entry_hit_pc := entry_hit_pc & pipe_cmp_inst_vld
          //for new inst create
          pfu_pmb_entry_hit_pc_for_new := entry_hit_pc && !(pfu_pmb_entry_type_ld.asBool ^ io.ld_da_pfu_act_dp_vld)
          //==========================================================
          //                    Set/clr evict
          //==========================================================
          pfu_pmb_entry_timeout_cnt_full := (pfu_pmb_entry_timeout_cnt ===  io.pmb_timeout_cnt_val)
          //if
          pfu_sdb_entry_evict_set := pfu_pmb_entry_vld.asBool && !pfu_pmb_entry_ready&&  pipe_cmp_inst_vld&&  pfu_pmb_entry_timeout_cnt_full&&  !pfu_pmb_entry_hit_pc//向外传递的信号
          pfu_sdb_entry_evict_clr := pfu_pmb_entry_hit_pc
          //==========================================================
          //                Generate pop signal
          //==========================================================
          //st pref pop
          pfu_pop_st_all := pfu_pmb_entry_vld.asBool && !pfu_pmb_entry_type_ld&& (! io.cp0_lsu_l2_st_pref_en || io.amr_wa_cancel)
          //for timing
          //when create_vld != create_dp,and the entry is at evict state
          //pop entry preventing data path from being changed incorrectly
          pfu_pmb_entry_evict_pop := pfu_pmb_entry_vld.asBool && pfu_pmb_entry_evict.asBool && pfu_pmb_entry_create_dp_vld&& !pfu_pmb_entry_create_vld
          pfu_pmb_entry_pop_vld := pfu_pmb_entry_ready_grnt||  pfu_pmb_entry_evict_pop||  pfu_pop_st_all||   io.pfu_pop_all_part_vld

          //==========================================================
          //                 Generate interface
          //==========================================================
          //------------------input-----------------------------------
          //-----------create signal--------------
          pfu_pmb_entry_create_vld :=  io.pfu_pmb_entry_create_vld_x
          pfu_pmb_entry_create_dp_vld :=  io.pfu_pmb_entry_create_dp_vld_x
          pfu_pmb_entry_create_gateclk_en :=  io.pfu_pmb_entry_create_gateclk_en_x
          //---------grnt/done signal-------------
          pfu_pmb_entry_ready_grnt :=  io.pfu_pmb_entry_ready_grnt_x
          //------------------output----------------------------------
          //-----------entry signal---------------
          io.pfu_pmb_entry_vld_x := pfu_pmb_entry_vld
          io.pfu_pmb_entry_pc_v := pfu_pmb_entry_pc
          io.pfu_pmb_entry_ready_x := pfu_pmb_entry_ready
          io.pfu_pmb_entry_evict_x := pfu_pmb_entry_evict
          io.pfu_pmb_entry_type_ld_x := pfu_pmb_entry_type_ld
          //-----------hit signal-----------------
          io.pfu_pmb_entry_hit_pc_x := pfu_pmb_entry_hit_pc_for_new
}
class gated_clk_cell extends BlackBox {
  val io = IO(new Bundle {
    val clk_in = Input(Clock())
    val external_en = Input(Bool())
    val global_en = Input(Bool())
    val local_en = Input(Bool())
    val module_en = Input(Bool())
    val pad_yy_icg_scan_en = Input(Bool())
    val clk_out = Output(Clock())
  })
}
