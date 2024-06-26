package pfbTOP

import chisel3._
import chisel3.util.Fill
import pfbTOP.main.{PC_LEN, TIMEOUT_BW}



object main {
  val TIMEOUT_BW = 8.intValue
  val PC_LEN = 15.intValue
}

class pfb(PA_WIDTH: Int) extends RawModule {
  val io = IO(new pfbIO)
  val wire = Wire(new pfbwire)
  val reg = new pfbreg
  //==========================================================
  //                 Instance of Gated Cell
  //==========================================================
  wire.pfu_pfb_entry_clk_en := wire.pfu_pfb_entry_vld || wire.pfu_pfb_entry_create_gateclk_en
  wire.pfu_pfb_entry_create_clk_en := wire.pfu_pfb_entry_create_gateclk_en
  wire.pfu_pfb_entry_all_pf_inst_clk_en := (wire.pfu_pfb_entry_vld
    && (io.ld_da_pfu_pf_inst_vld || io.st_da_pfu_pf_inst_vld)
    || wire.pfu_pfb_entry_biu_pe_req
    || wire.pfu_pfb_entry_create_gateclk_en)
  val gated_clk_inst = VecInit(Seq.fill(3)(Module(new gated_clk_cell).io))
  for (i <- 0 to 2) {
    gated_clk_inst(i).clk_in := io.lsu_special_clk.asClock
    gated_clk_inst(i).external_en := "b0".U(1.W)
    gated_clk_inst(i).global_en := io.cp0_yy_clk_en
    gated_clk_inst(i).module_en := io.cp0_lsu_icg_en
    gated_clk_inst(i).pad_yy_icg_scan_en := io.pad_yy_icg_scan_en
    if (i == 0) {
      wire.pfu_pfb_entry_clk := gated_clk_inst(i).clk_out.asBool
      gated_clk_inst(i).local_en := wire.pfu_pfb_entry_clk_en
    } else if (i == 1) {
      wire.pfu_pfb_entry_create_clk := gated_clk_inst(i).clk_out.asBool
      gated_clk_inst(i).local_en := wire.pfu_pfb_entry_create_clk_en
    } else if (i == 2) {
      wire.pfu_pfb_entry_all_pf_inst_clk := gated_clk_inst(i).clk_out.asBool
      gated_clk_inst(i).local_en := wire.pfu_pfb_entry_all_pf_inst_clk_en
    }
  }
  //==========================================================
  //                 register
  //==========================================================
  //+--------+----------------------+
  //| stride | stride_be_cache_line |
  //+--------+----------------------+

  withClockAndReset(wire.pfu_pfb_entry_create_clk.asClock, (!io.cpurst_b.asBool).asAsyncReset) {

    val pfu_pfb_entry_pc = Reg(reg.pfu_pfb_entry_pc)
    val pfu_pfb_entry_stride = Reg(reg.pfu_pfb_entry_stride)
    val pfu_pfb_entry_strideh_6to0 = Reg(reg.pfu_pfb_entry_strideh_6to0)
    val pfu_pfb_entry_stride_neg = Reg(reg.pfu_pfb_entry_stride_neg)
    val pfu_pfb_entry_type_ld = Reg(reg.pfu_pfb_entry_type_ld )

    when(!io.cpurst_b.asBool) {
      pfu_pfb_entry_pc := 0.U
      pfu_pfb_entry_stride := 0.U
      pfu_pfb_entry_strideh_6to0 := 0.U
      pfu_pfb_entry_stride_neg := false.B
      pfu_pfb_entry_type_ld := false.B
    }.elsewhen(wire.pfu_pfb_entry_create_dp_vld) {
      pfu_pfb_entry_pc := io.pfu_pfb_create_pc(PC_LEN - 1, 0)
      pfu_pfb_entry_stride := io.pfu_pfb_create_stride
      pfu_pfb_entry_strideh_6to0 := io.pfu_pfb_create_strideh_6to0
      pfu_pfb_entry_stride_neg := io.pfu_pfb_create_stride_neg
      pfu_pfb_entry_type_ld := io.pfu_pfb_create_type_ld
    }
    //==========================================================
    //                Generate  pop signal
    //==========================================================
    wire.pfu_pfb_entry_reinit_vld := (wire.pfu_pfb_entry_l1sm_reinit_req
      || wire.pfu_pfb_entry_l2sm_reinit_req
      || wire.pfu_pfb_entry_create_vld
      || wire.pfu_pfb_entry_tsm_is_judge
      && wire.pfu_pfb_entry_pf_inst_vld
      && !wire.pfu_pfb_entry_inst_new_va_hit_pipe)
    //st pref pop
    wire.pfu_pop_st_all := (wire.pfu_pfb_entry_vld
      && !pfu_pfb_entry_type_ld
      && (!io.cp0_lsu_l2_st_pref_en || io.amr_wa_cancel))

    wire.pfu_pfb_entry_pop_vld := (io.pfu_pop_all_part_vld
      || wire.pfu_pop_st_all
      || wire.pfu_pfb_entry_vld
      && (wire.pfu_pfb_entry_dcache_hit_pop_req
      || wire.pfu_pfb_entry_confidence_zero))

    //==========================================================
    //                 pipe info select
    //==========================================================


    wire.pipe_cmp_inst_vld := Mux(pfu_pfb_entry_type_ld, io.ld_da_pfu_pf_inst_vld
      , io.st_da_pfu_pf_inst_vld)

    wire.pipe_cmp_pc := Mux(pfu_pfb_entry_type_ld, io.ld_da_ldfifo_pc(PC_LEN - 1.intValue, 0)
      , io.st_da_pc(PC_LEN - 1.intValue, 0))

    wire.pipe_evict_cnt_vld := io.ld_da_pfu_evict_cnt_vld || io.st_da_pfu_evict_cnt_vld

    wire.pipe_act_vld := Mux(pfu_pfb_entry_type_ld, io.ld_da_pfu_act_vld, io.st_da_pfu_act_vld)

    wire.pipe_ppfu_va := Mux(pfu_pfb_entry_type_ld, io.ld_da_ppfu_va(PA_WIDTH - 1, 0), io.st_da_ppfu_va(PA_WIDTH - 1, 0))

    wire.pipe_page_sec := Mux(pfu_pfb_entry_type_ld, io.ld_da_page_sec_ff, io.st_da_page_sec_ff)

    wire.pipe_page_share := Mux(pfu_pfb_entry_type_ld, io.ld_da_page_share_ff, io.st_da_page_share_ff)

    wire.pipe_ppn := Mux(pfu_pfb_entry_type_ld, io.ld_da_ppn_ff(PA_WIDTH - 13, 0), io.st_da_ppn_ff(PA_WIDTH - 13, 0))

    //st will not trigger l1 prefetch
    wire.l1_pref_en := (io.pfu_dcache_pref_en
      && wire.pfu_pfb_entry_vld
      && pfu_pfb_entry_type_ld)

    //==========================================================
    //                 Caucalate pf_inst signal
    //==========================================================

    wire.pfu_pfb_entry_pf_inst_vld := (wire.pfu_pfb_entry_hit_pc
      && wire.pipe_cmp_inst_vld)
    wire.pfu_pfb_entry_act_vld := (wire.pfu_pfb_entry_hit_pc
      && wire.pipe_act_vld)
    //for new inst create
    wire.pfu_pfb_entry_hit_pc_for_new := (wire.pfu_pfb_entry_hit_pc
      && !(pfu_pfb_entry_type_ld ^ io.ld_da_pfu_act_dp_vld))

    wire.pfu_pfb_entry_hit_pc := (wire.pfu_pfb_entry_vld
      && (wire.pipe_cmp_pc(PC_LEN - 1.intValue, 0)
      === pfu_pfb_entry_pc(PC_LEN - 1.intValue, 0)))

    //==========================================================
    //                Generate some compare info
    //==========================================================
    //------------------generate strideh------------------------
    wire.pfu_pfb_entry_strideh := Fill(PA_WIDTH - 11, pfu_pfb_entry_stride_neg)##pfu_pfb_entry_stride(10, 7)##pfu_pfb_entry_strideh_6to0
    wire.pfu_pfb_entry_l1_dist_strideh := (Fill(PA_WIDTH, io.lsu_pfu_l1_dist_sel(3)) & (wire.pfu_pfb_entry_strideh(PA_WIDTH - 4, 0) ## 0.U(3.W))
      | Fill(PA_WIDTH, io.lsu_pfu_l1_dist_sel(2)) & (wire.pfu_pfb_entry_strideh(PA_WIDTH - 3, 0) ## 0.U(2.W))
      | Fill(PA_WIDTH, io.lsu_pfu_l1_dist_sel(1)) & (wire.pfu_pfb_entry_strideh(PA_WIDTH - 2, 0) ## 0.U(1.W))
      | Fill(PA_WIDTH, io.lsu_pfu_l1_dist_sel(0)) & wire.pfu_pfb_entry_strideh(PA_WIDTH - 1, 0))

    wire.pfu_pfb_entry_l2_dist_strideh := (Fill(PA_WIDTH, io.lsu_pfu_l2_dist_sel(3)) & (wire.pfu_pfb_entry_strideh(PA_WIDTH - 6, 0) ## 0.U(5.W))
      | Fill(PA_WIDTH, io.lsu_pfu_l2_dist_sel(2)) & (wire.pfu_pfb_entry_strideh(PA_WIDTH - 5, 0) ## 0.U(4.W))
      | Fill(PA_WIDTH, io.lsu_pfu_l2_dist_sel(1)) & (wire.pfu_pfb_entry_strideh(PA_WIDTH - 4, 0) ## 0.U(3.W))
      | Fill(PA_WIDTH, io.lsu_pfu_l2_dist_sel(0)) & (wire.pfu_pfb_entry_strideh(PA_WIDTH - 3, 0) ## 0.U(2.W)))


    //==========================================================
    //                Instance state machine
    //==========================================================
    // &ConnRule(s/^entry_/pfu_pfb_entry_/); @211
    // &Instance("ct_lsu_pfu_pfb_tsm","x_ct_lsu_pfu_pfu_entry_tsm"); @212
   val tsm = Module(new tsm(PA_WIDTH)).io
    tsm.cp0_lsu_icg_en := io.cp0_lsu_icg_en
    tsm.cp0_yy_clk_en := io.cp0_yy_clk_en
    tsm.cp0_yy_priv_mode := io.cp0_yy_priv_mode
    tsm.cpurst_b := io.cpurst_b.asAsyncReset
    tsm.entry_act_vld := wire.pfu_pfb_entry_act_vld
    wire.pfu_pfb_entry_biu_pe_req := tsm.entry_biu_pe_req
    tsm.entry_biu_pe_req_grnt := wire.pfu_pfb_entry_biu_pe_req_grnt
    wire.pfu_pfb_entry_biu_pe_req_src := tsm.entry_biu_pe_req_src
    tsm.entry_clk := wire.pfu_pfb_entry_clk.asClock
    tsm.entry_create_dp_vld := wire.pfu_pfb_entry_create_dp_vld
    tsm.entry_create_vld := wire.pfu_pfb_entry_create_vld
    wire.pfu_pfb_entry_dcache_hit_pop_req := tsm.entry_dcache_hit_pop_req
    tsm.entry_from_lfb_dcache_hit := wire.pfu_pfb_entry_from_lfb_dcache_hit
    tsm.entry_from_lfb_dcache_miss := wire.pfu_pfb_entry_from_lfb_dcache_miss
    wire.pfu_pfb_entry_inst_new_va := tsm.entry_inst_new_va
    tsm.entry_l1_biu_pe_req_set := wire.pfu_pfb_entry_l1_biu_pe_req_set
    tsm.entry_l1_mmu_pe_req_set := wire.pfu_pfb_entry_l1_mmu_pe_req_set
    tsm.entry_l2_biu_pe_req_set := wire.pfu_pfb_entry_l2_biu_pe_req_set
    tsm.entry_l2_mmu_pe_req_set := wire.pfu_pfb_entry_l2_mmu_pe_req_set
    wire.pfu_pfb_entry_mmu_pe_req := tsm.entry_mmu_pe_req
    tsm.entry_mmu_pe_req_grnt := wire.pfu_pfb_entry_mmu_pe_req_grnt
    wire.pfu_pfb_entry_mmu_pe_req_src := tsm.entry_mmu_pe_req_src
    tsm.entry_pf_inst_vld := wire.pfu_pfb_entry_pf_inst_vld
    tsm.entry_pop_vld := wire.pfu_pfb_entry_pop_vld
    wire.pfu_pfb_entry_priv_mode := tsm.entry_priv_mode
    tsm.entry_reinit_vld := wire.pfu_pfb_entry_reinit_vld
    tsm.entry_stride := pfu_pfb_entry_stride
    tsm.entry_stride_neg := pfu_pfb_entry_stride_neg
    wire.pfu_pfb_entry_tsm_is_judge := tsm.entry_tsm_is_judge
    wire.pfu_pfb_entry_vld := tsm.entry_vld
    tsm.forever_cpuclk := io.lsu_special_clk.asClock
    tsm.pad_yy_icg_scan_en := io.pad_yy_icg_scan_en
    tsm.pipe_va := wire.pipe_ppfu_va
    // &Connect(.forever_cpuclk      (lsu_special_clk      ), @218
    //          .pfu_dcache_pref_en  (l1_pref_en           )); @219
    // &Force("nonport","pfu_pfb_entry_l1_pf_va_sub_inst_new_va"); @220
    // &Force("nonport","pfu_pfb_entry_l1_cmp_va_vld"); @221
    // &Force("nonport","pfu_pfb_entry_l1sm_va_can_cmp"); @222

    // &ConnRule(s/^entry_/pfu_pfb_entry_/); @224
    // &Instance("ct_lsu_pfu_pfb_l2sm","x_ct_lsu_pfu_pfb_entry_l2sm"); @225

    val lsm = List(Module(new l1sm(PA_WIDTH, 0)).io, Module(new l1sm(PA_WIDTH, 1)).io)
    for (i <- 0 to 1) {
      lsm(i).cp0_lsu_icg_en := io.cp0_lsu_icg_en
      lsm(i).cp0_lsu_pfu_mmu_dis := io.cp0_lsu_pfu_mmu_dis
      lsm(i).cp0_yy_clk_en := io.cp0_yy_clk_en
      lsm(i).cpurst_b := io.cpurst_b.asAsyncReset
      lsm(i).entry_biu_pe_req := wire.pfu_pfb_entry_biu_pe_req
      lsm(i).entry_biu_pe_req_grnt := wire.pfu_pfb_entry_biu_pe_req_grnt
      lsm(i).entry_biu_pe_req_src := wire.pfu_pfb_entry_biu_pe_req_src
      lsm(i).entry_clk := wire.pfu_pfb_entry_clk.asClock
      lsm(i).entry_create_dp_vld := wire.pfu_pfb_entry_create_dp_vld
      lsm(i).entry_inst_new_va := wire.pfu_pfb_entry_inst_new_va
      lsm(i).entry_mmu_pe_req := wire.pfu_pfb_entry_mmu_pe_req
      lsm(i).entry_mmu_pe_req_grnt := wire.pfu_pfb_entry_mmu_pe_req_grnt
      lsm(i).entry_mmu_pe_req_src := wire.pfu_pfb_entry_mmu_pe_req_src
      lsm(i).entry_pf_inst_vld := wire.pfu_pfb_entry_pf_inst_vld
      lsm(i).entry_pop_vld := wire.pfu_pfb_entry_pop_vld
      lsm(i).entry_reinit_vld := wire.pfu_pfb_entry_reinit_vld
      lsm(i).entry_stride_neg := pfu_pfb_entry_stride_neg
      lsm(i).entry_strideh := wire.pfu_pfb_entry_strideh
      lsm(i).entry_tsm_is_judge := wire.pfu_pfb_entry_tsm_is_judge
      lsm(i).forever_cpuclk := io.lsu_special_clk.asClock
      lsm(i).pad_yy_icg_scan_en := io.pad_yy_icg_scan_en
      lsm(i).pfu_biu_pe_req_sel_l1 := io.pfu_biu_pe_req_sel_l1
      lsm(i).pfu_get_page_sec := io.pfu_get_page_sec
      lsm(i).pfu_get_page_share := io.pfu_get_page_share
      lsm(i).pfu_get_ppn := io.pfu_get_ppn
      lsm(i).pfu_get_ppn_err := io.pfu_get_ppn_err
      lsm(i).pfu_get_ppn_vld := io.pfu_get_ppn_vld
      lsm(i).pfu_mmu_pe_req_sel_l1 := io.pfu_mmu_pe_req_sel_l1

      if (i == 0) {
        lsm(i).pfu_dcache_pref_en := wire.l1_pref_en

        wire.pfu_pfb_entry_l1_pf_va := lsm(i).entry_l1_pf_va.get
        lsm(i).ld_da_page_sec_ff := io.ld_da_page_sec_ff
        lsm(i).ld_da_page_share_ff := io.ld_da_page_share_ff
        lsm(i).ld_da_ppn_ff := io.ld_da_ppn_ff
        wire.pfu_pfb_entry_l1sm_reinit_req := lsm(i).entry_l1sm_reinit_req
        wire.pfu_pfb_entry_l1sm_va_can_cmp := lsm(i).entry_l1sm_va_can_cmp
        lsm(i).entry_l1_dist_strideh := wire.pfu_pfb_entry_l1_dist_strideh
        wire.pfu_pfb_entry_l1_biu_pe_req_set := lsm(i).entry_l1_biu_pe_req_set
        wire.pfu_pfb_entry_l1_cmp_va_vld := lsm(i).entry_l1_cmp_va_vld
        wire.pfu_pfb_entry_l1_mmu_pe_req_set := lsm(i).entry_l1_mmu_pe_req_set
        wire.pfu_pfb_entry_l1_page_sec := lsm(i).entry_l1_page_sec
        wire.pfu_pfb_entry_l1_page_share := lsm(i).entry_l1_page_share
        wire.pfu_pfb_entry_l1_pf_addr := lsm(i).entry_l1_pf_addr
        wire.pfu_pfb_entry_l1_pf_va_sub_inst_new_va := lsm(i).entry_l1_pf_va_sub_inst_new_va ///
        wire.pfu_pfb_entry_l1_vpn := lsm(i).entry_l1_vpn
      } else {
        lsm(i).pfu_dcache_pref_en := io.pfu_l2_pref_en
        lsm(i).entry_l1_pf_va_t.get := wire.pfu_pfb_entry_l1_pf_va
        lsm(i).ld_da_page_sec_ff := wire.pipe_page_sec
        lsm(i).ld_da_page_share_ff := wire.pipe_page_share
        lsm(i).ld_da_ppn_ff := wire.pipe_ppn
        wire.pfu_pfb_entry_l2sm_reinit_req := lsm(i).entry_l1sm_reinit_req
        wire.pfu_pfb_entry_l2sm_va_can_cmp := lsm(i).entry_l1sm_va_can_cmp
        lsm(i).entry_l1_dist_strideh := wire.pfu_pfb_entry_l2_dist_strideh
        wire.pfu_pfb_entry_l2_mmu_pe_req_set := lsm(i).entry_l1_mmu_pe_req_set
        wire.pfu_pfb_entry_l2_cmp_va_vld := lsm(i).entry_l1_cmp_va_vld
        wire.pfu_pfb_entry_l2_biu_pe_req_set := lsm(i).entry_l1_biu_pe_req_set
        wire.pfu_pfb_entry_l2_page_sec := lsm(i).entry_l1_page_sec
        wire.pfu_pfb_entry_l2_page_share := lsm(i).entry_l1_page_share
        wire.pfu_pfb_entry_l2_pf_addr := lsm(i).entry_l1_pf_addr
        wire.pfu_pfb_entry_l2_pf_va_sub_l1_pf_va := lsm(i).entry_l1_pf_va_sub_inst_new_va ///
        wire.pfu_pfb_entry_l2_vpn := lsm(i).entry_l1_vpn

      }
    }

  }


  //+-------------+
  //| timeout_cnt |
  //+-------------+
  withClockAndReset(wire.pfu_pfb_entry_all_pf_inst_clk.asClock, (!io.cpurst_b.asBool).asAsyncReset) {

    val pfu_pfb_entry_timeout_cnt = Reg(reg.pfu_pfb_entry_timeout_cnt)
    when(!io.cpurst_b.asBool) {
      pfu_pfb_entry_timeout_cnt := 0.U(TIMEOUT_BW.W)
    }.elsewhen(wire.pfu_pfb_entry_create_dp_vld || wire.pfu_pfb_entry_pf_inst_vld) {
      pfu_pfb_entry_timeout_cnt := 0.U(TIMEOUT_BW.W)
      }.elsewhen(wire.pipe_evict_cnt_vld && !wire.pfu_pfb_entry_timeout_cnt_full) {
      pfu_pfb_entry_timeout_cnt := pfu_pfb_entry_timeout_cnt + 1.U(TIMEOUT_BW.W)
      }

    //==========================================================
    //                    Set/clr evict
    //==========================================================
    wire.pfu_pfb_entry_timeout_cnt_full := pfu_pfb_entry_timeout_cnt(TIMEOUT_BW - 1, 0) === io.pfb_timeout_cnt_val(TIMEOUT_BW - 1, 0)

    wire.pfu_pfb_entry_evict_set := (wire.pfu_pfb_entry_vld
      && (wire.pfu_pfb_entry_timeout_cnt_full
      || wire.pfu_pfb_entry_no_req_cnt_full))

    wire.pfu_pfb_entry_evict_clr := (!wire.pfu_pfb_entry_timeout_cnt_full
      && !wire.pfu_pfb_entry_no_req_cnt_full)
  }
  //+-------------+
  //| no_req_cnt |
  //+-------------+
  withClockAndReset(wire.pfu_pfb_entry_all_pf_inst_clk.asClock, (!io.cpurst_b.asBool).asAsyncReset) {
    val pfu_pfb_entry_no_req_cnt = Reg(reg.pfu_pfb_entry_no_req_cnt)

    when(!io.cpurst_b.asBool) {
      pfu_pfb_entry_no_req_cnt := 0.U(6.W)
    }.elsewhen(wire.pfu_pfb_entry_create_dp_vld || wire.pfu_pfb_entry_biu_pe_req) {
      pfu_pfb_entry_no_req_cnt := 0.U(6.W)
      }.elsewhen(wire.pfu_pfb_entry_pf_inst_vld && !wire.pfu_pfb_entry_no_req_cnt_full) {
      pfu_pfb_entry_no_req_cnt := pfu_pfb_entry_no_req_cnt + 1.U(6.W)
      }

    //==========================================================
    //                 no req evict
    //==========================================================
    //when pfb entry not send req for many inst,then set evict
    wire.pfu_pfb_entry_no_req_cnt_full := (pfu_pfb_entry_no_req_cnt(5, 0)
      === io.pfb_no_req_cnt_val(5, 0))

  }

  //+-------+
  //| evict |
  //+-------+
  withClockAndReset(wire.pfu_pfb_entry_clk.asClock, (!io.cpurst_b.asBool).asAsyncReset) {
    val pfu_pfb_entry_evict = Reg(reg.pfu_pfb_entry_evict)
    when(!io.cpurst_b.asBool) {
      pfu_pfb_entry_evict := false.B
    }.elsewhen(wire.pfu_pfb_entry_create_dp_vld || wire.pfu_pfb_entry_evict_clr) {
      pfu_pfb_entry_evict := false.B
      }.elsewhen(wire.pfu_pfb_entry_evict_set) {
      pfu_pfb_entry_evict := true.B
      }

    //==========================================================
    //                 Generate interface
    //==========================================================
    //------------------input-----------------------------------
    //-----------create signal--------------
    wire.pfu_pfb_entry_create_vld := io.pfu_pfb_entry_create_vld_x
    wire.pfu_pfb_entry_create_dp_vld := io.pfu_pfb_entry_create_dp_vld_x
    wire.pfu_pfb_entry_create_gateclk_en := io.pfu_pfb_entry_create_gateclk_en_x
    //---------grnt/done signal-------------
    wire.pfu_pfb_entry_biu_pe_req_grnt := io.pfu_pfb_entry_biu_pe_req_grnt_x
    wire.pfu_pfb_entry_mmu_pe_req_grnt := io.pfu_pfb_entry_mmu_pe_req_grnt_x
    //-----------reply signal---------------
    wire.pfu_pfb_entry_from_lfb_dcache_hit := io.pfu_pfb_entry_from_lfb_dcache_hit_x
    wire.pfu_pfb_entry_from_lfb_dcache_miss := io.pfu_pfb_entry_from_lfb_dcache_miss_x
    //------------------output----------------------------------
    //-----------entry signal---------------
    io.pfu_pfb_entry_vld_x := wire.pfu_pfb_entry_vld
    io.pfu_pfb_entry_l1_vpn_v := wire.pfu_pfb_entry_l1_vpn
    io.pfu_pfb_entry_l1_pf_addr_v := wire.pfu_pfb_entry_l1_pf_addr
    io.pfu_pfb_entry_l1_page_sec_x := wire.pfu_pfb_entry_l1_page_sec
    io.pfu_pfb_entry_l1_page_share_x := wire.pfu_pfb_entry_l1_page_share
    io.pfu_pfb_entry_l2_vpn_v := wire.pfu_pfb_entry_l2_vpn
    io.pfu_pfb_entry_l2_pf_addr_v := wire.pfu_pfb_entry_l2_pf_addr
    io.pfu_pfb_entry_l2_page_sec_x := wire.pfu_pfb_entry_l2_page_sec
    io.pfu_pfb_entry_l2_page_share_x := wire.pfu_pfb_entry_l2_page_share
    io.pfu_pfb_entry_biu_pe_req_x := wire.pfu_pfb_entry_biu_pe_req
    io.pfu_pfb_entry_biu_pe_req_src_v := wire.pfu_pfb_entry_biu_pe_req_src
    io.pfu_pfb_entry_mmu_pe_req_x := wire.pfu_pfb_entry_mmu_pe_req
    io.pfu_pfb_entry_mmu_pe_req_src_v := wire.pfu_pfb_entry_mmu_pe_req_src
    io.pfu_pfb_entry_evict_x := pfu_pfb_entry_evict
    io.pfu_pfb_entry_priv_mode_v := wire.pfu_pfb_entry_priv_mode
    //-----------hit signal-----------------
    io.pfu_pfb_entry_hit_pc_x := wire.pfu_pfb_entry_hit_pc_for_new
  }
  //+------------+
  //| confidence |
  //+------------+
  withClockAndReset(wire.pfu_pfb_entry_clk.asClock, (!io.cpurst_b.asBool).asAsyncReset) {
    val pfu_pfb_entry_confidence = Reg(reg.pfu_pfb_entry_confidence)

    when(!io.cpurst_b.asBool) {
      pfu_pfb_entry_confidence := 0.U
    }.elsewhen(wire.pfu_pfb_entry_create_dp_vld) {
      pfu_pfb_entry_confidence := "b110".U
      }.elsewhen(wire.pfu_pfb_entry_confidence_set) {
      pfu_pfb_entry_confidence := wire.pfu_pfb_entry_confidence_next
      }

    //==========================================================
    //                    Set confidence
    //==========================================================
    wire.pfu_pfb_entry_inst_new_va_hit_pipe := (wire.pipe_ppfu_va(PA_WIDTH - 1, 0)
      === wire.pfu_pfb_entry_inst_new_va(PA_WIDTH - 1, 0))
    //--------------------confidence set------------------------
    wire.pfu_pfb_entry_confidence_high := pfu_pfb_entry_confidence(2, 0).andR
    wire.pfu_pfb_entry_confidence_low := !(pfu_pfb_entry_confidence(2, 0).orR)

    wire.pfu_pfb_entry_confidence_set := (wire.pfu_pfb_entry_tsm_is_judge
      && !(wire.pfu_pfb_entry_confidence_high
      && wire.pfu_pfb_entry_confidence_add_vld)
      && !(wire.pfu_pfb_entry_confidence_low
      && !wire.pfu_pfb_entry_confidence_add_vld)
      && wire.pfu_pfb_entry_pf_inst_vld)

    wire.pfu_pfb_entry_confidence_add1 := pfu_pfb_entry_confidence(2, 0) + "b1".U(3.W)
    wire.pfu_pfb_entry_confidence_sub1 := pfu_pfb_entry_confidence(2, 0) - "b1".U(3.W)

    wire.pfu_pfb_entry_confidence_add_vld := wire.pfu_pfb_entry_inst_new_va_hit_pipe

    wire.pfu_pfb_entry_confidence_next := Mux(wire.pfu_pfb_entry_confidence_add_vld, wire.pfu_pfb_entry_confidence_add1(2, 0), wire.pfu_pfb_entry_confidence_sub1(2, 0))

    //--------------set confidence thdreshold------------------
    wire.pfu_pfb_entry_confidence_zero := (pfu_pfb_entry_confidence(2, 0)
      === "b0".U(3.W))
  }












}

