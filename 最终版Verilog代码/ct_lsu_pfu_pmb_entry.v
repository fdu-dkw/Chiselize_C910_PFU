module ct_lsu_pfu_pmb_entry(
  input         clock,
  input         reset,
  input         amr_wa_cancel,
  input         cp0_lsu_icg_en,
  input         cp0_lsu_l2_st_pref_en,
  input         cp0_yy_clk_en,
  input         cpurst_b,
  input  [14:0] ld_da_ldfifo_pc,
  input         ld_da_pfu_act_dp_vld,
  input         ld_da_pfu_evict_cnt_vld,
  input         ld_da_pfu_pf_inst_vld,
  input         lsu_special_clk,
  input         pad_yy_icg_scan_en,
  input         pfu_pmb_entry_create_dp_vld_x,
  input         pfu_pmb_entry_create_gateclk_en_x,
  input         pfu_pmb_entry_create_vld_x,
  input         pfu_pmb_entry_ready_grnt_x,
  input         pfu_pop_all_part_vld,
  input  [14:0] pipe_create_pc,
  input  [7:0]  pmb_timeout_cnt_val,
  input  [14:0] st_da_pc,
  input         st_da_pfu_evict_cnt_vld,
  input         st_da_pfu_pf_inst_vld,
  output        pfu_pmb_entry_evict_x,
  output        pfu_pmb_entry_hit_pc_x,
  output [14:0] pfu_pmb_entry_pc_v,
  output        pfu_pmb_entry_ready_x,
  output        pfu_pmb_entry_type_ld_x,
  output        pfu_pmb_entry_vld_x
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  wire  x_lsu_pfu_pmb_entry_gated_clk_clk_in; // @[ct_lsu_pfu_pmb_entry.scala 83:46]
  wire  x_lsu_pfu_pmb_entry_gated_clk_external_en; // @[ct_lsu_pfu_pmb_entry.scala 83:46]
  wire  x_lsu_pfu_pmb_entry_gated_clk_global_en; // @[ct_lsu_pfu_pmb_entry.scala 83:46]
  wire  x_lsu_pfu_pmb_entry_gated_clk_local_en; // @[ct_lsu_pfu_pmb_entry.scala 83:46]
  wire  x_lsu_pfu_pmb_entry_gated_clk_module_en; // @[ct_lsu_pfu_pmb_entry.scala 83:46]
  wire  x_lsu_pfu_pmb_entry_gated_clk_pad_yy_icg_scan_en; // @[ct_lsu_pfu_pmb_entry.scala 83:46]
  wire  x_lsu_pfu_pmb_entry_gated_clk_clk_out; // @[ct_lsu_pfu_pmb_entry.scala 83:46]
  wire  x_lsu_pfu_pmb_entry_create_gated_clk_clk_in; // @[ct_lsu_pfu_pmb_entry.scala 94:52]
  wire  x_lsu_pfu_pmb_entry_create_gated_clk_external_en; // @[ct_lsu_pfu_pmb_entry.scala 94:52]
  wire  x_lsu_pfu_pmb_entry_create_gated_clk_global_en; // @[ct_lsu_pfu_pmb_entry.scala 94:52]
  wire  x_lsu_pfu_pmb_entry_create_gated_clk_local_en; // @[ct_lsu_pfu_pmb_entry.scala 94:52]
  wire  x_lsu_pfu_pmb_entry_create_gated_clk_module_en; // @[ct_lsu_pfu_pmb_entry.scala 94:52]
  wire  x_lsu_pfu_pmb_entry_create_gated_clk_pad_yy_icg_scan_en; // @[ct_lsu_pfu_pmb_entry.scala 94:52]
  wire  x_lsu_pfu_pmb_entry_create_gated_clk_clk_out; // @[ct_lsu_pfu_pmb_entry.scala 94:52]
  wire  x_lsu_pfu_pmb_entry_all_pf_inst_gated_clk_clk_in; // @[ct_lsu_pfu_pmb_entry.scala 105:57]
  wire  x_lsu_pfu_pmb_entry_all_pf_inst_gated_clk_external_en; // @[ct_lsu_pfu_pmb_entry.scala 105:57]
  wire  x_lsu_pfu_pmb_entry_all_pf_inst_gated_clk_global_en; // @[ct_lsu_pfu_pmb_entry.scala 105:57]
  wire  x_lsu_pfu_pmb_entry_all_pf_inst_gated_clk_local_en; // @[ct_lsu_pfu_pmb_entry.scala 105:57]
  wire  x_lsu_pfu_pmb_entry_all_pf_inst_gated_clk_module_en; // @[ct_lsu_pfu_pmb_entry.scala 105:57]
  wire  x_lsu_pfu_pmb_entry_all_pf_inst_gated_clk_pad_yy_icg_scan_en; // @[ct_lsu_pfu_pmb_entry.scala 105:57]
  wire  x_lsu_pfu_pmb_entry_all_pf_inst_gated_clk_clk_out; // @[ct_lsu_pfu_pmb_entry.scala 105:57]
  wire  pfu_pmb_entry_clk = x_lsu_pfu_pmb_entry_gated_clk_clk_out; // @[ct_lsu_pfu_pmb_entry.scala 53:31 85:21]
  reg  pfu_pmb_entry_vld_reg; // @[ct_lsu_pfu_pmb_entry.scala 118:40]
  wire  _T = ~cpurst_b; // @[ct_lsu_pfu_pmb_entry.scala 116:40]
  reg  pfu_pmb_entry_ready_reg; // @[ct_lsu_pfu_pmb_entry.scala 119:42]
  reg  pfu_pmb_entry_evict_reg; // @[ct_lsu_pfu_pmb_entry.scala 120:42]
  wire  _GEN_0 = pfu_pmb_entry_create_vld_x | pfu_pmb_entry_vld_reg; // @[ct_lsu_pfu_pmb_entry.scala 128:42 129:31 118:40]
  wire  pfu_pmb_entry_evict_pop = pfu_pmb_entry_vld_reg & pfu_pmb_entry_evict_reg & pfu_pmb_entry_create_dp_vld_x & ~
    pfu_pmb_entry_create_vld_x; // @[ct_lsu_pfu_pmb_entry.scala 205:123]
  wire  pfu_pmb_entry_create_clk = x_lsu_pfu_pmb_entry_create_gated_clk_clk_out; // @[ct_lsu_pfu_pmb_entry.scala 55:38 96:28]
  reg  pfu_pmb_entry_type_ld_reg; // @[ct_lsu_pfu_pmb_entry.scala 144:46]
  wire  pfu_pop_st_all = pfu_pmb_entry_vld_reg & ~pfu_pmb_entry_type_ld_reg & (~cp0_lsu_l2_st_pref_en |
    amr_wa_cancel); // @[ct_lsu_pfu_pmb_entry.scala 201:79]
  wire  pfu_pmb_entry_pop_vld = pfu_pmb_entry_ready_grnt_x | pfu_pmb_entry_evict_pop | pfu_pop_st_all |
    pfu_pop_all_part_vld; // @[ct_lsu_pfu_pmb_entry.scala 206:105]
  wire  _T_1 = pfu_pmb_entry_create_dp_vld_x | pfu_pmb_entry_pop_vld; // @[ct_lsu_pfu_pmb_entry.scala 131:38]
  wire  pfu_pmb_entry_all_pf_inst_clk = x_lsu_pfu_pmb_entry_all_pf_inst_gated_clk_clk_out; // @[ct_lsu_pfu_pmb_entry.scala 107:33 51:43]
  reg  pfu_pmb_entry_cnt_reg; // @[ct_lsu_pfu_pmb_entry.scala 158:42]
  wire [14:0] pipe_cmp_pc = pfu_pmb_entry_type_ld_reg ? ld_da_ldfifo_pc : st_da_pc; // @[ct_lsu_pfu_pmb_entry.scala 180:29]
  reg [14:0] pfu_pmb_entry_pc_reg; // @[ct_lsu_pfu_pmb_entry.scala 143:41]
  wire  entry_hit_pc = pfu_pmb_entry_vld_reg & pipe_cmp_pc == pfu_pmb_entry_pc_reg; // @[ct_lsu_pfu_pmb_entry.scala 185:52]
  wire  pipe_cmp_inst_vld = pfu_pmb_entry_type_ld_reg ? ld_da_pfu_pf_inst_vld : st_da_pfu_pf_inst_vld; // @[ct_lsu_pfu_pmb_entry.scala 179:35]
  wire  pfu_pmb_entry_hit_pc = entry_hit_pc & pipe_cmp_inst_vld; // @[ct_lsu_pfu_pmb_entry.scala 187:48]
  wire  _GEN_2 = pfu_pmb_entry_cnt_reg & pfu_pmb_entry_hit_pc | pfu_pmb_entry_ready_reg; // @[ct_lsu_pfu_pmb_entry.scala 133:65 134:33 119:42]
  reg [7:0] pfu_pmb_entry_timeout_cnt_reg; // @[ct_lsu_pfu_pmb_entry.scala 157:50]
  wire  pfu_pmb_entry_timeout_cnt_full = pfu_pmb_entry_timeout_cnt_reg == pmb_timeout_cnt_val; // @[ct_lsu_pfu_pmb_entry.scala 193:72]
  wire  pfu_sdb_entry_evict_set = pfu_pmb_entry_vld_reg & ~pfu_pmb_entry_ready_reg & pipe_cmp_inst_vld &
    pfu_pmb_entry_timeout_cnt_full & ~pfu_pmb_entry_hit_pc; // @[ct_lsu_pfu_pmb_entry.scala 195:141]
  wire  _GEN_4 = pfu_sdb_entry_evict_set | pfu_pmb_entry_evict_reg; // @[ct_lsu_pfu_pmb_entry.scala 138:41 139:33 120:42]
  wire  pipe_evict_cnt_vld = ld_da_pfu_evict_cnt_vld | st_da_pfu_evict_cnt_vld; // @[ct_lsu_pfu_pmb_entry.scala 181:61]
  wire [7:0] _pfu_pmb_entry_timeout_cnt_reg_T_1 = pfu_pmb_entry_timeout_cnt_reg + 8'h1; // @[ct_lsu_pfu_pmb_entry.scala 174:69]
  gated_clk_cell x_lsu_pfu_pmb_entry_gated_clk ( // @[ct_lsu_pfu_pmb_entry.scala 83:46]
    .clk_in(x_lsu_pfu_pmb_entry_gated_clk_clk_in),
    .external_en(x_lsu_pfu_pmb_entry_gated_clk_external_en),
    .global_en(x_lsu_pfu_pmb_entry_gated_clk_global_en),
    .local_en(x_lsu_pfu_pmb_entry_gated_clk_local_en),
    .module_en(x_lsu_pfu_pmb_entry_gated_clk_module_en),
    .pad_yy_icg_scan_en(x_lsu_pfu_pmb_entry_gated_clk_pad_yy_icg_scan_en),
    .clk_out(x_lsu_pfu_pmb_entry_gated_clk_clk_out)
  );
  gated_clk_cell x_lsu_pfu_pmb_entry_create_gated_clk ( // @[ct_lsu_pfu_pmb_entry.scala 94:52]
    .clk_in(x_lsu_pfu_pmb_entry_create_gated_clk_clk_in),
    .external_en(x_lsu_pfu_pmb_entry_create_gated_clk_external_en),
    .global_en(x_lsu_pfu_pmb_entry_create_gated_clk_global_en),
    .local_en(x_lsu_pfu_pmb_entry_create_gated_clk_local_en),
    .module_en(x_lsu_pfu_pmb_entry_create_gated_clk_module_en),
    .pad_yy_icg_scan_en(x_lsu_pfu_pmb_entry_create_gated_clk_pad_yy_icg_scan_en),
    .clk_out(x_lsu_pfu_pmb_entry_create_gated_clk_clk_out)
  );
  gated_clk_cell x_lsu_pfu_pmb_entry_all_pf_inst_gated_clk ( // @[ct_lsu_pfu_pmb_entry.scala 105:57]
    .clk_in(x_lsu_pfu_pmb_entry_all_pf_inst_gated_clk_clk_in),
    .external_en(x_lsu_pfu_pmb_entry_all_pf_inst_gated_clk_external_en),
    .global_en(x_lsu_pfu_pmb_entry_all_pf_inst_gated_clk_global_en),
    .local_en(x_lsu_pfu_pmb_entry_all_pf_inst_gated_clk_local_en),
    .module_en(x_lsu_pfu_pmb_entry_all_pf_inst_gated_clk_module_en),
    .pad_yy_icg_scan_en(x_lsu_pfu_pmb_entry_all_pf_inst_gated_clk_pad_yy_icg_scan_en),
    .clk_out(x_lsu_pfu_pmb_entry_all_pf_inst_gated_clk_clk_out)
  );
  assign pfu_pmb_entry_evict_x = pfu_pmb_entry_evict_reg; // @[ct_lsu_pfu_pmb_entry.scala 123:25 74:33]
  assign pfu_pmb_entry_hit_pc_x = entry_hit_pc & ~(pfu_pmb_entry_type_ld_reg ^ ld_da_pfu_act_dp_vld); // @[ct_lsu_pfu_pmb_entry.scala 189:56]
  assign pfu_pmb_entry_pc_v = pfu_pmb_entry_pc_reg; // @[ct_lsu_pfu_pmb_entry.scala 145:24 75:30]
  assign pfu_pmb_entry_ready_x = pfu_pmb_entry_ready_reg; // @[ct_lsu_pfu_pmb_entry.scala 122:25 76:33]
  assign pfu_pmb_entry_type_ld_x = pfu_pmb_entry_type_ld_reg; // @[ct_lsu_pfu_pmb_entry.scala 146:29 78:35]
  assign pfu_pmb_entry_vld_x = pfu_pmb_entry_vld_reg; // @[ct_lsu_pfu_pmb_entry.scala 121:23 79:31]
  assign x_lsu_pfu_pmb_entry_gated_clk_clk_in = lsu_special_clk; // @[ct_lsu_pfu_pmb_entry.scala 84:43]
  assign x_lsu_pfu_pmb_entry_gated_clk_external_en = 1'h0; // @[ct_lsu_pfu_pmb_entry.scala 86:48]
  assign x_lsu_pfu_pmb_entry_gated_clk_global_en = cp0_yy_clk_en; // @[ct_lsu_pfu_pmb_entry.scala 87:46]
  assign x_lsu_pfu_pmb_entry_gated_clk_local_en = pfu_pmb_entry_vld_reg | pfu_pmb_entry_create_gateclk_en_x; // @[ct_lsu_pfu_pmb_entry.scala 178:60]
  assign x_lsu_pfu_pmb_entry_gated_clk_module_en = cp0_lsu_icg_en; // @[ct_lsu_pfu_pmb_entry.scala 89:46]
  assign x_lsu_pfu_pmb_entry_gated_clk_pad_yy_icg_scan_en = pad_yy_icg_scan_en; // @[ct_lsu_pfu_pmb_entry.scala 90:55]
  assign x_lsu_pfu_pmb_entry_create_gated_clk_clk_in = lsu_special_clk; // @[ct_lsu_pfu_pmb_entry.scala 95:50]
  assign x_lsu_pfu_pmb_entry_create_gated_clk_external_en = 1'h0; // @[ct_lsu_pfu_pmb_entry.scala 97:55]
  assign x_lsu_pfu_pmb_entry_create_gated_clk_global_en = cp0_yy_clk_en; // @[ct_lsu_pfu_pmb_entry.scala 98:53]
  assign x_lsu_pfu_pmb_entry_create_gated_clk_local_en = pfu_pmb_entry_create_gateclk_en_x; // @[ct_lsu_pfu_pmb_entry.scala 215:43 58:45]
  assign x_lsu_pfu_pmb_entry_create_gated_clk_module_en = cp0_lsu_icg_en; // @[ct_lsu_pfu_pmb_entry.scala 100:53]
  assign x_lsu_pfu_pmb_entry_create_gated_clk_pad_yy_icg_scan_en = pad_yy_icg_scan_en; // @[ct_lsu_pfu_pmb_entry.scala 101:62]
  assign x_lsu_pfu_pmb_entry_all_pf_inst_gated_clk_clk_in = lsu_special_clk; // @[ct_lsu_pfu_pmb_entry.scala 106:55]
  assign x_lsu_pfu_pmb_entry_all_pf_inst_gated_clk_external_en = 1'h0; // @[ct_lsu_pfu_pmb_entry.scala 108:60]
  assign x_lsu_pfu_pmb_entry_all_pf_inst_gated_clk_global_en = cp0_yy_clk_en; // @[ct_lsu_pfu_pmb_entry.scala 109:58]
  assign x_lsu_pfu_pmb_entry_all_pf_inst_gated_clk_local_en = pfu_pmb_entry_vld_reg & (ld_da_pfu_pf_inst_vld |
    st_da_pfu_pf_inst_vld) | pfu_pmb_entry_create_gateclk_en_x; // @[ct_lsu_pfu_pmb_entry.scala 103:125]
  assign x_lsu_pfu_pmb_entry_all_pf_inst_gated_clk_module_en = cp0_lsu_icg_en; // @[ct_lsu_pfu_pmb_entry.scala 111:58]
  assign x_lsu_pfu_pmb_entry_all_pf_inst_gated_clk_pad_yy_icg_scan_en = pad_yy_icg_scan_en; // @[ct_lsu_pfu_pmb_entry.scala 112:67]
  always @(posedge pfu_pmb_entry_clk) begin
    if (_T) begin // @[ct_lsu_pfu_pmb_entry.scala 118:40]
      pfu_pmb_entry_vld_reg <= 1'h0; // @[ct_lsu_pfu_pmb_entry.scala 118:40]
    end else if (pfu_pmb_entry_pop_vld) begin // @[ct_lsu_pfu_pmb_entry.scala 126:32]
      pfu_pmb_entry_vld_reg <= 1'h0; // @[ct_lsu_pfu_pmb_entry.scala 127:29]
    end else begin
      pfu_pmb_entry_vld_reg <= _GEN_0;
    end
    if (_T) begin // @[ct_lsu_pfu_pmb_entry.scala 119:42]
      pfu_pmb_entry_ready_reg <= 1'h0; // @[ct_lsu_pfu_pmb_entry.scala 119:42]
    end else if (pfu_pmb_entry_create_dp_vld_x | pfu_pmb_entry_pop_vld) begin // @[ct_lsu_pfu_pmb_entry.scala 131:64]
      pfu_pmb_entry_ready_reg <= 1'h0; // @[ct_lsu_pfu_pmb_entry.scala 132:31]
    end else begin
      pfu_pmb_entry_ready_reg <= _GEN_2;
    end
    if (_T) begin // @[ct_lsu_pfu_pmb_entry.scala 120:42]
      pfu_pmb_entry_evict_reg <= 1'h0; // @[ct_lsu_pfu_pmb_entry.scala 120:42]
    end else if (_T_1 | pfu_pmb_entry_hit_pc) begin // @[ct_lsu_pfu_pmb_entry.scala 136:92]
      pfu_pmb_entry_evict_reg <= 1'h0; // @[ct_lsu_pfu_pmb_entry.scala 137:31]
    end else begin
      pfu_pmb_entry_evict_reg <= _GEN_4;
    end
  end
  always @(posedge pfu_pmb_entry_create_clk) begin
    if (_T) begin // @[ct_lsu_pfu_pmb_entry.scala 144:46]
      pfu_pmb_entry_type_ld_reg <= 1'h0; // @[ct_lsu_pfu_pmb_entry.scala 144:46]
    end else if (pfu_pmb_entry_create_dp_vld_x) begin // @[ct_lsu_pfu_pmb_entry.scala 151:40]
      pfu_pmb_entry_type_ld_reg <= ld_da_pfu_act_dp_vld; // @[ct_lsu_pfu_pmb_entry.scala 152:35]
    end
    if (_T) begin // @[ct_lsu_pfu_pmb_entry.scala 143:41]
      pfu_pmb_entry_pc_reg <= 15'h0; // @[ct_lsu_pfu_pmb_entry.scala 143:41]
    end else if (pfu_pmb_entry_create_dp_vld_x) begin // @[ct_lsu_pfu_pmb_entry.scala 148:40]
      pfu_pmb_entry_pc_reg <= pipe_create_pc; // @[ct_lsu_pfu_pmb_entry.scala 149:30]
    end
  end
  always @(posedge pfu_pmb_entry_all_pf_inst_clk) begin
    if (_T) begin // @[ct_lsu_pfu_pmb_entry.scala 158:42]
      pfu_pmb_entry_cnt_reg <= 1'h0; // @[ct_lsu_pfu_pmb_entry.scala 158:42]
    end else if (pfu_pmb_entry_create_dp_vld_x) begin // @[ct_lsu_pfu_pmb_entry.scala 162:41]
      pfu_pmb_entry_cnt_reg <= 1'h0; // @[ct_lsu_pfu_pmb_entry.scala 163:31]
    end else if (~pfu_pmb_entry_cnt_reg & pfu_pmb_entry_hit_pc) begin // @[ct_lsu_pfu_pmb_entry.scala 165:63]
      pfu_pmb_entry_cnt_reg <= ~pfu_pmb_entry_cnt_reg; // @[ct_lsu_pfu_pmb_entry.scala 166:33]
    end
    if (_T) begin // @[ct_lsu_pfu_pmb_entry.scala 157:50]
      pfu_pmb_entry_timeout_cnt_reg <= 8'h0; // @[ct_lsu_pfu_pmb_entry.scala 157:50]
    end else if (pfu_pmb_entry_create_dp_vld_x | pfu_pmb_entry_hit_pc) begin // @[ct_lsu_pfu_pmb_entry.scala 170:65]
      pfu_pmb_entry_timeout_cnt_reg <= 8'h0; // @[ct_lsu_pfu_pmb_entry.scala 171:39]
    end else if (pipe_evict_cnt_vld & ~pfu_pmb_entry_timeout_cnt_full) begin // @[ct_lsu_pfu_pmb_entry.scala 173:74]
      pfu_pmb_entry_timeout_cnt_reg <= _pfu_pmb_entry_timeout_cnt_reg_T_1; // @[ct_lsu_pfu_pmb_entry.scala 174:41]
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
  pfu_pmb_entry_vld_reg = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  pfu_pmb_entry_ready_reg = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  pfu_pmb_entry_evict_reg = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  pfu_pmb_entry_type_ld_reg = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  pfu_pmb_entry_cnt_reg = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  pfu_pmb_entry_pc_reg = _RAND_5[14:0];
  _RAND_6 = {1{`RANDOM}};
  pfu_pmb_entry_timeout_cnt_reg = _RAND_6[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
