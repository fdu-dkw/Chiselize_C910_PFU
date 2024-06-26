package gpfb
import IOinst._

import chisel3._
import chisel3.experimental.noPrefix
import chisel3.util._
import chisel3.util.experimental._

/*
class tsm extends BlackBox {
  override def desiredName: String = "ct_lsu_pfu_pfb_tsm"
  val io =  IO(new tsmIO)
}*/


class gpfb (PA_WIDTH:Int)extends RawModule{

  val io = IO(new gpfbIO)
  val wire = Wire(new gpfbwire(PA_WIDTH))
  val reg = new gpfbreg

  override def desiredName: String = s"ct_lsu_pfu_gpfb_t"

  wire.pfu_gpfb_clk_en  := io.pfu_gpfb_vld || wire.pfu_gpfb_create_gateclk_en
  wire.pfu_gpfb_create_clk_en := wire.pfu_gpfb_create_gateclk_en
  //例化两个gated_clk
  //例化gated_clk
  val gated_clk_inst = VecInit(Seq.fill(2)(Module(new gated_clk_cell).io))
  for(i <- 0 to 1 ){
    gated_clk_inst(i).clk_in := io.forever_cpuclk
    gated_clk_inst(i).external_en := "b0".U(1.W)
    gated_clk_inst(i).global_en := io.cp0_yy_clk_en

    gated_clk_inst(i).module_en := io.cp0_lsu_icg_en
    gated_clk_inst(i).pad_yy_icg_scan_en := io.pad_yy_icg_scan_en
    if(i == 0){
      wire.pfu_gpfb_clk := gated_clk_inst(i).clk_out
      gated_clk_inst(i).local_en := wire.pfu_gpfb_clk_en
    }else{
      wire.pfu_gpfb_create_clk :=gated_clk_inst(i).clk_out
      gated_clk_inst(i).local_en := wire.pfu_gpfb_create_clk_en
    }
  }

  //                 Register
  wire.pfu_gpfb_stride := io.pfu_gsdb_stride(10,0)
  wire.pfu_gpfb_stride_neg    := io.pfu_gsdb_stride_neg

  //| stride | stride_be_cache_line |
  private val wire_pfu_gpfb_stideh_6to0 = Wire(UInt(7.W))
  withClockAndReset(wire.pfu_gpfb_create_clk,(!io.cpurst_b.asBool).asAsyncReset){
    val pfu_gpfb_strideh_6to0 = RegInit(reg.pfu_gpfb_strideh_6to0,"b0".U(reg.pfu_gpfb_strideh_6to0.getWidth.W))

    when(wire.pfu_gpfb_create_dp_vld){
      pfu_gpfb_strideh_6to0 := io.pfu_gsdb_strideh_6to0
    }
    wire_pfu_gpfb_stideh_6to0 := pfu_gpfb_strideh_6to0
}

  //some compare info
  withClockAndReset(wire.pfu_gpfb_clk,(!io.cpurst_b.asBool).asAsyncReset){
    val pfu_gpfb_inst_new_va_too_far_l1_pf_va = RegInit(reg.pfu_gpfb_inst_new_va_too_far_l1_pf_va,"b0".U(reg.pfu_gpfb_inst_new_va_too_far_l1_pf_va.getWidth.W))
    val pfu_gpfb_l1_pf_va_too_far_l2_pf_va = RegInit(reg.pfu_gpfb_l1_pf_va_too_far_l2_pf_va,"b0".U(reg.pfu_gpfb_l1_pf_va_too_far_l2_pf_va.getWidth.W))


    when(wire.pfu_gpfb_create_dp_vld ||  wire.pfu_gpfb_reinit_vld){
      pfu_gpfb_inst_new_va_too_far_l1_pf_va  :=  "b0".U
      pfu_gpfb_l1_pf_va_too_far_l2_pf_va := "b0".U
    }.otherwise{
      when(wire.pfu_gpfb_l1_cmp_va_vld && wire.pfu_gpfb_l1sm_va_can_cmp){
        pfu_gpfb_inst_new_va_too_far_l1_pf_va := wire.pfu_gpfb_inst_new_va_too_far_l1_pf_va_set
      }
      when(wire.pfu_gpfb_l2_cmp_va_vld &&  wire.pfu_gpfb_l2sm_va_can_cmp){
        pfu_gpfb_l1_pf_va_too_far_l2_pf_va := wire.pfu_gpfb_l1_pf_va_too_far_l2_pf_va_set
      }
    }
    wire.pfu_gpfb_pop_vld := (io.pfu_pop_all_vld || io.pfu_gpfb_vld &&  ( wire.pfu_gpfb_dcache_hit_pop_req
      ||  pfu_gpfb_inst_new_va_too_far_l1_pf_va.asBool
      ||  pfu_gpfb_l1_pf_va_too_far_l2_pf_va.asBool
      ||  io.pfu_gsdb_gpfb_pop_req))
    wire.pfu_gpfb_strideh := Fill(PA_WIDTH-11,wire.pfu_gpfb_stride_neg) ## wire.pfu_gpfb_stride(10,7) ## wire_pfu_gpfb_stideh_6to0(6,0)
  }

  //                Generate pf_inst_vld signal
   wire.pfu_gpfb_pf_inst_vld := io.pfu_gpfb_vld && io.ld_da_pfu_pf_inst_vld
   wire.pfu_gpfb_act_vld := io.pfu_gpfb_vld && io.ld_da_pfu_act_vld

  //                Instance state machine

  //tsm
  private val tsm = Module(new tsm(PA_WIDTH)).io
  tsm.cp0_lsu_icg_en                  := io.cp0_lsu_icg_en
  tsm.cp0_yy_clk_en                   := io.cp0_yy_clk_en
  tsm.cp0_yy_priv_mode                := io.cp0_yy_priv_mode
  tsm.cpurst_b                        := io.cpurst_b
  tsm.entry_act_vld                   := wire.pfu_gpfb_act_vld
  io.pfu_gpfb_biu_pe_req              := tsm.entry_biu_pe_req
  tsm.entry_biu_pe_req_grnt           := io.pfu_gpfb_biu_pe_req_grnt
  io.pfu_gpfb_biu_pe_req_src          := tsm.entry_biu_pe_req_src
  tsm.entry_clk                       := wire.pfu_gpfb_clk
  tsm.entry_create_dp_vld             := wire.pfu_gpfb_create_dp_vld
  tsm.entry_create_vld                := wire.pfu_gpfb_create_vld
  wire.pfu_gpfb_dcache_hit_pop_req    := tsm.entry_dcache_hit_pop_req
  tsm.entry_from_lfb_dcache_hit       := io.pfu_gpfb_from_lfb_dcache_hit
  tsm.entry_from_lfb_dcache_miss      := io.pfu_gpfb_from_lfb_dcache_miss
  wire.pfu_gpfb_inst_new_va           := tsm.entry_inst_new_va
  tsm.entry_l1_biu_pe_req_set         := wire.pfu_gpfb_l1_biu_pe_req_set
  tsm.entry_l1_mmu_pe_req_set         := wire.pfu_gpfb_l1_mmu_pe_req_set
  tsm.entry_l2_biu_pe_req_set         := wire.pfu_gpfb_l2_biu_pe_req_set
  tsm.entry_l2_mmu_pe_req_set         := wire.pfu_gpfb_l2_mmu_pe_req_set
  io.pfu_gpfb_mmu_pe_req              := tsm.entry_mmu_pe_req
  tsm.entry_mmu_pe_req_grnt           := io.pfu_gpfb_mmu_pe_req_grnt
  io.pfu_gpfb_mmu_pe_req_src          := tsm.entry_mmu_pe_req_src
  tsm.entry_pf_inst_vld               := wire.pfu_gpfb_pf_inst_vld
  tsm.entry_pop_vld                   := wire.pfu_gpfb_pop_vld
  io.pfu_gpfb_priv_mode               := tsm.entry_priv_mode
  tsm.entry_reinit_vld                := wire.pfu_gpfb_reinit_vld
  tsm.entry_stride                    := wire.pfu_gpfb_stride
  tsm.entry_stride_neg                := wire.pfu_gpfb_stride_neg
  wire.pfu_gpfb_tsm_is_judge          := tsm.entry_tsm_is_judge
  io.pfu_gpfb_vld                     :=   tsm.entry_vld
  tsm.forever_cpuclk                  := io.forever_cpuclk
  tsm.pad_yy_icg_scan_en              := io.pad_yy_icg_scan_en
  tsm.pipe_va                         := io.ld_da_pfu_va

  //l1sm
  //l2sm
  private val lsm = List(Module(new l1sm(PA_WIDTH,0)).io,Module(new l1sm(PA_WIDTH,1)).io)
  for(i <-0 to 1){
    lsm(i).cp0_lsu_icg_en := io.cp0_lsu_icg_en
    lsm(i).cp0_lsu_pfu_mmu_dis := io.cp0_lsu_pfu_mmu_dis
    lsm(i).cp0_yy_clk_en := io.cp0_yy_clk_en
    lsm(i).cpurst_b := io.cpurst_b
    lsm(i).entry_biu_pe_req := io.pfu_gpfb_biu_pe_req
    lsm(i).entry_biu_pe_req_grnt := io.pfu_gpfb_biu_pe_req_grnt
    lsm(i).entry_biu_pe_req_src := io.pfu_gpfb_biu_pe_req_src
    lsm(i).entry_clk := wire.pfu_gpfb_clk
    lsm(i).entry_create_dp_vld := wire.pfu_gpfb_create_dp_vld
    lsm(i).entry_mmu_pe_req := io.pfu_gpfb_mmu_pe_req
    lsm(i).entry_mmu_pe_req_grnt := io.pfu_gpfb_mmu_pe_req_grnt
    lsm(i).entry_mmu_pe_req_src := io.pfu_gpfb_mmu_pe_req_src
    lsm(i).entry_pf_inst_vld := wire.pfu_gpfb_pf_inst_vld
    lsm(i).entry_pop_vld := wire.pfu_gpfb_pop_vld
    lsm(i).entry_reinit_vld := wire.pfu_gpfb_reinit_vld
    lsm(i).entry_stride_neg := wire.pfu_gpfb_stride_neg
    lsm(i).entry_strideh := wire.pfu_gpfb_strideh
    lsm(i).entry_tsm_is_judge := wire.pfu_gpfb_tsm_is_judge
    lsm(i).forever_cpuclk := io.forever_cpuclk
    lsm(i).ld_da_page_sec_ff := io.ld_da_page_sec_ff
    lsm(i).ld_da_page_share_ff := io.ld_da_page_share_ff
    lsm(i).ld_da_ppn_ff := io.ld_da_ppn_ff
    lsm(i).pad_yy_icg_scan_en := io.pad_yy_icg_scan_en
    lsm(i).pfu_biu_pe_req_sel_l1 := io.pfu_biu_pe_req_sel_l1
    lsm(i).pfu_get_page_sec := io.pfu_get_page_sec
    lsm(i).pfu_get_page_share := io.pfu_get_page_share
    lsm(i).pfu_get_ppn := io.pfu_get_ppn
    lsm(i).pfu_get_ppn_err := io.pfu_get_ppn_err
    lsm(i).pfu_get_ppn_vld := io.pfu_get_ppn_vld
    lsm(i).pfu_mmu_pe_req_sel_l1 := io.pfu_mmu_pe_req_sel_l1
    lsm(i).entry_inst_new_va := wire.pfu_gpfb_inst_new_va

    if(i == 0){
      lsm(i).pfu_dcache_pref_en := io.pfu_dcache_pref_en

      wire.pfu_gpfb_l1_pf_va := lsm(i).entry_l1_pf_va.get

      wire.pfu_gpfb_l1sm_reinit_req := lsm(i).entry_l1sm_reinit_req
      wire.pfu_gpfb_l1sm_va_can_cmp := lsm(i).entry_l1sm_va_can_cmp
      lsm(i).entry_l1_dist_strideh := wire.pfu_gpfb_l1_dist_strideh
      wire.pfu_gpfb_l1_biu_pe_req_set := lsm(i).entry_l1_biu_pe_req_set
      wire.pfu_gpfb_l1_cmp_va_vld := lsm(i).entry_l1_cmp_va_vld
      wire.pfu_gpfb_l1_mmu_pe_req_set := lsm(i).entry_l1_mmu_pe_req_set
      io.pfu_gpfb_l1_page_sec := lsm(i).entry_l1_page_sec
      io.pfu_gpfb_l1_page_share := lsm(i).entry_l1_page_share
      io.pfu_gpfb_l1_pf_addr := lsm(i).entry_l1_pf_addr
      wire.pfu_gpfb_l1_pf_va_sub_inst_new_va := lsm(i).entry_l1_pf_va_sub_inst_new_va///
      io.pfu_gpfb_l1_vpn := lsm(i).entry_l1_vpn
    }else{
      lsm(i).pfu_dcache_pref_en := io.pfu_l2_pref_en //

      lsm(i).entry_l1_pf_va_t.get := wire.pfu_gpfb_l1_pf_va

      wire.pfu_gpfb_l2sm_reinit_req := lsm(i).entry_l1sm_reinit_req
      wire.pfu_gpfb_l2sm_va_can_cmp := lsm(i).entry_l1sm_va_can_cmp
      lsm(i).entry_l1_dist_strideh := wire.pfu_gpfb_l2_dist_strideh
      wire.pfu_gpfb_l2_biu_pe_req_set := lsm(i).entry_l1_biu_pe_req_set
      wire.pfu_gpfb_l2_cmp_va_vld := lsm(i).entry_l1_cmp_va_vld
      wire.pfu_gpfb_l2_mmu_pe_req_set := lsm(i).entry_l1_mmu_pe_req_set
      io.pfu_gpfb_l2_page_sec := lsm(i).entry_l1_page_sec
      io.pfu_gpfb_l2_page_share := lsm(i).entry_l1_page_share
      io.pfu_gpfb_l2_pf_addr := lsm(i).entry_l1_pf_addr
      wire.pfu_gpfb_l2_pf_va_sub_l1_pf_va := lsm(i).entry_l1_pf_va_sub_inst_new_va///
      io.pfu_gpfb_l2_vpn := lsm(i).entry_l1_vpn

    }
  }

  ///注意：l1_pf_va对l1sm为out对l2sm为in，而且对于l2sm而言，l1_pf_va + inst_new_va == l1sm的 inst_new_va
///l2sm的entry_l2_pf_va == l1sm的entry_pf_va，但是l2sm仅仅作为wire在内部
  //l2sm继承自l1sm的entry_l1_pf_va看作wire entry_l2_pf_va，将其从端口剔除，同时加上一个新端口entry_l1_pf_va_t，用来和inst_new_va组合为l1sm的inst_new_va


  //                Generate some compare info

  //------------------generate strideh------------------------


  wire.pfu_gpfb_l1_dist_strideh := (Fill(PA_WIDTH,io.lsu_pfu_l1_dist_sel(3)) & (wire.pfu_gpfb_strideh(PA_WIDTH-5,0) ## "b0".U(4.W))
    | Fill(PA_WIDTH,io.lsu_pfu_l1_dist_sel(2)) & (wire.pfu_gpfb_strideh(PA_WIDTH-4,0) ## "b0".U(3.W))
    | Fill(PA_WIDTH,io.lsu_pfu_l1_dist_sel(1)) & (wire.pfu_gpfb_strideh(PA_WIDTH-3,0) ## "b0".U(2.W))
    | Fill(PA_WIDTH,io.lsu_pfu_l1_dist_sel(0)) & (wire.pfu_gpfb_strideh(PA_WIDTH-2,0) ## "b0".U(1.W)))

  wire.pfu_gpfb_l2_dist_strideh := (Fill(PA_WIDTH,io.lsu_pfu_l2_dist_sel(3)) & (wire.pfu_gpfb_strideh(PA_WIDTH-7,0) ## "b0".U(6.W))
    | Fill(PA_WIDTH,io.lsu_pfu_l2_dist_sel(2)) & (wire.pfu_gpfb_strideh(PA_WIDTH-6,0) ## "b0".U(5.W))
    | Fill(PA_WIDTH,io.lsu_pfu_l2_dist_sel(1)) & (wire.pfu_gpfb_strideh(PA_WIDTH-5,0) ## "b0".U(4.W))
    | Fill(PA_WIDTH,io.lsu_pfu_l2_dist_sel(0)) & (wire.pfu_gpfb_strideh(PA_WIDTH-4,0) ## "b0".U(3.W)))
  
  wire.pfb_gpfb_32strideh    := wire.pfu_gpfb_strideh(PA_WIDTH-6,0) ## "b0".U(5.W)
  wire.pfb_gpfb_128strideh   := wire.pfu_gpfb_strideh(PA_WIDTH-8,0) ## "b0".U(7.W)

//-----------------generate l1 too far----------------------
wire.pfu_gpfb_l1sm_diff_sub_32strideh :=  wire.pfu_gpfb_l1_pf_va_sub_inst_new_va(PA_WIDTH-1,0) - wire.pfb_gpfb_32strideh(PA_WIDTH-1,0)

wire.pfu_gpfb_inst_new_va_too_far_l1_pf_va_set  := wire.pfu_gpfb_stride_neg ===  wire.pfu_gpfb_l1sm_diff_sub_32strideh(PA_WIDTH-1)

//-----------------generate l2 too far----------------------
wire.pfu_gpfb_l2sm_diff_sub_128strideh := wire.pfu_gpfb_l2_pf_va_sub_l1_pf_va(PA_WIDTH-1,0) - wire.pfb_gpfb_128strideh(PA_WIDTH-1,0)

wire.pfu_gpfb_l1_pf_va_too_far_l2_pf_va_set := wire.pfu_gpfb_stride_neg ===  wire.pfu_gpfb_l2sm_diff_sub_128strideh(PA_WIDTH-1)

//==========================================================
//              Generate pop/reinit signal
//==========================================================
wire.pfu_gpfb_reinit_vld          := wire.pfu_gpfb_l1sm_reinit_req  ||  wire.pfu_gpfb_l2sm_reinit_req

//==========================================================
//                Generate create signal
//==========================================================
wire.pfu_gpfb_create_vld          := io.pfu_gsdb_gpfb_create_vld
wire.pfu_gpfb_create_dp_vld       := io.pfu_gsdb_gpfb_create_vld
wire.pfu_gpfb_create_gateclk_en   := io.pfu_gsdb_gpfb_create_vld
}