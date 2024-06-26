package gpfb

import IOinst._
import chisel3._
import chisel3.experimental.{ChiselEnum, Direction, noPrefix}
import chisel3.util._
//个人认为可以优化的点：时钟域可以写的更清楚，reg的时钟域初始化可以用一个函数实现或许更好
//模块例化和端口连接，用更加方便的手段实现
//对于reg的时钟域问题，我写了两种利用时钟域实现的方法

//一个chisel实现l1sm和l2sm两个模块，对于l2sm中功能一样的信号，尝试直接将名字替换为l1的名字，如果没有问题就看作该名字
class l1sm (PA_WIDTH:Int,chose:Int) extends RawModule {

  override def desiredName: String = s"ct_lsu_pfu_pfb_l${chose+1}sm_tmp"

  val io = noPrefix{IO(new l1smIO(chose,PA_WIDTH))}
  val wire = Wire(new l1smwire(chose,PA_WIDTH))
  val reg = new l1smreg(PA_WIDTH)

//  if(chose == 0){
//    wire.entry_l1_pf_va <> DontCare
//    io.entry_l1_pf_va_t <> DontCare
//  }else{
//    io.entry_l1_pf_va <> DontCare
//  }

  object args extends ChiselEnum{
    val L1_INIT_PF_ADDR = Value("b000".U(3.W))
    val L1_ADD_PF_VA    = Value("b001".U(3.W))
    val L1_REQ_PF       = Value("b100".U(3.W))
    val L1_REQ_MMU      = Value("b101".U(3.W))
    val L1_WAIT_PPN     = Value("b110".U(3.W))
    val L1_DEAD         = Value("b111".U(3.W))
  }

  //chisel 的reg不能直接定义为与output相连，必须将reg和out端口：=相连
  //l1_pf_va clk
  wire.entry_l1_pf_va_clk_en := wire.entry_l1_pf_addr_init_vld || wire.entry_l1_pf_va_add_gateclk_en
  //l1_pf_ppn clk
  wire.entry_l1_pf_ppn_clk_en := wire.entry_l1_pf_addr_init_vld && io.pfu_dcache_pref_en || wire.entry_l1_pf_ppn_up_vld
  //例化gated_clk
  val gated_clk_inst = VecInit(Seq.fill(2)(Module(new gated_clk_cell).io))
  for(i <- 0 to 1 ){
    gated_clk_inst(i).clk_in := io.forever_cpuclk
    gated_clk_inst(i).external_en := "b0".U(1.W)
    gated_clk_inst(i).global_en := io.cp0_yy_clk_en

    gated_clk_inst(i).module_en := io.cp0_lsu_icg_en
    gated_clk_inst(i).pad_yy_icg_scan_en := io.pad_yy_icg_scan_en
    if(i == 0){
      wire.entry_l1_pf_va_clk := gated_clk_inst(i).clk_out
        gated_clk_inst(i).local_en := wire.entry_l1_pf_va_clk_en
    }else{
      wire.entry_l1_pf_ppn_clk :=gated_clk_inst(i).clk_out
      gated_clk_inst(i).local_en := wire.entry_l1_pf_ppn_clk_en
    }
  }




  //l1_pf_va
  withClockAndReset(wire.entry_l1_pf_va_clk,(!io.cpurst_b.asBool).asAsyncReset) {
    val entry_l1_pf_va = Reg(reg.entry_l1_pf_va)
    when(!io.cpurst_b.asBool) {
      entry_l1_pf_va := Fill(PA_WIDTH, "b0".U(1.W))
    }.elsewhen(wire.entry_l1_pf_addr_init_vld) {
      entry_l1_pf_va := io.entry_inst_new_va(PA_WIDTH - 1, 0)
    }.elsewhen(wire.entry_l1_pf_va_add_vld) {
      entry_l1_pf_va := wire.entry_l1_pf_va_add_strideh(PA_WIDTH - 1, 0)
    }
    if (chose == 0) {
      io.entry_l1_pf_va.get := entry_l1_pf_va
    }else{
      wire.entry_l1_pf_va.get := entry_l1_pf_va
    }
    io.entry_l1_vpn := entry_l1_pf_va(PA_WIDTH - 1, 12)

    //注意：原来的verilog是高位悬空的，我这里处理为高位置0
  }

  //l1_pf_ppn
  withClockAndReset(wire.entry_l1_pf_ppn_clk,(!io.cpurst_b.asBool).asAsyncReset){
    val entry_l1_pf_ppn = Reg(reg.entry_l1_pf_ppn)
    val entry_l1_page_sec = Reg(reg.entry_l1_page_sec)
    val entry_l1_page_share = Reg(reg.entry_l1_page_share)

    when(!io.cpurst_b.asBool){
      entry_l1_pf_ppn                :=  Fill(PA_WIDTH-12,"b0".U(1.W))
      entry_l1_page_sec              := "b0".U(1.W)
      entry_l1_page_share            := "b0".U(1.W)
    }.elsewhen(wire.entry_l1_pf_addr_init_vld &&  io.pfu_dcache_pref_en){

      entry_l1_pf_ppn                := io.ld_da_ppn_ff(PA_WIDTH-13,0)
      entry_l1_page_sec              := io.ld_da_page_sec_ff
      entry_l1_page_share            := io.ld_da_page_share_ff

    }.elsewhen(wire.entry_l1_pf_ppn_up_vld){

      entry_l1_pf_ppn                := io.pfu_get_ppn(PA_WIDTH-13,0)
      entry_l1_page_sec              := io.pfu_get_page_sec
      entry_l1_page_share            := io.pfu_get_page_share
    }

    //wire
    if(chose == 0){
      io.entry_l1_pf_addr  := entry_l1_pf_ppn(PA_WIDTH-13,0) ## io.entry_l1_pf_va.get(11,0);
    }else{
      io.entry_l1_pf_addr  := entry_l1_pf_ppn(PA_WIDTH-13,0) ## wire.entry_l1_pf_va.get(11,0);
    }
    //output
    io.entry_l1_page_sec := entry_l1_page_sec
    io.entry_l1_page_share := entry_l1_page_share

  }

  //pfu pipeline control signal
  withClockAndReset(io.entry_clk,(!io.cpurst_b.asBool).asAsyncReset){
    val entry_l1_cmp_va_vld = RegInit(reg.entry_l1_cmp_va_vld,"b0".U(1.W).asBool)
    when(io.entry_create_dp_vld.asBool || io.entry_reinit_vld.asBool){
      entry_l1_cmp_va_vld := "b0".asUInt.asBool
    }.elsewhen(wire.entry_l1_pf_va_add_vld || io.entry_pf_inst_vld && io.entry_l1sm_va_can_cmp){
      entry_l1_cmp_va_vld := "b1".asUInt.asBool
    }.otherwise{
      entry_l1_cmp_va_vld := "b0".asUInt.asBool
    }
    io.entry_l1_cmp_va_vld := entry_l1_cmp_va_vld
  }


  /*  //有另外一种实现方法：使用regnext，将when的第一个判断和复位信号用或连接起来变成一个复位信号，otherwise始终跟随。上下两个同理

//chisel的when语句包含了上升沿或者下降沿的检测概念，再加上switch，其实已经不需要将敏感列表列出，也不需要将其转为clock等取巧的方法
//对于敏感列表：1.when语句 2.将敏感列表所有的都位或3.重写，用chisel的语言逻辑重新写，不能照搬原来的verilog逻辑，参考chisel的FSM写法
//chisel与verilog的巧妙之处：verilog实现异步比较困难，尤其是有比较多的敏感信号的时候。而chisel不需要，只需要指定一个同步时钟域下的reg，再用when,即可实现异步组合逻辑变化，并将变化等待同步改变reg

*/
  //对于时序部分，最大的不同就在于1.同步和异步的结合2.敏感列表检测
  //一个令人迷惑的点在于chisel的时钟域其实比较特殊，本module是一个大模块下多时钟域，多个时钟域又要交互


  //state machine
  //绝对NB的地方：verilog的状态机实现非常麻烦，但是chisel就非常的爽，而且易读
  //同时这种时钟域同步控制+异步组合逻辑混写我觉得更加好懂
  private val entry_l1_state = Wire(UInt(3.W))
  withClockAndReset(io.entry_clk.asBool.asClock, (!io.cpurst_b.asBool).asAsyncReset) {
    val state = RegInit(reg.entry_l1_state,args.L1_INIT_PF_ADDR)
  //其实state的寄存器声明可以合并

    //state := args.L1_INIT_PF_ADDR.asUInt  //switch不支持default，可以先赋值，作为一种default，但是这里不可以这样写
  when(io.entry_pop_vld || io.entry_reinit_vld || !io.pfu_dcache_pref_en) {
    state := args.L1_INIT_PF_ADDR.asUInt
  }.otherwise{

    switch(state){
      is(args.L1_INIT_PF_ADDR){

        when(wire.entry_l1_pf_addr_init_vld && io.pfu_dcache_pref_en){
          state := args.L1_ADD_PF_VA.asUInt
        }.otherwise{
          state := args.L1_INIT_PF_ADDR.asUInt
        }
      }
      is(args.L1_ADD_PF_VA){
        state := args.L1_REQ_PF.asUInt
      }
      is(args.L1_REQ_PF){
        when(wire.entry_l1_pf_va_add_vld && wire.entry_l1_pf_va_cross_4k.asBool && io.cp0_lsu_pfu_mmu_dis.asBool) {
          state := args.L1_DEAD.asUInt
        }.elsewhen(wire.entry_l1_pf_va_add_vld && wire.entry_l1_pf_va_cross_4k.asBool){
          state := args.L1_REQ_MMU.asUInt
        }.otherwise{
          state := args.L1_REQ_PF.asUInt
        }
      }
      is(args.L1_REQ_MMU){
        when(io.entry_l1_mmu_pe_req_set.asBool){
          state := args.L1_WAIT_PPN.asUInt
        }.otherwise{
          state := args.L1_REQ_MMU.asUInt
        }
      }
      is(args.L1_WAIT_PPN) {
        when(io.pfu_get_ppn_vld && !io.pfu_get_ppn_err.asBool) {
          state := args.L1_REQ_PF.asUInt
        }.elsewhen(io.pfu_get_ppn_vld && io.pfu_get_ppn_err.asBool) {
          state := args.L1_DEAD.asUInt
        }.otherwise {
          state := args.L1_WAIT_PPN.asUInt
        }
      }
      is(args.L1_DEAD) {
        when(io.entry_reinit_vld.asBool) {
          state := args.L1_INIT_PF_ADDR.asUInt
        }.otherwise {
          state := args.L1_DEAD.asUInt
        }
      }
    }
  }
    entry_l1_state := state
  }

  //some compare info
  withClockAndReset(io.entry_clk, (!io.cpurst_b.asBool).asAsyncReset) { //注意asAsyncReset
    val entry_in_l1_pf_region = RegInit(reg.entry_in_l1_pf_region,"b1".U(1.W))
    val entry_inst_new_va_surpass_l1_pf_va = RegInit(reg.entry_inst_new_va_surpass_l1_pf_va,"b1".U(1.W))


    when(io.entry_create_dp_vld.asBool || io.entry_reinit_vld.asBool) {
      entry_in_l1_pf_region := "b1".U
      entry_inst_new_va_surpass_l1_pf_va := "b0".U
    }.elsewhen(io.entry_l1_cmp_va_vld && io.entry_l1sm_va_can_cmp) {
      entry_inst_new_va_surpass_l1_pf_va := wire.entry_inst_new_va_surpass_l1_pf_va_set
    }
    io.entry_l1_biu_pe_req_set  := (entry_l1_state.asUInt === args.L1_REQ_PF.asUInt) &&  entry_in_l1_pf_region.asBool &&  !wire.entry_l1_biu_pe_req
    io.entry_l1sm_reinit_req  := io.entry_l1sm_va_can_cmp &&  entry_inst_new_va_surpass_l1_pf_va.asBool
  }


  io.entry_l1sm_va_can_cmp := entry_l1_state.asUInt(2)
  //state0
  if(chose == 0){
    wire.entry_l1_pf_addr_init_vld := (entry_l1_state.asUInt === args.L1_INIT_PF_ADDR.asUInt) && io.entry_tsm_is_judge.asBool
  }else{
    wire.entry_l1_pf_addr_init_vld := (entry_l1_state.asUInt === args.L1_INIT_PF_ADDR.asUInt) && io.entry_tsm_is_judge.asBool && io.pfu_dcache_pref_en
  }


  //state1
  //add pf control signal
  wire.entry_l1_pf_va_add_vld   := (entry_l1_state.asUInt === args.L1_ADD_PF_VA.asUInt) || wire.entry_l1_biu_pe_req_grnt
  wire.entry_l1_pf_va_add_gateclk_en  :=  (entry_l1_state.asUInt === args.L1_ADD_PF_VA.asUInt) ||  io.entry_biu_pe_req_grnt
  if(chose == 0){
    wire.entry_l1_pf_va_add_strideh := (io.entry_l1_pf_va.get(PA_WIDTH-1,0) + io.entry_strideh(PA_WIDTH-1,0))
    wire.entry_l1_pf_va_sum_4k  := Cat("b0".U(1.W),io.entry_l1_pf_va.get(11,0)) + io.entry_strideh(12,0)
  }else{
    wire.entry_l1_pf_va_add_strideh := (wire.entry_l1_pf_va.get(PA_WIDTH-1,0) + io.entry_strideh(PA_WIDTH-1,0))
    wire.entry_l1_pf_va_sum_4k  := Cat("b0".U(1.W),wire.entry_l1_pf_va.get(11,0)) + io.entry_strideh(12,0)
  }
  //原来的verilog对entry_l1_pf_va_sum_4K是[12:0]但是1.chisel不支持位选变化2.声明的时候就是[12:0]，不需要再位选了
  wire.entry_l1_pf_va_cross_4k      := wire.entry_l1_pf_va_sum_4k(12)

  //==========================================================
  //                 State 2 : req pf
  //==========================================================
  //----------------set biu_pe_req reg------------------------
  // &Force("bus","entry_biu_pe_req_src","1","0"); @237
  wire.entry_l1_biu_pe_req      := io.entry_biu_pe_req &&  io.entry_biu_pe_req_src(chose).asBool
  //一些和reg相关的，合并到时钟域内了
if(chose == 0) {
  wire.entry_l1_biu_pe_req_grnt := io.pfu_biu_pe_req_sel_l1 &&  io.entry_biu_pe_req_grnt
}else {
  wire.entry_l1_biu_pe_req_grnt := (!io.pfu_biu_pe_req_sel_l1 || wire.entry_l1_pf_va_eq_inst_new_va) &&  io.entry_biu_pe_req_grnt
}
  //==========================================================
  //                 State 3 : req mmu
  //==========================================================
  // &Force("bus","entry_mmu_pe_req_src","1","0"); @253
  wire.entry_l1_mmu_pe_req      := io.entry_mmu_pe_req &&  io.entry_mmu_pe_req_src(chose).asBool

  io.entry_l1_mmu_pe_req_set  := (entry_l1_state.asUInt === args.L1_REQ_MMU.asUInt)  &&  !wire.entry_l1_mmu_pe_req
  if(chose == 0){
    wire.entry_l1_mmu_pe_req_grnt := io.entry_mmu_pe_req_grnt &&  io.pfu_mmu_pe_req_sel_l1
  }else{
    wire.entry_l1_mmu_pe_req_grnt := (io.entry_mmu_pe_req && io.entry_mmu_pe_req_grnt &&
      (!io.pfu_mmu_pe_req_sel_l1 || wire.entry_l1_pf_va_eq_inst_new_va))
  }

  //==========================================================
  //                 State 4 : wait ppn
  //==========================================================
  wire.entry_l1_pf_ppn_up_vld   := (entry_l1_state.asUInt === args.L1_WAIT_PPN.asUInt) &&  io.pfu_get_ppn_vld
  //==========================================================
  //                 Some compare info
  //==========================================================
  // &Force("output","entry_l1_pf_va_sub_inst_new_va"); @272
  if(chose == 0){
    io.entry_l1_pf_va_sub_inst_new_va  :=  (io.entry_l1_pf_va.get(PA_WIDTH-1,0) - io.entry_inst_new_va(PA_WIDTH-1,0))
  }else {
    io.entry_l1_pf_va_sub_inst_new_va  :=  (wire.entry_l1_pf_va.get(PA_WIDTH-1,0) - io.entry_l1_pf_va_t.get(PA_WIDTH-1,0))
  }

    wire.entry_l1sm_diff_sub_dist_strideh := (io.entry_l1_pf_va_sub_inst_new_va(PA_WIDTH-1,0) - io.entry_l1_dist_strideh(PA_WIDTH-1,0))


    wire.entry_l1_pf_va_eq_inst_new_va := !io.entry_l1_pf_va_sub_inst_new_va(PA_WIDTH-1,0).orR //注意这里容易错，！对于UInt来说，是检测UInt是否为0，如果为0则返回1
  wire.entry_inst_new_va_surpass_l1_pf_va_set := (io.entry_stride_neg ^ io.entry_l1_pf_va_sub_inst_new_va(PA_WIDTH-1)).asBool && !wire.entry_l1_pf_va_eq_inst_new_va
  wire.entry_in_l1_pf_region_set  := io.entry_stride_neg ^ wire.entry_l1sm_diff_sub_dist_strideh(PA_WIDTH-1)
}


class gated_clk_cell extends BlackBox {
  val io = IO(new gated_clk_cell_IO)

//  override def desiredName: String = s"gated_clk_cell_tmp"
//  private val clk_en_bf_latch = Wire(UInt(1.W))
//  private val SE = Wire(UInt(1.W))
//
//  clk_en_bf_latch := (io.global_en &&(io.module_en || io.local_en)) || io.external_en
//  SE := io.pad_yy_icg_scan_en
//  io.clk_out := io.clk_in
}