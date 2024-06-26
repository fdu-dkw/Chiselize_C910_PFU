import chisel3._
import chisel3.util.HasBlackBoxResource
import chisel3.util.HasBlackBoxInline

// Use parameter TIMEOUT_BW and PC_LEN To parameterlize the module
class ct_lsu_pfu_sdb_entry extends Module {
  val io = IO(new Bundle {

    // Inputs
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

    // Outputs
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

  // Regs
  val pfu_sdb_entry_evict = RegInit(false.B)
  val pfu_sdb_entry_pc = RegInit(0.U(15.W))
  val pfu_sdb_entry_ready = RegInit(false.B)
  val pfu_sdb_entry_timeout_cnt = RegInit(0.U(8.W))
  val pfu_sdb_entry_type_ld = RegInit(false.B)
  val pfu_sdb_entry_vld = RegInit(false.B)

  // Wires
  //  val amr_wa_cancel = Wire(Bool())
  //  val cp0_lsu_icg_en = Wire(Bool())
  //  val cp0_lsu_l2_st_pref_en = Wire(Bool())
  //  val cp0_yy_clk_en = Wire(Bool())
  //  val cpurst_b = Wire(Bool())
  //  val ld_da_iid = Wire(UInt(7.W))
  //  val ld_da_ldfifo_pc = Wire(UInt(15.W))
  //  val ld_da_pfu_act_dp_vld = Wire(Bool())
  //  val ld_da_pfu_evict_cnt_vld = Wire(Bool())
  //  val ld_da_pfu_pf_inst_vld = Wire(Bool())
  //  val ld_da_ppfu_va = Wire(UInt(40.W))
  //  val lsu_special_clk = Wire(Bool())
  //  val pad_yy_icg_scan_en = Wire(Bool())
  val pfu_pfb_entry_all_pf_inst_clk = Wire(Clock())
  val pfu_pfb_entry_all_pf_inst_clk_en = Wire(Bool())
  //  val pfu_pop_all_part_vld = Wire(Bool())
  val pfu_pop_st_all = Wire(Bool())
  //  val pfu_sdb_create_pc = Wire(UInt(15.W))
  //  val pfu_sdb_create_type_ld = Wire(Bool())
  val pfu_sdb_entry_addr_cmp_info_vld = Wire(Bool())
  val pfu_sdb_entry_check_stride_success = Wire(Bool())
  val pfu_sdb_entry_clk = Wire(Clock())
  val pfu_sdb_entry_clk_en = Wire(Bool())
  val pfu_sdb_entry_create_clk = Wire(Clock())
  val pfu_sdb_entry_create_clk_en = Wire(Bool())
  val pfu_sdb_entry_create_dp_vld = Wire(Bool())
  //  val pfu_sdb_entry_create_dp_vld_x = Wire(Bool())
  val pfu_sdb_entry_create_gateclk_en = Wire(Bool())
  //  val pfu_sdb_entry_create_gateclk_en_x = Wire(Bool())
  val pfu_sdb_entry_create_vld = Wire(Bool())
  //  val pfu_sdb_entry_create_vld_x = Wire(Bool())
  val pfu_sdb_entry_evict_clr = Wire(Bool())
  val pfu_sdb_entry_evict_set = Wire(Bool())
  //  val pfu_sdb_entry_evict_x = Wire(Bool())
  val pfu_sdb_entry_hit_pc = Wire(Bool())
  val pfu_sdb_entry_hit_pc_for_new = Wire(Bool())
  //  val pfu_sdb_entry_hit_pc_x = Wire(Bool())
  val pfu_sdb_entry_normal_stride = Wire(Bool())
  //  val pfu_sdb_entry_pc_v = Wire(UInt(15.W))
  val pfu_sdb_entry_pf_inst_vld = Wire(Bool())
  val pfu_sdb_entry_pop_vld = Wire(Bool())
  val pfu_sdb_entry_ready_grnt = Wire(Bool())
  //  val pfu_sdb_entry_ready_grnt_x = Wire(Bool())
  val pfu_sdb_entry_ready_set = Wire(Bool())
  //  val pfu_sdb_entry_ready_x = Wire(Bool())
  val pfu_sdb_entry_stride = Wire(UInt(11.W))
  val pfu_sdb_entry_stride_neg = Wire(Bool())
  //  val pfu_sdb_entry_stride_neg_x = Wire(Bool())
  //  val pfu_sdb_entry_stride_v = Wire(UInt(11.W))
  val pfu_sdb_entry_strideh_6to0 = Wire(UInt(7.W))
  //  val pfu_sdb_entry_strideh_6to0_v = Wire(UInt(7.W))
  val pfu_sdb_entry_timeout_cnt_full = Wire(Bool())
  //  val pfu_sdb_entry_type_ld_x = Wire(Bool())
  //  val pfu_sdb_entry_vld_x = Wire(Bool())
  val pipe_cmp_inst_vld = Wire(Bool())
  val pipe_cmp_pc = Wire(UInt(15.W))
  val pipe_evict_cnt_vld = Wire(Bool())
  val pipe_iid = Wire(UInt(7.W))
  val pipe_ppfu_va = Wire(UInt(40.W))
  //  val rtu_yy_xx_commit0 = Wire(Bool())
  //  val rtu_yy_xx_commit0_iid = Wire(UInt(7.W))
  //  val rtu_yy_xx_commit1 = Wire(Bool())
  //  val rtu_yy_xx_commit1_iid = Wire(UInt(7.W))
  //  val rtu_yy_xx_commit2 = Wire(Bool())
  //  val rtu_yy_xx_commit2_iid = Wire(UInt(7.W))
  //  val rtu_yy_xx_flush = Wire(Bool())
  ////  val sdb_timeout_cnt_val = Wire(UInt(8.W))
  //  val st_da_iid = Wire(UInt(7.W))
  //  val st_da_pc = Wire(UInt(15.W))
  //  val st_da_pfu_evict_cnt_vld = Wire(Bool())
  //  val st_da_pfu_pf_inst_vld = Wire(Bool())
  //  val st_da_ppfu_va = Wire(UInt(40.W))

  //==========================================================
  //                 Instance of Gated Cell
  //==========================================================

  pfu_sdb_entry_clk_en := pfu_sdb_entry_vld || pfu_sdb_entry_create_gateclk_en


  val gatedClkCell_1 = Module(new gated_clk_cell)

  gatedClkCell_1.io.clk_in := io.lsu_special_clk
  pfu_sdb_entry_clk := gatedClkCell_1.io.clk_out
  gatedClkCell_1.io.external_en := false.B
  gatedClkCell_1.io.global_en := io.cp0_yy_clk_en
  gatedClkCell_1.io.local_en := pfu_sdb_entry_clk_en
  gatedClkCell_1.io.module_en := io.cp0_lsu_icg_en
  gatedClkCell_1.io.pad_yy_icg_scan_en := io.pad_yy_icg_scan_en

  pfu_sdb_entry_create_clk_en := pfu_sdb_entry_create_gateclk_en


  val gatedClkCell_2 = Module(new gated_clk_cell)

  gatedClkCell_2.io.clk_in := io.lsu_special_clk
  pfu_sdb_entry_create_clk := gatedClkCell_2.io.clk_out
  gatedClkCell_2.io.external_en := false.B
  gatedClkCell_2.io.global_en := io.cp0_yy_clk_en
  gatedClkCell_2.io.local_en := pfu_sdb_entry_create_clk_en
  gatedClkCell_2.io.module_en := io.cp0_lsu_icg_en
  gatedClkCell_2.io.pad_yy_icg_scan_en := io.pad_yy_icg_scan_en

  pfu_pfb_entry_all_pf_inst_clk_en := pfu_sdb_entry_vld && (io.ld_da_pfu_pf_inst_vld || io.st_da_pfu_pf_inst_vld) || pfu_sdb_entry_create_gateclk_en


  val gatedClkCell_3 = Module(new gated_clk_cell)

  gatedClkCell_3.io.clk_in := io.lsu_special_clk
  pfu_pfb_entry_all_pf_inst_clk := gatedClkCell_3.io.clk_out
  gatedClkCell_3.io.external_en := false.B
  gatedClkCell_3.io.global_en := io.cp0_yy_clk_en
  gatedClkCell_3.io.local_en := pfu_pfb_entry_all_pf_inst_clk_en
  gatedClkCell_3.io.module_en := io.cp0_lsu_icg_en
  gatedClkCell_3.io.pad_yy_icg_scan_en := io.pad_yy_icg_scan_en

  //==========================================================
  //                 Register
  //==========================================================
  //+-----------+
  //| entry_vld |
  //+-----------+
  withClockAndReset(pfu_sdb_entry_clk, !io.cpurst_b) {
    when (!io.cpurst_b) {
      pfu_sdb_entry_vld := false.B
    } .elsewhen (pfu_sdb_entry_pop_vld) {
      pfu_sdb_entry_vld := false.B
    } .elsewhen (pfu_sdb_entry_create_vld) {
      pfu_sdb_entry_vld := true.B
    }
  }

  //+----+
  //| pc |
  //+----+
  withClockAndReset(pfu_sdb_entry_create_clk, !io.cpurst_b) {
    when (!io.cpurst_b) {
      pfu_sdb_entry_pc :=  0.U
    } .elsewhen (pfu_sdb_entry_create_dp_vld) {
      pfu_sdb_entry_pc :=  io.pfu_sdb_create_pc
    }
  }

  //+----+------+
  //| pref_type |
  //+----+------+
  withClockAndReset(pfu_sdb_entry_create_clk, !io.cpurst_b) {
    when (!io.cpurst_b) {
      pfu_sdb_entry_type_ld :=  0.U
    } .elsewhen (pfu_sdb_entry_create_dp_vld) {
      pfu_sdb_entry_type_ld :=  io.pfu_sdb_create_type_ld
    }
  }

  //+-------------+
  //| timeout_cnt |
  //+-------------+
  withClockAndReset(pfu_sdb_entry_create_clk, !io.cpurst_b){
    when(!io.cpurst_b){
      pfu_sdb_entry_timeout_cnt := 0.U
    } .elsewhen(pfu_sdb_entry_create_dp_vld ||  pfu_sdb_entry_pf_inst_vld){
      pfu_sdb_entry_timeout_cnt := 0.U
    } .elsewhen(pipe_evict_cnt_vld &&  !pfu_sdb_entry_timeout_cnt_full){
      pfu_sdb_entry_timeout_cnt := pfu_sdb_entry_timeout_cnt + 1.U
    }
  }

  //+-------+
  //| ready |
  //+-------+
  withClockAndReset(pfu_sdb_entry_create_clk, !io.cpurst_b) {
    when(!io.cpurst_b) {
      pfu_sdb_entry_evict := false.B
    }.elsewhen(pfu_sdb_entry_create_dp_vld || pfu_sdb_entry_pop_vld || pfu_sdb_entry_evict_clr) {
      pfu_sdb_entry_evict := false.B
    }.elsewhen(pfu_sdb_entry_evict_set) {
      pfu_sdb_entry_evict := true.B
    }
  }

  //==========================================================
  //                Instance addr cmp
  //==========================================================

  val ctLsuPfuSdbEntryCmp = Module(new ct_lsu_pfu_sdb_entry_cmp)

  ctLsuPfuSdbEntryCmp.io.cp0_lsu_icg_en := io.cp0_lsu_icg_en
  ctLsuPfuSdbEntryCmp.io.cp0_yy_clk_en := io.cp0_yy_clk_en
  ctLsuPfuSdbEntryCmp.io.cpurst_b := io.cpurst_b
  ctLsuPfuSdbEntryCmp.io.entry_addr0_act := true.B
  pfu_sdb_entry_addr_cmp_info_vld := ctLsuPfuSdbEntryCmp.io.entry_addr_cmp_info_vld
  pfu_sdb_entry_check_stride_success := ctLsuPfuSdbEntryCmp.io.entry_check_stride_success
  ctLsuPfuSdbEntryCmp.io.entry_clk := pfu_sdb_entry_clk
  ctLsuPfuSdbEntryCmp.io.entry_create_dp_vld := pfu_sdb_entry_create_dp_vld
  ctLsuPfuSdbEntryCmp.io.entry_create_gateclk_en := pfu_sdb_entry_create_gateclk_en
  pfu_sdb_entry_normal_stride := ctLsuPfuSdbEntryCmp.io.entry_normal_stride
  ctLsuPfuSdbEntryCmp.io.entry_pf_inst_vld := pfu_sdb_entry_pf_inst_vld
  pfu_sdb_entry_stride := ctLsuPfuSdbEntryCmp.io.entry_stride
  ctLsuPfuSdbEntryCmp.io.entry_stride_keep := false.B
  pfu_sdb_entry_stride_neg := ctLsuPfuSdbEntryCmp.io.entry_stride_neg
  pfu_sdb_entry_strideh_6to0 := ctLsuPfuSdbEntryCmp.io.entry_strideh_6to0
  ctLsuPfuSdbEntryCmp.io.entry_vld := pfu_sdb_entry_vld
  ctLsuPfuSdbEntryCmp.io.forever_cpuclk := io.lsu_special_clk
  ctLsuPfuSdbEntryCmp.io.ld_da_iid := pipe_iid
  ctLsuPfuSdbEntryCmp.io.pad_yy_icg_scan_en :=io.pad_yy_icg_scan_en
  ctLsuPfuSdbEntryCmp.io.pipe_va := pipe_ppfu_va
  ctLsuPfuSdbEntryCmp.io.rtu_yy_xx_commit0 := io.rtu_yy_xx_commit0
  ctLsuPfuSdbEntryCmp.io.rtu_yy_xx_commit0_iid := io.rtu_yy_xx_commit0_iid
  ctLsuPfuSdbEntryCmp.io.rtu_yy_xx_commit1 := io.rtu_yy_xx_commit1
  ctLsuPfuSdbEntryCmp.io.rtu_yy_xx_commit1_iid := io.rtu_yy_xx_commit1_iid
  ctLsuPfuSdbEntryCmp.io.rtu_yy_xx_commit2 := io.rtu_yy_xx_commit2
  ctLsuPfuSdbEntryCmp.io.rtu_yy_xx_commit2_iid := io.rtu_yy_xx_commit2_iid
  ctLsuPfuSdbEntryCmp.io.rtu_yy_xx_flush := io.rtu_yy_xx_flush

  //==========================================================
  //                 pipe info select
  //==========================================================
  pipe_cmp_inst_vld := Mux(pfu_sdb_entry_type_ld, io.ld_da_pfu_pf_inst_vld, io.st_da_pfu_pf_inst_vld)

  pipe_cmp_pc := Mux(pfu_sdb_entry_type_ld, io.ld_da_ldfifo_pc, io.st_da_pc)

  pipe_evict_cnt_vld := io.ld_da_pfu_evict_cnt_vld || io.st_da_pfu_evict_cnt_vld

  pipe_iid := Mux(pfu_sdb_entry_type_ld, io.ld_da_iid, io.st_da_iid)

  pipe_ppfu_va := Mux(pfu_sdb_entry_type_ld, io.ld_da_ppfu_va, io.st_da_ppfu_va)

  //==========================================================
  //                 Caucalate hit pc signal
  //==========================================================
  pfu_sdb_entry_hit_pc := pfu_sdb_entry_vld && (pipe_cmp_pc === pfu_sdb_entry_pc)

  pfu_sdb_entry_pf_inst_vld := pfu_sdb_entry_hit_pc && pipe_cmp_inst_vld

  //for new inst create
  pfu_sdb_entry_hit_pc_for_new := pfu_sdb_entry_hit_pc && !(pfu_sdb_entry_type_ld ^ io.ld_da_pfu_act_dp_vld)

  //==========================================================
  //                    Set/clr ready evict
  //==========================================================
  pfu_sdb_entry_ready_set := pfu_sdb_entry_vld && pfu_sdb_entry_addr_cmp_info_vld && pfu_sdb_entry_normal_stride

  pfu_sdb_entry_timeout_cnt_full := (pfu_sdb_entry_timeout_cnt === io.sdb_timeout_cnt_val)

  pfu_sdb_entry_evict_set := pfu_sdb_entry_vld && !pfu_sdb_entry_ready && pipe_cmp_inst_vld && pfu_sdb_entry_timeout_cnt_full && !pfu_sdb_entry_hit_pc

  pfu_sdb_entry_evict_clr := pfu_sdb_entry_pf_inst_vld

  //==========================================================
  //                Generate pop signal
  //==========================================================
  //st pref pop
  pfu_pop_st_all := pfu_sdb_entry_vld && !pfu_sdb_entry_type_ld && (!io.cp0_lsu_l2_st_pref_en || io.amr_wa_cancel)

  //if old 3 entry cross 4k or stride not equal, then pop immediately
  pfu_sdb_entry_pop_vld := pfu_sdb_entry_ready_grnt || !pfu_sdb_entry_normal_stride && pfu_sdb_entry_addr_cmp_info_vld && pfu_sdb_entry_vld || pfu_pop_st_all || io.pfu_pop_all_part_vld

  //==========================================================
  //                 Generate interface
  //==========================================================
  //------------------input-----------------------------------
  //-----------create signal--------------
  pfu_sdb_entry_create_vld         := io.pfu_sdb_entry_create_vld_x
  pfu_sdb_entry_create_dp_vld      := io.pfu_sdb_entry_create_dp_vld_x
  pfu_sdb_entry_create_gateclk_en  := io.pfu_sdb_entry_create_gateclk_en_x
  //---------grnt/done signal-------------
  pfu_sdb_entry_ready_grnt         := io.pfu_sdb_entry_ready_grnt_x
  //------------------output----------------------------------
  //-----------entry signal---------------
  io.pfu_sdb_entry_vld_x              := pfu_sdb_entry_vld
  io.pfu_sdb_entry_pc_v               := pfu_sdb_entry_pc
  io.pfu_sdb_entry_ready_x            := pfu_sdb_entry_ready
  io.pfu_sdb_entry_evict_x            := pfu_sdb_entry_evict
  io.pfu_sdb_entry_stride_neg_x       := pfu_sdb_entry_stride_neg
  io.pfu_sdb_entry_stride_v           := pfu_sdb_entry_stride
  io.pfu_sdb_entry_strideh_6to0_v     := pfu_sdb_entry_strideh_6to0
  io.pfu_sdb_entry_type_ld_x          := pfu_sdb_entry_type_ld
  //-----------hit signal-----------------
  io.pfu_sdb_entry_hit_pc_x     := pfu_sdb_entry_hit_pc_for_new

  // &ModuleEnd;

}

//class GatedClkCell extends BlackBox with HasBlackBoxResource {
//  val io = IO(new Bundle {
//    val clk_in = Input(Clock())
//    val clk_out = Output(Clock())
//    val external_en = Input(Bool())
//    val global_en = Input(Bool())
//    val local_en = Input(Bool())
//    val module_en = Input(Bool())
//    val pad_yy_icg_scan_en = Input(Bool())
//  })
//  addResource("/gated_clk_cell.v")
//}

class gated_clk_cell extends BlackBox  {
  val io = IO(new Bundle {
    val clk_in = Input(Clock())
    val clk_out = Output(Clock())
    val external_en = Input(Bool())
    val global_en = Input(Bool())
    val local_en = Input(Bool())
    val module_en = Input(Bool())
    val pad_yy_icg_scan_en = Input(Bool())
  })

  //  setInline("GatedClkCell.v",
  //    s"""
  //       |module gated_clk_cell(
  //       |  clk_in,
  //       |  global_en,
  //       |  module_en,
  //       |  local_en,
  //       |  external_en,
  //       |  pad_yy_icg_scan_en,
  //       |  clk_out
  //       |);
  //       |
  //       |input  clk_in;
  //       |input  global_en;
  //       |input  module_en;
  //       |input  local_en;
  //       |input  external_en;
  //       |input  pad_yy_icg_scan_en;
  //       |output clk_out;
  //       |
  //       |wire   clk_en_bf_latch;
  //       |wire   SE;
  //       |
  //       |assign clk_en_bf_latch = (global_en && (module_en || local_en)) || external_en ;
  //       |
  //       |// SE driven from primary input, held constant
  //       |assign SE           = pad_yy_icg_scan_en;
  //       |
  //       |// //   &Connect(    .clk_in           (clk_in), @50
  //       |// //                .SE               (SE), @51
  //       |// //                .external_en      (clk_en_bf_latch), @52
  //       |// //                .clk_out          (clk_out) @53
  //       |// //                ) ; @54
  //       |assign clk_out = clk_in;
  //       |
  //       |endmodule
  //    """.stripMargin)
}


//class CtlLsuPfuSdbEntryCmp extends BlackBox with HasBlackBoxResource {
//  val io = IO(new Bundle {
//    val cp0_lsu_icg_en = Input(Bool())
//    val cp0_yy_clk_en = Input(Bool())
//    val cpurst_b = Input(Bool())
//    val entry_addr0_act = Input(Bool())
//    val entry_addr_cmp_info_vld = Output(Bool())
//    val entry_check_stride_success = Output(Bool())
//    val entry_clk = Input(Clock())
//    val entry_create_dp_vld = Input(Bool())
//    val entry_create_gateclk_en = Input(Bool())
//    val entry_normal_stride = Output(Bool())
//    val entry_pf_inst_vld = Input(Bool())
//    val entry_stride = Output(UInt(11.W))
//    val entry_stride_keep = Input(Bool())
//    val entry_stride_neg = Output(Bool())
//    val entry_strideh_6to0 = Output(UInt(7.W))
//    val entry_vld = Input(Bool())
//    val forever_cpuclk = Input(Clock())
//    val ld_da_iid = Input(UInt(7.W))
//    val pad_yy_icg_scan_en = Input(Bool())
//    val pipe_va = Input(UInt(40.W))
//    val rtu_yy_xx_commit0 = Input(Bool())
//    val rtu_yy_xx_commit0_iid = Input(UInt(7.W))
//    val rtu_yy_xx_commit1 = Input(Bool())
//    val rtu_yy_xx_commit1_iid = Input(UInt(7.W))
//    val rtu_yy_xx_commit2 = Input(Bool())
//    val rtu_yy_xx_commit2_iid = Input(UInt(7.W))
//    val rtu_yy_xx_flush = Input(Bool())
//  })
//  addResource("/ct_lsu_pfu_sdb_cmp.v")
//}

class ct_lsu_pfu_sdb_entry_cmp extends BlackBox {
  val io = IO(new Bundle {
    val cp0_lsu_icg_en = Input(Bool())
    val cp0_yy_clk_en = Input(Bool())
    val cpurst_b = Input(Bool())
    val entry_addr0_act = Input(Bool())
    val entry_addr_cmp_info_vld = Output(Bool())
    val entry_check_stride_success = Output(Bool())
    val entry_clk = Input(Clock())
    val entry_create_dp_vld = Input(Bool())
    val entry_create_gateclk_en = Input(Bool())
    val entry_normal_stride = Output(Bool())
    val entry_pf_inst_vld = Input(Bool())
    val entry_stride = Output(UInt(11.W))
    val entry_stride_keep = Input(Bool())
    val entry_stride_neg = Output(Bool())
    val entry_strideh_6to0 = Output(UInt(7.W))
    val entry_vld = Input(Bool())
    val forever_cpuclk = Input(Clock())
    val ld_da_iid = Input(UInt(7.W))
    val pad_yy_icg_scan_en = Input(Bool())
    val pipe_va = Input(UInt(40.W))
    val rtu_yy_xx_commit0 = Input(Bool())
    val rtu_yy_xx_commit0_iid = Input(UInt(7.W))
    val rtu_yy_xx_commit1 = Input(Bool())
    val rtu_yy_xx_commit1_iid = Input(UInt(7.W))
    val rtu_yy_xx_commit2 = Input(Bool())
    val rtu_yy_xx_commit2_iid = Input(UInt(7.W))
    val rtu_yy_xx_flush = Input(Bool())
  })

}



object Verilog_entry extends App{
  emitVerilog(new ct_lsu_pfu_sdb_entry())
}
