import chisel3._

class ct_lsu_pfu_sdb_cmp extends Module {
  val io = IO(new Bundle{
    val cp0_lsu_icg_en = Input(Bool())
    val cp0_yy_clk_en = Input(Bool())
    val cpurst_b = Input(Bool())
    val entry_addr0_act = Input(Bool())
    val entry_clk = Input(Clock())
    val entry_create_dp_vld = Input(Bool())
    val entry_create_gateclk_en = Input(Bool())
    val entry_pf_inst_vld = Input(Bool())
    val entry_stride_keep = Input(Bool())
    val entry_vld = Input(Bool())
    val forever_cpuclk = Input(Clock())
    val ld_da_iid = Input(UInt(7.W))
    val pad_yy_icg_scan_en = Input(Bool())
    val pipe_va = Input(UInt(40.W))
    val rtu_yy_xx_commit0 = Input(UInt(1.W))
    val rtu_yy_xx_commit0_iid = Input(UInt(7.W))
    val rtu_yy_xx_commit1 = Input(UInt(1.W))
    val rtu_yy_xx_commit1_iid = Input(UInt(7.W))
    val rtu_yy_xx_commit2 = Input(UInt(1.W))
    val rtu_yy_xx_commit2_iid = Input(UInt(7.W))
    val rtu_yy_xx_flush = Input(Bool())
    val entry_addr_cmp_info_vld = Output(Bool())
    val entry_check_stride_success = Output(Bool())
    val entry_normal_stride = Output(Bool())
    val entry_stride = Output(UInt(11.W))
    val entry_stride_neg = Output(Bool())
    val entry_strideh_6to0 = Output(UInt(7.W))
  })
  val entry_addr_0 = Wire(UInt(40.W))
  val entry_addr_1 = Wire(UInt(40.W))
  val entry_addr_2 = Wire(UInt(40.W))
  val entry_addr_cmp_info_vld = Wire(UInt(1.W))
  val entry_addr_vld = Wire(Vec(3,UInt(1.W)))
  val entry_cmit = Wire(Vec(3,UInt(1.W)))
  val entry_iid_0 = Wire(UInt(7.W))
  val entry_iid_1 = Wire(UInt(7.W))
  val entry_iid_2 = Wire(UInt(7.W))
  val entry_stride = Wire(UInt(11.W))
  val entry_stride_0to1_neg_cross_2k = Wire(UInt(1.W))
  val entry_stride_0to1_pos_cross_2k = Wire(UInt(1.W))
  val entry_stride_0to1_zero = Wire(UInt(1.W))
  val entry_stride_cmp0_eq = Wire(UInt(1.W))
  val entry_stride_diff_eq = Wire(UInt(1.W))
  val entry_stride_neg = Wire(UInt(1.W))
  val cp0_lsu_icg_en = io.cp0_lsu_icg_en
  val cp0_yy_clk_en = io.cp0_yy_clk_en
  val cpurst_b = io.cpurst_b
  val entry_addr0_act = io.entry_addr0_act
  val entry_addr_0_clk = Wire(Clock())
  val entry_addr_0_clk_en = Wire(Bool())
  val entry_addr_0_next = Wire(UInt(40.W))
  val entry_addr_1_clk = Wire(Clock())
  val entry_addr_1_clk_en = Wire(Bool())
  val entry_addr_1_next = Wire(UInt(40.W))
  val entry_addr_2_clk = Wire(Clock())
  val entry_addr_2_clk_en = Wire(Bool())
  val entry_addr_2_next = Wire(UInt(40.W))
  val entry_addr_dp_set = Wire(Vec(3,UInt(1.W)))
  val entry_addr_set = Wire(Vec(3,UInt(1.W)))
  val entry_check_stride_success = Wire(Bool())
  val entry_clk = io.entry_clk
  val entry_clr_addr_info_vld = Wire(Bool())
  val entry_cmit_all = Wire(Bool())
  val entry_cmit_all_clk = Wire(Clock())
  val entry_cmit_all_clk_en = Wire(Bool())
  val entry_cmit_hit0 = Wire(Vec(3,UInt(1.W)))
  val entry_cmit_hit1 = Wire(Vec(3,UInt(1.W)))
  val entry_cmit_hit2 = Wire(Vec(3,UInt(1.W)))
  val entry_cmit_set = Wire(Vec(3,UInt(1.W)))
  val entry_create_dp_vld = io.entry_create_dp_vld
  val entry_create_gateclk_en = io.entry_create_gateclk_en
  val entry_flush_uncmit = Wire(Vec(3,UInt(1.W)))
  val entry_iid_0_next = Wire(UInt(7.W))
  val entry_iid_1_next = Wire(UInt(7.W))
  val entry_iid_2_next = Wire(UInt(7.W))
  val entry_iid_newer_than_ld_da = Wire(Vec(3,UInt(1.W)))
  val entry_newer_than_ld_da = Wire(Vec(3,UInt(1.W)))
  val entry_normal_stride = Wire(Bool())
  val entry_pf_inst_vld = io.entry_pf_inst_vld
  val entry_sel_2 = Wire(Bool())
  val entry_stride_0to1 = Wire(UInt(40.W))
  val entry_stride_0to1_cross_2k = Wire(Bool())
  val entry_stride_0to1_neg_cross_2k_set = Wire(Bool())
  val entry_stride_0to1_pos_cross_2k_set = Wire(Bool())
  val entry_stride_0to1_zero_set = Wire(Bool())
  val entry_stride_1to0 = Wire(UInt(40.W))
  val entry_stride_1to2 = Wire(UInt(40.W))
  val entry_stride_cmp0_eq_set = Wire(Bool())
  val entry_stride_create_vld = Wire(Bool())
  val entry_stride_diff_eq_set = Wire(Bool())
  val entry_stride_ge_cache_line = Wire(Bool())
  val entry_stride_keep = io.entry_stride_keep
  val entry_stride_neg_ge_cache_line = Wire(Bool())
  val entry_stride_neg_set = Wire(Bool())
  val entry_stride_pos_ge_cache_line = Wire(Bool())
  val entry_strideh_6to0 = Wire(UInt(7.W))
  val entry_vld = io.entry_vld
  val forever_cpuclk = io.forever_cpuclk
  val ld_da_iid = io.ld_da_iid
  val pad_yy_icg_scan_en = io.pad_yy_icg_scan_en
  val pipe_va = io.pipe_va
  val rtu_yy_xx_commit0 = io.rtu_yy_xx_commit0
  val rtu_yy_xx_commit0_iid = io.rtu_yy_xx_commit0_iid
  val rtu_yy_xx_commit1 = io.rtu_yy_xx_commit1
  val rtu_yy_xx_commit1_iid = io.rtu_yy_xx_commit1_iid
  val rtu_yy_xx_commit2 = io.rtu_yy_xx_commit2
  val rtu_yy_xx_commit2_iid = io.rtu_yy_xx_commit2_iid
  val rtu_yy_xx_flush = io.rtu_yy_xx_flush

  entry_cmit_all_clk_en := entry_create_gateclk_en ||  entry_vld &&  entry_cmit_all
  val x_lsu_entry_cmit_all_gated_clk = Module(new gated_clk_cell)
  x_lsu_entry_cmit_all_gated_clk.io.clk_in := forever_cpuclk
  entry_cmit_all_clk := x_lsu_entry_cmit_all_gated_clk.io.clk_out
  x_lsu_entry_cmit_all_gated_clk.io.external_en := false.B
  x_lsu_entry_cmit_all_gated_clk.io.global_en := cp0_yy_clk_en
  x_lsu_entry_cmit_all_gated_clk.io.local_en := entry_cmit_all_clk_en
  x_lsu_entry_cmit_all_gated_clk.io.module_en := cp0_lsu_icg_en
  x_lsu_entry_cmit_all_gated_clk.io.pad_yy_icg_scan_en := pad_yy_icg_scan_en

  entry_addr_0_clk_en := entry_addr_dp_set(0).asBool
  val x_lsu_entry_addr_0_gated_clk = Module(new gated_clk_cell)
  x_lsu_entry_addr_0_gated_clk.io.clk_in := forever_cpuclk
  entry_addr_0_clk := x_lsu_entry_addr_0_gated_clk.io.clk_out
  x_lsu_entry_addr_0_gated_clk.io.external_en := false.B
  x_lsu_entry_addr_0_gated_clk.io.global_en := cp0_yy_clk_en
  x_lsu_entry_addr_0_gated_clk.io.local_en := entry_addr_0_clk_en
  x_lsu_entry_addr_0_gated_clk.io.module_en := cp0_lsu_icg_en
  x_lsu_entry_addr_0_gated_clk.io.pad_yy_icg_scan_en := pad_yy_icg_scan_en

  entry_addr_1_clk_en := entry_addr_dp_set(1).asBool
  val x_lsu_entry_addr_1_gated_clk = Module(new gated_clk_cell)
  x_lsu_entry_addr_1_gated_clk.io.clk_in := forever_cpuclk
  entry_addr_1_clk := x_lsu_entry_addr_1_gated_clk.io.clk_out
  x_lsu_entry_addr_1_gated_clk.io.external_en := false.B
  x_lsu_entry_addr_1_gated_clk.io.global_en := cp0_yy_clk_en
  x_lsu_entry_addr_1_gated_clk.io.local_en := entry_addr_1_clk_en
  x_lsu_entry_addr_1_gated_clk.io.module_en := cp0_lsu_icg_en
  x_lsu_entry_addr_1_gated_clk.io.pad_yy_icg_scan_en := pad_yy_icg_scan_en

  entry_addr_2_clk_en := entry_addr_dp_set(2).asBool
  val x_lsu_entry_addr_2_gated_clk = Module(new gated_clk_cell)
  x_lsu_entry_addr_2_gated_clk.io.clk_in := forever_cpuclk
  entry_addr_2_clk := x_lsu_entry_addr_2_gated_clk.io.clk_out
  x_lsu_entry_addr_2_gated_clk.io.external_en := false.B
  x_lsu_entry_addr_2_gated_clk.io.global_en := cp0_yy_clk_en
  x_lsu_entry_addr_2_gated_clk.io.local_en := entry_addr_2_clk_en
  x_lsu_entry_addr_2_gated_clk.io.module_en := cp0_lsu_icg_en
  x_lsu_entry_addr_2_gated_clk.io.pad_yy_icg_scan_en := pad_yy_icg_scan_en

  //                 Register
  //==========================================================
  //------------------addr/addr_vld/cmit----------------------
  //+--------+-------+
  //| addr_0 | iid_0 |
  //+--------+-------+
  withClockAndReset(entry_addr_0_clk,(!io.cpurst_b).asTypeOf(AsyncReset())){
    val entry_addr_0_reg = RegInit(0.U(40.W))
    val entry_iid_0_reg = RegInit(0.U(7.W))
    entry_addr_0 := entry_addr_0_reg
    entry_iid_0 := entry_iid_0_reg
      when(entry_addr_dp_set(0).asBool){
        entry_addr_0_reg := entry_addr_0_next(39,0)
        entry_iid_0_reg := entry_iid_0_next(6,0)
      }
  }
  //+-------------+
  //| addr_vld[0] |
  //+-------------+
  withClockAndReset(entry_clk,(!io.cpurst_b).asTypeOf(AsyncReset())){
    val entry_addr_vld_reg0 = RegInit(0.U(1.W))
    entry_addr_vld(0) := entry_addr_vld_reg0
      when(entry_create_dp_vld ||  entry_flush_uncmit(0).asBool ||  entry_clr_addr_info_vld){
        entry_addr_vld_reg0 := 0.U(1.W)
      }
      .elsewhen(entry_addr_set(0).asBool){
        entry_addr_vld_reg0 := 1.U(1.W)
      }
  }
  //+---------+
  //| cmit[0] |
  //+---------+
  withClockAndReset(entry_clk,(!io.cpurst_b).asTypeOf(AsyncReset())){
    val entry_cmit_reg0 = RegInit(0.U(1.W))
    entry_cmit(0) := entry_cmit_reg0
      when(entry_create_dp_vld ||  entry_flush_uncmit(0).asBool ||  entry_clr_addr_info_vld){
        entry_cmit_reg0 := 0.U(1.W)
      }
      .elsewhen(entry_cmit_set(0).asBool){
        entry_cmit_reg0 := 1.U(1.W)
      }
  }
  //+--------+-------+
  //| addr_1 | iid_1 |
  //+--------+-------+
  withClockAndReset(entry_addr_1_clk,(!io.cpurst_b).asTypeOf(AsyncReset())){
    val entry_addr_1_reg = RegInit(0.U(40.W))
    val entry_iid_1_reg = RegInit(0.U(7.W))
    entry_addr_1 := entry_addr_1_reg
    entry_iid_1 := entry_iid_1_reg
      when(entry_addr_dp_set(1).asBool){
        entry_addr_1_reg := entry_addr_1_next(39,0)
        entry_iid_1_reg := entry_iid_1_next(6,0)
      }
  }
  //+-------------+
  //| addr_vld[1] |
  //+-------------+
  withClockAndReset(entry_clk,(!io.cpurst_b).asTypeOf(AsyncReset())){
    val entry_addr_vld_reg1 = RegInit(0.U(1.W))
    entry_addr_vld(1) := entry_addr_vld_reg1
      when(entry_create_dp_vld ||  entry_flush_uncmit(1).asBool ||  entry_clr_addr_info_vld){
        entry_addr_vld_reg1 := 0.U(1.W)
      }
      .elsewhen(entry_addr_set(1).asBool){
        entry_addr_vld_reg1 := 1.U(1.W)
      }
  }
  //+---------+
  //| cmit[1] |
  //+---------+
  withClockAndReset(entry_clk,(!io.cpurst_b).asTypeOf(AsyncReset())){
    val entry_cmit_reg1 = RegInit(0.U(1.W))
    entry_cmit(1) := entry_cmit_reg1
      when(entry_create_dp_vld ||  entry_flush_uncmit(1).asBool ||  entry_clr_addr_info_vld){
        entry_cmit_reg1 := 0.U(1.W)
      }
      .elsewhen(entry_cmit_set(1).asBool){
        entry_cmit_reg1 := 1.U(1.W)
      }
  }

  //+--------+-------+
  //| addr_2 | iid_2 |
  //+--------+-------+
  withClockAndReset(entry_addr_2_clk,(!io.cpurst_b).asTypeOf(AsyncReset())){
    val entry_addr_2_reg = RegInit(0.U(40.W))
    val entry_iid_2_reg = RegInit(0.U(7.W))
    entry_addr_2 := entry_addr_2_reg
    entry_iid_2 := entry_iid_2_reg
      when(entry_addr_dp_set(2).asBool){
        entry_addr_2_reg := entry_addr_2_next(39,0)
        entry_iid_2_reg := entry_iid_2_next(6,0)
      }
  }
  //+-------------+
  //| addr_vld[2] |
  //+-------------+
  withClockAndReset(entry_clk,(!io.cpurst_b).asTypeOf(AsyncReset())){
    val entry_addr_vld_reg2 = RegInit(0.U(1.W))
    entry_addr_vld(2) := entry_addr_vld_reg2
      when(entry_create_dp_vld ||  entry_flush_uncmit(2).asBool ||  entry_clr_addr_info_vld){
        entry_addr_vld_reg2 := 0.U(1.W)
      }
      .elsewhen(entry_addr_set(2).asBool){
        entry_addr_vld_reg2 := 1.U(1.W)
      }
  }
  //+---------+
  //| cmit[2] |
  //+---------+
  withClockAndReset(entry_clk,(!io.cpurst_b).asTypeOf(AsyncReset())){
    val entry_cmit_reg2 = RegInit(0.U(1.W))
    entry_cmit(2) := entry_cmit_reg2
      when(entry_create_dp_vld ||  entry_flush_uncmit(2).asBool ||  entry_clr_addr_info_vld){
        entry_cmit_reg2 := 0.U(1.W)
      }
      .elsewhen(entry_cmit_set(2).asBool){
        entry_cmit_reg2 := 1.U(1.W)
      }
  }

  //+--------+
  //| stride |
  //+--------+
  withClockAndReset(entry_cmit_all_clk,(!io.cpurst_b).asTypeOf(AsyncReset())){
    val entry_stride_neg_reg = RegInit(0.U(1.W))
    val entry_stride_reg = RegInit(0.U(11.W))
    entry_stride_neg := entry_stride_neg_reg
    entry_stride := entry_stride_reg
      when(entry_stride_create_vld){
        entry_stride_neg_reg := entry_stride_neg_set.asUInt
        entry_stride_reg := entry_stride_0to1(10,0)
      }
  }

  //+-------------------+
  //| addr compare info |
  //+-------------------+
  withClockAndReset(entry_cmit_all_clk,(!io.cpurst_b).asTypeOf(AsyncReset())){
    val entry_addr_cmp_info_vld_reg = RegInit(0.U(1.W))
    val entry_stride_diff_eq_reg = RegInit(0.U(1.W))
    val entry_stride_0to1_neg_cross_2k_reg = RegInit(0.U(1.W))
    val entry_stride_0to1_pos_cross_2k_reg = RegInit(0.U(1.W))
    val entry_stride_0to1_zero_reg = RegInit(0.U(1.W))
    val entry_stride_cmp0_eq_reg = RegInit(0.U(1.W))
    entry_addr_cmp_info_vld :=entry_addr_cmp_info_vld_reg
    entry_stride_diff_eq := entry_stride_diff_eq_reg
    entry_stride_0to1_neg_cross_2k := entry_stride_0to1_neg_cross_2k_reg
    entry_stride_0to1_pos_cross_2k := entry_stride_0to1_pos_cross_2k_reg
    entry_stride_0to1_zero := entry_stride_0to1_zero_reg
    entry_stride_cmp0_eq := entry_stride_cmp0_eq_reg
      when(entry_create_dp_vld  ||  entry_clr_addr_info_vld){
        entry_addr_cmp_info_vld_reg := 0.U(1.W)
        entry_stride_diff_eq_reg := 0.U(1.W)
        entry_stride_cmp0_eq_reg := 0.U(1.W)
        entry_stride_0to1_zero_reg := 0.U(1.W)
        entry_stride_0to1_pos_cross_2k_reg := 0.U(1.W)
        entry_stride_0to1_neg_cross_2k_reg := 0.U(1.W)
      }
      .elsewhen(entry_vld &&  entry_cmit_all){
        entry_addr_cmp_info_vld_reg := 1.U(1.W)
        entry_stride_diff_eq_reg := entry_stride_diff_eq_set.asUInt
        entry_stride_cmp0_eq_reg := entry_stride_cmp0_eq_set.asUInt
        entry_stride_0to1_zero_reg := entry_stride_0to1_zero_set.asUInt
        entry_stride_0to1_pos_cross_2k_reg := entry_stride_0to1_pos_cross_2k_set.asUInt
        entry_stride_0to1_neg_cross_2k_reg := entry_stride_0to1_neg_cross_2k_set.asUInt
      }
  }
  //==========================================================
  //                 Generate cmit signal
  //==========================================================
  //----------------------cmit0 signal------------------------
  entry_cmit_hit0(0) := ((rtu_yy_xx_commit0##rtu_yy_xx_commit0_iid(6,0))===(1.U##entry_iid_0(6,0))).asUInt
  entry_cmit_hit1(0) := ((rtu_yy_xx_commit1##rtu_yy_xx_commit1_iid(6,0))===(1.U##entry_iid_0(6,0))).asUInt
  entry_cmit_hit2(0) := ((rtu_yy_xx_commit2##rtu_yy_xx_commit2_iid(6,0))===(1.U##entry_iid_0(6,0))).asUInt
  entry_cmit_set(0) := ((entry_cmit_hit0(0).asBool ||  entry_cmit_hit1(0).asBool ||  entry_cmit_hit2(0).asBool)&&  entry_addr_vld(0).asBool).asUInt
  //----------------------cmit1 signal------------------------
  entry_cmit_hit0(1) := ((rtu_yy_xx_commit0##rtu_yy_xx_commit0_iid(6,0))===(1.U##entry_iid_1(6,0))).asUInt
  entry_cmit_hit1(1) := ((rtu_yy_xx_commit1##rtu_yy_xx_commit1_iid(6,0))===(1.U##entry_iid_1(6,0))).asUInt
  entry_cmit_hit2(1) := ((rtu_yy_xx_commit2##rtu_yy_xx_commit2_iid(6,0))===(1.U##entry_iid_1(6,0))).asUInt
  entry_cmit_set(1) := ((entry_cmit_hit0(1).asBool ||  entry_cmit_hit1(1).asBool ||  entry_cmit_hit2(1).asBool)&&  entry_addr_vld(1).asBool).asUInt
  //----------------------cmit2 signal------------------------
  entry_cmit_hit0(2) := ((rtu_yy_xx_commit0##rtu_yy_xx_commit0_iid(6,0))===(1.U##entry_iid_2(6,0))).asUInt
  entry_cmit_hit1(2) := ((rtu_yy_xx_commit1##rtu_yy_xx_commit1_iid(6,0))===(1.U##entry_iid_2(6,0))).asUInt
  entry_cmit_hit2(2) := ((rtu_yy_xx_commit2##rtu_yy_xx_commit2_iid(6,0))===(1.U##entry_iid_2(6,0))).asUInt
  entry_cmit_set(2) := ((entry_cmit_hit0(2).asBool ||  entry_cmit_hit1(2).asBool ||  entry_cmit_hit2(2).asBool)&&  entry_addr_vld(2).asBool).asUInt
  //-------------------flush uncommited-----------------------
  entry_flush_uncmit(2) := rtu_yy_xx_flush.asUInt &(~entry_cmit(2))
  entry_flush_uncmit(1) := rtu_yy_xx_flush.asUInt &(~entry_cmit(1))
  entry_flush_uncmit(0) := rtu_yy_xx_flush.asUInt &(~entry_cmit(0))
  //==========================================================
  //                    Set addr and iid
  //==========================================================
  //------------------------addr_set--------------------------
  entry_addr_dp_set(0) := (entry_pf_inst_vld &&  !(entry_addr_vld(0).asBool)).asUInt
  entry_addr_dp_set(1) := (entry_pf_inst_vld &&  !(entry_newer_than_ld_da(0).asBool)&&((entry_addr_vld(0).asBool) &&  !(entry_addr_vld(1).asBool) ||  (entry_newer_than_ld_da(1).asBool))).asUInt
  entry_addr_dp_set(2) := (entry_pf_inst_vld&&  !(entry_newer_than_ld_da(0).asBool)&&  ((entry_addr_vld(0).asBool &&  entry_addr_vld(1).asBool &&  !(entry_addr_vld(2).asBool) ||  entry_newer_than_ld_da(2).asBool))).asUInt
  entry_addr_set(0) := (entry_addr_dp_set(0).asBool&&  entry_addr0_act).asUInt
  entry_addr_set(1) := entry_addr_dp_set(1)
  entry_addr_set(2) := entry_addr_dp_set(2)
  //----------------------addr/iid set------------------------
  //------------------0-------------------
  entry_addr_0_next := pipe_va(39,0)
  entry_iid_0_next := ld_da_iid(6,0)
  //------------------1-------------------
  entry_addr_1_next := pipe_va(39,0)
  entry_iid_1_next := ld_da_iid(6,0)
  //------------------2-------------------
  entry_sel_2 := entry_newer_than_ld_da(1).asBool
  entry_addr_2_next := Mux(entry_sel_2,entry_addr_1(39,0),pipe_va(39,0))
  entry_iid_2_next := Mux(entry_sel_2,entry_iid_1(6,0),ld_da_iid(6,0))

  //--------------------compare iid---------------------------
  //------------------0-------------------
  val x_lsu_sdb_cmp_0 = Module(new ct_rtu_compare_iid)
  x_lsu_sdb_cmp_0.io.x_iid0 := ld_da_iid(6,0)
  entry_iid_newer_than_ld_da(0) := x_lsu_sdb_cmp_0.io.x_iid0_older
  x_lsu_sdb_cmp_0.io.x_iid1 := entry_iid_0(6,0)
  entry_newer_than_ld_da(0) := (entry_iid_newer_than_ld_da(0).asBool && !(entry_cmit(0).asBool) && entry_addr_vld(0).asBool).asUInt

  //------------------1-------------------
  val x_lsu_sdb_cmp_1 = Module(new ct_rtu_compare_iid)
  x_lsu_sdb_cmp_1.io.x_iid0 := ld_da_iid(6,0)
  entry_iid_newer_than_ld_da(1):= x_lsu_sdb_cmp_1.io.x_iid0_older
  x_lsu_sdb_cmp_1.io.x_iid1 := entry_iid_1(6,0)
  entry_newer_than_ld_da(1) := (entry_iid_newer_than_ld_da(1).asBool && !(entry_cmit(1).asBool) && entry_addr_vld(1).asBool).asUInt

  //------------------2-------------------
  val x_lsu_sdb_cmp_2 = Module(new ct_rtu_compare_iid)
  x_lsu_sdb_cmp_2.io.x_iid0 := ld_da_iid(6,0)
  entry_iid_newer_than_ld_da(2):= x_lsu_sdb_cmp_2.io.x_iid0_older
  x_lsu_sdb_cmp_2.io.x_iid1 := entry_iid_2(6,0)
  entry_newer_than_ld_da(2) := (entry_iid_newer_than_ld_da(2).asBool && !(entry_cmit(2).asBool) && entry_addr_vld(2).asBool).asUInt

  //==========================================================
  //                Compare stride
  //==========================================================
  entry_stride_1to0 := entry_addr_0(39,0) - entry_addr_1(39,0)
  entry_stride_0to1 := entry_addr_1(39,0) - entry_addr_0(39,0)
  entry_stride_1to2 := entry_addr_2(39,0) - entry_addr_1(39,0)
  entry_stride_neg_set := entry_stride_0to1(39).asBool
  entry_stride_diff_eq_set := entry_stride_0to1(39,0) === entry_stride_1to2(39,0)
  entry_stride_cmp0_eq_set := entry_stride_0to1(11,0) === (entry_stride_neg##entry_stride(10,0))
  entry_stride_0to1_pos_cross_2k_set := Mux(entry_stride_0to1(39,12)===0.U,false.B,true.B)
  entry_stride_0to1_neg_cross_2k_set := Mux(entry_stride_1to0(39,12)===0.U,false.B,true.B)
  entry_stride_0to1_zero_set := Mux(entry_stride_0to1(39,0)===0.U,true.B,false.B)
  entry_stride_0to1_cross_2k := entry_stride_neg.asBool && entry_stride_0to1_neg_cross_2k.asBool || !(entry_stride_neg.asBool) && entry_stride_0to1_pos_cross_2k.asBool

  //----------------------judge stride------------------------
  entry_normal_stride := !(entry_stride_0to1_zero.asBool) && !entry_stride_0to1_cross_2k && entry_stride_diff_eq.asBool
  entry_check_stride_success := entry_normal_stride && entry_stride_cmp0_eq.asBool

  //==========================================================
  //                    Addr info wires
  //==========================================================
  entry_cmit_all := entry_cmit(2).asBool&& entry_cmit(1).asBool && entry_cmit(0).asBool
  entry_stride_create_vld := entry_cmit_all && !entry_stride_keep && !(entry_addr_cmp_info_vld.asBool)
  entry_clr_addr_info_vld := entry_cmit_all && entry_addr_cmp_info_vld.asBool

  //==========================================================
  //              Generate create gpfb signal
  //==========================================================
  entry_stride_neg_ge_cache_line := !(entry_stride(10).asBool&&entry_stride(9).asBool&&entry_stride(8).asBool&&entry_stride(7).asBool&&entry_stride(6).asBool)
  entry_stride_pos_ge_cache_line := entry_stride(10).asBool||entry_stride(9).asBool||entry_stride(8).asBool||entry_stride(7).asBool||entry_stride(6).asBool
  entry_stride_ge_cache_line := Mux(entry_stride_neg.asBool,entry_stride_neg_ge_cache_line,entry_stride_pos_ge_cache_line)
  entry_strideh_6to0 := Mux(entry_stride_ge_cache_line,entry_stride(6,0),"h40".U)

  io.entry_addr_cmp_info_vld := entry_addr_cmp_info_vld.asBool
  io.entry_check_stride_success := entry_check_stride_success
  io.entry_normal_stride := entry_normal_stride
  io.entry_stride := entry_stride
  io.entry_stride_neg := entry_stride_neg.asBool
  io.entry_strideh_6to0 := entry_strideh_6to0

}

class gated_clk_cell extends BlackBox{
  val io = IO(new Bundle{
    val clk_in = Input(Clock())
    val clk_out = Output(Clock())
    val external_en = Input(Bool())
    val global_en = Input(Bool())
    val local_en = Input(Bool())
    val module_en = Input(Bool())
    val pad_yy_icg_scan_en = Input(Bool())
  })
}

class ct_rtu_compare_iid extends BlackBox{
  val io = IO(new Bundle{
    val x_iid0 = Input(UInt(7.W))
    val x_iid0_older = Output(UInt(1.W))
    val x_iid1 = Input(UInt(7.W))
  })
}
