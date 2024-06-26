module ct_lsu_pfu_pfb_entry(
  amr_wa_cancel,
  cp0_lsu_icg_en,
  cp0_lsu_l2_st_pref_en,
  cp0_lsu_pfu_mmu_dis,
  cp0_yy_clk_en,
  cp0_yy_priv_mode,
  cpurst_b,
  ld_da_ldfifo_pc,
  ld_da_page_sec_ff,
  ld_da_page_share_ff,
  ld_da_pfu_act_dp_vld,
  ld_da_pfu_act_vld,
  ld_da_pfu_evict_cnt_vld,
  ld_da_pfu_pf_inst_vld,
  ld_da_ppfu_va,
  ld_da_ppn_ff,
  lsu_pfu_l1_dist_sel,
  lsu_pfu_l2_dist_sel,
  lsu_special_clk,
  pad_yy_icg_scan_en,
  pfb_no_req_cnt_val,
  pfb_timeout_cnt_val,
  pfu_biu_pe_req_sel_l1,
  pfu_dcache_pref_en,
  pfu_get_page_sec,
  pfu_get_page_share,
  pfu_get_ppn,
  pfu_get_ppn_err,
  pfu_get_ppn_vld,
  pfu_l2_pref_en,
  pfu_mmu_pe_req_sel_l1,
  pfu_pfb_create_pc,
  pfu_pfb_create_stride,
  pfu_pfb_create_stride_neg,
  pfu_pfb_create_strideh_6to0,
  pfu_pfb_create_type_ld,
  pfu_pfb_entry_biu_pe_req_grnt_x,
  pfu_pfb_entry_biu_pe_req_src_v,
  pfu_pfb_entry_biu_pe_req_x,
  pfu_pfb_entry_create_dp_vld_x,
  pfu_pfb_entry_create_gateclk_en_x,
  pfu_pfb_entry_create_vld_x,
  pfu_pfb_entry_evict_x,
  pfu_pfb_entry_from_lfb_dcache_hit_x,
  pfu_pfb_entry_from_lfb_dcache_miss_x,
  pfu_pfb_entry_hit_pc_x,
  pfu_pfb_entry_l1_page_sec_x,
  pfu_pfb_entry_l1_page_share_x,
  pfu_pfb_entry_l1_pf_addr_v,
  pfu_pfb_entry_l1_vpn_v,
  pfu_pfb_entry_l2_page_sec_x,
  pfu_pfb_entry_l2_page_share_x,
  pfu_pfb_entry_l2_pf_addr_v,
  pfu_pfb_entry_l2_vpn_v,
  pfu_pfb_entry_mmu_pe_req_grnt_x,
  pfu_pfb_entry_mmu_pe_req_src_v,
  pfu_pfb_entry_mmu_pe_req_x,
  pfu_pfb_entry_priv_mode_v,
  pfu_pfb_entry_vld_x,
  pfu_pop_all_part_vld,
  st_da_page_sec_ff,
  st_da_page_share_ff,
  st_da_pc,
  st_da_pfu_act_vld,
  st_da_pfu_evict_cnt_vld,
  st_da_pfu_pf_inst_vld,
  st_da_ppfu_va,
  st_da_ppn_ff
);

// &Ports; @31
input           amr_wa_cancel;                         
input           cp0_lsu_icg_en;                        
input           cp0_lsu_l2_st_pref_en;                 
input           cp0_lsu_pfu_mmu_dis;                   
input           cp0_yy_clk_en;                         
input   [1 :0]  cp0_yy_priv_mode;                      
input           cpurst_b;                              
input   [14:0]  ld_da_ldfifo_pc;                       
input           ld_da_page_sec_ff;                     
input           ld_da_page_share_ff;                   
input           ld_da_pfu_act_dp_vld;                  
input           ld_da_pfu_act_vld;                     
input           ld_da_pfu_evict_cnt_vld;               
input           ld_da_pfu_pf_inst_vld;                 
input   [39:0]  ld_da_ppfu_va;                         
input   [27:0]  ld_da_ppn_ff;                          
input   [3 :0]  lsu_pfu_l1_dist_sel;                   
input   [3 :0]  lsu_pfu_l2_dist_sel;                   
input           lsu_special_clk;                       
input           pad_yy_icg_scan_en;                    
input   [5 :0]  pfb_no_req_cnt_val;                    
input   [7 :0]  pfb_timeout_cnt_val;                   
input           pfu_biu_pe_req_sel_l1;                 
input           pfu_dcache_pref_en;                    
input           pfu_get_page_sec;                      
input           pfu_get_page_share;                    
input   [27:0]  pfu_get_ppn;                           
input           pfu_get_ppn_err;                       
input           pfu_get_ppn_vld;                       
input           pfu_l2_pref_en;                        
input           pfu_mmu_pe_req_sel_l1;                 
input   [14:0]  pfu_pfb_create_pc;                     
input   [10:0]  pfu_pfb_create_stride;                 
input           pfu_pfb_create_stride_neg;             
input   [6 :0]  pfu_pfb_create_strideh_6to0;           
input           pfu_pfb_create_type_ld;                
input           pfu_pfb_entry_biu_pe_req_grnt_x;       
input           pfu_pfb_entry_create_dp_vld_x;         
input           pfu_pfb_entry_create_gateclk_en_x;     
input           pfu_pfb_entry_create_vld_x;            
input           pfu_pfb_entry_from_lfb_dcache_hit_x;   
input           pfu_pfb_entry_from_lfb_dcache_miss_x;  
input           pfu_pfb_entry_mmu_pe_req_grnt_x;       
input           pfu_pop_all_part_vld;                  
input           st_da_page_sec_ff;                     
input           st_da_page_share_ff;                   
input   [14:0]  st_da_pc;                              
input           st_da_pfu_act_vld;                     
input           st_da_pfu_evict_cnt_vld;               
input           st_da_pfu_pf_inst_vld;                 
input   [39:0]  st_da_ppfu_va;                         
input   [27:0]  st_da_ppn_ff;                          
output  [1 :0]  pfu_pfb_entry_biu_pe_req_src_v;        
output          pfu_pfb_entry_biu_pe_req_x;            
output          pfu_pfb_entry_evict_x;                 
output          pfu_pfb_entry_hit_pc_x;                
output          pfu_pfb_entry_l1_page_sec_x;           
output          pfu_pfb_entry_l1_page_share_x;        
output  [39:0]  pfu_pfb_entry_l1_pf_addr_v;            
output  [27:0]  pfu_pfb_entry_l1_vpn_v;                
output          pfu_pfb_entry_l2_page_sec_x;           
output          pfu_pfb_entry_l2_page_share_x;         
output  [39:0]  pfu_pfb_entry_l2_pf_addr_v;            
output  [27:0]  pfu_pfb_entry_l2_vpn_v;                
output  [1 :0]  pfu_pfb_entry_mmu_pe_req_src_v;        
output          pfu_pfb_entry_mmu_pe_req_x;            
output  [1 :0]  pfu_pfb_entry_priv_mode_v;             
output          pfu_pfb_entry_vld_x;        


my_pfb my_pfb(
  .io_amr_wa_cancel                           (amr_wa_cancel                        ),
  .io_cp0_lsu_icg_en                          (cp0_lsu_icg_en                       ),
  .io_cp0_lsu_l2_st_pref_en                   (cp0_lsu_l2_st_pref_en                ),
  .io_cp0_lsu_pfu_mmu_dis                     (cp0_lsu_pfu_mmu_dis                  ),
  .io_cp0_yy_clk_en                           (cp0_yy_clk_en                        ),
  .io_cp0_yy_priv_mode                        (cp0_yy_priv_mode                     ),
  .io_cpurst_b                                (cpurst_b                             ),
  .io_ld_da_ldfifo_pc                         (ld_da_ldfifo_pc                      ),
  .io_ld_da_page_sec_ff                       (ld_da_page_sec_ff                    ),
  .io_ld_da_page_share_ff                     (ld_da_page_share_ff                  ),
  .io_ld_da_pfu_act_dp_vld                    (ld_da_pfu_act_dp_vld                 ),
  .io_ld_da_pfu_act_vld                       (ld_da_pfu_act_vld                    ),
  .io_ld_da_pfu_evict_cnt_vld                 (ld_da_pfu_evict_cnt_vld              ),
  .io_ld_da_pfu_pf_inst_vld                   (ld_da_pfu_pf_inst_vld                ),
  .io_ld_da_ppfu_va                           (ld_da_ppfu_va                        ),
  .io_ld_da_ppn_ff                            (ld_da_ppn_ff                         ),
  .io_lsu_pfu_l1_dist_sel                     (lsu_pfu_l1_dist_sel                  ),
  .io_lsu_pfu_l2_dist_sel                     (lsu_pfu_l2_dist_sel                  ),
  .io_lsu_special_clk                         (lsu_special_clk                      ),
  .io_pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                   ),
  .io_pfb_no_req_cnt_val                      (pfb_no_req_cnt_val                   ),
  .io_pfb_timeout_cnt_val                     (pfb_timeout_cnt_val                  ),
  .io_pfu_biu_pe_req_sel_l1                   (pfu_biu_pe_req_sel_l1                ),
  .io_pfu_dcache_pref_en                      (pfu_dcache_pref_en                   ),
  .io_pfu_get_page_sec                        (pfu_get_page_sec                     ),
  .io_pfu_get_page_share                      (pfu_get_page_share                   ),
  .io_pfu_get_ppn                             (pfu_get_ppn                          ),
  .io_pfu_get_ppn_err                         (pfu_get_ppn_err                      ),
  .io_pfu_get_ppn_vld                         (pfu_get_ppn_vld                      ),
  .io_pfu_l2_pref_en                          (pfu_l2_pref_en                       ),
  .io_pfu_mmu_pe_req_sel_l1                   (pfu_mmu_pe_req_sel_l1                ),
  .io_pfu_pfb_create_pc                       (pfu_pfb_create_pc                    ),
  .io_pfu_pfb_create_stride                   (pfu_pfb_create_stride                ),
  .io_pfu_pfb_create_stride_neg               (pfu_pfb_create_stride_neg            ),
  .io_pfu_pfb_create_strideh_6to0             (pfu_pfb_create_strideh_6to0          ),
  .io_pfu_pfb_create_type_ld                  (pfu_pfb_create_type_ld               ),
  .io_pfu_pfb_entry_biu_pe_req_grnt_x         (pfu_pfb_entry_biu_pe_req_grnt_x      ),
  .io_pfu_pfb_entry_create_dp_vld_x           (pfu_pfb_entry_create_dp_vld_x        ),
  .io_pfu_pfb_entry_create_gateclk_en_x       (pfu_pfb_entry_create_gateclk_en_x    ),
  .io_pfu_pfb_entry_create_vld_x              (pfu_pfb_entry_create_vld_x           ),
  .io_pfu_pfb_entry_from_lfb_dcache_hit_x     (pfu_pfb_entry_from_lfb_dcache_hit_x  ),
  .io_pfu_pfb_entry_from_lfb_dcache_miss_x    (pfu_pfb_entry_from_lfb_dcache_miss_x ),
  .io_pfu_pfb_entry_mmu_pe_req_grnt_x         (pfu_pfb_entry_mmu_pe_req_grnt_x      ),
  .io_pfu_pop_all_part_vld                    (pfu_pop_all_part_vld                 ),
  .io_st_da_page_sec_ff                       (st_da_page_sec_ff                    ),
  .io_st_da_page_share_ff                     (st_da_page_share_ff                  ),
  .io_st_da_pc                                (st_da_pc                             ),
  .io_st_da_pfu_act_vld                       (st_da_pfu_act_vld                    ),
  .io_st_da_pfu_evict_cnt_vld                 (st_da_pfu_evict_cnt_vld              ),
  .io_st_da_pfu_pf_inst_vld                   (st_da_pfu_pf_inst_vld                ),
  .io_st_da_ppfu_va                           (st_da_ppfu_va                        ),
  .io_st_da_ppn_ff                            (st_da_ppn_ff                         ),
  .io_pfu_pfb_entry_biu_pe_req_src_v          (pfu_pfb_entry_biu_pe_req_src_v       ),
  .io_pfu_pfb_entry_biu_pe_req_x              (pfu_pfb_entry_biu_pe_req_x           ),
  .io_pfu_pfb_entry_evict_x                   (pfu_pfb_entry_evict_x                ),
  .io_pfu_pfb_entry_hit_pc_x                  (pfu_pfb_entry_hit_pc_x               ),
  .io_pfu_pfb_entry_l1_page_sec_x             (pfu_pfb_entry_l1_page_sec_x          ),
  .io_pfu_pfb_entry_l1_page_share_x           (pfu_pfb_entry_l1_page_share_x        ),
  .io_pfu_pfb_entry_l1_pf_addr_v              (pfu_pfb_entry_l1_pf_addr_v           ),
  .io_pfu_pfb_entry_l1_vpn_v                  (pfu_pfb_entry_l1_vpn_v               ),
  .io_pfu_pfb_entry_l2_page_sec_x             (pfu_pfb_entry_l2_page_sec_x          ),
  .io_pfu_pfb_entry_l2_page_share_x           (pfu_pfb_entry_l2_page_share_x        ),
  .io_pfu_pfb_entry_l2_pf_addr_v              (pfu_pfb_entry_l2_pf_addr_v           ),
  .io_pfu_pfb_entry_l2_vpn_v                  (pfu_pfb_entry_l2_vpn_v               ),
  .io_pfu_pfb_entry_mmu_pe_req_src_v          (pfu_pfb_entry_mmu_pe_req_src_v       ),
  .io_pfu_pfb_entry_mmu_pe_req_x              (pfu_pfb_entry_mmu_pe_req_x           ),
  .io_pfu_pfb_entry_priv_mode_v               (pfu_pfb_entry_priv_mode_v            ),
  .io_pfu_pfb_entry_vld_x                     (pfu_pfb_entry_vld_x                  )
);
endmodule

module ct_lsu_pfu_pfb_tsm_tmp(
  input         io_cp0_lsu_icg_en,
  input         io_cp0_yy_clk_en,
  input  [1:0]  io_cp0_yy_priv_mode,
  input         io_cpurst_b,
  input         io_entry_act_vld,
  input         io_entry_biu_pe_req_grnt,
  input         io_entry_clk,
  input         io_entry_create_dp_vld,
  input         io_entry_create_vld,
  input         io_entry_from_lfb_dcache_hit,
  input         io_entry_from_lfb_dcache_miss,
  input         io_entry_l1_biu_pe_req_set,
  input         io_entry_l1_mmu_pe_req_set,
  input         io_entry_l2_biu_pe_req_set,
  input         io_entry_l2_mmu_pe_req_set,
  input         io_entry_mmu_pe_req_grnt,
  input         io_entry_pf_inst_vld,
  input         io_entry_pop_vld,
  input         io_entry_reinit_vld,
  input  [10:0] io_entry_stride,
  input         io_entry_stride_neg,
  input         io_forever_cpuclk,
  input         io_pad_yy_icg_scan_en,
  input  [39:0] io_pipe_va,
  output        io_entry_biu_pe_req,
  output [1:0]  io_entry_biu_pe_req_src,
  output        io_entry_dcache_hit_pop_req,
  output [39:0] io_entry_inst_new_va,
  output        io_entry_mmu_pe_req,
  output [1:0]  io_entry_mmu_pe_req_src,
  output [1:0]  io_entry_priv_mode,
  output        io_entry_tsm_is_judge,
  output        io_entry_vld
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
`endif // RANDOMIZE_REG_INIT
  wire  gated_clk_cell_clk_in; // @[tsm.scala 29:29]
  wire  gated_clk_cell_global_en; // @[tsm.scala 29:29]
  wire  gated_clk_cell_module_en; // @[tsm.scala 29:29]
  wire  gated_clk_cell_local_en; // @[tsm.scala 29:29]
  wire  gated_clk_cell_external_en; // @[tsm.scala 29:29]
  wire  gated_clk_cell_pad_yy_icg_scan_en; // @[tsm.scala 29:29]
  wire  gated_clk_cell_clk_out; // @[tsm.scala 29:29]
  wire  _T_2 = ~io_cpurst_b; // @[tsm.scala 40:57]
  reg [1:0] state; // @[tsm.scala 41:24]
  wire [28:0] _wire_entry_stride_ext_T_1 = io_entry_stride_neg ? 29'h1fffffff : 29'h0; // @[Bitwise.scala 77:12]
  wire [39:0] wire_entry_stride_ext = {_wire_entry_stride_ext_T_1,io_entry_stride}; // @[tsm.scala 135:67]
  wire [12:0] _GEN_19 = {{1'd0}, io_pipe_va[11:0]}; // @[tsm.scala 140:42]
  wire [12:0] wire_entry_sum_4k = _GEN_19 + wire_entry_stride_ext[12:0]; // @[tsm.scala 140:42]
  wire  wire_entry_inst_new_va_cross_4k = wire_entry_sum_4k[12]; // @[tsm.scala 142:57]
  wire [1:0] _GEN_2 = io_entry_reinit_vld ? 2'h2 : 2'h3; // @[tsm.scala 63:37 64:19 66:19]
  wire  wire_entry_pf_inst_vld_clk = gated_clk_cell_clk_out; // @[tsm.scala 17:18 31:30]
  reg [39:0] entry_inst_new_va; // @[tsm.scala 81:36]
  reg [1:0] entry_priv_mode; // @[tsm.scala 82:34]
  wire [39:0] wire_entry_pipe_va_add_stride = io_pipe_va + wire_entry_stride_ext; // @[tsm.scala 138:62]
  reg  entry_already_dcache_hit; // @[tsm.scala 95:43]
  wire  _GEN_9 = io_entry_from_lfb_dcache_hit | entry_already_dcache_hit; // @[tsm.scala 98:45 99:32 95:43]
  reg  entry_biu_pe_req; // @[tsm.scala 107:35]
  reg [1:0] entry_biu_pe_req_src; // @[tsm.scala 108:39]
  wire  wire_entry_biu_pe_req_set = io_entry_l2_biu_pe_req_set | io_entry_l1_biu_pe_req_set; // @[tsm.scala 147:66]
  wire [1:0] wire_entry_biu_pe_req_set_src = {io_entry_l2_biu_pe_req_set,io_entry_l1_biu_pe_req_set}; // @[tsm.scala 148:64]
  wire [1:0] _entry_biu_pe_req_src_T = entry_biu_pe_req_src | wire_entry_biu_pe_req_set_src; // @[tsm.scala 114:52]
  wire  _GEN_11 = wire_entry_biu_pe_req_set | entry_biu_pe_req; // @[tsm.scala 112:49 113:24 107:35]
  reg  entry_mmu_pe_req; // @[tsm.scala 122:35]
  reg [1:0] entry_mmu_pe_req_src; // @[tsm.scala 123:39]
  wire  wire_entry_mmu_pe_req_set = io_entry_l2_mmu_pe_req_set | io_entry_l1_mmu_pe_req_set; // @[tsm.scala 152:66]
  wire [1:0] wire_entry_mmu_pe_req_set_src = {io_entry_l2_mmu_pe_req_set,io_entry_l1_mmu_pe_req_set}; // @[tsm.scala 153:64]
  wire [1:0] _entry_mmu_pe_req_src_T = entry_mmu_pe_req_src | wire_entry_mmu_pe_req_set_src; // @[tsm.scala 129:52]
  wire  _GEN_15 = wire_entry_mmu_pe_req_set | entry_mmu_pe_req; // @[tsm.scala 127:49 128:24 122:35]
  gated_clk_cell gated_clk_cell ( // @[tsm.scala 29:29]
    .clk_in(gated_clk_cell_clk_in),
    .global_en(gated_clk_cell_global_en),
    .module_en(gated_clk_cell_module_en),
    .local_en(gated_clk_cell_local_en),
    .external_en(gated_clk_cell_external_en),
    .pad_yy_icg_scan_en(gated_clk_cell_pad_yy_icg_scan_en),
    .clk_out(gated_clk_cell_clk_out)
  );
  assign io_entry_biu_pe_req = entry_biu_pe_req; // @[tsm.scala 116:25]
  assign io_entry_biu_pe_req_src = entry_biu_pe_req_src; // @[tsm.scala 117:29]
  assign io_entry_dcache_hit_pop_req = entry_already_dcache_hit & io_entry_from_lfb_dcache_hit; // @[tsm.scala 101:68]
  assign io_entry_inst_new_va = entry_inst_new_va; // @[tsm.scala 87:26]
  assign io_entry_mmu_pe_req = entry_mmu_pe_req; // @[tsm.scala 131:25]
  assign io_entry_mmu_pe_req_src = entry_mmu_pe_req_src; // @[tsm.scala 132:29]
  assign io_entry_priv_mode = entry_priv_mode; // @[tsm.scala 88:24]
  assign io_entry_tsm_is_judge = state == 2'h3; // @[tsm.scala 75:43]
  assign io_entry_vld = state[1]; // @[tsm.scala 74:33]
  assign gated_clk_cell_clk_in = io_forever_cpuclk; // @[tsm.scala 30:24]
  assign gated_clk_cell_global_en = io_cp0_yy_clk_en; // @[tsm.scala 33:27]
  assign gated_clk_cell_module_en = io_cp0_lsu_icg_en; // @[tsm.scala 35:27]
  assign gated_clk_cell_local_en = io_entry_vld & io_entry_pf_inst_vld; // @[tsm.scala 27:49]
  assign gated_clk_cell_external_en = 1'h0; // @[tsm.scala 32:29]
  assign gated_clk_cell_pad_yy_icg_scan_en = io_pad_yy_icg_scan_en; // @[tsm.scala 36:36]
  always @(posedge io_entry_clk or posedge _T_2) begin
    if (_T_2) begin // @[tsm.scala 43:28]
      state <= 2'h0; // @[tsm.scala 44:13]
    end else if (io_entry_pop_vld) begin // @[tsm.scala 47:21]
      state <= 2'h0; // @[tsm.scala 49:37 50:19 52:19]
    end else if (2'h0 == state) begin // @[tsm.scala 47:21]
      if (io_entry_create_vld) begin // @[tsm.scala 56:94]
        state <= 2'h2; // @[tsm.scala 57:19]
      end else begin
        state <= 2'h0; // @[tsm.scala 59:19]
      end
    end else if (2'h2 == state) begin // @[tsm.scala 47:21]
      if (io_entry_act_vld & ~wire_entry_inst_new_va_cross_4k & ~io_entry_reinit_vld) begin
        state <= 2'h3;
      end else begin
        state <= 2'h2;
      end
    end else if (2'h3 == state) begin // @[tsm.scala 46:13]
      state <= _GEN_2;
    end else begin
      state <= 2'h0;
    end
  end
  always @(posedge wire_entry_pf_inst_vld_clk or posedge _T_2) begin
    if (_T_2) begin // @[tsm.scala 83:31]
      entry_inst_new_va <= 40'h0; // @[tsm.scala 84:25]
    end else if (io_entry_pf_inst_vld) begin // @[tsm.scala 81:36]
      entry_inst_new_va <= wire_entry_pipe_va_add_stride;
    end
  end
  always @(posedge wire_entry_pf_inst_vld_clk or posedge _T_2) begin
    if (_T_2) begin // @[tsm.scala 83:31]
      entry_priv_mode <= 2'h0; // @[tsm.scala 85:23]
    end else if (io_entry_pf_inst_vld) begin // @[tsm.scala 82:34]
      entry_priv_mode <= io_cp0_yy_priv_mode;
    end
  end
  always @(posedge io_entry_clk or posedge _T_2) begin
    if (_T_2) begin // @[tsm.scala 96:66]
      entry_already_dcache_hit <= 1'h0; // @[tsm.scala 97:32]
    end else if (io_entry_create_dp_vld | io_entry_from_lfb_dcache_miss) begin
      entry_already_dcache_hit <= 1'h0;
    end else begin
      entry_already_dcache_hit <= _GEN_9;
    end
  end
  always @(posedge io_entry_clk or posedge _T_2) begin
    if (_T_2) begin // @[tsm.scala 109:55]
      entry_biu_pe_req <= 1'h0; // @[tsm.scala 110:24]
    end else if (io_entry_pop_vld | io_entry_biu_pe_req_grnt) begin
      entry_biu_pe_req <= 1'h0;
    end else begin
      entry_biu_pe_req <= _GEN_11;
    end
  end
  always @(posedge io_entry_clk or posedge _T_2) begin
    if (_T_2) begin // @[tsm.scala 109:55]
      entry_biu_pe_req_src <= 2'h0; // @[tsm.scala 111:28]
    end else if (io_entry_pop_vld | io_entry_biu_pe_req_grnt) begin // @[tsm.scala 112:49]
      entry_biu_pe_req_src <= 2'h0; // @[tsm.scala 114:28]
    end else if (wire_entry_biu_pe_req_set) begin // @[tsm.scala 108:39]
      entry_biu_pe_req_src <= _entry_biu_pe_req_src_T;
    end
  end
  always @(posedge io_entry_clk or posedge _T_2) begin
    if (_T_2) begin // @[tsm.scala 124:55]
      entry_mmu_pe_req <= 1'h0; // @[tsm.scala 125:24]
    end else if (io_entry_pop_vld | io_entry_mmu_pe_req_grnt) begin
      entry_mmu_pe_req <= 1'h0;
    end else begin
      entry_mmu_pe_req <= _GEN_15;
    end
  end
  always @(posedge io_entry_clk or posedge _T_2) begin
    if (_T_2) begin // @[tsm.scala 124:55]
      entry_mmu_pe_req_src <= 2'h0; // @[tsm.scala 126:28]
    end else if (io_entry_pop_vld | io_entry_mmu_pe_req_grnt) begin // @[tsm.scala 127:49]
      entry_mmu_pe_req_src <= 2'h0; // @[tsm.scala 129:28]
    end else if (wire_entry_mmu_pe_req_set) begin // @[tsm.scala 123:39]
      entry_mmu_pe_req_src <= _entry_mmu_pe_req_src_T;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  state = _RAND_0[1:0];
  _RAND_1 = {2{`RANDOM}};
  entry_inst_new_va = _RAND_1[39:0];
  _RAND_2 = {1{`RANDOM}};
  entry_priv_mode = _RAND_2[1:0];
  _RAND_3 = {1{`RANDOM}};
  entry_already_dcache_hit = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  entry_biu_pe_req = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  entry_biu_pe_req_src = _RAND_5[1:0];
  _RAND_6 = {1{`RANDOM}};
  entry_mmu_pe_req = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  entry_mmu_pe_req_src = _RAND_7[1:0];
`endif // RANDOMIZE_REG_INIT
  if (_T_2) begin
    state = 2'h0;
  end
  if (_T_2) begin
    entry_inst_new_va = 40'h0;
  end
  if (_T_2) begin
    entry_priv_mode = 2'h0;
  end
  if (_T_2) begin
    entry_already_dcache_hit = 1'h0;
  end
  if (_T_2) begin
    entry_biu_pe_req = 1'h0;
  end
  if (_T_2) begin
    entry_biu_pe_req_src = 2'h0;
  end
  if (_T_2) begin
    entry_mmu_pe_req = 1'h0;
  end
  if (_T_2) begin
    entry_mmu_pe_req_src = 2'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ct_lsu_pfu_pfb_l1sm_tmp(
  input         io_cp0_lsu_icg_en,
  input         io_cp0_lsu_pfu_mmu_dis,
  input         io_cp0_yy_clk_en,
  input         io_cpurst_b,
  input         io_entry_biu_pe_req,
  input         io_entry_biu_pe_req_grnt,
  input  [1:0]  io_entry_biu_pe_req_src,
  input         io_entry_clk,
  input         io_entry_create_dp_vld,
  input  [39:0] io_entry_inst_new_va,
  input         io_entry_mmu_pe_req,
  input  [1:0]  io_entry_mmu_pe_req_src,
  input         io_entry_pf_inst_vld,
  input         io_entry_pop_vld,
  input         io_entry_reinit_vld,
  input         io_entry_stride_neg,
  input  [39:0] io_entry_strideh,
  input         io_entry_tsm_is_judge,
  input         io_forever_cpuclk,
  input         io_ld_da_page_sec_ff,
  input         io_ld_da_page_share_ff,
  input  [27:0] io_ld_da_ppn_ff,
  input         io_pad_yy_icg_scan_en,
  input         io_pfu_biu_pe_req_sel_l1,
  input         io_pfu_dcache_pref_en,
  input         io_pfu_get_page_sec,
  input         io_pfu_get_page_share,
  input  [27:0] io_pfu_get_ppn,
  input         io_pfu_get_ppn_err,
  input         io_pfu_get_ppn_vld,
  output        io_entry_l1_biu_pe_req_set,
  output        io_entry_l1_cmp_va_vld,
  output        io_entry_l1_mmu_pe_req_set,
  output        io_entry_l1_page_sec,
  output        io_entry_l1_page_share,
  output [39:0] io_entry_l1_pf_addr,
  output [39:0] io_entry_l1_pf_va_sub_inst_new_va,
  output [27:0] io_entry_l1_vpn,
  output        io_entry_l1sm_reinit_req,
  output        io_entry_l1sm_va_can_cmp,
  output [39:0] io_entry_l1_pf_va
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  wire  gated_clk_cell_clk_in; // @[l1sm.scala 40:50]
  wire  gated_clk_cell_global_en; // @[l1sm.scala 40:50]
  wire  gated_clk_cell_module_en; // @[l1sm.scala 40:50]
  wire  gated_clk_cell_local_en; // @[l1sm.scala 40:50]
  wire  gated_clk_cell_external_en; // @[l1sm.scala 40:50]
  wire  gated_clk_cell_pad_yy_icg_scan_en; // @[l1sm.scala 40:50]
  wire  gated_clk_cell_clk_out; // @[l1sm.scala 40:50]
  wire  gated_clk_cell_1_clk_in; // @[l1sm.scala 40:50]
  wire  gated_clk_cell_1_global_en; // @[l1sm.scala 40:50]
  wire  gated_clk_cell_1_module_en; // @[l1sm.scala 40:50]
  wire  gated_clk_cell_1_local_en; // @[l1sm.scala 40:50]
  wire  gated_clk_cell_1_external_en; // @[l1sm.scala 40:50]
  wire  gated_clk_cell_1_pad_yy_icg_scan_en; // @[l1sm.scala 40:50]
  wire  gated_clk_cell_1_clk_out; // @[l1sm.scala 40:50]
  wire  _T_23 = ~io_cpurst_b; // @[l1sm.scala 144:51]
  wire  _T_24 = ~io_cpurst_b; // @[l1sm.scala 144:72]
  reg [2:0] state; // @[l1sm.scala 145:24]
  wire  wire_entry_l1_pf_addr_init_vld = state == 3'h0 & io_entry_tsm_is_judge; // @[l1sm.scala 221:95]
  wire  _wire_entry_l1_pf_va_add_gateclk_en_T_1 = state == 3'h1; // @[l1sm.scala 230:66]
  wire  wire_entry_l1_pf_va_add_gateclk_en = state == 3'h1 | io_entry_biu_pe_req_grnt; // @[l1sm.scala 230:96]
  wire  _wire_entry_l1_pf_ppn_clk_en_T = wire_entry_l1_pf_addr_init_vld & io_pfu_dcache_pref_en; // @[l1sm.scala 38:65]
  wire  wire_entry_l1_pf_ppn_up_vld = state == 3'h6 & io_pfu_get_ppn_vld; // @[l1sm.scala 270:88]
  wire  gated_clk_inst_0_clk_out = gated_clk_cell_clk_out; // @[l1sm.scala 40:{31,31}]
  reg [39:0] entry_l1_pf_va; // @[l1sm.scala 62:29]
  wire [39:0] wire_entry_l1_pf_va_add_strideh = io_entry_l1_pf_va + io_entry_strideh; // @[l1sm.scala 232:77]
  wire  wire_entry_l1_biu_pe_req_grnt = io_pfu_biu_pe_req_sel_l1 & io_entry_biu_pe_req_grnt; // @[l1sm.scala 249:63]
  wire  wire_entry_l1_pf_va_add_vld = _wire_entry_l1_pf_va_add_gateclk_en_T_1 | wire_entry_l1_biu_pe_req_grnt; // @[l1sm.scala 229:89]
  wire  gated_clk_inst_1_clk_out = gated_clk_cell_1_clk_out; // @[l1sm.scala 40:{31,31}]
  reg [27:0] entry_l1_pf_ppn; // @[l1sm.scala 82:30]
  reg  entry_l1_page_sec; // @[l1sm.scala 83:32]
  reg  entry_l1_page_share; // @[l1sm.scala 84:34]
  reg  entry_l1_cmp_va_vld; // @[l1sm.scala 117:38]
  wire  _T_16 = io_entry_create_dp_vld | io_entry_reinit_vld; // @[l1sm.scala 118:40]
  wire  _T_18 = wire_entry_l1_pf_va_add_vld | io_entry_pf_inst_vld & io_entry_l1sm_va_can_cmp; // @[l1sm.scala 120:44]
  wire [12:0] _wire_entry_l1_pf_va_sum_4k_T_1 = {1'h0,io_entry_l1_pf_va[11:0]}; // @[Cat.scala 33:92]
  wire [12:0] wire_entry_l1_pf_va_sum_4k = _wire_entry_l1_pf_va_sum_4k_T_1 + io_entry_strideh[12:0]; // @[l1sm.scala 233:81]
  wire  wire_entry_l1_pf_va_cross_4k = wire_entry_l1_pf_va_sum_4k[12]; // @[l1sm.scala 239:66]
  wire  _T_36 = wire_entry_l1_pf_va_add_vld & wire_entry_l1_pf_va_cross_4k; // @[l1sm.scala 165:44]
  wire [2:0] _GEN_15 = _T_36 ? 3'h5 : 3'h4; // @[l1sm.scala 167:89 168:19 170:19]
  wire [2:0] _GEN_16 = wire_entry_l1_pf_va_add_vld & wire_entry_l1_pf_va_cross_4k & io_cp0_lsu_pfu_mmu_dis ? 3'h7 :
    _GEN_15; // @[l1sm.scala 165:117 166:19]
  wire [2:0] _GEN_17 = io_entry_l1_mmu_pe_req_set ? 3'h6 : 3'h5; // @[l1sm.scala 174:50 175:19 177:19]
  wire [2:0] _GEN_18 = io_pfu_get_ppn_vld & io_pfu_get_ppn_err ? 3'h7 : 3'h6; // @[l1sm.scala 183:71 184:19 186:19]
  wire [2:0] _GEN_19 = io_pfu_get_ppn_vld & ~io_pfu_get_ppn_err ? 3'h4 : _GEN_18; // @[l1sm.scala 181:66 182:19]
  wire [2:0] _GEN_20 = io_entry_reinit_vld ? 3'h0 : 3'h7; // @[l1sm.scala 190:44 191:19 193:19]
  wire [2:0] _GEN_21 = 3'h7 == state ? _GEN_20 : 3'h0; // @[l1sm.scala 151:13 152:20]
  wire [2:0] _GEN_22 = 3'h6 == state ? _GEN_19 : _GEN_21; // @[l1sm.scala 152:20]
  wire [2:0] _GEN_23 = 3'h5 == state ? _GEN_17 : _GEN_22; // @[l1sm.scala 152:20]
  reg  entry_inst_new_va_surpass_l1_pf_va; // @[l1sm.scala 204:53]
  wire  wire_entry_l1_pf_va_eq_inst_new_va = ~(|io_entry_l1_pf_va_sub_inst_new_va); // @[l1sm.scala 284:41]
  wire  wire_entry_inst_new_va_surpass_l1_pf_va_set = (io_entry_stride_neg ^ io_entry_l1_pf_va_sub_inst_new_va[39]) & ~
    wire_entry_l1_pf_va_eq_inst_new_va; // @[l1sm.scala 285:127]
  wire  wire_entry_l1_biu_pe_req = io_entry_biu_pe_req & io_entry_biu_pe_req_src[0]; // @[l1sm.scala 246:56]
  wire  wire_entry_l1_mmu_pe_req = io_entry_mmu_pe_req & io_entry_mmu_pe_req_src[0]; // @[l1sm.scala 257:56]
  gated_clk_cell gated_clk_cell ( // @[l1sm.scala 40:50]
    .clk_in(gated_clk_cell_clk_in),
    .global_en(gated_clk_cell_global_en),
    .module_en(gated_clk_cell_module_en),
    .local_en(gated_clk_cell_local_en),
    .external_en(gated_clk_cell_external_en),
    .pad_yy_icg_scan_en(gated_clk_cell_pad_yy_icg_scan_en),
    .clk_out(gated_clk_cell_clk_out)
  );
  gated_clk_cell gated_clk_cell_1 ( // @[l1sm.scala 40:50]
    .clk_in(gated_clk_cell_1_clk_in),
    .global_en(gated_clk_cell_1_global_en),
    .module_en(gated_clk_cell_1_module_en),
    .local_en(gated_clk_cell_1_local_en),
    .external_en(gated_clk_cell_1_external_en),
    .pad_yy_icg_scan_en(gated_clk_cell_1_pad_yy_icg_scan_en),
    .clk_out(gated_clk_cell_1_clk_out)
  );
  assign io_entry_l1_biu_pe_req_set = state == 3'h4 & ~wire_entry_l1_biu_pe_req; // @[l1sm.scala 213:119]
  assign io_entry_l1_cmp_va_vld = entry_l1_cmp_va_vld; // @[l1sm.scala 125:28]
  assign io_entry_l1_mmu_pe_req_set = state == 3'h5 & ~wire_entry_l1_mmu_pe_req; // @[l1sm.scala 259:86]
  assign io_entry_l1_page_sec = entry_l1_page_sec; // @[l1sm.scala 110:26]
  assign io_entry_l1_page_share = entry_l1_page_share; // @[l1sm.scala 111:28]
  assign io_entry_l1_pf_addr = {entry_l1_pf_ppn,io_entry_l1_pf_va[11:0]}; // @[l1sm.scala 105:62]
  assign io_entry_l1_pf_va_sub_inst_new_va = io_entry_l1_pf_va - io_entry_inst_new_va; // @[l1sm.scala 276:80]
  assign io_entry_l1_vpn = entry_l1_pf_va[39:12]; // @[l1sm.scala 75:38]
  assign io_entry_l1sm_reinit_req = io_entry_l1sm_va_can_cmp & entry_inst_new_va_surpass_l1_pf_va; // @[l1sm.scala 214:59]
  assign io_entry_l1sm_va_can_cmp = state[2]; // @[l1sm.scala 218:52]
  assign io_entry_l1_pf_va = entry_l1_pf_va; // @[l1sm.scala 71:29]
  assign gated_clk_cell_clk_in = io_forever_cpuclk; // @[l1sm.scala 40:31 42:30]
  assign gated_clk_cell_global_en = io_cp0_yy_clk_en; // @[l1sm.scala 40:31 44:33]
  assign gated_clk_cell_module_en = io_cp0_lsu_icg_en; // @[l1sm.scala 40:31 46:33]
  assign gated_clk_cell_local_en = wire_entry_l1_pf_addr_init_vld | wire_entry_l1_pf_va_add_gateclk_en; // @[l1sm.scala 36:64]
  assign gated_clk_cell_external_en = 1'h0; // @[l1sm.scala 40:31 43:35]
  assign gated_clk_cell_pad_yy_icg_scan_en = io_pad_yy_icg_scan_en; // @[l1sm.scala 40:31 47:42]
  assign gated_clk_cell_1_clk_in = io_forever_cpuclk; // @[l1sm.scala 40:31 42:30]
  assign gated_clk_cell_1_global_en = io_cp0_yy_clk_en; // @[l1sm.scala 40:31 44:33]
  assign gated_clk_cell_1_module_en = io_cp0_lsu_icg_en; // @[l1sm.scala 40:31 46:33]
  assign gated_clk_cell_1_local_en = wire_entry_l1_pf_addr_init_vld & io_pfu_dcache_pref_en |
    wire_entry_l1_pf_ppn_up_vld; // @[l1sm.scala 38:90]
  assign gated_clk_cell_1_external_en = 1'h0; // @[l1sm.scala 40:31 43:35]
  assign gated_clk_cell_1_pad_yy_icg_scan_en = io_pad_yy_icg_scan_en; // @[l1sm.scala 40:31 47:42]
  always @(posedge gated_clk_inst_0_clk_out) begin
    if (_T_23) begin // @[l1sm.scala 63:31]
      entry_l1_pf_va <= 40'h0; // @[l1sm.scala 64:22]
    end else if (wire_entry_l1_pf_addr_init_vld) begin // @[l1sm.scala 65:48]
      entry_l1_pf_va <= io_entry_inst_new_va; // @[l1sm.scala 66:22]
    end else if (wire_entry_l1_pf_va_add_vld) begin // @[l1sm.scala 67:45]
      entry_l1_pf_va <= wire_entry_l1_pf_va_add_strideh; // @[l1sm.scala 68:22]
    end
  end
  always @(posedge gated_clk_inst_1_clk_out) begin
    if (_T_23) begin // @[l1sm.scala 86:30]
      entry_l1_pf_ppn <= 28'h0; // @[l1sm.scala 87:38]
    end else if (_wire_entry_l1_pf_ppn_clk_en_T) begin // @[l1sm.scala 90:73]
      entry_l1_pf_ppn <= io_ld_da_ppn_ff; // @[l1sm.scala 92:38]
    end else if (wire_entry_l1_pf_ppn_up_vld) begin // @[l1sm.scala 96:44]
      entry_l1_pf_ppn <= io_pfu_get_ppn; // @[l1sm.scala 98:38]
    end
    if (_T_23) begin // @[l1sm.scala 86:30]
      entry_l1_page_sec <= 1'h0; // @[l1sm.scala 88:38]
    end else if (_wire_entry_l1_pf_ppn_clk_en_T) begin // @[l1sm.scala 90:73]
      entry_l1_page_sec <= io_ld_da_page_sec_ff; // @[l1sm.scala 93:38]
    end else if (wire_entry_l1_pf_ppn_up_vld) begin // @[l1sm.scala 96:44]
      entry_l1_page_sec <= io_pfu_get_page_sec; // @[l1sm.scala 99:38]
    end
    if (_T_23) begin // @[l1sm.scala 86:30]
      entry_l1_page_share <= 1'h0; // @[l1sm.scala 89:38]
    end else if (_wire_entry_l1_pf_ppn_clk_en_T) begin // @[l1sm.scala 90:73]
      entry_l1_page_share <= io_ld_da_page_share_ff; // @[l1sm.scala 94:38]
    end else if (wire_entry_l1_pf_ppn_up_vld) begin // @[l1sm.scala 96:44]
      entry_l1_page_share <= io_pfu_get_page_share; // @[l1sm.scala 100:38]
    end
  end
  always @(posedge io_entry_clk or posedge _T_24) begin
    if (_T_24) begin // @[l1sm.scala 148:77]
      state <= 3'h0; // @[l1sm.scala 149:13]
    end else if (io_entry_pop_vld | io_entry_reinit_vld | ~io_pfu_dcache_pref_en) begin // @[l1sm.scala 152:20]
      state <= 3'h0;
    end else if (3'h0 == state) begin // @[l1sm.scala 152:20]
      state <= {{2'd0}, _wire_entry_l1_pf_ppn_clk_en_T}; // @[l1sm.scala 162:17]
    end else if (3'h1 == state) begin // @[l1sm.scala 152:20]
      state <= 3'h4;
    end else if (3'h4 == state) begin
      state <= _GEN_16;
    end else begin
      state <= _GEN_23;
    end
  end
  always @(posedge io_entry_clk or posedge _T_24) begin
    if (_T_24) begin // @[l1sm.scala 118:70]
      entry_l1_cmp_va_vld <= 1'h0; // @[l1sm.scala 119:27]
    end else if (io_entry_create_dp_vld | io_entry_reinit_vld) begin
      entry_l1_cmp_va_vld <= 1'h0;
    end else begin
      entry_l1_cmp_va_vld <= _T_18;
    end
  end
  always @(posedge io_entry_clk or posedge _T_24) begin
    if (_T_24) begin // @[l1sm.scala 207:71]
      entry_inst_new_va_surpass_l1_pf_va <= 1'h1; // @[l1sm.scala 209:42]
    end else if (_T_16) begin // @[l1sm.scala 210:68]
      entry_inst_new_va_surpass_l1_pf_va <= 1'h0; // @[l1sm.scala 211:42]
    end else if (io_entry_l1_cmp_va_vld & io_entry_l1sm_va_can_cmp) begin // @[l1sm.scala 204:53]
      entry_inst_new_va_surpass_l1_pf_va <= wire_entry_inst_new_va_surpass_l1_pf_va_set;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  state = _RAND_0[2:0];
  _RAND_1 = {2{`RANDOM}};
  entry_l1_pf_va = _RAND_1[39:0];
  _RAND_2 = {1{`RANDOM}};
  entry_l1_pf_ppn = _RAND_2[27:0];
  _RAND_3 = {1{`RANDOM}};
  entry_l1_page_sec = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  entry_l1_page_share = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  entry_l1_cmp_va_vld = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  entry_inst_new_va_surpass_l1_pf_va = _RAND_6[0:0];
`endif // RANDOMIZE_REG_INIT
  if (_T_24) begin
    state = 3'h0;
  end
  if (_T_24) begin
    entry_l1_cmp_va_vld = 1'h0;
  end
  if (_T_24) begin
    entry_inst_new_va_surpass_l1_pf_va = 1'h1;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ct_lsu_pfu_pfb_l2sm_tmp(
  input         io_cp0_lsu_icg_en,
  input         io_cp0_lsu_pfu_mmu_dis,
  input         io_cp0_yy_clk_en,
  input         io_cpurst_b,
  input         io_entry_biu_pe_req,
  input         io_entry_biu_pe_req_grnt,
  input  [1:0]  io_entry_biu_pe_req_src,
  input         io_entry_clk,
  input         io_entry_create_dp_vld,
  input  [39:0] io_entry_inst_new_va,
  input         io_entry_mmu_pe_req,
  input  [1:0]  io_entry_mmu_pe_req_src,
  input         io_entry_pf_inst_vld,
  input         io_entry_pop_vld,
  input         io_entry_reinit_vld,
  input         io_entry_stride_neg,
  input  [39:0] io_entry_strideh,
  input         io_entry_tsm_is_judge,
  input         io_forever_cpuclk,
  input         io_ld_da_page_sec_ff,
  input         io_ld_da_page_share_ff,
  input  [27:0] io_ld_da_ppn_ff,
  input         io_pad_yy_icg_scan_en,
  input         io_pfu_biu_pe_req_sel_l1,
  input         io_pfu_dcache_pref_en,
  input         io_pfu_get_page_sec,
  input         io_pfu_get_page_share,
  input  [27:0] io_pfu_get_ppn,
  input         io_pfu_get_ppn_err,
  input         io_pfu_get_ppn_vld,
  output        io_entry_l1_biu_pe_req_set,
  output        io_entry_l1_cmp_va_vld,
  output        io_entry_l1_mmu_pe_req_set,
  output        io_entry_l1_page_sec,
  output        io_entry_l1_page_share,
  output [39:0] io_entry_l1_pf_addr,
  output [39:0] io_entry_l1_pf_va_sub_inst_new_va,
  output [27:0] io_entry_l1_vpn,
  output        io_entry_l1sm_reinit_req,
  output        io_entry_l1sm_va_can_cmp,
  input  [39:0] io_entry_l1_pf_va_t
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  wire  gated_clk_cell_clk_in; // @[l1sm.scala 40:50]
  wire  gated_clk_cell_global_en; // @[l1sm.scala 40:50]
  wire  gated_clk_cell_module_en; // @[l1sm.scala 40:50]
  wire  gated_clk_cell_local_en; // @[l1sm.scala 40:50]
  wire  gated_clk_cell_external_en; // @[l1sm.scala 40:50]
  wire  gated_clk_cell_pad_yy_icg_scan_en; // @[l1sm.scala 40:50]
  wire  gated_clk_cell_clk_out; // @[l1sm.scala 40:50]
  wire  gated_clk_cell_1_clk_in; // @[l1sm.scala 40:50]
  wire  gated_clk_cell_1_global_en; // @[l1sm.scala 40:50]
  wire  gated_clk_cell_1_module_en; // @[l1sm.scala 40:50]
  wire  gated_clk_cell_1_local_en; // @[l1sm.scala 40:50]
  wire  gated_clk_cell_1_external_en; // @[l1sm.scala 40:50]
  wire  gated_clk_cell_1_pad_yy_icg_scan_en; // @[l1sm.scala 40:50]
  wire  gated_clk_cell_1_clk_out; // @[l1sm.scala 40:50]
  wire  _T_23 = ~io_cpurst_b; // @[l1sm.scala 144:51]
  wire  _T_24 = ~io_cpurst_b; // @[l1sm.scala 144:72]
  reg [2:0] state; // @[l1sm.scala 145:24]
  wire  wire_entry_l1_pf_addr_init_vld = state == 3'h0 & io_entry_tsm_is_judge & io_pfu_dcache_pref_en; // @[l1sm.scala 223:127]
  wire  _wire_entry_l1_pf_va_add_gateclk_en_T_1 = state == 3'h1; // @[l1sm.scala 230:66]
  wire  wire_entry_l1_pf_va_add_gateclk_en = state == 3'h1 | io_entry_biu_pe_req_grnt; // @[l1sm.scala 230:96]
  wire  _wire_entry_l1_pf_ppn_clk_en_T = wire_entry_l1_pf_addr_init_vld & io_pfu_dcache_pref_en; // @[l1sm.scala 38:65]
  wire  wire_entry_l1_pf_ppn_up_vld = state == 3'h6 & io_pfu_get_ppn_vld; // @[l1sm.scala 270:88]
  wire  gated_clk_inst_0_clk_out = gated_clk_cell_clk_out; // @[l1sm.scala 40:{31,31}]
  reg [39:0] entry_l1_pf_va; // @[l1sm.scala 62:29]
  wire [39:0] wire_entry_l1_pf_va_add_strideh = entry_l1_pf_va + io_entry_strideh; // @[l1sm.scala 235:79]
  wire  wire_entry_l1_pf_va_eq_inst_new_va = ~(|io_entry_l1_pf_va_sub_inst_new_va); // @[l1sm.scala 284:41]
  wire  wire_entry_l1_biu_pe_req_grnt = (~io_pfu_biu_pe_req_sel_l1 | wire_entry_l1_pf_va_eq_inst_new_va) &
    io_entry_biu_pe_req_grnt; // @[l1sm.scala 251:104]
  wire  wire_entry_l1_pf_va_add_vld = _wire_entry_l1_pf_va_add_gateclk_en_T_1 | wire_entry_l1_biu_pe_req_grnt; // @[l1sm.scala 229:89]
  wire  gated_clk_inst_1_clk_out = gated_clk_cell_1_clk_out; // @[l1sm.scala 40:{31,31}]
  reg [27:0] entry_l1_pf_ppn; // @[l1sm.scala 82:30]
  reg  entry_l1_page_sec; // @[l1sm.scala 83:32]
  reg  entry_l1_page_share; // @[l1sm.scala 84:34]
  reg  entry_l1_cmp_va_vld; // @[l1sm.scala 117:38]
  wire  _T_16 = io_entry_create_dp_vld | io_entry_reinit_vld; // @[l1sm.scala 118:40]
  wire  _T_18 = wire_entry_l1_pf_va_add_vld | io_entry_pf_inst_vld & io_entry_l1sm_va_can_cmp; // @[l1sm.scala 120:44]
  wire [12:0] _wire_entry_l1_pf_va_sum_4k_T_1 = {1'h0,entry_l1_pf_va[11:0]}; // @[Cat.scala 33:92]
  wire [12:0] wire_entry_l1_pf_va_sum_4k = _wire_entry_l1_pf_va_sum_4k_T_1 + io_entry_strideh[12:0]; // @[l1sm.scala 236:83]
  wire  wire_entry_l1_pf_va_cross_4k = wire_entry_l1_pf_va_sum_4k[12]; // @[l1sm.scala 239:66]
  wire  _T_36 = wire_entry_l1_pf_va_add_vld & wire_entry_l1_pf_va_cross_4k; // @[l1sm.scala 165:44]
  wire [2:0] _GEN_15 = _T_36 ? 3'h5 : 3'h4; // @[l1sm.scala 167:89 168:19 170:19]
  wire [2:0] _GEN_16 = wire_entry_l1_pf_va_add_vld & wire_entry_l1_pf_va_cross_4k & io_cp0_lsu_pfu_mmu_dis ? 3'h7 :
    _GEN_15; // @[l1sm.scala 165:117 166:19]
  wire [2:0] _GEN_17 = io_entry_l1_mmu_pe_req_set ? 3'h6 : 3'h5; // @[l1sm.scala 174:50 175:19 177:19]
  wire [2:0] _GEN_18 = io_pfu_get_ppn_vld & io_pfu_get_ppn_err ? 3'h7 : 3'h6; // @[l1sm.scala 183:71 184:19 186:19]
  wire [2:0] _GEN_19 = io_pfu_get_ppn_vld & ~io_pfu_get_ppn_err ? 3'h4 : _GEN_18; // @[l1sm.scala 181:66 182:19]
  wire [2:0] _GEN_20 = io_entry_reinit_vld ? 3'h0 : 3'h7; // @[l1sm.scala 190:44 191:19 193:19]
  wire [2:0] _GEN_21 = 3'h7 == state ? _GEN_20 : 3'h0; // @[l1sm.scala 151:13 152:20]
  wire [2:0] _GEN_22 = 3'h6 == state ? _GEN_19 : _GEN_21; // @[l1sm.scala 152:20]
  wire [2:0] _GEN_23 = 3'h5 == state ? _GEN_17 : _GEN_22; // @[l1sm.scala 152:20]
  reg  entry_inst_new_va_surpass_l1_pf_va; // @[l1sm.scala 204:53]
  wire  wire_entry_inst_new_va_surpass_l1_pf_va_set = (io_entry_stride_neg ^ io_entry_l1_pf_va_sub_inst_new_va[39]) & ~
    wire_entry_l1_pf_va_eq_inst_new_va; // @[l1sm.scala 285:127]
  wire  wire_entry_l1_biu_pe_req = io_entry_biu_pe_req & io_entry_biu_pe_req_src[1]; // @[l1sm.scala 246:56]
  wire  wire_entry_l1_mmu_pe_req = io_entry_mmu_pe_req & io_entry_mmu_pe_req_src[1]; // @[l1sm.scala 257:56]
  gated_clk_cell gated_clk_cell ( // @[l1sm.scala 40:50]
    .clk_in(gated_clk_cell_clk_in),
    .global_en(gated_clk_cell_global_en),
    .module_en(gated_clk_cell_module_en),
    .local_en(gated_clk_cell_local_en),
    .external_en(gated_clk_cell_external_en),
    .pad_yy_icg_scan_en(gated_clk_cell_pad_yy_icg_scan_en),
    .clk_out(gated_clk_cell_clk_out)
  );
  gated_clk_cell gated_clk_cell_1 ( // @[l1sm.scala 40:50]
    .clk_in(gated_clk_cell_1_clk_in),
    .global_en(gated_clk_cell_1_global_en),
    .module_en(gated_clk_cell_1_module_en),
    .local_en(gated_clk_cell_1_local_en),
    .external_en(gated_clk_cell_1_external_en),
    .pad_yy_icg_scan_en(gated_clk_cell_1_pad_yy_icg_scan_en),
    .clk_out(gated_clk_cell_1_clk_out)
  );
  assign io_entry_l1_biu_pe_req_set = state == 3'h4 & ~wire_entry_l1_biu_pe_req; // @[l1sm.scala 213:119]
  assign io_entry_l1_cmp_va_vld = entry_l1_cmp_va_vld; // @[l1sm.scala 125:28]
  assign io_entry_l1_mmu_pe_req_set = state == 3'h5 & ~wire_entry_l1_mmu_pe_req; // @[l1sm.scala 259:86]
  assign io_entry_l1_page_sec = entry_l1_page_sec; // @[l1sm.scala 110:26]
  assign io_entry_l1_page_share = entry_l1_page_share; // @[l1sm.scala 111:28]
  assign io_entry_l1_pf_addr = {entry_l1_pf_ppn,entry_l1_pf_va[11:0]}; // @[l1sm.scala 107:62]
  assign io_entry_l1_pf_va_sub_inst_new_va = entry_l1_pf_va - io_entry_l1_pf_va_t; // @[l1sm.scala 278:82]
  assign io_entry_l1_vpn = entry_l1_pf_va[39:12]; // @[l1sm.scala 75:38]
  assign io_entry_l1sm_reinit_req = io_entry_l1sm_va_can_cmp & entry_inst_new_va_surpass_l1_pf_va; // @[l1sm.scala 214:59]
  assign io_entry_l1sm_va_can_cmp = state[2]; // @[l1sm.scala 218:52]
  assign gated_clk_cell_clk_in = io_forever_cpuclk; // @[l1sm.scala 40:31 42:30]
  assign gated_clk_cell_global_en = io_cp0_yy_clk_en; // @[l1sm.scala 40:31 44:33]
  assign gated_clk_cell_module_en = io_cp0_lsu_icg_en; // @[l1sm.scala 40:31 46:33]
  assign gated_clk_cell_local_en = wire_entry_l1_pf_addr_init_vld | wire_entry_l1_pf_va_add_gateclk_en; // @[l1sm.scala 36:64]
  assign gated_clk_cell_external_en = 1'h0; // @[l1sm.scala 40:31 43:35]
  assign gated_clk_cell_pad_yy_icg_scan_en = io_pad_yy_icg_scan_en; // @[l1sm.scala 40:31 47:42]
  assign gated_clk_cell_1_clk_in = io_forever_cpuclk; // @[l1sm.scala 40:31 42:30]
  assign gated_clk_cell_1_global_en = io_cp0_yy_clk_en; // @[l1sm.scala 40:31 44:33]
  assign gated_clk_cell_1_module_en = io_cp0_lsu_icg_en; // @[l1sm.scala 40:31 46:33]
  assign gated_clk_cell_1_local_en = wire_entry_l1_pf_addr_init_vld & io_pfu_dcache_pref_en |
    wire_entry_l1_pf_ppn_up_vld; // @[l1sm.scala 38:90]
  assign gated_clk_cell_1_external_en = 1'h0; // @[l1sm.scala 40:31 43:35]
  assign gated_clk_cell_1_pad_yy_icg_scan_en = io_pad_yy_icg_scan_en; // @[l1sm.scala 40:31 47:42]
  always @(posedge gated_clk_inst_0_clk_out) begin
    if (_T_23) begin // @[l1sm.scala 63:31]
      entry_l1_pf_va <= 40'h0; // @[l1sm.scala 64:22]
    end else if (wire_entry_l1_pf_addr_init_vld) begin // @[l1sm.scala 65:48]
      entry_l1_pf_va <= io_entry_inst_new_va; // @[l1sm.scala 66:22]
    end else if (wire_entry_l1_pf_va_add_vld) begin // @[l1sm.scala 67:45]
      entry_l1_pf_va <= wire_entry_l1_pf_va_add_strideh; // @[l1sm.scala 68:22]
    end
  end
  always @(posedge gated_clk_inst_1_clk_out) begin
    if (_T_23) begin // @[l1sm.scala 86:30]
      entry_l1_pf_ppn <= 28'h0; // @[l1sm.scala 87:38]
    end else if (_wire_entry_l1_pf_ppn_clk_en_T) begin // @[l1sm.scala 90:73]
      entry_l1_pf_ppn <= io_ld_da_ppn_ff; // @[l1sm.scala 92:38]
    end else if (wire_entry_l1_pf_ppn_up_vld) begin // @[l1sm.scala 96:44]
      entry_l1_pf_ppn <= io_pfu_get_ppn; // @[l1sm.scala 98:38]
    end
    if (_T_23) begin // @[l1sm.scala 86:30]
      entry_l1_page_sec <= 1'h0; // @[l1sm.scala 88:38]
    end else if (_wire_entry_l1_pf_ppn_clk_en_T) begin // @[l1sm.scala 90:73]
      entry_l1_page_sec <= io_ld_da_page_sec_ff; // @[l1sm.scala 93:38]
    end else if (wire_entry_l1_pf_ppn_up_vld) begin // @[l1sm.scala 96:44]
      entry_l1_page_sec <= io_pfu_get_page_sec; // @[l1sm.scala 99:38]
    end
    if (_T_23) begin // @[l1sm.scala 86:30]
      entry_l1_page_share <= 1'h0; // @[l1sm.scala 89:38]
    end else if (_wire_entry_l1_pf_ppn_clk_en_T) begin // @[l1sm.scala 90:73]
      entry_l1_page_share <= io_ld_da_page_share_ff; // @[l1sm.scala 94:38]
    end else if (wire_entry_l1_pf_ppn_up_vld) begin // @[l1sm.scala 96:44]
      entry_l1_page_share <= io_pfu_get_page_share; // @[l1sm.scala 100:38]
    end
  end
  always @(posedge io_entry_clk or posedge _T_24) begin
    if (_T_24) begin // @[l1sm.scala 148:77]
      state <= 3'h0; // @[l1sm.scala 149:13]
    end else if (io_entry_pop_vld | io_entry_reinit_vld | ~io_pfu_dcache_pref_en) begin // @[l1sm.scala 152:20]
      state <= 3'h0;
    end else if (3'h0 == state) begin // @[l1sm.scala 152:20]
      state <= {{2'd0}, _wire_entry_l1_pf_ppn_clk_en_T}; // @[l1sm.scala 162:17]
    end else if (3'h1 == state) begin // @[l1sm.scala 152:20]
      state <= 3'h4;
    end else if (3'h4 == state) begin
      state <= _GEN_16;
    end else begin
      state <= _GEN_23;
    end
  end
  always @(posedge io_entry_clk or posedge _T_24) begin
    if (_T_24) begin // @[l1sm.scala 118:70]
      entry_l1_cmp_va_vld <= 1'h0; // @[l1sm.scala 119:27]
    end else if (io_entry_create_dp_vld | io_entry_reinit_vld) begin
      entry_l1_cmp_va_vld <= 1'h0;
    end else begin
      entry_l1_cmp_va_vld <= _T_18;
    end
  end
  always @(posedge io_entry_clk or posedge _T_24) begin
    if (_T_24) begin // @[l1sm.scala 207:71]
      entry_inst_new_va_surpass_l1_pf_va <= 1'h1; // @[l1sm.scala 209:42]
    end else if (_T_16) begin // @[l1sm.scala 210:68]
      entry_inst_new_va_surpass_l1_pf_va <= 1'h0; // @[l1sm.scala 211:42]
    end else if (io_entry_l1_cmp_va_vld & io_entry_l1sm_va_can_cmp) begin // @[l1sm.scala 204:53]
      entry_inst_new_va_surpass_l1_pf_va <= wire_entry_inst_new_va_surpass_l1_pf_va_set;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  state = _RAND_0[2:0];
  _RAND_1 = {2{`RANDOM}};
  entry_l1_pf_va = _RAND_1[39:0];
  _RAND_2 = {1{`RANDOM}};
  entry_l1_pf_ppn = _RAND_2[27:0];
  _RAND_3 = {1{`RANDOM}};
  entry_l1_page_sec = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  entry_l1_page_share = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  entry_l1_cmp_va_vld = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  entry_inst_new_va_surpass_l1_pf_va = _RAND_6[0:0];
`endif // RANDOMIZE_REG_INIT
  if (_T_24) begin
    state = 3'h0;
  end
  if (_T_24) begin
    entry_l1_cmp_va_vld = 1'h0;
  end
  if (_T_24) begin
    entry_inst_new_va_surpass_l1_pf_va = 1'h1;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module my_pfb(
  input         io_amr_wa_cancel,
  input         io_cp0_lsu_icg_en,
  input         io_cp0_lsu_l2_st_pref_en,
  input         io_cp0_lsu_pfu_mmu_dis,
  input         io_cp0_yy_clk_en,
  input  [1:0]  io_cp0_yy_priv_mode,
  input         io_cpurst_b,
  input  [14:0] io_ld_da_ldfifo_pc,
  input         io_ld_da_page_sec_ff,
  input         io_ld_da_page_share_ff,
  input         io_ld_da_pfu_act_dp_vld,
  input         io_ld_da_pfu_act_vld,
  input         io_ld_da_pfu_evict_cnt_vld,
  input         io_ld_da_pfu_pf_inst_vld,
  input  [39:0] io_ld_da_ppfu_va,
  input  [27:0] io_ld_da_ppn_ff,
  input  [3:0]  io_lsu_pfu_l1_dist_sel,
  input  [3:0]  io_lsu_pfu_l2_dist_sel,
  input         io_lsu_special_clk,
  input         io_pad_yy_icg_scan_en,
  input  [5:0]  io_pfb_no_req_cnt_val,
  input  [7:0]  io_pfb_timeout_cnt_val,
  input         io_pfu_biu_pe_req_sel_l1,
  input         io_pfu_dcache_pref_en,
  input         io_pfu_get_page_sec,
  input         io_pfu_get_page_share,
  input  [27:0] io_pfu_get_ppn,
  input         io_pfu_get_ppn_err,
  input         io_pfu_get_ppn_vld,
  input         io_pfu_l2_pref_en,
  input         io_pfu_mmu_pe_req_sel_l1,
  input  [14:0] io_pfu_pfb_create_pc,
  input  [10:0] io_pfu_pfb_create_stride,
  input         io_pfu_pfb_create_stride_neg,
  input  [6:0]  io_pfu_pfb_create_strideh_6to0,
  input         io_pfu_pfb_create_type_ld,
  input         io_pfu_pfb_entry_biu_pe_req_grnt_x,
  input         io_pfu_pfb_entry_create_dp_vld_x,
  input         io_pfu_pfb_entry_create_gateclk_en_x,
  input         io_pfu_pfb_entry_create_vld_x,
  input         io_pfu_pfb_entry_from_lfb_dcache_hit_x,
  input         io_pfu_pfb_entry_from_lfb_dcache_miss_x,
  input         io_pfu_pfb_entry_mmu_pe_req_grnt_x,
  input         io_pfu_pop_all_part_vld,
  input         io_st_da_page_sec_ff,
  input         io_st_da_page_share_ff,
  input  [14:0] io_st_da_pc,
  input         io_st_da_pfu_act_vld,
  input         io_st_da_pfu_evict_cnt_vld,
  input         io_st_da_pfu_pf_inst_vld,
  input  [39:0] io_st_da_ppfu_va,
  input  [27:0] io_st_da_ppn_ff,
  output [1:0]  io_pfu_pfb_entry_biu_pe_req_src_v,
  output        io_pfu_pfb_entry_biu_pe_req_x,
  output        io_pfu_pfb_entry_evict_x,
  output        io_pfu_pfb_entry_hit_pc_x,
  output        io_pfu_pfb_entry_l1_page_sec_x,
  output        io_pfu_pfb_entry_l1_page_share_x,
  output [39:0] io_pfu_pfb_entry_l1_pf_addr_v,
  output [27:0] io_pfu_pfb_entry_l1_vpn_v,
  output        io_pfu_pfb_entry_l2_page_sec_x,
  output        io_pfu_pfb_entry_l2_page_share_x,
  output [39:0] io_pfu_pfb_entry_l2_pf_addr_v,
  output [27:0] io_pfu_pfb_entry_l2_vpn_v,
  output [1:0]  io_pfu_pfb_entry_mmu_pe_req_src_v,
  output        io_pfu_pfb_entry_mmu_pe_req_x,
  output [1:0]  io_pfu_pfb_entry_priv_mode_v,
  output        io_pfu_pfb_entry_vld_x
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
`endif // RANDOMIZE_REG_INIT
  wire  gated_clk_cell_clk_in; // @[pfb_entry.scala 27:50]
  wire  gated_clk_cell_global_en; // @[pfb_entry.scala 27:50]
  wire  gated_clk_cell_module_en; // @[pfb_entry.scala 27:50]
  wire  gated_clk_cell_local_en; // @[pfb_entry.scala 27:50]
  wire  gated_clk_cell_external_en; // @[pfb_entry.scala 27:50]
  wire  gated_clk_cell_pad_yy_icg_scan_en; // @[pfb_entry.scala 27:50]
  wire  gated_clk_cell_clk_out; // @[pfb_entry.scala 27:50]
  wire  gated_clk_cell_1_clk_in; // @[pfb_entry.scala 27:50]
  wire  gated_clk_cell_1_global_en; // @[pfb_entry.scala 27:50]
  wire  gated_clk_cell_1_module_en; // @[pfb_entry.scala 27:50]
  wire  gated_clk_cell_1_local_en; // @[pfb_entry.scala 27:50]
  wire  gated_clk_cell_1_external_en; // @[pfb_entry.scala 27:50]
  wire  gated_clk_cell_1_pad_yy_icg_scan_en; // @[pfb_entry.scala 27:50]
  wire  gated_clk_cell_1_clk_out; // @[pfb_entry.scala 27:50]
  wire  gated_clk_cell_2_clk_in; // @[pfb_entry.scala 27:50]
  wire  gated_clk_cell_2_global_en; // @[pfb_entry.scala 27:50]
  wire  gated_clk_cell_2_module_en; // @[pfb_entry.scala 27:50]
  wire  gated_clk_cell_2_local_en; // @[pfb_entry.scala 27:50]
  wire  gated_clk_cell_2_external_en; // @[pfb_entry.scala 27:50]
  wire  gated_clk_cell_2_pad_yy_icg_scan_en; // @[pfb_entry.scala 27:50]
  wire  gated_clk_cell_2_clk_out; // @[pfb_entry.scala 27:50]
  wire  ct_lsu_pfu_pfb_tsm_tmp_io_cp0_lsu_icg_en; // @[pfb_entry.scala 200:27]
  wire  ct_lsu_pfu_pfb_tsm_tmp_io_cp0_yy_clk_en; // @[pfb_entry.scala 200:27]
  wire [1:0] ct_lsu_pfu_pfb_tsm_tmp_io_cp0_yy_priv_mode; // @[pfb_entry.scala 200:27]
  wire  ct_lsu_pfu_pfb_tsm_tmp_io_cpurst_b; // @[pfb_entry.scala 200:27]
  wire  ct_lsu_pfu_pfb_tsm_tmp_io_entry_act_vld; // @[pfb_entry.scala 200:27]
  wire  ct_lsu_pfu_pfb_tsm_tmp_io_entry_biu_pe_req_grnt; // @[pfb_entry.scala 200:27]
  wire  ct_lsu_pfu_pfb_tsm_tmp_io_entry_clk; // @[pfb_entry.scala 200:27]
  wire  ct_lsu_pfu_pfb_tsm_tmp_io_entry_create_dp_vld; // @[pfb_entry.scala 200:27]
  wire  ct_lsu_pfu_pfb_tsm_tmp_io_entry_create_vld; // @[pfb_entry.scala 200:27]
  wire  ct_lsu_pfu_pfb_tsm_tmp_io_entry_from_lfb_dcache_hit; // @[pfb_entry.scala 200:27]
  wire  ct_lsu_pfu_pfb_tsm_tmp_io_entry_from_lfb_dcache_miss; // @[pfb_entry.scala 200:27]
  wire  ct_lsu_pfu_pfb_tsm_tmp_io_entry_l1_biu_pe_req_set; // @[pfb_entry.scala 200:27]
  wire  ct_lsu_pfu_pfb_tsm_tmp_io_entry_l1_mmu_pe_req_set; // @[pfb_entry.scala 200:27]
  wire  ct_lsu_pfu_pfb_tsm_tmp_io_entry_l2_biu_pe_req_set; // @[pfb_entry.scala 200:27]
  wire  ct_lsu_pfu_pfb_tsm_tmp_io_entry_l2_mmu_pe_req_set; // @[pfb_entry.scala 200:27]
  wire  ct_lsu_pfu_pfb_tsm_tmp_io_entry_mmu_pe_req_grnt; // @[pfb_entry.scala 200:27]
  wire  ct_lsu_pfu_pfb_tsm_tmp_io_entry_pf_inst_vld; // @[pfb_entry.scala 200:27]
  wire  ct_lsu_pfu_pfb_tsm_tmp_io_entry_pop_vld; // @[pfb_entry.scala 200:27]
  wire  ct_lsu_pfu_pfb_tsm_tmp_io_entry_reinit_vld; // @[pfb_entry.scala 200:27]
  wire [10:0] ct_lsu_pfu_pfb_tsm_tmp_io_entry_stride; // @[pfb_entry.scala 200:27]
  wire  ct_lsu_pfu_pfb_tsm_tmp_io_entry_stride_neg; // @[pfb_entry.scala 200:27]
  wire  ct_lsu_pfu_pfb_tsm_tmp_io_forever_cpuclk; // @[pfb_entry.scala 200:27]
  wire  ct_lsu_pfu_pfb_tsm_tmp_io_pad_yy_icg_scan_en; // @[pfb_entry.scala 200:27]
  wire [39:0] ct_lsu_pfu_pfb_tsm_tmp_io_pipe_va; // @[pfb_entry.scala 200:27]
  wire  ct_lsu_pfu_pfb_tsm_tmp_io_entry_biu_pe_req; // @[pfb_entry.scala 200:27]
  wire [1:0] ct_lsu_pfu_pfb_tsm_tmp_io_entry_biu_pe_req_src; // @[pfb_entry.scala 200:27]
  wire  ct_lsu_pfu_pfb_tsm_tmp_io_entry_dcache_hit_pop_req; // @[pfb_entry.scala 200:27]
  wire [39:0] ct_lsu_pfu_pfb_tsm_tmp_io_entry_inst_new_va; // @[pfb_entry.scala 200:27]
  wire  ct_lsu_pfu_pfb_tsm_tmp_io_entry_mmu_pe_req; // @[pfb_entry.scala 200:27]
  wire [1:0] ct_lsu_pfu_pfb_tsm_tmp_io_entry_mmu_pe_req_src; // @[pfb_entry.scala 200:27]
  wire [1:0] ct_lsu_pfu_pfb_tsm_tmp_io_entry_priv_mode; // @[pfb_entry.scala 200:27]
  wire  ct_lsu_pfu_pfb_tsm_tmp_io_entry_tsm_is_judge; // @[pfb_entry.scala 200:27]
  wire  ct_lsu_pfu_pfb_tsm_tmp_io_entry_vld; // @[pfb_entry.scala 200:27]
  wire  ct_lsu_pfu_pfb_l1sm_tmp_io_cp0_lsu_icg_en; // @[pfb_entry.scala 242:32]
  wire  ct_lsu_pfu_pfb_l1sm_tmp_io_cp0_lsu_pfu_mmu_dis; // @[pfb_entry.scala 242:32]
  wire  ct_lsu_pfu_pfb_l1sm_tmp_io_cp0_yy_clk_en; // @[pfb_entry.scala 242:32]
  wire  ct_lsu_pfu_pfb_l1sm_tmp_io_cpurst_b; // @[pfb_entry.scala 242:32]
  wire  ct_lsu_pfu_pfb_l1sm_tmp_io_entry_biu_pe_req; // @[pfb_entry.scala 242:32]
  wire  ct_lsu_pfu_pfb_l1sm_tmp_io_entry_biu_pe_req_grnt; // @[pfb_entry.scala 242:32]
  wire [1:0] ct_lsu_pfu_pfb_l1sm_tmp_io_entry_biu_pe_req_src; // @[pfb_entry.scala 242:32]
  wire  ct_lsu_pfu_pfb_l1sm_tmp_io_entry_clk; // @[pfb_entry.scala 242:32]
  wire  ct_lsu_pfu_pfb_l1sm_tmp_io_entry_create_dp_vld; // @[pfb_entry.scala 242:32]
  wire [39:0] ct_lsu_pfu_pfb_l1sm_tmp_io_entry_inst_new_va; // @[pfb_entry.scala 242:32]
  wire  ct_lsu_pfu_pfb_l1sm_tmp_io_entry_mmu_pe_req; // @[pfb_entry.scala 242:32]
  wire [1:0] ct_lsu_pfu_pfb_l1sm_tmp_io_entry_mmu_pe_req_src; // @[pfb_entry.scala 242:32]
  wire  ct_lsu_pfu_pfb_l1sm_tmp_io_entry_pf_inst_vld; // @[pfb_entry.scala 242:32]
  wire  ct_lsu_pfu_pfb_l1sm_tmp_io_entry_pop_vld; // @[pfb_entry.scala 242:32]
  wire  ct_lsu_pfu_pfb_l1sm_tmp_io_entry_reinit_vld; // @[pfb_entry.scala 242:32]
  wire  ct_lsu_pfu_pfb_l1sm_tmp_io_entry_stride_neg; // @[pfb_entry.scala 242:32]
  wire [39:0] ct_lsu_pfu_pfb_l1sm_tmp_io_entry_strideh; // @[pfb_entry.scala 242:32]
  wire  ct_lsu_pfu_pfb_l1sm_tmp_io_entry_tsm_is_judge; // @[pfb_entry.scala 242:32]
  wire  ct_lsu_pfu_pfb_l1sm_tmp_io_forever_cpuclk; // @[pfb_entry.scala 242:32]
  wire  ct_lsu_pfu_pfb_l1sm_tmp_io_ld_da_page_sec_ff; // @[pfb_entry.scala 242:32]
  wire  ct_lsu_pfu_pfb_l1sm_tmp_io_ld_da_page_share_ff; // @[pfb_entry.scala 242:32]
  wire [27:0] ct_lsu_pfu_pfb_l1sm_tmp_io_ld_da_ppn_ff; // @[pfb_entry.scala 242:32]
  wire  ct_lsu_pfu_pfb_l1sm_tmp_io_pad_yy_icg_scan_en; // @[pfb_entry.scala 242:32]
  wire  ct_lsu_pfu_pfb_l1sm_tmp_io_pfu_biu_pe_req_sel_l1; // @[pfb_entry.scala 242:32]
  wire  ct_lsu_pfu_pfb_l1sm_tmp_io_pfu_dcache_pref_en; // @[pfb_entry.scala 242:32]
  wire  ct_lsu_pfu_pfb_l1sm_tmp_io_pfu_get_page_sec; // @[pfb_entry.scala 242:32]
  wire  ct_lsu_pfu_pfb_l1sm_tmp_io_pfu_get_page_share; // @[pfb_entry.scala 242:32]
  wire [27:0] ct_lsu_pfu_pfb_l1sm_tmp_io_pfu_get_ppn; // @[pfb_entry.scala 242:32]
  wire  ct_lsu_pfu_pfb_l1sm_tmp_io_pfu_get_ppn_err; // @[pfb_entry.scala 242:32]
  wire  ct_lsu_pfu_pfb_l1sm_tmp_io_pfu_get_ppn_vld; // @[pfb_entry.scala 242:32]
  wire  ct_lsu_pfu_pfb_l1sm_tmp_io_entry_l1_biu_pe_req_set; // @[pfb_entry.scala 242:32]
  wire  ct_lsu_pfu_pfb_l1sm_tmp_io_entry_l1_cmp_va_vld; // @[pfb_entry.scala 242:32]
  wire  ct_lsu_pfu_pfb_l1sm_tmp_io_entry_l1_mmu_pe_req_set; // @[pfb_entry.scala 242:32]
  wire  ct_lsu_pfu_pfb_l1sm_tmp_io_entry_l1_page_sec; // @[pfb_entry.scala 242:32]
  wire  ct_lsu_pfu_pfb_l1sm_tmp_io_entry_l1_page_share; // @[pfb_entry.scala 242:32]
  wire [39:0] ct_lsu_pfu_pfb_l1sm_tmp_io_entry_l1_pf_addr; // @[pfb_entry.scala 242:32]
  wire [39:0] ct_lsu_pfu_pfb_l1sm_tmp_io_entry_l1_pf_va_sub_inst_new_va; // @[pfb_entry.scala 242:32]
  wire [27:0] ct_lsu_pfu_pfb_l1sm_tmp_io_entry_l1_vpn; // @[pfb_entry.scala 242:32]
  wire  ct_lsu_pfu_pfb_l1sm_tmp_io_entry_l1sm_reinit_req; // @[pfb_entry.scala 242:32]
  wire  ct_lsu_pfu_pfb_l1sm_tmp_io_entry_l1sm_va_can_cmp; // @[pfb_entry.scala 242:32]
  wire [39:0] ct_lsu_pfu_pfb_l1sm_tmp_io_entry_l1_pf_va; // @[pfb_entry.scala 242:32]
  wire  ct_lsu_pfu_pfb_l2sm_tmp_io_cp0_lsu_icg_en; // @[pfb_entry.scala 242:66]
  wire  ct_lsu_pfu_pfb_l2sm_tmp_io_cp0_lsu_pfu_mmu_dis; // @[pfb_entry.scala 242:66]
  wire  ct_lsu_pfu_pfb_l2sm_tmp_io_cp0_yy_clk_en; // @[pfb_entry.scala 242:66]
  wire  ct_lsu_pfu_pfb_l2sm_tmp_io_cpurst_b; // @[pfb_entry.scala 242:66]
  wire  ct_lsu_pfu_pfb_l2sm_tmp_io_entry_biu_pe_req; // @[pfb_entry.scala 242:66]
  wire  ct_lsu_pfu_pfb_l2sm_tmp_io_entry_biu_pe_req_grnt; // @[pfb_entry.scala 242:66]
  wire [1:0] ct_lsu_pfu_pfb_l2sm_tmp_io_entry_biu_pe_req_src; // @[pfb_entry.scala 242:66]
  wire  ct_lsu_pfu_pfb_l2sm_tmp_io_entry_clk; // @[pfb_entry.scala 242:66]
  wire  ct_lsu_pfu_pfb_l2sm_tmp_io_entry_create_dp_vld; // @[pfb_entry.scala 242:66]
  wire [39:0] ct_lsu_pfu_pfb_l2sm_tmp_io_entry_inst_new_va; // @[pfb_entry.scala 242:66]
  wire  ct_lsu_pfu_pfb_l2sm_tmp_io_entry_mmu_pe_req; // @[pfb_entry.scala 242:66]
  wire [1:0] ct_lsu_pfu_pfb_l2sm_tmp_io_entry_mmu_pe_req_src; // @[pfb_entry.scala 242:66]
  wire  ct_lsu_pfu_pfb_l2sm_tmp_io_entry_pf_inst_vld; // @[pfb_entry.scala 242:66]
  wire  ct_lsu_pfu_pfb_l2sm_tmp_io_entry_pop_vld; // @[pfb_entry.scala 242:66]
  wire  ct_lsu_pfu_pfb_l2sm_tmp_io_entry_reinit_vld; // @[pfb_entry.scala 242:66]
  wire  ct_lsu_pfu_pfb_l2sm_tmp_io_entry_stride_neg; // @[pfb_entry.scala 242:66]
  wire [39:0] ct_lsu_pfu_pfb_l2sm_tmp_io_entry_strideh; // @[pfb_entry.scala 242:66]
  wire  ct_lsu_pfu_pfb_l2sm_tmp_io_entry_tsm_is_judge; // @[pfb_entry.scala 242:66]
  wire  ct_lsu_pfu_pfb_l2sm_tmp_io_forever_cpuclk; // @[pfb_entry.scala 242:66]
  wire  ct_lsu_pfu_pfb_l2sm_tmp_io_ld_da_page_sec_ff; // @[pfb_entry.scala 242:66]
  wire  ct_lsu_pfu_pfb_l2sm_tmp_io_ld_da_page_share_ff; // @[pfb_entry.scala 242:66]
  wire [27:0] ct_lsu_pfu_pfb_l2sm_tmp_io_ld_da_ppn_ff; // @[pfb_entry.scala 242:66]
  wire  ct_lsu_pfu_pfb_l2sm_tmp_io_pad_yy_icg_scan_en; // @[pfb_entry.scala 242:66]
  wire  ct_lsu_pfu_pfb_l2sm_tmp_io_pfu_biu_pe_req_sel_l1; // @[pfb_entry.scala 242:66]
  wire  ct_lsu_pfu_pfb_l2sm_tmp_io_pfu_dcache_pref_en; // @[pfb_entry.scala 242:66]
  wire  ct_lsu_pfu_pfb_l2sm_tmp_io_pfu_get_page_sec; // @[pfb_entry.scala 242:66]
  wire  ct_lsu_pfu_pfb_l2sm_tmp_io_pfu_get_page_share; // @[pfb_entry.scala 242:66]
  wire [27:0] ct_lsu_pfu_pfb_l2sm_tmp_io_pfu_get_ppn; // @[pfb_entry.scala 242:66]
  wire  ct_lsu_pfu_pfb_l2sm_tmp_io_pfu_get_ppn_err; // @[pfb_entry.scala 242:66]
  wire  ct_lsu_pfu_pfb_l2sm_tmp_io_pfu_get_ppn_vld; // @[pfb_entry.scala 242:66]
  wire  ct_lsu_pfu_pfb_l2sm_tmp_io_entry_l1_biu_pe_req_set; // @[pfb_entry.scala 242:66]
  wire  ct_lsu_pfu_pfb_l2sm_tmp_io_entry_l1_cmp_va_vld; // @[pfb_entry.scala 242:66]
  wire  ct_lsu_pfu_pfb_l2sm_tmp_io_entry_l1_mmu_pe_req_set; // @[pfb_entry.scala 242:66]
  wire  ct_lsu_pfu_pfb_l2sm_tmp_io_entry_l1_page_sec; // @[pfb_entry.scala 242:66]
  wire  ct_lsu_pfu_pfb_l2sm_tmp_io_entry_l1_page_share; // @[pfb_entry.scala 242:66]
  wire [39:0] ct_lsu_pfu_pfb_l2sm_tmp_io_entry_l1_pf_addr; // @[pfb_entry.scala 242:66]
  wire [39:0] ct_lsu_pfu_pfb_l2sm_tmp_io_entry_l1_pf_va_sub_inst_new_va; // @[pfb_entry.scala 242:66]
  wire [27:0] ct_lsu_pfu_pfb_l2sm_tmp_io_entry_l1_vpn; // @[pfb_entry.scala 242:66]
  wire  ct_lsu_pfu_pfb_l2sm_tmp_io_entry_l1sm_reinit_req; // @[pfb_entry.scala 242:66]
  wire  ct_lsu_pfu_pfb_l2sm_tmp_io_entry_l1sm_va_can_cmp; // @[pfb_entry.scala 242:66]
  wire [39:0] ct_lsu_pfu_pfb_l2sm_tmp_io_entry_l1_pf_va_t; // @[pfb_entry.scala 242:66]
  wire  wire_pfu_pfb_entry_vld = ct_lsu_pfu_pfb_tsm_tmp_io_entry_vld; // @[pfb_entry.scala 16:18 230:26]
  wire  _wire_pfu_pfb_entry_all_pf_inst_clk_en_T_1 = wire_pfu_pfb_entry_vld & (io_ld_da_pfu_pf_inst_vld |
    io_st_da_pfu_pf_inst_vld); // @[pfb_entry.scala 24:5]
  wire  wire_pfu_pfb_entry_biu_pe_req = ct_lsu_pfu_pfb_tsm_tmp_io_entry_biu_pe_req; // @[pfb_entry.scala 16:18 206:33]
  wire  _wire_pfu_pfb_entry_all_pf_inst_clk_en_T_2 = _wire_pfu_pfb_entry_all_pf_inst_clk_en_T_1 |
    wire_pfu_pfb_entry_biu_pe_req; // @[pfb_entry.scala 25:5]
  wire  _T_1 = ~io_cpurst_b; // @[pfb_entry.scala 51:60]
  reg [14:0] pc; // @[pfb_entry.scala 52:21]
  reg [10:0] stride; // @[pfb_entry.scala 53:25]
  reg [6:0] strideh_6to0; // @[pfb_entry.scala 54:31]
  reg  stride_neg; // @[pfb_entry.scala 55:29]
  reg  type_ld; // @[pfb_entry.scala 56:26]
  reg [7:0] timeoutCnt; // @[pfb_entry.scala 85:29]
  wire [14:0] wire_pipe_cmp_pc = type_ld ? io_ld_da_ldfifo_pc : io_st_da_pc; // @[pfb_entry.scala 151:26]
  wire  _wire_pfu_pfb_entry_hit_pc_T_2 = wire_pipe_cmp_pc == pc; // @[pfb_entry.scala 181:5]
  wire  wire_pfu_pfb_entry_hit_pc = wire_pfu_pfb_entry_vld & _wire_pfu_pfb_entry_hit_pc_T_2; // @[pfb_entry.scala 180:5]
  wire  wire_pipe_cmp_inst_vld = type_ld ? io_ld_da_pfu_pf_inst_vld : io_st_da_pfu_pf_inst_vld; // @[pfb_entry.scala 148:32]
  wire  wire_pfu_pfb_entry_pf_inst_vld = wire_pfu_pfb_entry_hit_pc & wire_pipe_cmp_inst_vld; // @[pfb_entry.scala 183:5]
  wire  wire_pfu_pfb_entry_timeout_cnt_full = timeoutCnt == io_pfb_timeout_cnt_val; // @[pfb_entry.scala 359:91]
  wire  _T_7 = ~wire_pfu_pfb_entry_timeout_cnt_full; // @[pfb_entry.scala 91:43]
  wire  wire_pipe_evict_cnt_vld = io_ld_da_pfu_evict_cnt_vld | io_st_da_pfu_evict_cnt_vld; // @[pfb_entry.scala 154:57]
  wire [7:0] _timeoutCnt_T_1 = timeoutCnt + 8'h1; // @[pfb_entry.scala 92:32]
  reg [5:0] noReqCnt; // @[pfb_entry.scala 101:27]
  wire  wire_pfu_pfb_entry_no_req_cnt_full = noReqCnt == io_pfb_no_req_cnt_val; // @[pfb_entry.scala 194:5]
  wire  _T_13 = ~wire_pfu_pfb_entry_no_req_cnt_full; // @[pfb_entry.scala 107:50]
  wire [5:0] _noReqCnt_T_1 = noReqCnt + 6'h1; // @[pfb_entry.scala 108:28]
  reg  evict; // @[pfb_entry.scala 118:24]
  wire  wire_pfu_pfb_entry_evict_clr = _T_7 & _T_13; // @[pfb_entry.scala 366:5]
  wire  _wire_pfu_pfb_entry_evict_set_T = wire_pfu_pfb_entry_timeout_cnt_full | wire_pfu_pfb_entry_no_req_cnt_full; // @[pfb_entry.scala 363:5]
  wire  wire_pfu_pfb_entry_evict_set = wire_pfu_pfb_entry_vld & _wire_pfu_pfb_entry_evict_set_T; // @[pfb_entry.scala 362:5]
  wire  _GEN_16 = wire_pfu_pfb_entry_evict_set | evict; // @[pfb_entry.scala 123:46 124:13 118:24]
  reg [2:0] confidence; // @[pfb_entry.scala 132:29]
  wire  wire_pfu_pfb_entry_tsm_is_judge = ct_lsu_pfu_pfb_tsm_tmp_io_entry_tsm_is_judge; // @[pfb_entry.scala 16:18 229:35]
  wire  wire_pfu_pfb_entry_confidence_high = &confidence; // @[pfb_entry.scala 336:76]
  wire [39:0] wire_pipe_ppfu_va = type_ld ? io_ld_da_ppfu_va : io_st_da_ppfu_va; // @[pfb_entry.scala 158:27]
  wire [39:0] wire_pfu_pfb_entry_inst_new_va = ct_lsu_pfu_pfb_tsm_tmp_io_entry_inst_new_va; // @[pfb_entry.scala 16:18 215:34]
  wire  wire_pfu_pfb_entry_inst_new_va_hit_pipe = wire_pipe_ppfu_va == wire_pfu_pfb_entry_inst_new_va; // @[pfb_entry.scala 334:5]
  wire  _wire_pfu_pfb_entry_confidence_set_T = wire_pfu_pfb_entry_confidence_high &
    wire_pfu_pfb_entry_inst_new_va_hit_pipe; // @[pfb_entry.scala 341:5]
  wire  _wire_pfu_pfb_entry_confidence_set_T_2 = wire_pfu_pfb_entry_tsm_is_judge & ~_wire_pfu_pfb_entry_confidence_set_T
    ; // @[pfb_entry.scala 340:5]
  wire  wire_pfu_pfb_entry_confidence_low = ~(|confidence); // @[pfb_entry.scala 337:40]
  wire  _wire_pfu_pfb_entry_confidence_set_T_3 = ~wire_pfu_pfb_entry_inst_new_va_hit_pipe; // @[pfb_entry.scala 343:8]
  wire  _wire_pfu_pfb_entry_confidence_set_T_4 = wire_pfu_pfb_entry_confidence_low & ~
    wire_pfu_pfb_entry_inst_new_va_hit_pipe; // @[pfb_entry.scala 343:5]
  wire  _wire_pfu_pfb_entry_confidence_set_T_6 = _wire_pfu_pfb_entry_confidence_set_T_2 & ~
    _wire_pfu_pfb_entry_confidence_set_T_4; // @[pfb_entry.scala 342:5]
  wire  wire_pfu_pfb_entry_confidence_set = _wire_pfu_pfb_entry_confidence_set_T_6 & wire_pfu_pfb_entry_pf_inst_vld; // @[pfb_entry.scala 344:5]
  wire [2:0] wire_pfu_pfb_entry_confidence_add1 = confidence + 3'h1; // @[pfb_entry.scala 346:76]
  wire [2:0] wire_pfu_pfb_entry_confidence_sub1 = confidence - 3'h1; // @[pfb_entry.scala 347:76]
  wire [2:0] wire_pfu_pfb_entry_confidence_next = wire_pfu_pfb_entry_inst_new_va_hit_pipe ?
    wire_pfu_pfb_entry_confidence_add1 : wire_pfu_pfb_entry_confidence_sub1; // @[pfb_entry.scala 351:44]
  wire  wire_pipe_act_vld = type_ld ? io_ld_da_pfu_act_vld : io_st_da_pfu_act_vld; // @[pfb_entry.scala 156:27]
  wire  _wire_l1_pref_en_T = io_pfu_dcache_pref_en & wire_pfu_pfb_entry_vld; // @[pfb_entry.scala 174:5]
  wire [28:0] _wire_pfu_pfb_entry_strideh_T_1 = stride_neg ? 29'h1fffffff : 29'h0; // @[Bitwise.scala 77:12]
  wire [32:0] wire_pfu_pfb_entry_strideh_hi = {_wire_pfu_pfb_entry_strideh_T_1,stride[10:7]}; // @[Cat.scala 33:92]
  wire  wire_pfu_pfb_entry_confidence_zero = confidence == 3'h0; // @[pfb_entry.scala 355:5]
  wire  wire_pfu_pfb_entry_l1sm_reinit_req = ct_lsu_pfu_pfb_l1sm_tmp_io_entry_l1sm_reinit_req; // @[pfb_entry.scala 16:18 280:42]
  wire  wire_pfu_pfb_entry_l2sm_reinit_req = ct_lsu_pfu_pfb_l2sm_tmp_io_entry_l1sm_reinit_req; // @[pfb_entry.scala 16:18 297:42]
  wire  _wire_pfu_pfb_entry_reinit_vld_T = wire_pfu_pfb_entry_l1sm_reinit_req | wire_pfu_pfb_entry_l2sm_reinit_req; // @[pfb_entry.scala 371:5]
  wire  _wire_pfu_pfb_entry_reinit_vld_T_1 = _wire_pfu_pfb_entry_reinit_vld_T | io_pfu_pfb_entry_create_vld_x; // @[pfb_entry.scala 372:5]
  wire  _wire_pfu_pfb_entry_reinit_vld_T_2 = wire_pfu_pfb_entry_tsm_is_judge & wire_pfu_pfb_entry_pf_inst_vld; // @[pfb_entry.scala 374:5]
  wire  _wire_pfu_pfb_entry_reinit_vld_T_4 = _wire_pfu_pfb_entry_reinit_vld_T_2 & _wire_pfu_pfb_entry_confidence_set_T_3
    ; // @[pfb_entry.scala 375:5]
  wire  _wire_pfu_pop_st_all_T_1 = wire_pfu_pfb_entry_vld & ~type_ld; // @[pfb_entry.scala 378:5]
  wire  wire_pfu_pop_st_all = _wire_pfu_pop_st_all_T_1 & (~io_cp0_lsu_l2_st_pref_en | io_amr_wa_cancel); // @[pfb_entry.scala 379:5]
  wire  _wire_pfu_pfb_entry_pop_vld_T = io_pfu_pop_all_part_vld | wire_pfu_pop_st_all; // @[pfb_entry.scala 382:5]
  wire  wire_pfu_pfb_entry_dcache_hit_pop_req = ct_lsu_pfu_pfb_tsm_tmp_io_entry_dcache_hit_pop_req; // @[pfb_entry.scala 16:18 212:41]
  wire  _wire_pfu_pfb_entry_pop_vld_T_1 = wire_pfu_pfb_entry_dcache_hit_pop_req | wire_pfu_pfb_entry_confidence_zero; // @[pfb_entry.scala 385:5]
  wire  _wire_pfu_pfb_entry_pop_vld_T_2 = wire_pfu_pfb_entry_vld & _wire_pfu_pfb_entry_pop_vld_T_1; // @[pfb_entry.scala 384:5]
  gated_clk_cell gated_clk_cell ( // @[pfb_entry.scala 27:50]
    .clk_in(gated_clk_cell_clk_in),
    .global_en(gated_clk_cell_global_en),
    .module_en(gated_clk_cell_module_en),
    .local_en(gated_clk_cell_local_en),
    .external_en(gated_clk_cell_external_en),
    .pad_yy_icg_scan_en(gated_clk_cell_pad_yy_icg_scan_en),
    .clk_out(gated_clk_cell_clk_out)
  );
  gated_clk_cell gated_clk_cell_1 ( // @[pfb_entry.scala 27:50]
    .clk_in(gated_clk_cell_1_clk_in),
    .global_en(gated_clk_cell_1_global_en),
    .module_en(gated_clk_cell_1_module_en),
    .local_en(gated_clk_cell_1_local_en),
    .external_en(gated_clk_cell_1_external_en),
    .pad_yy_icg_scan_en(gated_clk_cell_1_pad_yy_icg_scan_en),
    .clk_out(gated_clk_cell_1_clk_out)
  );
  gated_clk_cell gated_clk_cell_2 ( // @[pfb_entry.scala 27:50]
    .clk_in(gated_clk_cell_2_clk_in),
    .global_en(gated_clk_cell_2_global_en),
    .module_en(gated_clk_cell_2_module_en),
    .local_en(gated_clk_cell_2_local_en),
    .external_en(gated_clk_cell_2_external_en),
    .pad_yy_icg_scan_en(gated_clk_cell_2_pad_yy_icg_scan_en),
    .clk_out(gated_clk_cell_2_clk_out)
  );
  ct_lsu_pfu_pfb_tsm_tmp ct_lsu_pfu_pfb_tsm_tmp ( // @[pfb_entry.scala 200:27]
    .io_cp0_lsu_icg_en(ct_lsu_pfu_pfb_tsm_tmp_io_cp0_lsu_icg_en),
    .io_cp0_yy_clk_en(ct_lsu_pfu_pfb_tsm_tmp_io_cp0_yy_clk_en),
    .io_cp0_yy_priv_mode(ct_lsu_pfu_pfb_tsm_tmp_io_cp0_yy_priv_mode),
    .io_cpurst_b(ct_lsu_pfu_pfb_tsm_tmp_io_cpurst_b),
    .io_entry_act_vld(ct_lsu_pfu_pfb_tsm_tmp_io_entry_act_vld),
    .io_entry_biu_pe_req_grnt(ct_lsu_pfu_pfb_tsm_tmp_io_entry_biu_pe_req_grnt),
    .io_entry_clk(ct_lsu_pfu_pfb_tsm_tmp_io_entry_clk),
    .io_entry_create_dp_vld(ct_lsu_pfu_pfb_tsm_tmp_io_entry_create_dp_vld),
    .io_entry_create_vld(ct_lsu_pfu_pfb_tsm_tmp_io_entry_create_vld),
    .io_entry_from_lfb_dcache_hit(ct_lsu_pfu_pfb_tsm_tmp_io_entry_from_lfb_dcache_hit),
    .io_entry_from_lfb_dcache_miss(ct_lsu_pfu_pfb_tsm_tmp_io_entry_from_lfb_dcache_miss),
    .io_entry_l1_biu_pe_req_set(ct_lsu_pfu_pfb_tsm_tmp_io_entry_l1_biu_pe_req_set),
    .io_entry_l1_mmu_pe_req_set(ct_lsu_pfu_pfb_tsm_tmp_io_entry_l1_mmu_pe_req_set),
    .io_entry_l2_biu_pe_req_set(ct_lsu_pfu_pfb_tsm_tmp_io_entry_l2_biu_pe_req_set),
    .io_entry_l2_mmu_pe_req_set(ct_lsu_pfu_pfb_tsm_tmp_io_entry_l2_mmu_pe_req_set),
    .io_entry_mmu_pe_req_grnt(ct_lsu_pfu_pfb_tsm_tmp_io_entry_mmu_pe_req_grnt),
    .io_entry_pf_inst_vld(ct_lsu_pfu_pfb_tsm_tmp_io_entry_pf_inst_vld),
    .io_entry_pop_vld(ct_lsu_pfu_pfb_tsm_tmp_io_entry_pop_vld),
    .io_entry_reinit_vld(ct_lsu_pfu_pfb_tsm_tmp_io_entry_reinit_vld),
    .io_entry_stride(ct_lsu_pfu_pfb_tsm_tmp_io_entry_stride),
    .io_entry_stride_neg(ct_lsu_pfu_pfb_tsm_tmp_io_entry_stride_neg),
    .io_forever_cpuclk(ct_lsu_pfu_pfb_tsm_tmp_io_forever_cpuclk),
    .io_pad_yy_icg_scan_en(ct_lsu_pfu_pfb_tsm_tmp_io_pad_yy_icg_scan_en),
    .io_pipe_va(ct_lsu_pfu_pfb_tsm_tmp_io_pipe_va),
    .io_entry_biu_pe_req(ct_lsu_pfu_pfb_tsm_tmp_io_entry_biu_pe_req),
    .io_entry_biu_pe_req_src(ct_lsu_pfu_pfb_tsm_tmp_io_entry_biu_pe_req_src),
    .io_entry_dcache_hit_pop_req(ct_lsu_pfu_pfb_tsm_tmp_io_entry_dcache_hit_pop_req),
    .io_entry_inst_new_va(ct_lsu_pfu_pfb_tsm_tmp_io_entry_inst_new_va),
    .io_entry_mmu_pe_req(ct_lsu_pfu_pfb_tsm_tmp_io_entry_mmu_pe_req),
    .io_entry_mmu_pe_req_src(ct_lsu_pfu_pfb_tsm_tmp_io_entry_mmu_pe_req_src),
    .io_entry_priv_mode(ct_lsu_pfu_pfb_tsm_tmp_io_entry_priv_mode),
    .io_entry_tsm_is_judge(ct_lsu_pfu_pfb_tsm_tmp_io_entry_tsm_is_judge),
    .io_entry_vld(ct_lsu_pfu_pfb_tsm_tmp_io_entry_vld)
  );
  ct_lsu_pfu_pfb_l1sm_tmp ct_lsu_pfu_pfb_l1sm_tmp ( // @[pfb_entry.scala 242:32]
    .io_cp0_lsu_icg_en(ct_lsu_pfu_pfb_l1sm_tmp_io_cp0_lsu_icg_en),
    .io_cp0_lsu_pfu_mmu_dis(ct_lsu_pfu_pfb_l1sm_tmp_io_cp0_lsu_pfu_mmu_dis),
    .io_cp0_yy_clk_en(ct_lsu_pfu_pfb_l1sm_tmp_io_cp0_yy_clk_en),
    .io_cpurst_b(ct_lsu_pfu_pfb_l1sm_tmp_io_cpurst_b),
    .io_entry_biu_pe_req(ct_lsu_pfu_pfb_l1sm_tmp_io_entry_biu_pe_req),
    .io_entry_biu_pe_req_grnt(ct_lsu_pfu_pfb_l1sm_tmp_io_entry_biu_pe_req_grnt),
    .io_entry_biu_pe_req_src(ct_lsu_pfu_pfb_l1sm_tmp_io_entry_biu_pe_req_src),
    .io_entry_clk(ct_lsu_pfu_pfb_l1sm_tmp_io_entry_clk),
    .io_entry_create_dp_vld(ct_lsu_pfu_pfb_l1sm_tmp_io_entry_create_dp_vld),
    .io_entry_inst_new_va(ct_lsu_pfu_pfb_l1sm_tmp_io_entry_inst_new_va),
    .io_entry_mmu_pe_req(ct_lsu_pfu_pfb_l1sm_tmp_io_entry_mmu_pe_req),
    .io_entry_mmu_pe_req_src(ct_lsu_pfu_pfb_l1sm_tmp_io_entry_mmu_pe_req_src),
    .io_entry_pf_inst_vld(ct_lsu_pfu_pfb_l1sm_tmp_io_entry_pf_inst_vld),
    .io_entry_pop_vld(ct_lsu_pfu_pfb_l1sm_tmp_io_entry_pop_vld),
    .io_entry_reinit_vld(ct_lsu_pfu_pfb_l1sm_tmp_io_entry_reinit_vld),
    .io_entry_stride_neg(ct_lsu_pfu_pfb_l1sm_tmp_io_entry_stride_neg),
    .io_entry_strideh(ct_lsu_pfu_pfb_l1sm_tmp_io_entry_strideh),
    .io_entry_tsm_is_judge(ct_lsu_pfu_pfb_l1sm_tmp_io_entry_tsm_is_judge),
    .io_forever_cpuclk(ct_lsu_pfu_pfb_l1sm_tmp_io_forever_cpuclk),
    .io_ld_da_page_sec_ff(ct_lsu_pfu_pfb_l1sm_tmp_io_ld_da_page_sec_ff),
    .io_ld_da_page_share_ff(ct_lsu_pfu_pfb_l1sm_tmp_io_ld_da_page_share_ff),
    .io_ld_da_ppn_ff(ct_lsu_pfu_pfb_l1sm_tmp_io_ld_da_ppn_ff),
    .io_pad_yy_icg_scan_en(ct_lsu_pfu_pfb_l1sm_tmp_io_pad_yy_icg_scan_en),
    .io_pfu_biu_pe_req_sel_l1(ct_lsu_pfu_pfb_l1sm_tmp_io_pfu_biu_pe_req_sel_l1),
    .io_pfu_dcache_pref_en(ct_lsu_pfu_pfb_l1sm_tmp_io_pfu_dcache_pref_en),
    .io_pfu_get_page_sec(ct_lsu_pfu_pfb_l1sm_tmp_io_pfu_get_page_sec),
    .io_pfu_get_page_share(ct_lsu_pfu_pfb_l1sm_tmp_io_pfu_get_page_share),
    .io_pfu_get_ppn(ct_lsu_pfu_pfb_l1sm_tmp_io_pfu_get_ppn),
    .io_pfu_get_ppn_err(ct_lsu_pfu_pfb_l1sm_tmp_io_pfu_get_ppn_err),
    .io_pfu_get_ppn_vld(ct_lsu_pfu_pfb_l1sm_tmp_io_pfu_get_ppn_vld),
    .io_entry_l1_biu_pe_req_set(ct_lsu_pfu_pfb_l1sm_tmp_io_entry_l1_biu_pe_req_set),
    .io_entry_l1_cmp_va_vld(ct_lsu_pfu_pfb_l1sm_tmp_io_entry_l1_cmp_va_vld),
    .io_entry_l1_mmu_pe_req_set(ct_lsu_pfu_pfb_l1sm_tmp_io_entry_l1_mmu_pe_req_set),
    .io_entry_l1_page_sec(ct_lsu_pfu_pfb_l1sm_tmp_io_entry_l1_page_sec),
    .io_entry_l1_page_share(ct_lsu_pfu_pfb_l1sm_tmp_io_entry_l1_page_share),
    .io_entry_l1_pf_addr(ct_lsu_pfu_pfb_l1sm_tmp_io_entry_l1_pf_addr),
    .io_entry_l1_pf_va_sub_inst_new_va(ct_lsu_pfu_pfb_l1sm_tmp_io_entry_l1_pf_va_sub_inst_new_va),
    .io_entry_l1_vpn(ct_lsu_pfu_pfb_l1sm_tmp_io_entry_l1_vpn),
    .io_entry_l1sm_reinit_req(ct_lsu_pfu_pfb_l1sm_tmp_io_entry_l1sm_reinit_req),
    .io_entry_l1sm_va_can_cmp(ct_lsu_pfu_pfb_l1sm_tmp_io_entry_l1sm_va_can_cmp),
    .io_entry_l1_pf_va(ct_lsu_pfu_pfb_l1sm_tmp_io_entry_l1_pf_va)
  );
  ct_lsu_pfu_pfb_l2sm_tmp ct_lsu_pfu_pfb_l2sm_tmp ( // @[pfb_entry.scala 242:66]
    .io_cp0_lsu_icg_en(ct_lsu_pfu_pfb_l2sm_tmp_io_cp0_lsu_icg_en),
    .io_cp0_lsu_pfu_mmu_dis(ct_lsu_pfu_pfb_l2sm_tmp_io_cp0_lsu_pfu_mmu_dis),
    .io_cp0_yy_clk_en(ct_lsu_pfu_pfb_l2sm_tmp_io_cp0_yy_clk_en),
    .io_cpurst_b(ct_lsu_pfu_pfb_l2sm_tmp_io_cpurst_b),
    .io_entry_biu_pe_req(ct_lsu_pfu_pfb_l2sm_tmp_io_entry_biu_pe_req),
    .io_entry_biu_pe_req_grnt(ct_lsu_pfu_pfb_l2sm_tmp_io_entry_biu_pe_req_grnt),
    .io_entry_biu_pe_req_src(ct_lsu_pfu_pfb_l2sm_tmp_io_entry_biu_pe_req_src),
    .io_entry_clk(ct_lsu_pfu_pfb_l2sm_tmp_io_entry_clk),
    .io_entry_create_dp_vld(ct_lsu_pfu_pfb_l2sm_tmp_io_entry_create_dp_vld),
    .io_entry_inst_new_va(ct_lsu_pfu_pfb_l2sm_tmp_io_entry_inst_new_va),
    .io_entry_mmu_pe_req(ct_lsu_pfu_pfb_l2sm_tmp_io_entry_mmu_pe_req),
    .io_entry_mmu_pe_req_src(ct_lsu_pfu_pfb_l2sm_tmp_io_entry_mmu_pe_req_src),
    .io_entry_pf_inst_vld(ct_lsu_pfu_pfb_l2sm_tmp_io_entry_pf_inst_vld),
    .io_entry_pop_vld(ct_lsu_pfu_pfb_l2sm_tmp_io_entry_pop_vld),
    .io_entry_reinit_vld(ct_lsu_pfu_pfb_l2sm_tmp_io_entry_reinit_vld),
    .io_entry_stride_neg(ct_lsu_pfu_pfb_l2sm_tmp_io_entry_stride_neg),
    .io_entry_strideh(ct_lsu_pfu_pfb_l2sm_tmp_io_entry_strideh),
    .io_entry_tsm_is_judge(ct_lsu_pfu_pfb_l2sm_tmp_io_entry_tsm_is_judge),
    .io_forever_cpuclk(ct_lsu_pfu_pfb_l2sm_tmp_io_forever_cpuclk),
    .io_ld_da_page_sec_ff(ct_lsu_pfu_pfb_l2sm_tmp_io_ld_da_page_sec_ff),
    .io_ld_da_page_share_ff(ct_lsu_pfu_pfb_l2sm_tmp_io_ld_da_page_share_ff),
    .io_ld_da_ppn_ff(ct_lsu_pfu_pfb_l2sm_tmp_io_ld_da_ppn_ff),
    .io_pad_yy_icg_scan_en(ct_lsu_pfu_pfb_l2sm_tmp_io_pad_yy_icg_scan_en),
    .io_pfu_biu_pe_req_sel_l1(ct_lsu_pfu_pfb_l2sm_tmp_io_pfu_biu_pe_req_sel_l1),
    .io_pfu_dcache_pref_en(ct_lsu_pfu_pfb_l2sm_tmp_io_pfu_dcache_pref_en),
    .io_pfu_get_page_sec(ct_lsu_pfu_pfb_l2sm_tmp_io_pfu_get_page_sec),
    .io_pfu_get_page_share(ct_lsu_pfu_pfb_l2sm_tmp_io_pfu_get_page_share),
    .io_pfu_get_ppn(ct_lsu_pfu_pfb_l2sm_tmp_io_pfu_get_ppn),
    .io_pfu_get_ppn_err(ct_lsu_pfu_pfb_l2sm_tmp_io_pfu_get_ppn_err),
    .io_pfu_get_ppn_vld(ct_lsu_pfu_pfb_l2sm_tmp_io_pfu_get_ppn_vld),
    .io_entry_l1_biu_pe_req_set(ct_lsu_pfu_pfb_l2sm_tmp_io_entry_l1_biu_pe_req_set),
    .io_entry_l1_cmp_va_vld(ct_lsu_pfu_pfb_l2sm_tmp_io_entry_l1_cmp_va_vld),
    .io_entry_l1_mmu_pe_req_set(ct_lsu_pfu_pfb_l2sm_tmp_io_entry_l1_mmu_pe_req_set),
    .io_entry_l1_page_sec(ct_lsu_pfu_pfb_l2sm_tmp_io_entry_l1_page_sec),
    .io_entry_l1_page_share(ct_lsu_pfu_pfb_l2sm_tmp_io_entry_l1_page_share),
    .io_entry_l1_pf_addr(ct_lsu_pfu_pfb_l2sm_tmp_io_entry_l1_pf_addr),
    .io_entry_l1_pf_va_sub_inst_new_va(ct_lsu_pfu_pfb_l2sm_tmp_io_entry_l1_pf_va_sub_inst_new_va),
    .io_entry_l1_vpn(ct_lsu_pfu_pfb_l2sm_tmp_io_entry_l1_vpn),
    .io_entry_l1sm_reinit_req(ct_lsu_pfu_pfb_l2sm_tmp_io_entry_l1sm_reinit_req),
    .io_entry_l1sm_va_can_cmp(ct_lsu_pfu_pfb_l2sm_tmp_io_entry_l1sm_va_can_cmp),
    .io_entry_l1_pf_va_t(ct_lsu_pfu_pfb_l2sm_tmp_io_entry_l1_pf_va_t)
  );
  assign io_pfu_pfb_entry_biu_pe_req_src_v = ct_lsu_pfu_pfb_tsm_tmp_io_entry_biu_pe_req_src; // @[pfb_entry.scala 16:18 208:37]
  assign io_pfu_pfb_entry_biu_pe_req_x = ct_lsu_pfu_pfb_tsm_tmp_io_entry_biu_pe_req; // @[pfb_entry.scala 16:18 206:33]
  assign io_pfu_pfb_entry_evict_x = evict; // @[pfb_entry.scala 17:17 126:29]
  assign io_pfu_pfb_entry_hit_pc_x = wire_pfu_pfb_entry_hit_pc & ~(type_ld ^ io_ld_da_pfu_act_dp_vld); // @[pfb_entry.scala 188:5]
  assign io_pfu_pfb_entry_l1_page_sec_x = ct_lsu_pfu_pfb_l1sm_tmp_io_entry_l1_page_sec; // @[pfb_entry.scala 16:18 286:38]
  assign io_pfu_pfb_entry_l1_page_share_x = ct_lsu_pfu_pfb_l1sm_tmp_io_entry_l1_page_share; // @[pfb_entry.scala 16:18 287:40]
  assign io_pfu_pfb_entry_l1_pf_addr_v = ct_lsu_pfu_pfb_l1sm_tmp_io_entry_l1_pf_addr; // @[pfb_entry.scala 16:18 288:37]
  assign io_pfu_pfb_entry_l1_vpn_v = ct_lsu_pfu_pfb_l1sm_tmp_io_entry_l1_vpn; // @[pfb_entry.scala 16:18 290:33]
  assign io_pfu_pfb_entry_l2_page_sec_x = ct_lsu_pfu_pfb_l2sm_tmp_io_entry_l1_page_sec; // @[pfb_entry.scala 16:18 303:38]
  assign io_pfu_pfb_entry_l2_page_share_x = ct_lsu_pfu_pfb_l2sm_tmp_io_entry_l1_page_share; // @[pfb_entry.scala 16:18 304:40]
  assign io_pfu_pfb_entry_l2_pf_addr_v = ct_lsu_pfu_pfb_l2sm_tmp_io_entry_l1_pf_addr; // @[pfb_entry.scala 16:18 305:37]
  assign io_pfu_pfb_entry_l2_vpn_v = ct_lsu_pfu_pfb_l2sm_tmp_io_entry_l1_vpn; // @[pfb_entry.scala 16:18 307:33]
  assign io_pfu_pfb_entry_mmu_pe_req_src_v = ct_lsu_pfu_pfb_tsm_tmp_io_entry_mmu_pe_req_src; // @[pfb_entry.scala 16:18 222:37]
  assign io_pfu_pfb_entry_mmu_pe_req_x = ct_lsu_pfu_pfb_tsm_tmp_io_entry_mmu_pe_req; // @[pfb_entry.scala 16:18 220:33]
  assign io_pfu_pfb_entry_priv_mode_v = ct_lsu_pfu_pfb_tsm_tmp_io_entry_priv_mode; // @[pfb_entry.scala 16:18 225:32]
  assign io_pfu_pfb_entry_vld_x = ct_lsu_pfu_pfb_tsm_tmp_io_entry_vld; // @[pfb_entry.scala 16:18 230:26]
  assign gated_clk_cell_clk_in = io_lsu_special_clk; // @[pfb_entry.scala 29:52]
  assign gated_clk_cell_global_en = io_cp0_yy_clk_en; // @[pfb_entry.scala 27:31 31:33]
  assign gated_clk_cell_module_en = io_cp0_lsu_icg_en; // @[pfb_entry.scala 27:31 32:33]
  assign gated_clk_cell_local_en = wire_pfu_pfb_entry_vld | io_pfu_pfb_entry_create_gateclk_en_x; // @[pfb_entry.scala 21:55]
  assign gated_clk_cell_external_en = 1'h0; // @[pfb_entry.scala 27:31 30:35]
  assign gated_clk_cell_pad_yy_icg_scan_en = io_pad_yy_icg_scan_en; // @[pfb_entry.scala 27:31 33:42]
  assign gated_clk_cell_1_clk_in = io_lsu_special_clk; // @[pfb_entry.scala 29:52]
  assign gated_clk_cell_1_global_en = io_cp0_yy_clk_en; // @[pfb_entry.scala 27:31 31:33]
  assign gated_clk_cell_1_module_en = io_cp0_lsu_icg_en; // @[pfb_entry.scala 27:31 32:33]
  assign gated_clk_cell_1_local_en = io_pfu_pfb_entry_create_gateclk_en_x; // @[pfb_entry.scala 16:18 393:40]
  assign gated_clk_cell_1_external_en = 1'h0; // @[pfb_entry.scala 27:31 30:35]
  assign gated_clk_cell_1_pad_yy_icg_scan_en = io_pad_yy_icg_scan_en; // @[pfb_entry.scala 27:31 33:42]
  assign gated_clk_cell_2_clk_in = io_lsu_special_clk; // @[pfb_entry.scala 29:52]
  assign gated_clk_cell_2_global_en = io_cp0_yy_clk_en; // @[pfb_entry.scala 27:31 31:33]
  assign gated_clk_cell_2_module_en = io_cp0_lsu_icg_en; // @[pfb_entry.scala 27:31 32:33]
  assign gated_clk_cell_2_local_en = _wire_pfu_pfb_entry_all_pf_inst_clk_en_T_2 | io_pfu_pfb_entry_create_gateclk_en_x; // @[pfb_entry.scala 26:5]
  assign gated_clk_cell_2_external_en = 1'h0; // @[pfb_entry.scala 27:31 30:35]
  assign gated_clk_cell_2_pad_yy_icg_scan_en = io_pad_yy_icg_scan_en; // @[pfb_entry.scala 27:31 33:42]
  assign ct_lsu_pfu_pfb_tsm_tmp_io_cp0_lsu_icg_en = io_cp0_lsu_icg_en; // @[pfb_entry.scala 201:22]
  assign ct_lsu_pfu_pfb_tsm_tmp_io_cp0_yy_clk_en = io_cp0_yy_clk_en; // @[pfb_entry.scala 202:21]
  assign ct_lsu_pfu_pfb_tsm_tmp_io_cp0_yy_priv_mode = io_cp0_yy_priv_mode; // @[pfb_entry.scala 203:24]
  assign ct_lsu_pfu_pfb_tsm_tmp_io_cpurst_b = io_cpurst_b; // @[pfb_entry.scala 204:31]
  assign ct_lsu_pfu_pfb_tsm_tmp_io_entry_act_vld = wire_pfu_pfb_entry_hit_pc & wire_pipe_act_vld; // @[pfb_entry.scala 185:5]
  assign ct_lsu_pfu_pfb_tsm_tmp_io_entry_biu_pe_req_grnt = io_pfu_pfb_entry_biu_pe_req_grnt_x; // @[pfb_entry.scala 16:18 395:38]
  assign ct_lsu_pfu_pfb_tsm_tmp_io_entry_clk = gated_clk_cell_clk_out; // @[pfb_entry.scala 209:43]
  assign ct_lsu_pfu_pfb_tsm_tmp_io_entry_create_dp_vld = io_pfu_pfb_entry_create_dp_vld_x; // @[pfb_entry.scala 16:18 392:36]
  assign ct_lsu_pfu_pfb_tsm_tmp_io_entry_create_vld = io_pfu_pfb_entry_create_vld_x; // @[pfb_entry.scala 16:18 391:33]
  assign ct_lsu_pfu_pfb_tsm_tmp_io_entry_from_lfb_dcache_hit = io_pfu_pfb_entry_from_lfb_dcache_hit_x; // @[pfb_entry.scala 16:18 398:42]
  assign ct_lsu_pfu_pfb_tsm_tmp_io_entry_from_lfb_dcache_miss = io_pfu_pfb_entry_from_lfb_dcache_miss_x; // @[pfb_entry.scala 16:18 399:43]
  assign ct_lsu_pfu_pfb_tsm_tmp_io_entry_l1_biu_pe_req_set = ct_lsu_pfu_pfb_l1sm_tmp_io_entry_l1_biu_pe_req_set; // @[pfb_entry.scala 16:18 283:44]
  assign ct_lsu_pfu_pfb_tsm_tmp_io_entry_l1_mmu_pe_req_set = ct_lsu_pfu_pfb_l1sm_tmp_io_entry_l1_mmu_pe_req_set; // @[pfb_entry.scala 16:18 285:44]
  assign ct_lsu_pfu_pfb_tsm_tmp_io_entry_l2_biu_pe_req_set = ct_lsu_pfu_pfb_l2sm_tmp_io_entry_l1_biu_pe_req_set; // @[pfb_entry.scala 16:18 302:44]
  assign ct_lsu_pfu_pfb_tsm_tmp_io_entry_l2_mmu_pe_req_set = ct_lsu_pfu_pfb_l2sm_tmp_io_entry_l1_mmu_pe_req_set; // @[pfb_entry.scala 16:18 300:44]
  assign ct_lsu_pfu_pfb_tsm_tmp_io_entry_mmu_pe_req_grnt = io_pfu_pfb_entry_mmu_pe_req_grnt_x; // @[pfb_entry.scala 16:18 396:38]
  assign ct_lsu_pfu_pfb_tsm_tmp_io_entry_pf_inst_vld = wire_pfu_pfb_entry_hit_pc & wire_pipe_cmp_inst_vld; // @[pfb_entry.scala 183:5]
  assign ct_lsu_pfu_pfb_tsm_tmp_io_entry_pop_vld = _wire_pfu_pfb_entry_pop_vld_T | _wire_pfu_pfb_entry_pop_vld_T_2; // @[pfb_entry.scala 383:5]
  assign ct_lsu_pfu_pfb_tsm_tmp_io_entry_reinit_vld = _wire_pfu_pfb_entry_reinit_vld_T_1 |
    _wire_pfu_pfb_entry_reinit_vld_T_4; // @[pfb_entry.scala 373:5]
  assign ct_lsu_pfu_pfb_tsm_tmp_io_entry_stride = stride; // @[pfb_entry.scala 17:17 73:30]
  assign ct_lsu_pfu_pfb_tsm_tmp_io_entry_stride_neg = stride_neg; // @[pfb_entry.scala 17:17 75:34]
  assign ct_lsu_pfu_pfb_tsm_tmp_io_forever_cpuclk = io_lsu_special_clk; // @[pfb_entry.scala 231:44]
  assign ct_lsu_pfu_pfb_tsm_tmp_io_pad_yy_icg_scan_en = io_pad_yy_icg_scan_en; // @[pfb_entry.scala 232:26]
  assign ct_lsu_pfu_pfb_tsm_tmp_io_pipe_va = type_ld ? io_ld_da_ppfu_va : io_st_da_ppfu_va; // @[pfb_entry.scala 158:27]
  assign ct_lsu_pfu_pfb_l1sm_tmp_io_cp0_lsu_icg_en = io_cp0_lsu_icg_en; // @[pfb_entry.scala 244:27]
  assign ct_lsu_pfu_pfb_l1sm_tmp_io_cp0_lsu_pfu_mmu_dis = io_cp0_lsu_pfu_mmu_dis; // @[pfb_entry.scala 245:32]
  assign ct_lsu_pfu_pfb_l1sm_tmp_io_cp0_yy_clk_en = io_cp0_yy_clk_en; // @[pfb_entry.scala 246:26]
  assign ct_lsu_pfu_pfb_l1sm_tmp_io_cpurst_b = io_cpurst_b; // @[pfb_entry.scala 247:36]
  assign ct_lsu_pfu_pfb_l1sm_tmp_io_entry_biu_pe_req = ct_lsu_pfu_pfb_tsm_tmp_io_entry_biu_pe_req; // @[pfb_entry.scala 16:18 206:33]
  assign ct_lsu_pfu_pfb_l1sm_tmp_io_entry_biu_pe_req_grnt = io_pfu_pfb_entry_biu_pe_req_grnt_x; // @[pfb_entry.scala 16:18 395:38]
  assign ct_lsu_pfu_pfb_l1sm_tmp_io_entry_biu_pe_req_src = ct_lsu_pfu_pfb_tsm_tmp_io_entry_biu_pe_req_src; // @[pfb_entry.scala 16:18 208:37]
  assign ct_lsu_pfu_pfb_l1sm_tmp_io_entry_clk = gated_clk_cell_clk_out; // @[pfb_entry.scala 251:48]
  assign ct_lsu_pfu_pfb_l1sm_tmp_io_entry_create_dp_vld = io_pfu_pfb_entry_create_dp_vld_x; // @[pfb_entry.scala 16:18 392:36]
  assign ct_lsu_pfu_pfb_l1sm_tmp_io_entry_inst_new_va = ct_lsu_pfu_pfb_tsm_tmp_io_entry_inst_new_va; // @[pfb_entry.scala 16:18 215:34]
  assign ct_lsu_pfu_pfb_l1sm_tmp_io_entry_mmu_pe_req = ct_lsu_pfu_pfb_tsm_tmp_io_entry_mmu_pe_req; // @[pfb_entry.scala 16:18 220:33]
  assign ct_lsu_pfu_pfb_l1sm_tmp_io_entry_mmu_pe_req_src = ct_lsu_pfu_pfb_tsm_tmp_io_entry_mmu_pe_req_src; // @[pfb_entry.scala 16:18 222:37]
  assign ct_lsu_pfu_pfb_l1sm_tmp_io_entry_pf_inst_vld = wire_pfu_pfb_entry_hit_pc & wire_pipe_cmp_inst_vld; // @[pfb_entry.scala 183:5]
  assign ct_lsu_pfu_pfb_l1sm_tmp_io_entry_pop_vld = _wire_pfu_pfb_entry_pop_vld_T | _wire_pfu_pfb_entry_pop_vld_T_2; // @[pfb_entry.scala 383:5]
  assign ct_lsu_pfu_pfb_l1sm_tmp_io_entry_reinit_vld = _wire_pfu_pfb_entry_reinit_vld_T_1 |
    _wire_pfu_pfb_entry_reinit_vld_T_4; // @[pfb_entry.scala 373:5]
  assign ct_lsu_pfu_pfb_l1sm_tmp_io_entry_stride_neg = stride_neg; // @[pfb_entry.scala 17:17 75:34]
  assign ct_lsu_pfu_pfb_l1sm_tmp_io_entry_strideh = {wire_pfu_pfb_entry_strideh_hi,strideh_6to0}; // @[Cat.scala 33:92]
  assign ct_lsu_pfu_pfb_l1sm_tmp_io_entry_tsm_is_judge = ct_lsu_pfu_pfb_tsm_tmp_io_entry_tsm_is_judge; // @[pfb_entry.scala 16:18 229:35]
  assign ct_lsu_pfu_pfb_l1sm_tmp_io_forever_cpuclk = io_lsu_special_clk; // @[pfb_entry.scala 263:49]
  assign ct_lsu_pfu_pfb_l1sm_tmp_io_ld_da_page_sec_ff = io_ld_da_page_sec_ff; // @[pfb_entry.scala 277:32]
  assign ct_lsu_pfu_pfb_l1sm_tmp_io_ld_da_page_share_ff = io_ld_da_page_share_ff; // @[pfb_entry.scala 278:34]
  assign ct_lsu_pfu_pfb_l1sm_tmp_io_ld_da_ppn_ff = io_ld_da_ppn_ff; // @[pfb_entry.scala 279:27]
  assign ct_lsu_pfu_pfb_l1sm_tmp_io_pad_yy_icg_scan_en = io_pad_yy_icg_scan_en; // @[pfb_entry.scala 264:31]
  assign ct_lsu_pfu_pfb_l1sm_tmp_io_pfu_biu_pe_req_sel_l1 = io_pfu_biu_pe_req_sel_l1; // @[pfb_entry.scala 265:34]
  assign ct_lsu_pfu_pfb_l1sm_tmp_io_pfu_dcache_pref_en = _wire_l1_pref_en_T & type_ld; // @[pfb_entry.scala 175:5]
  assign ct_lsu_pfu_pfb_l1sm_tmp_io_pfu_get_page_sec = io_pfu_get_page_sec; // @[pfb_entry.scala 266:29]
  assign ct_lsu_pfu_pfb_l1sm_tmp_io_pfu_get_page_share = io_pfu_get_page_share; // @[pfb_entry.scala 267:31]
  assign ct_lsu_pfu_pfb_l1sm_tmp_io_pfu_get_ppn = io_pfu_get_ppn; // @[pfb_entry.scala 268:24]
  assign ct_lsu_pfu_pfb_l1sm_tmp_io_pfu_get_ppn_err = io_pfu_get_ppn_err; // @[pfb_entry.scala 269:28]
  assign ct_lsu_pfu_pfb_l1sm_tmp_io_pfu_get_ppn_vld = io_pfu_get_ppn_vld; // @[pfb_entry.scala 270:28]
  assign ct_lsu_pfu_pfb_l2sm_tmp_io_cp0_lsu_icg_en = io_cp0_lsu_icg_en; // @[pfb_entry.scala 244:27]
  assign ct_lsu_pfu_pfb_l2sm_tmp_io_cp0_lsu_pfu_mmu_dis = io_cp0_lsu_pfu_mmu_dis; // @[pfb_entry.scala 245:32]
  assign ct_lsu_pfu_pfb_l2sm_tmp_io_cp0_yy_clk_en = io_cp0_yy_clk_en; // @[pfb_entry.scala 246:26]
  assign ct_lsu_pfu_pfb_l2sm_tmp_io_cpurst_b = io_cpurst_b; // @[pfb_entry.scala 247:36]
  assign ct_lsu_pfu_pfb_l2sm_tmp_io_entry_biu_pe_req = ct_lsu_pfu_pfb_tsm_tmp_io_entry_biu_pe_req; // @[pfb_entry.scala 16:18 206:33]
  assign ct_lsu_pfu_pfb_l2sm_tmp_io_entry_biu_pe_req_grnt = io_pfu_pfb_entry_biu_pe_req_grnt_x; // @[pfb_entry.scala 16:18 395:38]
  assign ct_lsu_pfu_pfb_l2sm_tmp_io_entry_biu_pe_req_src = ct_lsu_pfu_pfb_tsm_tmp_io_entry_biu_pe_req_src; // @[pfb_entry.scala 16:18 208:37]
  assign ct_lsu_pfu_pfb_l2sm_tmp_io_entry_clk = gated_clk_cell_clk_out; // @[pfb_entry.scala 251:48]
  assign ct_lsu_pfu_pfb_l2sm_tmp_io_entry_create_dp_vld = io_pfu_pfb_entry_create_dp_vld_x; // @[pfb_entry.scala 16:18 392:36]
  assign ct_lsu_pfu_pfb_l2sm_tmp_io_entry_inst_new_va = ct_lsu_pfu_pfb_tsm_tmp_io_entry_inst_new_va; // @[pfb_entry.scala 16:18 215:34]
  assign ct_lsu_pfu_pfb_l2sm_tmp_io_entry_mmu_pe_req = ct_lsu_pfu_pfb_tsm_tmp_io_entry_mmu_pe_req; // @[pfb_entry.scala 16:18 220:33]
  assign ct_lsu_pfu_pfb_l2sm_tmp_io_entry_mmu_pe_req_src = ct_lsu_pfu_pfb_tsm_tmp_io_entry_mmu_pe_req_src; // @[pfb_entry.scala 16:18 222:37]
  assign ct_lsu_pfu_pfb_l2sm_tmp_io_entry_pf_inst_vld = wire_pfu_pfb_entry_hit_pc & wire_pipe_cmp_inst_vld; // @[pfb_entry.scala 183:5]
  assign ct_lsu_pfu_pfb_l2sm_tmp_io_entry_pop_vld = _wire_pfu_pfb_entry_pop_vld_T | _wire_pfu_pfb_entry_pop_vld_T_2; // @[pfb_entry.scala 383:5]
  assign ct_lsu_pfu_pfb_l2sm_tmp_io_entry_reinit_vld = _wire_pfu_pfb_entry_reinit_vld_T_1 |
    _wire_pfu_pfb_entry_reinit_vld_T_4; // @[pfb_entry.scala 373:5]
  assign ct_lsu_pfu_pfb_l2sm_tmp_io_entry_stride_neg = stride_neg; // @[pfb_entry.scala 17:17 75:34]
  assign ct_lsu_pfu_pfb_l2sm_tmp_io_entry_strideh = {wire_pfu_pfb_entry_strideh_hi,strideh_6to0}; // @[Cat.scala 33:92]
  assign ct_lsu_pfu_pfb_l2sm_tmp_io_entry_tsm_is_judge = ct_lsu_pfu_pfb_tsm_tmp_io_entry_tsm_is_judge; // @[pfb_entry.scala 16:18 229:35]
  assign ct_lsu_pfu_pfb_l2sm_tmp_io_forever_cpuclk = io_lsu_special_clk; // @[pfb_entry.scala 263:49]
  assign ct_lsu_pfu_pfb_l2sm_tmp_io_ld_da_page_sec_ff = type_ld ? io_ld_da_page_sec_ff : io_st_da_page_sec_ff; // @[pfb_entry.scala 160:28]
  assign ct_lsu_pfu_pfb_l2sm_tmp_io_ld_da_page_share_ff = type_ld ? io_ld_da_page_share_ff : io_st_da_page_share_ff; // @[pfb_entry.scala 164:30]
  assign ct_lsu_pfu_pfb_l2sm_tmp_io_ld_da_ppn_ff = type_ld ? io_ld_da_ppn_ff : io_st_da_ppn_ff; // @[pfb_entry.scala 168:23]
  assign ct_lsu_pfu_pfb_l2sm_tmp_io_pad_yy_icg_scan_en = io_pad_yy_icg_scan_en; // @[pfb_entry.scala 264:31]
  assign ct_lsu_pfu_pfb_l2sm_tmp_io_pfu_biu_pe_req_sel_l1 = io_pfu_biu_pe_req_sel_l1; // @[pfb_entry.scala 265:34]
  assign ct_lsu_pfu_pfb_l2sm_tmp_io_pfu_dcache_pref_en = io_pfu_l2_pref_en; // @[pfb_entry.scala 292:33]
  assign ct_lsu_pfu_pfb_l2sm_tmp_io_pfu_get_page_sec = io_pfu_get_page_sec; // @[pfb_entry.scala 266:29]
  assign ct_lsu_pfu_pfb_l2sm_tmp_io_pfu_get_page_share = io_pfu_get_page_share; // @[pfb_entry.scala 267:31]
  assign ct_lsu_pfu_pfb_l2sm_tmp_io_pfu_get_ppn = io_pfu_get_ppn; // @[pfb_entry.scala 268:24]
  assign ct_lsu_pfu_pfb_l2sm_tmp_io_pfu_get_ppn_err = io_pfu_get_ppn_err; // @[pfb_entry.scala 269:28]
  assign ct_lsu_pfu_pfb_l2sm_tmp_io_pfu_get_ppn_vld = io_pfu_get_ppn_vld; // @[pfb_entry.scala 270:28]
  assign ct_lsu_pfu_pfb_l2sm_tmp_io_entry_l1_pf_va_t = ct_lsu_pfu_pfb_l1sm_tmp_io_entry_l1_pf_va; // @[pfb_entry.scala 16:18 276:35]
  always @(posedge gated_clk_cell_1_clk_out) begin
    if (_T_1) begin // @[pfb_entry.scala 52:21]
      pc <= 15'h0; // @[pfb_entry.scala 52:21]
    end else if (_T_1) begin // @[pfb_entry.scala 58:24]
      pc <= 15'h0; // @[pfb_entry.scala 59:10]
    end else if (io_pfu_pfb_entry_create_dp_vld_x) begin // @[pfb_entry.scala 64:50]
      pc <= io_pfu_pfb_create_pc; // @[pfb_entry.scala 65:10]
    end
    if (_T_1) begin // @[pfb_entry.scala 53:25]
      stride <= 11'h0; // @[pfb_entry.scala 53:25]
    end else if (_T_1) begin // @[pfb_entry.scala 58:24]
      stride <= 11'h0; // @[pfb_entry.scala 60:14]
    end else if (io_pfu_pfb_entry_create_dp_vld_x) begin // @[pfb_entry.scala 64:50]
      stride <= io_pfu_pfb_create_stride; // @[pfb_entry.scala 66:14]
    end
    if (_T_1) begin // @[pfb_entry.scala 54:31]
      strideh_6to0 <= 7'h0; // @[pfb_entry.scala 54:31]
    end else if (_T_1) begin // @[pfb_entry.scala 58:24]
      strideh_6to0 <= 7'h0; // @[pfb_entry.scala 61:20]
    end else if (io_pfu_pfb_entry_create_dp_vld_x) begin // @[pfb_entry.scala 64:50]
      strideh_6to0 <= io_pfu_pfb_create_strideh_6to0; // @[pfb_entry.scala 67:20]
    end
    if (_T_1) begin // @[pfb_entry.scala 55:29]
      stride_neg <= 1'h0; // @[pfb_entry.scala 55:29]
    end else if (_T_1) begin // @[pfb_entry.scala 58:24]
      stride_neg <= 1'h0; // @[pfb_entry.scala 62:18]
    end else if (io_pfu_pfb_entry_create_dp_vld_x) begin // @[pfb_entry.scala 64:50]
      stride_neg <= io_pfu_pfb_create_stride_neg; // @[pfb_entry.scala 68:18]
    end
    if (_T_1) begin // @[pfb_entry.scala 56:26]
      type_ld <= 1'h0; // @[pfb_entry.scala 56:26]
    end else if (_T_1) begin // @[pfb_entry.scala 58:24]
      type_ld <= 1'h0; // @[pfb_entry.scala 63:15]
    end else if (io_pfu_pfb_entry_create_dp_vld_x) begin // @[pfb_entry.scala 64:50]
      type_ld <= io_pfu_pfb_create_type_ld; // @[pfb_entry.scala 69:15]
    end
  end
  always @(posedge gated_clk_cell_2_clk_out) begin
    if (_T_1) begin // @[pfb_entry.scala 85:29]
      timeoutCnt <= 8'h0; // @[pfb_entry.scala 85:29]
    end else if (_T_1) begin // @[pfb_entry.scala 87:24]
      timeoutCnt <= 8'h0; // @[pfb_entry.scala 88:18]
    end else if (io_pfu_pfb_entry_create_dp_vld_x | wire_pfu_pfb_entry_pf_inst_vld) begin // @[pfb_entry.scala 89:84]
      timeoutCnt <= 8'h0; // @[pfb_entry.scala 90:18]
    end else if (wire_pipe_evict_cnt_vld & ~wire_pfu_pfb_entry_timeout_cnt_full) begin // @[pfb_entry.scala 91:81]
      timeoutCnt <= _timeoutCnt_T_1; // @[pfb_entry.scala 92:18]
    end
    if (_T_1) begin // @[pfb_entry.scala 101:27]
      noReqCnt <= 6'h0; // @[pfb_entry.scala 101:27]
    end else if (_T_1) begin // @[pfb_entry.scala 103:24]
      noReqCnt <= 6'h0; // @[pfb_entry.scala 104:16]
    end else if (io_pfu_pfb_entry_create_dp_vld_x | wire_pfu_pfb_entry_biu_pe_req) begin // @[pfb_entry.scala 105:83]
      noReqCnt <= 6'h0; // @[pfb_entry.scala 106:16]
    end else if (wire_pfu_pfb_entry_pf_inst_vld & ~wire_pfu_pfb_entry_no_req_cnt_full) begin // @[pfb_entry.scala 107:87]
      noReqCnt <= _noReqCnt_T_1; // @[pfb_entry.scala 108:16]
    end
  end
  always @(posedge gated_clk_cell_clk_out) begin
    if (_T_1) begin // @[pfb_entry.scala 118:24]
      evict <= 1'h0; // @[pfb_entry.scala 118:24]
    end else if (_T_1) begin // @[pfb_entry.scala 119:24]
      evict <= 1'h0; // @[pfb_entry.scala 120:13]
    end else if (io_pfu_pfb_entry_create_dp_vld_x | wire_pfu_pfb_entry_evict_clr) begin // @[pfb_entry.scala 121:82]
      evict <= 1'h0; // @[pfb_entry.scala 122:13]
    end else begin
      evict <= _GEN_16;
    end
    if (_T_1) begin // @[pfb_entry.scala 132:29]
      confidence <= 3'h0; // @[pfb_entry.scala 132:29]
    end else if (_T_1) begin // @[pfb_entry.scala 134:24]
      confidence <= 3'h0; // @[pfb_entry.scala 135:18]
    end else if (io_pfu_pfb_entry_create_dp_vld_x) begin // @[pfb_entry.scala 136:50]
      confidence <= 3'h6; // @[pfb_entry.scala 137:18]
    end else if (wire_pfu_pfb_entry_confidence_set) begin // @[pfb_entry.scala 138:51]
      confidence <= wire_pfu_pfb_entry_confidence_next; // @[pfb_entry.scala 139:18]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  pc = _RAND_0[14:0];
  _RAND_1 = {1{`RANDOM}};
  stride = _RAND_1[10:0];
  _RAND_2 = {1{`RANDOM}};
  strideh_6to0 = _RAND_2[6:0];
  _RAND_3 = {1{`RANDOM}};
  stride_neg = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  type_ld = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  timeoutCnt = _RAND_5[7:0];
  _RAND_6 = {1{`RANDOM}};
  noReqCnt = _RAND_6[5:0];
  _RAND_7 = {1{`RANDOM}};
  evict = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  confidence = _RAND_8[2:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
