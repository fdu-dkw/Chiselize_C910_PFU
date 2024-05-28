import chisel3._
class ct_lsu_pfu_pmb_entry extends Module {
  //io all below
val io = IO(new Bundle {
val amr_wa_cancel = Input(UInt(1.W))                    
val cp0_lsu_icg_en = Input(UInt(1.W))                     
val cp0_lsu_l2_st_pref_en = Input(UInt(1.W))              
val cp0_yy_clk_en = Input(UInt(1.W))                      
val cpurst_b = Input(UInt(1.W))              


val ld_da_ldfifo_pc = Input(UInt(14.W))                     
val ld_da_pfu_act_dp_vld = Input(UInt(1.W))                
val ld_da_pfu_evict_cnt_vld = Input(UInt(1.W))             
val ld_da_pfu_pf_inst_vld = Input(UInt(1.W))   


val lsu_special_clk = Input(UInt(1.W))                    
val pad_yy_icg_scan_en = Input(UInt(1.W))      


val pfu_pmb_entry_create_dp_vld_x = Input(UInt(1.W))       
val pfu_pmb_entry_create_gateclk_en_x = Input(UInt(1.W))    
val pfu_pmb_entry_create_vld_x = Input(UInt(1.W))          

val pfu_pmb_entry_ready_grnt_x = Input(UInt(1.W))          
val pfu_pop_all_part_vld = Input(UInt(1.W))                

val pipe_create_pc = Input(UInt(14.W))                    
val pmb_timeout_cnt_val = Input(UInt(7.W))                 
val st_da_pc = Input(UInt(14.W))                          
val st_da_pfu_evict_cnt_vld = Input(UInt(1.W))             
val st_da_pfu_pf_inst_vld = Input(UInt(1.W))              


val pfu_pmb_entry_evict_x = Output(UInt(1.W))               
val pfu_pmb_entry_hit_pc_x = Output(UInt(1.W))              
val pfu_pmb_entry_pc_v = Output(UInt(14.W))                  
val pfu_pmb_entry_ready_x = Output(UInt(1.W))               
val pfu_pmb_entry_type_ld_x = Output(UInt(1.W))             
val pfu_pmb_entry_vld_x = Output(UInt(1.W))                
})              

// Wires @29
                         
val entry_hit_pc = Wire(UInt())                                              
val pfu_pmb_entry_all_pf_inst_clk = Wire(UInt())    
val pfu_pmb_entry_all_pf_inst_clk_en = Wire(UInt()) 
val pfu_pmb_entry_clk = Wire(UInt())                
val pfu_pmb_entry_clk_en = Wire(UInt())             
val pfu_pmb_entry_create_clk = Wire(UInt())         
val pfu_pmb_entry_create_clk_en = Wire(UInt())      
val pfu_pmb_entry_create_dp_vld = Wire(UInt())      
val pfu_pmb_entry_create_gateclk_en = Wire(UInt())   
val pfu_pmb_entry_create_vld = Wire(UInt())                
val pfu_pmb_entry_evict_pop = Wire(UInt())                     
val pfu_pmb_entry_hit_pc = Wire(UInt())             
val pfu_pmb_entry_hit_pc_for_new = Wire(UInt())                              
val pfu_pmb_entry_pop_vld = Wire(UInt())            
val pfu_pmb_entry_ready_grnt = Wire(UInt())                          
val pfu_pmb_entry_timeout_cnt_full = Wire(UInt())              
val pfu_pop_st_all = Wire(UInt())                   
val pfu_sdb_entry_evict_clr = Wire(UInt())          
val pfu_sdb_entry_evict_set = Wire(UInt())          
val pipe_cmp_inst_vld = Wire(UInt())                
val pipe_cmp_pc = Wire(UInt())                                        
val pipe_evict_cnt_vld = Wire(UInt())                             

//gate signal

val pfu_pmb_entry_clk_en := pfu_pmb_entry_vld
                              ||  pfu_pmb_entry_create_gateclk_en;
 
val x_lsu_pfu_pmb_entry_gated_clk = Module new (gated_clk_cell)
  x_lsu_pfu_pmb_entry_gated_clk.io.clk_in := io.lsu_special_clk
  pfu_pmb_entry_clk := x_lsu_pfu_pmb_entry_gated_clk.io.clk_out 
  x_lsu_pfu_pmb_entry_gated_clk.io.external_en :=  0.U(1.W)                 
  x_lsu_pfu_pmb_entry_gated_clk.io.global_en :=  io.cp0_yy_clk_en        
  x_lsu_pfu_pmb_entry_gated_clk.io.local_en :=  pfu_pmb_entry_clk_en 
  x_lsu_pfu_pmb_entry_gated_clk.io.module_en :=   io.cp0_lsu_icg_en       
  x_lsu_pfu_pmb_entry_create_gated_clk.io.pad_yy_icg_scan_en := io.pad_yy_icg_scan_en   
 ;

val pfu_pmb_entry_create_clk_en := pfu_pmb_entry_create_gateclk_en;
 
val x_lsu_pfu_pmb_entry_create_gated_clk = Module(new gated_clk_cell)
  x_lsu_pfu_pmb_entry_create_gated_clk.io.clk_in :=   io.lsu_special_clk             
  pfu_pmb_entry_create_clk := x_lsu_pfu_pmb_entry_create_gated_clk.io.clk_out
  x_lsu_pfu_pmb_entry_create_gated_clk.io.external_en :=  0.U(1.W)                        
  x_lsu_pfu_pmb_entry_create_gated_clk.io.global_en :=   io.cp0_yy_clk_en               
  x_lsu_pfu_pmb_entry_create_gated_clk.io.local_en :=  pfu_pmb_entry_create_clk_en 
  x_lsu_pfu_pmb_entry_create_gated_clk.io.module_en :=  cp0_lsu_icg_en              
  x_lsu_pfu_pmb_entry_create_gated_clk.io.pad_yy_icg_scan_en := io.pad_yy_icg_scan_en          
 ;

val pfu_pmb_entry_all_pf_inst_clk_en := pfu_pmb_entry_vld
                                             && ( io.ld_da_pfu_pf_inst_vld ||  io.st_da_pfu_pf_inst_vld)
                                          || pfu_pmb_entry_create_gateclk_en;
                                          
                                          
 
val x_lsu_pfu_pmb_entry_all_pf_inst_gated_clk = Module(new gated_clk_cell)
  x_lsu_pfu_pmb_entry_all_pf_inst_gated_clk.io.clk_in :=   io.lsu_special_clk                  
  pfu_pmb_entry_all_pf_inst_clk := x_lsu_pfu_pmb_entry_all_pf_inst_gated_clk.io.clk_out    
  x_lsu_pfu_pmb_entry_all_pf_inst_gated_clk.io.external_en :=  0.U(1.W)                             
  x_lsu_pfu_pmb_entry_all_pf_inst_gated_clk.io.global_en :=   io.cp0_yy_clk_en                    
  x_lsu_pfu_pmb_entry_all_pf_inst_gated_clk.io.local_en :=  pfu_pmb_entry_all_pf_inst_clk_en 
  x_lsu_pfu_pmb_entry_all_pf_inst_gated_clk.io.module_en :=  cp0_lsu_icg_en                   
  x_lsu_pfu_pmb_entry_all_pf_inst_gated_clk.io.pad_yy_icg_scan_en := io.pad_yy_icg_scan_en               
 ;


//regs

withClockAndReset(pfu_pmb_entry_clk, !io.cpurst_b) {
  // Regs @28          
val pfu_pmb_entry_vld = RegInit(0.U(1.W))
  else if(pfu_pmb_entry_pop_vld)
    pfu_pmb_entry_vld  <=  1'b0;
  else if(pfu_pmb_entry_create_vld)
    pfu_pmb_entry_vld  <=  1'b1;
}

//+----+
//| pc |
//+----+
withClockAndReset(pfu_pmb_entry_create_clk, !io.cpurst_b) {
  if (! io.cpurst_b)
    pfu_pmb_entry_pc[PC_LEN-1:0]  <=  {PC_LEN{1'b0}};
  else if(pfu_pmb_entry_create_dp_vld)
    pfu_pmb_entry_pc[PC_LEN-1:0]  <=   io.pipe_create_pc[PC_LEN-1:0];
}

//+----+------+
//| pref_type |
//+----+------+
withClockAndReset(pfu_pmb_entry_create_clk, !io.cpurst_b) {
  if (! io.cpurst_b)
    pfu_pmb_entry_type_ld  <=  1'b0;
  else if(pfu_pmb_entry_create_dp_vld)
    pfu_pmb_entry_type_ld  <=   io.ld_da_pfu_act_dp_vld;
}

//+-----+
//| cnt |
//+-----+
withClockAndReset(pfu_pmb_entry_all_pf_inst_clk, !io.cpurst_b) {
  if (! io.cpurst_b)
    pfu_pmb_entry_cnt       <=  1'b0;
  else if(pfu_pmb_entry_create_dp_vld)
    pfu_pmb_entry_cnt       <=  1'b0;
  else if(!pfu_pmb_entry_cnt  &&  pfu_pmb_entry_hit_pc)
    pfu_pmb_entry_cnt       <=  ~pfu_pmb_entry_cnt;
}

//+-------------+
//| timeout_cnt 
//+-------------+
withClockAndReset(pfu_pmb_entry_all_pf_inst_clk, !io.cpurst_b) {
  if (! io.cpurst_b)
    pfu_pmb_entry_timeout_cnt[TIMEOUT_BW-1:0] <=  {TIMEOUT_BW{1'b0}};
  else if(pfu_pmb_entry_create_dp_vld ||  pfu_pmb_entry_hit_pc)
    pfu_pmb_entry_timeout_cnt[TIMEOUT_BW-1:0] <=  {TIMEOUT_BW{1'b0}};
  else if(pipe_evict_cnt_vld &&  !pfu_pmb_entry_timeout_cnt_full)
    pfu_pmb_entry_timeout_cnt[TIMEOUT_BW-1:0] <=  pfu_pmb_entry_timeout_cnt[TIMEOUT_BW-1:0]
                                                  + {{TIMEOUT_BW-1{1'b0}},1'b1};
}

//+-------+
//| ready |
//+-------+
withClockAndReset(pfu_pmb_entry_clk, !io.cpurst_b) {
  if (! io.cpurst_b)
    pfu_pmb_entry_ready     <=  1'b0;
  else if(pfu_pmb_entry_create_dp_vld ||  pfu_pmb_entry_pop_vld)
    pfu_pmb_entry_ready     <=  1'b0;
  else if(pfu_pmb_entry_cnt &&  pfu_pmb_entry_hit_pc)
    pfu_pmb_entry_ready     <=  1'b1;
}

//+-------+
//| evict |
//+-------+
withClockAndReset(pfu_pmb_entry_clk, !io.cpurst_b) {

  else if(pfu_pmb_entry_create_dp_vld ||  pfu_pmb_entry_pop_vld ||  pfu_sdb_entry_evict_clr)
    pfu_pmb_entry_evict     <=  1'b0;
  else if(pfu_sdb_entry_evict_set)
    pfu_pmb_entry_evict     <=  1'b1;
}

val pipe_cmp_inst_vld := pfu_pmb_entry_type_ld;
                           ?  io.ld_da_pfu_pf_inst_vld
                           :  io.st_da_pfu_pf_inst_vld;

val pipe_cmp_pc := pfu_pmb_entry_type_ld
                                 ?  io.ld_da_ldfifo_pc[PC_LEN-1:0]
                                 :  io.st_da_pc[PC_LEN-1:0];

val pipe_evict_cnt_vld :=  io.ld_da_pfu_evict_cnt_vld ||  io.st_da_pfu_evict_cnt_vld;
//==========================================================
//                 Caucalate hit pc signal
//==========================================================
val entry_hit_pc := pfu_pmb_entry_vld
                      && (pipe_cmp_pc[PC_LEN-1:0]
                         ==  pfu_pmb_entry_pc[PC_LEN-1:0]);

//for maintance
val pfu_pmb_entry_hit_pc := entry_hit_pc
                              &&  pipe_cmp_inst_vld;

//for new inst create
val pfu_pmb_entry_hit_pc_for_new := entry_hit_pc
                                      && !(pfu_pmb_entry_type_ld ^  io.ld_da_pfu_act_dp_vld);
//==========================================================
//                    Set/clr evict
//==========================================================
val pfu_pmb_entry_timeout_cnt_full := (pfu_pmb_entry_timeout_cnt[TIMEOUT_BW-1:0]
                                         ==  io.pmb_timeout_cnt_val[TIMEOUT_BW-1:0]);

//if 
val pfu_sdb_entry_evict_set := pfu_pmb_entry_vld
                                  &&  !pfu_pmb_entry_ready
                                  &&  pipe_cmp_inst_vld
                                  &&  pfu_pmb_entry_timeout_cnt_full
                                  &&  !pfu_pmb_entry_hit_pc;//向外传递的信号

val pfu_sdb_entry_evict_clr := pfu_pmb_entry_hit_pc;

//==========================================================
//                Generate pop signal
//==========================================================
//st pref pop
val pfu_pop_st_all := pfu_pmb_entry_vld
                        && !pfu_pmb_entry_type_ld 
                        && (! io.cp0_lsu_l2_st_pref_en || io.amr_wa_cancel);

//for timing
//when create_vld != create_dp,and the entry is at evict state
//pop entry preventing data path from being changed incorrectly
val pfu_pmb_entry_evict_pop := pfu_pmb_entry_vld
                                  && pfu_pmb_entry_evict
                                  && pfu_pmb_entry_create_dp_vld
                                  && !pfu_pmb_entry_create_vld; 

val pfu_pmb_entry_pop_vld := pfu_pmb_entry_ready_grnt
                                  ||  pfu_pmb_entry_evict_pop
                                  ||  pfu_pop_st_all
                                  ||   io.pfu_pop_all_part_vld;

//==========================================================
//                 Generate interface
//==========================================================
//------------------input-----------------------------------
//-----------create signal--------------
val pfu_pmb_entry_create_vld :=  io.pfu_pmb_entry_create_vld_x;
val pfu_pmb_entry_create_dp_vld :=  io.pfu_pmb_entry_create_dp_vld_x;
val pfu_pmb_entry_create_gateclk_en :=  io.pfu_pmb_entry_create_gateclk_en_x;
//---------grnt/done signal-------------
val pfu_pmb_entry_ready_grnt :=  io.pfu_pmb_entry_ready_grnt_x;
//------------------output----------------------------------
//-----------entry signal---------------
val  io.pfu_pmb_entry_vld_x := pfu_pmb_entry_vld;
val  io.pfu_pmb_entry_pc_v := pfu_pmb_entry_pc;
val  io.pfu_pmb_entry_ready_x := pfu_pmb_entry_ready;
val  io.pfu_pmb_entry_evict_x := pfu_pmb_entry_evict;
val pfu_pmb_entry_type_ld_x := pfu_pmb_entry_type_ld;
//-----------hit signal-----------------
val  io.pfu_pmb_entry_hit_pc_x := pfu_pmb_entry_hit_pc_for_new;
}
