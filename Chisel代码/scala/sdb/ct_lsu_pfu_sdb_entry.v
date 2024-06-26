module ct_lsu_pfu_sdb_entry(
  input         clock,
  input         reset,
  input         io_amr_wa_cancel,
  input         io_cp0_lsu_icg_en,
  input         io_cp0_lsu_l2_st_pref_en,
  input         io_cp0_yy_clk_en,
  input         io_cpurst_b,
  input  [6:0]  io_ld_da_iid,
  input  [14:0] io_ld_da_ldfifo_pc,
  input         io_ld_da_pfu_act_dp_vld,
  input         io_ld_da_pfu_evict_cnt_vld,
  input         io_ld_da_pfu_pf_inst_vld,
  input  [39:0] io_ld_da_ppfu_va,
  input         io_lsu_special_clk,
  input         io_pad_yy_icg_scan_en,
  input         io_pfu_pop_all_part_vld,
  input  [14:0] io_pfu_sdb_create_pc,
  input         io_pfu_sdb_create_type_ld,
  input         io_pfu_sdb_entry_create_dp_vld_x,
  input         io_pfu_sdb_entry_create_gateclk_en_x,
  input         io_pfu_sdb_entry_create_vld_x,
  input         io_pfu_sdb_entry_ready_grnt_x,
  input         io_rtu_yy_xx_commit0,
  input  [6:0]  io_rtu_yy_xx_commit0_iid,
  input         io_rtu_yy_xx_commit1,
  input  [6:0]  io_rtu_yy_xx_commit1_iid,
  input         io_rtu_yy_xx_commit2,
  input  [6:0]  io_rtu_yy_xx_commit2_iid,
  input         io_rtu_yy_xx_flush,
  input  [7:0]  io_sdb_timeout_cnt_val,
  input  [6:0]  io_st_da_iid,
  input  [14:0] io_st_da_pc,
  input         io_st_da_pfu_evict_cnt_vld,
  input         io_st_da_pfu_pf_inst_vld,
  input  [39:0] io_st_da_ppfu_va,
  output        io_pfu_sdb_entry_evict_x,
  output        io_pfu_sdb_entry_hit_pc_x,
  output [14:0] io_pfu_sdb_entry_pc_v,
  output        io_pfu_sdb_entry_ready_x,
  output        io_pfu_sdb_entry_stride_neg_x,
  output [10:0] io_pfu_sdb_entry_stride_v,
  output [6:0]  io_pfu_sdb_entry_strideh_6to0_v,
  output        io_pfu_sdb_entry_type_ld_x,
  output        io_pfu_sdb_entry_vld_x
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  wire  gatedClkCell_1_clk_in; // @[ct_lsu_pfu_sdb_entry.scala 145:30]
  wire  gatedClkCell_1_clk_out; // @[ct_lsu_pfu_sdb_entry.scala 145:30]
  wire  gatedClkCell_1_external_en; // @[ct_lsu_pfu_sdb_entry.scala 145:30]
  wire  gatedClkCell_1_global_en; // @[ct_lsu_pfu_sdb_entry.scala 145:30]
  wire  gatedClkCell_1_local_en; // @[ct_lsu_pfu_sdb_entry.scala 145:30]
  wire  gatedClkCell_1_module_en; // @[ct_lsu_pfu_sdb_entry.scala 145:30]
  wire  gatedClkCell_1_pad_yy_icg_scan_en; // @[ct_lsu_pfu_sdb_entry.scala 145:30]
  wire  gatedClkCell_2_clk_in; // @[ct_lsu_pfu_sdb_entry.scala 158:30]
  wire  gatedClkCell_2_clk_out; // @[ct_lsu_pfu_sdb_entry.scala 158:30]
  wire  gatedClkCell_2_external_en; // @[ct_lsu_pfu_sdb_entry.scala 158:30]
  wire  gatedClkCell_2_global_en; // @[ct_lsu_pfu_sdb_entry.scala 158:30]
  wire  gatedClkCell_2_local_en; // @[ct_lsu_pfu_sdb_entry.scala 158:30]
  wire  gatedClkCell_2_module_en; // @[ct_lsu_pfu_sdb_entry.scala 158:30]
  wire  gatedClkCell_2_pad_yy_icg_scan_en; // @[ct_lsu_pfu_sdb_entry.scala 158:30]
  wire  gatedClkCell_3_clk_in; // @[ct_lsu_pfu_sdb_entry.scala 171:30]
  wire  gatedClkCell_3_clk_out; // @[ct_lsu_pfu_sdb_entry.scala 171:30]
  wire  gatedClkCell_3_external_en; // @[ct_lsu_pfu_sdb_entry.scala 171:30]
  wire  gatedClkCell_3_global_en; // @[ct_lsu_pfu_sdb_entry.scala 171:30]
  wire  gatedClkCell_3_local_en; // @[ct_lsu_pfu_sdb_entry.scala 171:30]
  wire  gatedClkCell_3_module_en; // @[ct_lsu_pfu_sdb_entry.scala 171:30]
  wire  gatedClkCell_3_pad_yy_icg_scan_en; // @[ct_lsu_pfu_sdb_entry.scala 171:30]
  wire  ctLsuPfuSdbEntryCmp_cp0_lsu_icg_en; // @[ct_lsu_pfu_sdb_entry.scala 249:35]
  wire  ctLsuPfuSdbEntryCmp_cp0_yy_clk_en; // @[ct_lsu_pfu_sdb_entry.scala 249:35]
  wire  ctLsuPfuSdbEntryCmp_cpurst_b; // @[ct_lsu_pfu_sdb_entry.scala 249:35]
  wire  ctLsuPfuSdbEntryCmp_entry_addr0_act; // @[ct_lsu_pfu_sdb_entry.scala 249:35]
  wire  ctLsuPfuSdbEntryCmp_entry_addr_cmp_info_vld; // @[ct_lsu_pfu_sdb_entry.scala 249:35]
  wire  ctLsuPfuSdbEntryCmp_entry_check_stride_success; // @[ct_lsu_pfu_sdb_entry.scala 249:35]
  wire  ctLsuPfuSdbEntryCmp_entry_clk; // @[ct_lsu_pfu_sdb_entry.scala 249:35]
  wire  ctLsuPfuSdbEntryCmp_entry_create_dp_vld; // @[ct_lsu_pfu_sdb_entry.scala 249:35]
  wire  ctLsuPfuSdbEntryCmp_entry_create_gateclk_en; // @[ct_lsu_pfu_sdb_entry.scala 249:35]
  wire  ctLsuPfuSdbEntryCmp_entry_normal_stride; // @[ct_lsu_pfu_sdb_entry.scala 249:35]
  wire  ctLsuPfuSdbEntryCmp_entry_pf_inst_vld; // @[ct_lsu_pfu_sdb_entry.scala 249:35]
  wire [10:0] ctLsuPfuSdbEntryCmp_entry_stride; // @[ct_lsu_pfu_sdb_entry.scala 249:35]
  wire  ctLsuPfuSdbEntryCmp_entry_stride_keep; // @[ct_lsu_pfu_sdb_entry.scala 249:35]
  wire  ctLsuPfuSdbEntryCmp_entry_stride_neg; // @[ct_lsu_pfu_sdb_entry.scala 249:35]
  wire [6:0] ctLsuPfuSdbEntryCmp_entry_strideh_6to0; // @[ct_lsu_pfu_sdb_entry.scala 249:35]
  wire  ctLsuPfuSdbEntryCmp_entry_vld; // @[ct_lsu_pfu_sdb_entry.scala 249:35]
  wire  ctLsuPfuSdbEntryCmp_forever_cpuclk; // @[ct_lsu_pfu_sdb_entry.scala 249:35]
  wire [6:0] ctLsuPfuSdbEntryCmp_ld_da_iid; // @[ct_lsu_pfu_sdb_entry.scala 249:35]
  wire  ctLsuPfuSdbEntryCmp_pad_yy_icg_scan_en; // @[ct_lsu_pfu_sdb_entry.scala 249:35]
  wire [39:0] ctLsuPfuSdbEntryCmp_pipe_va; // @[ct_lsu_pfu_sdb_entry.scala 249:35]
  wire  ctLsuPfuSdbEntryCmp_rtu_yy_xx_commit0; // @[ct_lsu_pfu_sdb_entry.scala 249:35]
  wire [6:0] ctLsuPfuSdbEntryCmp_rtu_yy_xx_commit0_iid; // @[ct_lsu_pfu_sdb_entry.scala 249:35]
  wire  ctLsuPfuSdbEntryCmp_rtu_yy_xx_commit1; // @[ct_lsu_pfu_sdb_entry.scala 249:35]
  wire [6:0] ctLsuPfuSdbEntryCmp_rtu_yy_xx_commit1_iid; // @[ct_lsu_pfu_sdb_entry.scala 249:35]
  wire  ctLsuPfuSdbEntryCmp_rtu_yy_xx_commit2; // @[ct_lsu_pfu_sdb_entry.scala 249:35]
  wire [6:0] ctLsuPfuSdbEntryCmp_rtu_yy_xx_commit2_iid; // @[ct_lsu_pfu_sdb_entry.scala 249:35]
  wire  ctLsuPfuSdbEntryCmp_rtu_yy_xx_flush; // @[ct_lsu_pfu_sdb_entry.scala 249:35]
  reg  pfu_sdb_entry_evict; // @[ct_lsu_pfu_sdb_entry.scala 57:36]
  reg [14:0] pfu_sdb_entry_pc; // @[ct_lsu_pfu_sdb_entry.scala 58:33]
  reg [7:0] pfu_sdb_entry_timeout_cnt; // @[ct_lsu_pfu_sdb_entry.scala 60:42]
  reg  pfu_sdb_entry_type_ld; // @[ct_lsu_pfu_sdb_entry.scala 61:38]
  reg  pfu_sdb_entry_vld; // @[ct_lsu_pfu_sdb_entry.scala 62:34]
  wire  _T = ~io_cpurst_b; // @[ct_lsu_pfu_sdb_entry.scala 187:40]
  wire  _GEN_0 = io_pfu_sdb_entry_create_vld_x | pfu_sdb_entry_vld; // @[ct_lsu_pfu_sdb_entry.scala 192:44 193:25 62:34]
  wire  pfu_sdb_entry_normal_stride = ctLsuPfuSdbEntryCmp_entry_normal_stride; // @[ct_lsu_pfu_sdb_entry.scala 102:41 260:31]
  wire  pfu_sdb_entry_addr_cmp_info_vld = ctLsuPfuSdbEntryCmp_entry_addr_cmp_info_vld; // @[ct_lsu_pfu_sdb_entry.scala 255:35 84:45]
  wire  pfu_pop_st_all = pfu_sdb_entry_vld & ~pfu_sdb_entry_type_ld & (~io_cp0_lsu_l2_st_pref_en | io_amr_wa_cancel); // @[ct_lsu_pfu_sdb_entry.scala 317:65]
  wire  pfu_sdb_entry_pop_vld = io_pfu_sdb_entry_ready_grnt_x | ~pfu_sdb_entry_normal_stride &
    pfu_sdb_entry_addr_cmp_info_vld & pfu_sdb_entry_vld | pfu_pop_st_all | io_pfu_pop_all_part_vld; // @[ct_lsu_pfu_sdb_entry.scala 320:159]
  wire [14:0] pipe_cmp_pc = pfu_sdb_entry_type_ld ? io_ld_da_ldfifo_pc : io_st_da_pc; // @[ct_lsu_pfu_sdb_entry.scala 284:21]
  wire  pfu_sdb_entry_hit_pc = pfu_sdb_entry_vld & pipe_cmp_pc == pfu_sdb_entry_pc; // @[ct_lsu_pfu_sdb_entry.scala 295:45]
  wire  pipe_cmp_inst_vld = pfu_sdb_entry_type_ld ? io_ld_da_pfu_pf_inst_vld : io_st_da_pfu_pf_inst_vld; // @[ct_lsu_pfu_sdb_entry.scala 282:27]
  wire  pfu_sdb_entry_pf_inst_vld = pfu_sdb_entry_hit_pc & pipe_cmp_inst_vld; // @[ct_lsu_pfu_sdb_entry.scala 297:53]
  wire  pfu_sdb_entry_timeout_cnt_full = pfu_sdb_entry_timeout_cnt == io_sdb_timeout_cnt_val; // @[ct_lsu_pfu_sdb_entry.scala 307:64]
  wire  pipe_evict_cnt_vld = io_ld_da_pfu_evict_cnt_vld | io_st_da_pfu_evict_cnt_vld; // @[ct_lsu_pfu_sdb_entry.scala 286:52]
  wire [7:0] _pfu_sdb_entry_timeout_cnt_T_1 = pfu_sdb_entry_timeout_cnt + 8'h1; // @[ct_lsu_pfu_sdb_entry.scala 228:62]
  wire  pfu_sdb_entry_evict_set = pfu_sdb_entry_vld & pipe_cmp_inst_vld & pfu_sdb_entry_timeout_cnt_full & ~
    pfu_sdb_entry_hit_pc; // @[ct_lsu_pfu_sdb_entry.scala 309:127]
  wire  _GEN_10 = pfu_sdb_entry_evict_set | pfu_sdb_entry_evict; // @[ct_lsu_pfu_sdb_entry.scala 240:41 241:27 57:36]
  gated_clk_cell gatedClkCell_1 ( // @[ct_lsu_pfu_sdb_entry.scala 145:30]
    .clk_in(gatedClkCell_1_clk_in),
    .clk_out(gatedClkCell_1_clk_out),
    .external_en(gatedClkCell_1_external_en),
    .global_en(gatedClkCell_1_global_en),
    .local_en(gatedClkCell_1_local_en),
    .module_en(gatedClkCell_1_module_en),
    .pad_yy_icg_scan_en(gatedClkCell_1_pad_yy_icg_scan_en)
  );
  gated_clk_cell gatedClkCell_2 ( // @[ct_lsu_pfu_sdb_entry.scala 158:30]
    .clk_in(gatedClkCell_2_clk_in),
    .clk_out(gatedClkCell_2_clk_out),
    .external_en(gatedClkCell_2_external_en),
    .global_en(gatedClkCell_2_global_en),
    .local_en(gatedClkCell_2_local_en),
    .module_en(gatedClkCell_2_module_en),
    .pad_yy_icg_scan_en(gatedClkCell_2_pad_yy_icg_scan_en)
  );
  gated_clk_cell gatedClkCell_3 ( // @[ct_lsu_pfu_sdb_entry.scala 171:30]
    .clk_in(gatedClkCell_3_clk_in),
    .clk_out(gatedClkCell_3_clk_out),
    .external_en(gatedClkCell_3_external_en),
    .global_en(gatedClkCell_3_global_en),
    .local_en(gatedClkCell_3_local_en),
    .module_en(gatedClkCell_3_module_en),
    .pad_yy_icg_scan_en(gatedClkCell_3_pad_yy_icg_scan_en)
  );
  ct_lsu_pfu_sdb_entry_cmp ctLsuPfuSdbEntryCmp ( // @[ct_lsu_pfu_sdb_entry.scala 249:35]
    .cp0_lsu_icg_en(ctLsuPfuSdbEntryCmp_cp0_lsu_icg_en),
    .cp0_yy_clk_en(ctLsuPfuSdbEntryCmp_cp0_yy_clk_en),
    .cpurst_b(ctLsuPfuSdbEntryCmp_cpurst_b),
    .entry_addr0_act(ctLsuPfuSdbEntryCmp_entry_addr0_act),
    .entry_addr_cmp_info_vld(ctLsuPfuSdbEntryCmp_entry_addr_cmp_info_vld),
    .entry_check_stride_success(ctLsuPfuSdbEntryCmp_entry_check_stride_success),
    .entry_clk(ctLsuPfuSdbEntryCmp_entry_clk),
    .entry_create_dp_vld(ctLsuPfuSdbEntryCmp_entry_create_dp_vld),
    .entry_create_gateclk_en(ctLsuPfuSdbEntryCmp_entry_create_gateclk_en),
    .entry_normal_stride(ctLsuPfuSdbEntryCmp_entry_normal_stride),
    .entry_pf_inst_vld(ctLsuPfuSdbEntryCmp_entry_pf_inst_vld),
    .entry_stride(ctLsuPfuSdbEntryCmp_entry_stride),
    .entry_stride_keep(ctLsuPfuSdbEntryCmp_entry_stride_keep),
    .entry_stride_neg(ctLsuPfuSdbEntryCmp_entry_stride_neg),
    .entry_strideh_6to0(ctLsuPfuSdbEntryCmp_entry_strideh_6to0),
    .entry_vld(ctLsuPfuSdbEntryCmp_entry_vld),
    .forever_cpuclk(ctLsuPfuSdbEntryCmp_forever_cpuclk),
    .ld_da_iid(ctLsuPfuSdbEntryCmp_ld_da_iid),
    .pad_yy_icg_scan_en(ctLsuPfuSdbEntryCmp_pad_yy_icg_scan_en),
    .pipe_va(ctLsuPfuSdbEntryCmp_pipe_va),
    .rtu_yy_xx_commit0(ctLsuPfuSdbEntryCmp_rtu_yy_xx_commit0),
    .rtu_yy_xx_commit0_iid(ctLsuPfuSdbEntryCmp_rtu_yy_xx_commit0_iid),
    .rtu_yy_xx_commit1(ctLsuPfuSdbEntryCmp_rtu_yy_xx_commit1),
    .rtu_yy_xx_commit1_iid(ctLsuPfuSdbEntryCmp_rtu_yy_xx_commit1_iid),
    .rtu_yy_xx_commit2(ctLsuPfuSdbEntryCmp_rtu_yy_xx_commit2),
    .rtu_yy_xx_commit2_iid(ctLsuPfuSdbEntryCmp_rtu_yy_xx_commit2_iid),
    .rtu_yy_xx_flush(ctLsuPfuSdbEntryCmp_rtu_yy_xx_flush)
  );
  assign io_pfu_sdb_entry_evict_x = pfu_sdb_entry_evict; // @[ct_lsu_pfu_sdb_entry.scala 337:39]
  assign io_pfu_sdb_entry_hit_pc_x = pfu_sdb_entry_hit_pc & ~(pfu_sdb_entry_type_ld ^ io_ld_da_pfu_act_dp_vld); // @[ct_lsu_pfu_sdb_entry.scala 300:56]
  assign io_pfu_sdb_entry_pc_v = pfu_sdb_entry_pc; // @[ct_lsu_pfu_sdb_entry.scala 335:39]
  assign io_pfu_sdb_entry_ready_x = 1'h0; // @[ct_lsu_pfu_sdb_entry.scala 336:39]
  assign io_pfu_sdb_entry_stride_neg_x = ctLsuPfuSdbEntryCmp_entry_stride_neg; // @[ct_lsu_pfu_sdb_entry.scala 111:38 264:28]
  assign io_pfu_sdb_entry_stride_v = ctLsuPfuSdbEntryCmp_entry_stride; // @[ct_lsu_pfu_sdb_entry.scala 110:34 262:24]
  assign io_pfu_sdb_entry_strideh_6to0_v = ctLsuPfuSdbEntryCmp_entry_strideh_6to0; // @[ct_lsu_pfu_sdb_entry.scala 114:40 265:30]
  assign io_pfu_sdb_entry_type_ld_x = pfu_sdb_entry_type_ld; // @[ct_lsu_pfu_sdb_entry.scala 341:39]
  assign io_pfu_sdb_entry_vld_x = pfu_sdb_entry_vld; // @[ct_lsu_pfu_sdb_entry.scala 334:39]
  assign gatedClkCell_1_clk_in = io_lsu_special_clk; // @[ct_lsu_pfu_sdb_entry.scala 147:28]
  assign gatedClkCell_1_external_en = 1'h0; // @[ct_lsu_pfu_sdb_entry.scala 149:33]
  assign gatedClkCell_1_global_en = io_cp0_yy_clk_en; // @[ct_lsu_pfu_sdb_entry.scala 150:31]
  assign gatedClkCell_1_local_en = pfu_sdb_entry_vld | io_pfu_sdb_entry_create_gateclk_en_x; // @[ct_lsu_pfu_sdb_entry.scala 142:45]
  assign gatedClkCell_1_module_en = io_cp0_lsu_icg_en; // @[ct_lsu_pfu_sdb_entry.scala 152:31]
  assign gatedClkCell_1_pad_yy_icg_scan_en = io_pad_yy_icg_scan_en; // @[ct_lsu_pfu_sdb_entry.scala 153:40]
  assign gatedClkCell_2_clk_in = io_lsu_special_clk; // @[ct_lsu_pfu_sdb_entry.scala 160:28]
  assign gatedClkCell_2_external_en = 1'h0; // @[ct_lsu_pfu_sdb_entry.scala 162:33]
  assign gatedClkCell_2_global_en = io_cp0_yy_clk_en; // @[ct_lsu_pfu_sdb_entry.scala 163:31]
  assign gatedClkCell_2_local_en = io_pfu_sdb_entry_create_gateclk_en_x; // @[ct_lsu_pfu_sdb_entry.scala 329:36 92:45]
  assign gatedClkCell_2_module_en = io_cp0_lsu_icg_en; // @[ct_lsu_pfu_sdb_entry.scala 165:31]
  assign gatedClkCell_2_pad_yy_icg_scan_en = io_pad_yy_icg_scan_en; // @[ct_lsu_pfu_sdb_entry.scala 166:40]
  assign gatedClkCell_3_clk_in = io_lsu_special_clk; // @[ct_lsu_pfu_sdb_entry.scala 173:28]
  assign gatedClkCell_3_external_en = 1'h0; // @[ct_lsu_pfu_sdb_entry.scala 175:33]
  assign gatedClkCell_3_global_en = io_cp0_yy_clk_en; // @[ct_lsu_pfu_sdb_entry.scala 176:31]
  assign gatedClkCell_3_local_en = pfu_sdb_entry_vld & (io_ld_da_pfu_pf_inst_vld | io_st_da_pfu_pf_inst_vld) |
    io_pfu_sdb_entry_create_gateclk_en_x; // @[ct_lsu_pfu_sdb_entry.scala 168:115]
  assign gatedClkCell_3_module_en = io_cp0_lsu_icg_en; // @[ct_lsu_pfu_sdb_entry.scala 178:31]
  assign gatedClkCell_3_pad_yy_icg_scan_en = io_pad_yy_icg_scan_en; // @[ct_lsu_pfu_sdb_entry.scala 179:40]
  assign ctLsuPfuSdbEntryCmp_cp0_lsu_icg_en = io_cp0_lsu_icg_en; // @[ct_lsu_pfu_sdb_entry.scala 251:41]
  assign ctLsuPfuSdbEntryCmp_cp0_yy_clk_en = io_cp0_yy_clk_en; // @[ct_lsu_pfu_sdb_entry.scala 252:40]
  assign ctLsuPfuSdbEntryCmp_cpurst_b = io_cpurst_b; // @[ct_lsu_pfu_sdb_entry.scala 253:35]
  assign ctLsuPfuSdbEntryCmp_entry_addr0_act = 1'h1; // @[ct_lsu_pfu_sdb_entry.scala 254:42]
  assign ctLsuPfuSdbEntryCmp_entry_clk = gatedClkCell_1_clk_out; // @[ct_lsu_pfu_sdb_entry.scala 148:21 86:31]
  assign ctLsuPfuSdbEntryCmp_entry_create_dp_vld = io_pfu_sdb_entry_create_dp_vld_x; // @[ct_lsu_pfu_sdb_entry.scala 328:36 90:41]
  assign ctLsuPfuSdbEntryCmp_entry_create_gateclk_en = io_pfu_sdb_entry_create_gateclk_en_x; // @[ct_lsu_pfu_sdb_entry.scala 329:36 92:45]
  assign ctLsuPfuSdbEntryCmp_entry_pf_inst_vld = pfu_sdb_entry_hit_pc & pipe_cmp_inst_vld; // @[ct_lsu_pfu_sdb_entry.scala 297:53]
  assign ctLsuPfuSdbEntryCmp_entry_stride_keep = 1'h0; // @[ct_lsu_pfu_sdb_entry.scala 263:44]
  assign ctLsuPfuSdbEntryCmp_entry_vld = pfu_sdb_entry_vld; // @[ct_lsu_pfu_sdb_entry.scala 266:36]
  assign ctLsuPfuSdbEntryCmp_forever_cpuclk = io_lsu_special_clk; // @[ct_lsu_pfu_sdb_entry.scala 267:41]
  assign ctLsuPfuSdbEntryCmp_ld_da_iid = pfu_sdb_entry_type_ld ? io_ld_da_iid : io_st_da_iid; // @[ct_lsu_pfu_sdb_entry.scala 288:18]
  assign ctLsuPfuSdbEntryCmp_pad_yy_icg_scan_en = io_pad_yy_icg_scan_en; // @[ct_lsu_pfu_sdb_entry.scala 269:45]
  assign ctLsuPfuSdbEntryCmp_pipe_va = pfu_sdb_entry_type_ld ? io_ld_da_ppfu_va : io_st_da_ppfu_va; // @[ct_lsu_pfu_sdb_entry.scala 290:22]
  assign ctLsuPfuSdbEntryCmp_rtu_yy_xx_commit0 = io_rtu_yy_xx_commit0; // @[ct_lsu_pfu_sdb_entry.scala 271:44]
  assign ctLsuPfuSdbEntryCmp_rtu_yy_xx_commit0_iid = io_rtu_yy_xx_commit0_iid; // @[ct_lsu_pfu_sdb_entry.scala 272:48]
  assign ctLsuPfuSdbEntryCmp_rtu_yy_xx_commit1 = io_rtu_yy_xx_commit1; // @[ct_lsu_pfu_sdb_entry.scala 273:44]
  assign ctLsuPfuSdbEntryCmp_rtu_yy_xx_commit1_iid = io_rtu_yy_xx_commit1_iid; // @[ct_lsu_pfu_sdb_entry.scala 274:48]
  assign ctLsuPfuSdbEntryCmp_rtu_yy_xx_commit2 = io_rtu_yy_xx_commit2; // @[ct_lsu_pfu_sdb_entry.scala 275:44]
  assign ctLsuPfuSdbEntryCmp_rtu_yy_xx_commit2_iid = io_rtu_yy_xx_commit2_iid; // @[ct_lsu_pfu_sdb_entry.scala 276:48]
  assign ctLsuPfuSdbEntryCmp_rtu_yy_xx_flush = io_rtu_yy_xx_flush; // @[ct_lsu_pfu_sdb_entry.scala 277:42]
  always @(posedge clock) begin
    if (reset) begin // @[ct_lsu_pfu_sdb_entry.scala 57:36]
      pfu_sdb_entry_evict <= 1'h0; // @[ct_lsu_pfu_sdb_entry.scala 57:36]
    end else if (_T) begin // @[ct_lsu_pfu_sdb_entry.scala 236:24]
      pfu_sdb_entry_evict <= 1'h0; // @[ct_lsu_pfu_sdb_entry.scala 237:27]
    end else if (io_pfu_sdb_entry_create_dp_vld_x | pfu_sdb_entry_pop_vld | pfu_sdb_entry_pf_inst_vld) begin // @[ct_lsu_pfu_sdb_entry.scala 238:97]
      pfu_sdb_entry_evict <= 1'h0; // @[ct_lsu_pfu_sdb_entry.scala 239:27]
    end else begin
      pfu_sdb_entry_evict <= _GEN_10;
    end
    if (reset) begin // @[ct_lsu_pfu_sdb_entry.scala 58:33]
      pfu_sdb_entry_pc <= 15'h0; // @[ct_lsu_pfu_sdb_entry.scala 58:33]
    end else if (_T) begin // @[ct_lsu_pfu_sdb_entry.scala 201:25]
      pfu_sdb_entry_pc <= 15'h0; // @[ct_lsu_pfu_sdb_entry.scala 202:24]
    end else if (io_pfu_sdb_entry_create_dp_vld_x) begin // @[ct_lsu_pfu_sdb_entry.scala 203:47]
      pfu_sdb_entry_pc <= io_pfu_sdb_create_pc; // @[ct_lsu_pfu_sdb_entry.scala 204:24]
    end
    if (reset) begin // @[ct_lsu_pfu_sdb_entry.scala 60:42]
      pfu_sdb_entry_timeout_cnt <= 8'h0; // @[ct_lsu_pfu_sdb_entry.scala 60:42]
    end else if (_T) begin // @[ct_lsu_pfu_sdb_entry.scala 223:23]
      pfu_sdb_entry_timeout_cnt <= 8'h0; // @[ct_lsu_pfu_sdb_entry.scala 224:33]
    end else if (io_pfu_sdb_entry_create_dp_vld_x | pfu_sdb_entry_pf_inst_vld) begin // @[ct_lsu_pfu_sdb_entry.scala 225:75]
      pfu_sdb_entry_timeout_cnt <= 8'h0; // @[ct_lsu_pfu_sdb_entry.scala 226:33]
    end else if (pipe_evict_cnt_vld & ~pfu_sdb_entry_timeout_cnt_full) begin // @[ct_lsu_pfu_sdb_entry.scala 227:72]
      pfu_sdb_entry_timeout_cnt <= _pfu_sdb_entry_timeout_cnt_T_1; // @[ct_lsu_pfu_sdb_entry.scala 228:33]
    end
    if (reset) begin // @[ct_lsu_pfu_sdb_entry.scala 61:38]
      pfu_sdb_entry_type_ld <= 1'h0; // @[ct_lsu_pfu_sdb_entry.scala 61:38]
    end else if (_T) begin // @[ct_lsu_pfu_sdb_entry.scala 212:25]
      pfu_sdb_entry_type_ld <= 1'h0; // @[ct_lsu_pfu_sdb_entry.scala 213:29]
    end else if (io_pfu_sdb_entry_create_dp_vld_x) begin // @[ct_lsu_pfu_sdb_entry.scala 214:47]
      pfu_sdb_entry_type_ld <= io_pfu_sdb_create_type_ld; // @[ct_lsu_pfu_sdb_entry.scala 215:29]
    end
    if (reset) begin // @[ct_lsu_pfu_sdb_entry.scala 62:34]
      pfu_sdb_entry_vld <= 1'h0; // @[ct_lsu_pfu_sdb_entry.scala 62:34]
    end else if (_T) begin // @[ct_lsu_pfu_sdb_entry.scala 188:25]
      pfu_sdb_entry_vld <= 1'h0; // @[ct_lsu_pfu_sdb_entry.scala 189:25]
    end else if (pfu_sdb_entry_pop_vld) begin // @[ct_lsu_pfu_sdb_entry.scala 190:41]
      pfu_sdb_entry_vld <= 1'h0; // @[ct_lsu_pfu_sdb_entry.scala 191:25]
    end else begin
      pfu_sdb_entry_vld <= _GEN_0;
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
  pfu_sdb_entry_evict = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  pfu_sdb_entry_pc = _RAND_1[14:0];
  _RAND_2 = {1{`RANDOM}};
  pfu_sdb_entry_timeout_cnt = _RAND_2[7:0];
  _RAND_3 = {1{`RANDOM}};
  pfu_sdb_entry_type_ld = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  pfu_sdb_entry_vld = _RAND_4[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule



