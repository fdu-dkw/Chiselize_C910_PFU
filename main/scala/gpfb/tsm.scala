package gpfbTOP

import chisel3.{util, _}
import chisel3.experimental.ChiselEnum
import chisel3.util.{Fill, is, switch}
import os.FileType.File


class tsmIO extends Bundle {
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

class tsmwire extends Bundle {
  val entry_biu_pe_req_set = UInt(1.W)
  val entry_biu_pe_req_set_src = UInt(2.W)
  val entry_inst_new_va_cross_4k = Bool()
  val entry_mmu_pe_req_set = UInt(1.W)
  val entry_mmu_pe_req_set_src = UInt(2.W)
  val entry_pf_inst_vld_clk = Clock()
  val entry_pf_inst_vld_clk_en = Bool()
  val entry_pipe_va_add_stride = UInt(40.W)
  val entry_stride_ext = UInt(40.W)
  val entry_sum_4k = UInt(13.W)
}

class tsmreg extends Bundle {
  val entry_already_dcache_hit = UInt(1.W)
  val entry_biu_pe_req = UInt(1.W)
  val entry_biu_pe_req_src = UInt(2.W)
  val entry_inst_new_va = UInt(40.W)
  val entry_mmu_pe_req = UInt(1.W)
  val entry_mmu_pe_req_src = UInt(2.W)
  val entry_priv_mode = UInt(2.W)

  val entry_top_state = UInt(2.W)
}


class tsm(PA_WIDTH: Int) extends RawModule {

  override def desiredName: String = "ct_lsu_pfu_pfb_tsm"

  val io = IO(new tsmIO)
  val wire = Wire(new tsmwire)
  val reg = new tsmreg

  object args extends ChiselEnum {
    val IDLE = Value("b00".U(2.W))
    val INIT_INST_NEW_VA = Value("b10".U(2.W))
    val JUDGE = Value("b11".U(2.W))
  }

  //例化gated cell
  wire.entry_pf_inst_vld_clk_en := io.entry_vld && io.entry_pf_inst_vld

  val tsm_gated_clk = Module(new gated_clk_cell).io
  tsm_gated_clk.clk_in := io.forever_cpuclk
  wire.entry_pf_inst_vld_clk := tsm_gated_clk.clk_out
  tsm_gated_clk.external_en := "b0".U(1.W)
  tsm_gated_clk.global_en := io.cp0_yy_clk_en
  tsm_gated_clk.local_en := wire.entry_pf_inst_vld_clk_en
  tsm_gated_clk.module_en := io.cp0_lsu_icg_en
  tsm_gated_clk.pad_yy_icg_scan_en := io.pad_yy_icg_scan_en

  //state machine

  withClockAndReset(io.entry_clk, (!io.cpurst_b.asBool).asAsyncReset) {
    val state = RegInit(reg.entry_top_state, args.IDLE)

    when(io.entry_pop_vld) {
      state := args.IDLE.asUInt
    }.otherwise {
      state := args.IDLE.asUInt //switch不支持default，可以先赋值，作为一种default
      switch(state) {
        is(args.IDLE) {
          when(io.entry_create_vld) {
            state := args.INIT_INST_NEW_VA.asUInt
          }.otherwise {
            state := args.IDLE.asUInt
          }
        }
        is(args.INIT_INST_NEW_VA) {
          when(io.entry_act_vld && !wire.entry_inst_new_va_cross_4k && !io.entry_reinit_vld) {
            state := args.JUDGE.asUInt
          }.otherwise {
            state := args.INIT_INST_NEW_VA.asUInt
          }
        }
        is(args.JUDGE) {
          when(io.entry_reinit_vld) {
            state := args.INIT_INST_NEW_VA.asUInt
          }.otherwise {
            state := args.JUDGE.asUInt
          }
        }
      }
      //将state从时钟域接出


    }
    io.entry_vld := state.asUInt(1)
    io.entry_tsm_is_judge := state.asUInt === args.JUDGE.asUInt
  }

  //| inst_new_va | addr_compare_info |
  //| supv_mode   |
  withClockAndReset(wire.entry_pf_inst_vld_clk, (!io.cpurst_b.asBool).asAsyncReset) {
    val entry_inst_new_va = RegInit(reg.entry_inst_new_va, "b0".U(reg.entry_inst_new_va.getWidth.W))
    val entry_priv_mode = RegInit(reg.entry_priv_mode, "b0".U(2.W))
    when(io.entry_pf_inst_vld) {
      entry_inst_new_va := Fill(entry_inst_new_va.getWidth - PA_WIDTH, "b0".U(1.W)) ## wire.entry_pipe_va_add_stride(PA_WIDTH - 1, 0)
      entry_priv_mode := io.cp0_yy_priv_mode(1, 0)
    }
    io.entry_inst_new_va := entry_inst_new_va
    io.entry_priv_mode := entry_priv_mode
  }



  //| already_dcache_hit |
  withClockAndReset(io.entry_clk, (!io.cpurst_b.asBool).asAsyncReset) {
    val entry_already_dcache_hit = RegInit(reg.entry_already_dcache_hit, "b0".U(1.W))
    when(io.entry_create_dp_vld || io.entry_from_lfb_dcache_miss) {
      entry_already_dcache_hit := "b0".U(1.W)
    }.elsewhen(io.entry_from_lfb_dcache_hit) {
      entry_already_dcache_hit := "b1".U(1.W)
    }
    io.entry_dcache_hit_pop_req := entry_already_dcache_hit.asBool && io.entry_from_lfb_dcache_hit
  }


  //| biu_pe_req |
  withClockAndReset(io.entry_clk, (!io.cpurst_b.asBool).asAsyncReset) {
    val entry_biu_pe_req = RegInit(reg.entry_biu_pe_req, "b0".U(1.W))
    val entry_biu_pe_req_src = RegInit(reg.entry_biu_pe_req_src, "b0".U(2.W))
    when(io.entry_pop_vld || io.entry_biu_pe_req_grnt) {
      entry_biu_pe_req := "b0".U(1.W)
      entry_biu_pe_req_src := "b0".U(2.W)
    }.elsewhen(wire.entry_biu_pe_req_set.asBool) {
      entry_biu_pe_req := "b1".U(1.W)
      entry_biu_pe_req_src := entry_biu_pe_req_src | wire.entry_biu_pe_req_set_src
    }
    io.entry_biu_pe_req := entry_biu_pe_req
    io.entry_biu_pe_req_src := entry_biu_pe_req_src
  }

  //| mmu_pe_req |
  withClockAndReset(io.entry_clk, (!io.cpurst_b.asBool).asAsyncReset) {
    val entry_mmu_pe_req = RegInit(reg.entry_mmu_pe_req, "b0".U(1.W))
    val entry_mmu_pe_req_src = RegInit(reg.entry_mmu_pe_req_src, "b0".U(2.W))
    when(io.entry_pop_vld || io.entry_mmu_pe_req_grnt) {
      entry_mmu_pe_req := "b0".U(1.W)
      entry_mmu_pe_req_src := "b0".U(2.W)
    }.elsewhen(wire.entry_mmu_pe_req_set.asBool) {
      entry_mmu_pe_req := "b1".U(1.W)
      entry_mmu_pe_req_src := entry_mmu_pe_req_src | wire.entry_mmu_pe_req_set_src
    }
    io.entry_mmu_pe_req := entry_mmu_pe_req
    io.entry_mmu_pe_req_src := entry_mmu_pe_req_src
  }

  wire.entry_stride_ext := "b0".U((wire.entry_stride_ext.getWidth - PA_WIDTH).W) ## Fill(PA_WIDTH - 11, io.entry_stride_neg) ## io.entry_stride(10, 0)


  wire.entry_pipe_va_add_stride := "b0".U((wire.entry_pipe_va_add_stride.getWidth - PA_WIDTH).W) ## io.pipe_va(PA_WIDTH - 1, 0) + wire.entry_stride_ext(PA_WIDTH - 1, 0)
  //judge whether pipe_va + stride cross 4k
  wire.entry_sum_4k := io.pipe_va(11, 0) + wire.entry_stride_ext(12, 0)

  wire.entry_inst_new_va_cross_4k := wire.entry_sum_4k(12)

  //==========================================================
  //                 Generate biu pe req
  //==========================================================
  wire.entry_biu_pe_req_set := io.entry_l2_biu_pe_req_set.asBool || io.entry_l1_biu_pe_req_set.asBool
  wire.entry_biu_pe_req_set_src := io.entry_l2_biu_pe_req_set ## io.entry_l1_biu_pe_req_set
  //==========================================================
  //                 Generate mmu pe req
  //==========================================================
  wire.entry_mmu_pe_req_set := io.entry_l2_mmu_pe_req_set.asBool || io.entry_l1_mmu_pe_req_set.asBool
  wire.entry_mmu_pe_req_set_src := io.entry_l2_mmu_pe_req_set ## io.entry_l1_mmu_pe_req_set
  //==========================================================
  //                 Generate pop req
  //==========================================================
  //已经归入前面的时钟域处理

  // &ModuleEnd; @211

}
