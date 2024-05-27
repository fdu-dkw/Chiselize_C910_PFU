package prefetch

import chisel3._
import chisel3.stage.ChiselGeneratorAnnotation
import chisel3.util._
import firrtl.TargetDirAnnotation
import org.scalatest.{FlatSpec, Matchers}

class gsdb extends Module{
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

  val IDLE = 0.U(4.W)
  val GET_STRIDE = 9.U(4.W)
  val CHECK_STRIDE = 10.U(4.W)
  val MONITOR_STRIDE = 12.U(4.W)
  val IDLE_Vec = VecInit(Seq.fill(4)(0.U(1.W)))
  val GET_STRIDE_Vec = VecInit(Seq(1.U, 0.U, 0.U, 1.U))
  val CHECK_STRIDE_Vec = VecInit(Seq(0.U, 1.U, 0.U, 1.U))
  val MONITOR_STRIDE_Vec = VecInit(Seq(0.U, 0.U, 1.U, 1.U))

  val pfu_gsdb_next_state = Wire(Vec(4, UInt(1.W)))

  val pfu_gsdb_clk_en = Wire(Bool())
  val pfu_gsdb_pf_inst_vld_clk_en = Wire(Bool())

  val pfu_gsdb_vld = Wire(Bool())

  val pfu_gsdb_state_is_get_stride      = Wire(Bool())
  val pfu_gsdb_state_is_check_stride    = Wire(Bool())
  val pfu_gsdb_state_is_monitor_stride  = Wire(Bool())

  val pfu_gsdb_pf_inst_vld = Wire(Bool())
  val pfu_gsdb_addr0_act = Wire(Bool())

  val pfu_gsdb_create_vld = Wire(Bool())
  val pfu_gsdb_create_dp_vld = Wire(Bool())
  val pfu_gsdb_create_gateclk_en = Wire(Bool())

  val confidence_max = Wire(Bool())
  val confidence_min = Wire(Bool())
  val confidence_reset = Wire(Bool())
  val confidence_sub_vld = Wire(Bool())
  val confidence_add_vld = Wire(Bool())
  val monitor_with_confidence = Wire(Bool())

  val pfu_gsdb_newest_pf_inst_cmit_hit0 = Wire(Bool())
  val pfu_gsdb_newest_pf_inst_cmit_hit1 = Wire(Bool())
  val pfu_gsdb_newest_pf_inst_cmit_hit2 = Wire(Bool())
  val pfu_gsdb_newest_pf_inst_cmit_set = Wire(Bool())
  val pfu_gsdb_newest_pf_inst_older_than_ld_da = Wire(Bool())

  val pfu_gsdb_newest_pf_inst_set = Wire(Bool())
  val pfu_gsdb_newest_pf_inst_flush_uncmit = Wire(Bool())

  //==========================================================
  //                 Instance of Gated Cell
  //==========================================================
  pfu_gsdb_clk_en := pfu_gsdb_vld || pfu_gsdb_create_gateclk_en
  pfu_gsdb_pf_inst_vld_clk_en := pfu_gsdb_pf_inst_vld
  val x_lsu_pfu_gsdb_gated_clk = Module(new gated_clk_cell)
  val x_lsu_pfu_gsdb_pf_inst_vld_gated_clk = Module(new gated_clk_cell)
  val pfu_gsdb_clk = Wire(Clock())
  x_lsu_pfu_gsdb_gated_clk.io.clk_in := io.forever_cpuclk
  x_lsu_pfu_gsdb_gated_clk.io.external_en := false.B
  x_lsu_pfu_gsdb_gated_clk.io.global_en := io.cp0_yy_clk_en
  x_lsu_pfu_gsdb_gated_clk.io.local_en := pfu_gsdb_clk_en
  x_lsu_pfu_gsdb_gated_clk.io.module_en := io.cp0_lsu_icg_en
  x_lsu_pfu_gsdb_gated_clk.io.pad_yy_icg_scan_en := io.pad_yy_icg_scan_en
  pfu_gsdb_clk := x_lsu_pfu_gsdb_gated_clk.io.clk_out
  val pfu_gsdb_pf_inst_vld_clk = Wire(Clock())
  x_lsu_pfu_gsdb_pf_inst_vld_gated_clk.io.clk_in := io.forever_cpuclk
  x_lsu_pfu_gsdb_pf_inst_vld_gated_clk.io.external_en := false.B
  x_lsu_pfu_gsdb_pf_inst_vld_gated_clk.io.global_en := io.cp0_yy_clk_en
  x_lsu_pfu_gsdb_pf_inst_vld_gated_clk.io.local_en := pfu_gsdb_pf_inst_vld_clk_en
  x_lsu_pfu_gsdb_pf_inst_vld_gated_clk.io.module_en := io.cp0_lsu_icg_en
  x_lsu_pfu_gsdb_pf_inst_vld_gated_clk.io.pad_yy_icg_scan_en := io.pad_yy_icg_scan_en
  pfu_gsdb_pf_inst_vld_clk := x_lsu_pfu_gsdb_pf_inst_vld_gated_clk.io.clk_out

  //==========================================================
  //                 Register
  //==========================================================
  //+----------------+
  //| newest_pf_inst |
  //+----------------+
  val pfu_gsdb_newest_pf_inst_iid: UInt = withClockAndReset(pfu_gsdb_pf_inst_vld_clk, (!io.cpurst_b).asAsyncReset()) {
    val reg = RegInit(0.U(7.W))
    when(!io.cpurst_b || pfu_gsdb_create_dp_vld || pfu_gsdb_newest_pf_inst_flush_uncmit) {
      reg := 0.U(7.W)
    } .elsewhen(pfu_gsdb_vld && pfu_gsdb_pf_inst_vld) {
      reg := io.ld_da_iid
    }
    reg
  }
  //+-------+
  //| state |
  //+-------+
  withClockAndReset(pfu_gsdb_clk, (!io.cpurst_b).asAsyncReset()) {
    val pfu_gsdb_state = Reg(Vec(4, UInt(1.W)))
    val pfu_gsdb_newest_pf_inst_vld = RegInit(false.B)
    val pfu_gsdb_newest_pf_inst_cmit = RegInit(false.B)
    val pfu_gsdb_pop_confidence = RegInit(2.U(2.W))
    when (!io.cpurst_b) {
      pfu_gsdb_state := IDLE_Vec
    } .elsewhen (io.pfu_pop_all_vld) {
      pfu_gsdb_state := IDLE_Vec
    } .otherwise {
      pfu_gsdb_state := pfu_gsdb_next_state
    }
    pfu_gsdb_vld := pfu_gsdb_state(3)

    //+----------------+
    //| newest_pf_inst |
    //+----------------+

    when(!io.cpurst_b || pfu_gsdb_create_dp_vld || pfu_gsdb_newest_pf_inst_flush_uncmit) {
      pfu_gsdb_newest_pf_inst_vld := false.B
    } .elsewhen(pfu_gsdb_vld && pfu_gsdb_pf_inst_vld) {
      pfu_gsdb_newest_pf_inst_vld := true.B
    }

    when (!io.cpurst_b || pfu_gsdb_newest_pf_inst_set){
      pfu_gsdb_newest_pf_inst_cmit := false.B
    } .elsewhen(pfu_gsdb_newest_pf_inst_cmit_set) {
      pfu_gsdb_newest_pf_inst_cmit := true.B
    }

    //+-----------------------------+
    //| gsdb to gpfb pop confidence |
    //+-----------------------------+
    when (!io.cpurst_b){
      pfu_gsdb_pop_confidence := 0.U(2.W)
    } .elsewhen (confidence_reset) {
      pfu_gsdb_pop_confidence := 2.U(2.W)
    } .elsewhen (confidence_sub_vld) {
      pfu_gsdb_pop_confidence := pfu_gsdb_pop_confidence - 1.U(2.W)
    } .elsewhen (confidence_add_vld) {
      pfu_gsdb_pop_confidence := pfu_gsdb_pop_confidence + 1.U(2.W)
    }

    //==========================================================
    //                Instance addr cmp
    //==========================================================
    val x_ct_lsu_pfu_gsdb_cmp = Module(new ct_lsu_pfu_sdb_cmp)
    val pfu_gsdb_check_stride_success = Wire(Bool())
    val pfu_gsdb_addr_cmp_info_vld = Wire(Bool())
    val pfu_gsdb_normal_stride = Wire(Bool())
    x_ct_lsu_pfu_gsdb_cmp.io.cp0_lsu_icg_en := io.cp0_lsu_icg_en
    x_ct_lsu_pfu_gsdb_cmp.io.cp0_yy_clk_en := io.cp0_yy_clk_en
    x_ct_lsu_pfu_gsdb_cmp.io.cpurst_b := io.cpurst_b
    x_ct_lsu_pfu_gsdb_cmp.io.entry_addr0_act := pfu_gsdb_addr0_act
    x_ct_lsu_pfu_gsdb_cmp.io.entry_clk := pfu_gsdb_clk
    x_ct_lsu_pfu_gsdb_cmp.io.entry_create_dp_vld := pfu_gsdb_create_dp_vld
    x_ct_lsu_pfu_gsdb_cmp.io.entry_create_gateclk_en := pfu_gsdb_create_gateclk_en
    x_ct_lsu_pfu_gsdb_cmp.io.entry_pf_inst_vld := pfu_gsdb_pf_inst_vld
    x_ct_lsu_pfu_gsdb_cmp.io.entry_stride_keep := monitor_with_confidence
    x_ct_lsu_pfu_gsdb_cmp.io.entry_vld := pfu_gsdb_vld
    x_ct_lsu_pfu_gsdb_cmp.io.forever_cpuclk := io.forever_cpuclk
    x_ct_lsu_pfu_gsdb_cmp.io.ld_da_iid := io.ld_da_iid
    x_ct_lsu_pfu_gsdb_cmp.io.pad_yy_icg_scan_en := io.pad_yy_icg_scan_en
    x_ct_lsu_pfu_gsdb_cmp.io.pipe_va := io.ld_da_pfu_va
    x_ct_lsu_pfu_gsdb_cmp.io.rtu_yy_xx_commit0 := io.rtu_yy_xx_commit0
    x_ct_lsu_pfu_gsdb_cmp.io.rtu_yy_xx_commit0_iid := io.rtu_yy_xx_commit0_iid
    x_ct_lsu_pfu_gsdb_cmp.io.rtu_yy_xx_commit1 := io.rtu_yy_xx_commit1
    x_ct_lsu_pfu_gsdb_cmp.io.rtu_yy_xx_commit1_iid := io.rtu_yy_xx_commit1_iid
    x_ct_lsu_pfu_gsdb_cmp.io.rtu_yy_xx_commit2 := io.rtu_yy_xx_commit2
    x_ct_lsu_pfu_gsdb_cmp.io.rtu_yy_xx_commit2_iid := io.rtu_yy_xx_commit2_iid
    x_ct_lsu_pfu_gsdb_cmp.io.rtu_yy_xx_flush := io.rtu_yy_xx_flush
    pfu_gsdb_check_stride_success := x_ct_lsu_pfu_gsdb_cmp.io.entry_check_stride_success
    pfu_gsdb_addr_cmp_info_vld := x_ct_lsu_pfu_gsdb_cmp.io.entry_addr_cmp_info_vld
    pfu_gsdb_normal_stride := x_ct_lsu_pfu_gsdb_cmp.io.entry_normal_stride
    io.pfu_gsdb_stride := x_ct_lsu_pfu_gsdb_cmp.io.entry_stride
    io.pfu_gsdb_stride_neg := x_ct_lsu_pfu_gsdb_cmp.io.entry_stride_neg
    io.pfu_gsdb_strideh_6to0 := x_ct_lsu_pfu_gsdb_cmp.io.entry_strideh_6to0

    //==========================================================
    //                Generate state machine
    //==========================================================
    pfu_gsdb_next_state := IDLE_Vec
    val pfu_gsdb_state_UInt = pfu_gsdb_state.asUInt()
    switch(pfu_gsdb_state_UInt) {
      is (IDLE) {
        when (pfu_gsdb_create_vld) {
          pfu_gsdb_next_state := GET_STRIDE_Vec
        } .otherwise{
          pfu_gsdb_next_state := IDLE_Vec
        }
      }
      is (GET_STRIDE) {
        when (pfu_gsdb_addr_cmp_info_vld &&  pfu_gsdb_normal_stride) {
          pfu_gsdb_next_state := CHECK_STRIDE_Vec
        } .otherwise{
          pfu_gsdb_next_state := GET_STRIDE_Vec
        }
      }
      is (CHECK_STRIDE) {
        when (pfu_gsdb_addr_cmp_info_vld && pfu_gsdb_check_stride_success) {
          pfu_gsdb_next_state := MONITOR_STRIDE_Vec
        } .elsewhen(pfu_gsdb_addr_cmp_info_vld && !pfu_gsdb_check_stride_success){
          pfu_gsdb_next_state := GET_STRIDE_Vec
        } .otherwise {
          pfu_gsdb_next_state := CHECK_STRIDE_Vec
        }
      }
      is (MONITOR_STRIDE) {
        when (pfu_gsdb_addr_cmp_info_vld && (!pfu_gsdb_check_stride_success && confidence_min || !io.pfu_gpfb_vld)){
          pfu_gsdb_next_state := GET_STRIDE_Vec
        } .otherwise{
          pfu_gsdb_next_state := MONITOR_STRIDE_Vec
        }
      }
    }

    pfu_gsdb_state_is_get_stride := pfu_gsdb_state(0)
    pfu_gsdb_state_is_check_stride := pfu_gsdb_state(1)
    pfu_gsdb_state_is_monitor_stride := pfu_gsdb_state(2)

    //==========================================================
    //                    Set ld inst
    //==========================================================
    pfu_gsdb_pf_inst_vld := pfu_gsdb_vld && io.ld_da_pfu_pf_inst_vld
    pfu_gsdb_addr0_act   := pfu_gsdb_newest_pf_inst_older_than_ld_da && (!(pfu_gsdb_state_is_get_stride) || io.ld_da_pfu_act_vld)

    //==========================================================
    //              Generate create gsdb signal
    //==========================================================
    pfu_gsdb_create_vld          := !pfu_gsdb_vld &&  io.cp0_yy_dcache_pref_en;
    pfu_gsdb_create_dp_vld       := pfu_gsdb_create_vld;
    pfu_gsdb_create_gateclk_en   := pfu_gsdb_create_vld;

    //==========================================================
    //              pop confidence ctrl
    //==========================================================
    confidence_max := (pfu_gsdb_pop_confidence === 3.U)
    confidence_min := (pfu_gsdb_pop_confidence === 0.U)
    confidence_reset    := pfu_gsdb_state_is_check_stride && pfu_gsdb_addr_cmp_info_vld && pfu_gsdb_check_stride_success

    confidence_sub_vld  := pfu_gsdb_state_is_monitor_stride && pfu_gsdb_addr_cmp_info_vld && !pfu_gsdb_check_stride_success && !confidence_min

    confidence_add_vld  := pfu_gsdb_state_is_monitor_stride && pfu_gsdb_addr_cmp_info_vld && pfu_gsdb_check_stride_success && !confidence_max

    monitor_with_confidence := pfu_gsdb_state_is_monitor_stride && io.pfu_gpfb_vld && !confidence_min

    //==========================================================
    //              Maintain newest iid
    //==========================================================
    val x_lsu_gsdb_newest_inst_cmp = Module(new ct_rtu_compare_iid)
    x_lsu_gsdb_newest_inst_cmp.io.x_iid0 := pfu_gsdb_newest_pf_inst_iid
    val pfu_gsdb_newest_pf_inst_iid_older_than_ld_da = x_lsu_gsdb_newest_inst_cmp.io.x_iid0_older
    x_lsu_gsdb_newest_inst_cmp.io.x_iid1 := io.ld_da_iid

    pfu_gsdb_newest_pf_inst_cmit_hit0 := Cat(io.rtu_yy_xx_commit0, io.rtu_yy_xx_commit0_iid) === Cat(1.U(1.W), pfu_gsdb_newest_pf_inst_iid)
    pfu_gsdb_newest_pf_inst_cmit_hit1 := Cat(io.rtu_yy_xx_commit1, io.rtu_yy_xx_commit0_iid) === Cat(1.U(1.W), pfu_gsdb_newest_pf_inst_iid)
    pfu_gsdb_newest_pf_inst_cmit_hit2 := Cat(io.rtu_yy_xx_commit2, io.rtu_yy_xx_commit0_iid) === Cat(1.U(1.W), pfu_gsdb_newest_pf_inst_iid)

    pfu_gsdb_newest_pf_inst_cmit_set  := (pfu_gsdb_newest_pf_inst_cmit_hit0 ||  pfu_gsdb_newest_pf_inst_cmit_hit1 ||  pfu_gsdb_newest_pf_inst_cmit_hit2) &&  pfu_gsdb_newest_pf_inst_vld

    pfu_gsdb_newest_pf_inst_older_than_ld_da := pfu_gsdb_newest_pf_inst_vld. && (pfu_gsdb_newest_pf_inst_iid_older_than_ld_da ||  pfu_gsdb_newest_pf_inst_cmit)
    //-------------------newest_pf_inst_set---------------------/
    pfu_gsdb_newest_pf_inst_set := pfu_gsdb_vld && pfu_gsdb_pf_inst_vld && (!pfu_gsdb_newest_pf_inst_vld || pfu_gsdb_newest_pf_inst_older_than_ld_da)

    pfu_gsdb_newest_pf_inst_flush_uncmit := io.rtu_yy_xx_flush && !pfu_gsdb_newest_pf_inst_cmit

    //==========================================================
    //              Generate gpfb signal
    //==========================================================
    io.pfu_gsdb_gpfb_create_vld := pfu_gsdb_state_is_check_stride && pfu_gsdb_addr_cmp_info_vld && pfu_gsdb_check_stride_success
    io.pfu_gsdb_gpfb_pop_req := pfu_gsdb_state_is_monitor_stride && pfu_gsdb_addr_cmp_info_vld && confidence_min && !pfu_gsdb_check_stride_success
  }
}

class gated_clk_cell extends BlackBox{
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

class ct_lsu_pfu_sdb_cmp extends BlackBox {
  val io = IO(new Bundle {
    val cp0_lsu_icg_en                = Input(Bool())
    val cp0_yy_clk_en                 = Input(Bool())
    val cpurst_b                      = Input(Bool())
    val entry_addr0_act               = Input(Bool())
    val entry_clk                     = Input(Clock())
    val entry_create_dp_vld           = Input(Bool())
    val entry_create_gateclk_en       = Input(Bool())
    val entry_pf_inst_vld             = Input(Bool())
    val entry_stride_keep             = Input(Bool())
    val entry_vld                     = Input(Bool())
    val forever_cpuclk                = Input(Clock())
    val ld_da_iid                     = Input(UInt(7.W))
    val pad_yy_icg_scan_en            = Input(Bool())
    val pipe_va                       = Input(UInt(40.W))
    val rtu_yy_xx_commit0             = Input(Bool())
    val rtu_yy_xx_commit0_iid         = Input(UInt(7.W))
    val rtu_yy_xx_commit1             = Input(Bool())
    val rtu_yy_xx_commit1_iid         = Input(UInt(7.W))
    val rtu_yy_xx_commit2             = Input(Bool())
    val rtu_yy_xx_commit2_iid         = Input(UInt(7.W))
    val rtu_yy_xx_flush               = Input(Bool())
    val entry_addr_cmp_info_vld       = Output(Bool())
    val entry_check_stride_success    = Output(Bool())
    val entry_normal_stride           = Output(Bool())
    val entry_stride                  = Output(UInt(11.W))
    val entry_stride_neg              = Output(Bool())
    val entry_strideh_6to0            = Output(UInt(7.W))
  })
}

class ct_rtu_compare_iid extends BlackBox {
  val io = IO(new Bundle {
    val x_iid0           = Input(UInt(7.W))
    val x_iid0_older     = Output(Bool())
    val x_iid1           = Input(UInt(7.W))
  })
}

class testTc1_counterTop extends FlatSpec with Matchers {
  (new chisel3.stage.ChiselStage).execute(
    Array("-X", "verilog"),
    Seq(ChiselGeneratorAnnotation(() => new gsdb),
      TargetDirAnnotation("Verilog")))
}