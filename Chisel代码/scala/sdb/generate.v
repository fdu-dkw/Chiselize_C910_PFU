module ct_lsu_pfu_sdb_cmp(
  input         clock,
  input         reset,
  input         io_cp0_lsu_icg_en,
  input         io_cp0_yy_clk_en,
  input         io_cpurst_b,
  input         io_entry_addr0_act,
  input         io_entry_clk,
  input         io_entry_create_dp_vld,
  input         io_entry_create_gateclk_en,
  input         io_entry_pf_inst_vld,
  input         io_entry_stride_keep,
  input         io_entry_vld,
  input         io_forever_cpuclk,
  input  [6:0]  io_ld_da_iid,
  input         io_pad_yy_icg_scan_en,
  input  [39:0] io_pipe_va,
  input         io_rtu_yy_xx_commit0,
  input  [6:0]  io_rtu_yy_xx_commit0_iid,
  input         io_rtu_yy_xx_commit1,
  input  [6:0]  io_rtu_yy_xx_commit1_iid,
  input         io_rtu_yy_xx_commit2,
  input  [6:0]  io_rtu_yy_xx_commit2_iid,
  input         io_rtu_yy_xx_flush,
  output        io_entry_addr_cmp_info_vld,
  output        io_entry_check_stride_success,
  output        io_entry_normal_stride,
  output [10:0] io_entry_stride,
  output        io_entry_stride_neg,
  output [6:0]  io_entry_strideh_6to0
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [63:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [63:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [63:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
`endif // RANDOMIZE_REG_INIT
  wire  x_lsu_entry_cmit_all_gated_clk_clk_in; // @[ct_lsu_pfu_sdb_cmp.scala 117:46]
  wire  x_lsu_entry_cmit_all_gated_clk_clk_out; // @[ct_lsu_pfu_sdb_cmp.scala 117:46]
  wire  x_lsu_entry_cmit_all_gated_clk_external_en; // @[ct_lsu_pfu_sdb_cmp.scala 117:46]
  wire  x_lsu_entry_cmit_all_gated_clk_global_en; // @[ct_lsu_pfu_sdb_cmp.scala 117:46]
  wire  x_lsu_entry_cmit_all_gated_clk_local_en; // @[ct_lsu_pfu_sdb_cmp.scala 117:46]
  wire  x_lsu_entry_cmit_all_gated_clk_module_en; // @[ct_lsu_pfu_sdb_cmp.scala 117:46]
  wire  x_lsu_entry_cmit_all_gated_clk_pad_yy_icg_scan_en; // @[ct_lsu_pfu_sdb_cmp.scala 117:46]
  wire  x_lsu_entry_addr_0_gated_clk_clk_in; // @[ct_lsu_pfu_sdb_cmp.scala 127:44]
  wire  x_lsu_entry_addr_0_gated_clk_clk_out; // @[ct_lsu_pfu_sdb_cmp.scala 127:44]
  wire  x_lsu_entry_addr_0_gated_clk_external_en; // @[ct_lsu_pfu_sdb_cmp.scala 127:44]
  wire  x_lsu_entry_addr_0_gated_clk_global_en; // @[ct_lsu_pfu_sdb_cmp.scala 127:44]
  wire  x_lsu_entry_addr_0_gated_clk_local_en; // @[ct_lsu_pfu_sdb_cmp.scala 127:44]
  wire  x_lsu_entry_addr_0_gated_clk_module_en; // @[ct_lsu_pfu_sdb_cmp.scala 127:44]
  wire  x_lsu_entry_addr_0_gated_clk_pad_yy_icg_scan_en; // @[ct_lsu_pfu_sdb_cmp.scala 127:44]
  wire  x_lsu_entry_addr_1_gated_clk_clk_in; // @[ct_lsu_pfu_sdb_cmp.scala 137:44]
  wire  x_lsu_entry_addr_1_gated_clk_clk_out; // @[ct_lsu_pfu_sdb_cmp.scala 137:44]
  wire  x_lsu_entry_addr_1_gated_clk_external_en; // @[ct_lsu_pfu_sdb_cmp.scala 137:44]
  wire  x_lsu_entry_addr_1_gated_clk_global_en; // @[ct_lsu_pfu_sdb_cmp.scala 137:44]
  wire  x_lsu_entry_addr_1_gated_clk_local_en; // @[ct_lsu_pfu_sdb_cmp.scala 137:44]
  wire  x_lsu_entry_addr_1_gated_clk_module_en; // @[ct_lsu_pfu_sdb_cmp.scala 137:44]
  wire  x_lsu_entry_addr_1_gated_clk_pad_yy_icg_scan_en; // @[ct_lsu_pfu_sdb_cmp.scala 137:44]
  wire  x_lsu_entry_addr_2_gated_clk_clk_in; // @[ct_lsu_pfu_sdb_cmp.scala 147:44]
  wire  x_lsu_entry_addr_2_gated_clk_clk_out; // @[ct_lsu_pfu_sdb_cmp.scala 147:44]
  wire  x_lsu_entry_addr_2_gated_clk_external_en; // @[ct_lsu_pfu_sdb_cmp.scala 147:44]
  wire  x_lsu_entry_addr_2_gated_clk_global_en; // @[ct_lsu_pfu_sdb_cmp.scala 147:44]
  wire  x_lsu_entry_addr_2_gated_clk_local_en; // @[ct_lsu_pfu_sdb_cmp.scala 147:44]
  wire  x_lsu_entry_addr_2_gated_clk_module_en; // @[ct_lsu_pfu_sdb_cmp.scala 147:44]
  wire  x_lsu_entry_addr_2_gated_clk_pad_yy_icg_scan_en; // @[ct_lsu_pfu_sdb_cmp.scala 147:44]
  wire [6:0] x_lsu_sdb_cmp_0_x_iid0; // @[ct_lsu_pfu_sdb_cmp.scala 371:31]
  wire  x_lsu_sdb_cmp_0_x_iid0_older; // @[ct_lsu_pfu_sdb_cmp.scala 371:31]
  wire [6:0] x_lsu_sdb_cmp_0_x_iid1; // @[ct_lsu_pfu_sdb_cmp.scala 371:31]
  wire [6:0] x_lsu_sdb_cmp_1_x_iid0; // @[ct_lsu_pfu_sdb_cmp.scala 378:31]
  wire  x_lsu_sdb_cmp_1_x_iid0_older; // @[ct_lsu_pfu_sdb_cmp.scala 378:31]
  wire [6:0] x_lsu_sdb_cmp_1_x_iid1; // @[ct_lsu_pfu_sdb_cmp.scala 378:31]
  wire [6:0] x_lsu_sdb_cmp_2_x_iid0; // @[ct_lsu_pfu_sdb_cmp.scala 385:31]
  wire  x_lsu_sdb_cmp_2_x_iid0_older; // @[ct_lsu_pfu_sdb_cmp.scala 385:31]
  wire [6:0] x_lsu_sdb_cmp_2_x_iid1; // @[ct_lsu_pfu_sdb_cmp.scala 385:31]
  wire  _T_49 = ~io_cpurst_b; // @[ct_lsu_pfu_sdb_cmp.scala 267:54]
  reg  entry_cmit_reg2; // @[ct_lsu_pfu_sdb_cmp.scala 268:34]
  reg  entry_cmit_reg1; // @[ct_lsu_pfu_sdb_cmp.scala 228:34]
  reg  entry_cmit_reg0; // @[ct_lsu_pfu_sdb_cmp.scala 189:34]
  wire  entry_cmit_all = entry_cmit_reg2 & entry_cmit_reg1 & entry_cmit_reg0; // @[ct_lsu_pfu_sdb_cmp.scala 412:65]
  wire  _entry_cmit_all_clk_en_T = io_entry_vld & entry_cmit_all; // @[ct_lsu_pfu_sdb_cmp.scala 116:66]
  reg  entry_addr_vld_reg0; // @[ct_lsu_pfu_sdb_cmp.scala 176:38]
  wire  entry_addr_dp_set_0 = io_entry_pf_inst_vld & ~entry_addr_vld_reg0; // @[ct_lsu_pfu_sdb_cmp.scala 351:46]
  wire  entry_iid_newer_than_ld_da_0 = x_lsu_sdb_cmp_0_x_iid0_older; // @[ct_lsu_pfu_sdb_cmp.scala 373:33 82:40]
  wire  _entry_newer_than_ld_da_0_T_2 = ~entry_cmit_reg0; // @[ct_lsu_pfu_sdb_cmp.scala 375:73]
  wire  entry_newer_than_ld_da_0 = entry_iid_newer_than_ld_da_0 & ~entry_cmit_reg0 & entry_addr_vld_reg0; // @[ct_lsu_pfu_sdb_cmp.scala 375:97]
  wire  _entry_addr_dp_set_1_T_2 = io_entry_pf_inst_vld & ~entry_newer_than_ld_da_0; // @[ct_lsu_pfu_sdb_cmp.scala 352:46]
  reg  entry_addr_vld_reg1; // @[ct_lsu_pfu_sdb_cmp.scala 215:38]
  wire  entry_iid_newer_than_ld_da_1 = x_lsu_sdb_cmp_1_x_iid0_older; // @[ct_lsu_pfu_sdb_cmp.scala 380:32 82:40]
  wire  _entry_newer_than_ld_da_1_T_2 = ~entry_cmit_reg1; // @[ct_lsu_pfu_sdb_cmp.scala 382:73]
  wire  entry_newer_than_ld_da_1 = entry_iid_newer_than_ld_da_1 & ~entry_cmit_reg1 & entry_addr_vld_reg1; // @[ct_lsu_pfu_sdb_cmp.scala 382:97]
  wire  entry_addr_dp_set_1 = io_entry_pf_inst_vld & ~entry_newer_than_ld_da_0 & (entry_addr_vld_reg0 & ~
    entry_addr_vld_reg1 | entry_newer_than_ld_da_1); // @[ct_lsu_pfu_sdb_cmp.scala 352:85]
  reg  entry_addr_vld_reg2; // @[ct_lsu_pfu_sdb_cmp.scala 255:38]
  wire  entry_iid_newer_than_ld_da_2 = x_lsu_sdb_cmp_2_x_iid0_older; // @[ct_lsu_pfu_sdb_cmp.scala 387:32 82:40]
  wire  _entry_newer_than_ld_da_2_T_2 = ~entry_cmit_reg2; // @[ct_lsu_pfu_sdb_cmp.scala 389:73]
  wire  entry_newer_than_ld_da_2 = entry_iid_newer_than_ld_da_2 & ~entry_cmit_reg2 & entry_addr_vld_reg2; // @[ct_lsu_pfu_sdb_cmp.scala 389:97]
  wire  entry_addr_dp_set_2 = _entry_addr_dp_set_1_T_2 & (entry_addr_vld_reg0 & entry_addr_vld_reg1 & ~
    entry_addr_vld_reg2 | entry_newer_than_ld_da_2); // @[ct_lsu_pfu_sdb_cmp.scala 353:84]
  wire  entry_addr_0_clk = x_lsu_entry_addr_0_gated_clk_clk_out; // @[ct_lsu_pfu_sdb_cmp.scala 129:20 55:30]
  reg [39:0] entry_addr_0_reg; // @[ct_lsu_pfu_sdb_cmp.scala 163:35]
  reg [6:0] entry_iid_0_reg; // @[ct_lsu_pfu_sdb_cmp.scala 164:34]
  wire  entry_flush_uncmit_0 = io_rtu_yy_xx_flush & _entry_newer_than_ld_da_0_T_2; // @[ct_lsu_pfu_sdb_cmp.scala 346:51]
  wire  entry_cmit_all_clk = x_lsu_entry_cmit_all_gated_clk_clk_out; // @[ct_lsu_pfu_sdb_cmp.scala 119:22 70:32]
  reg  entry_addr_cmp_info_vld_reg; // @[ct_lsu_pfu_sdb_cmp.scala 296:46]
  wire  entry_clr_addr_info_vld = entry_cmit_all & entry_addr_cmp_info_vld_reg; // @[ct_lsu_pfu_sdb_cmp.scala 414:45]
  wire  _T_9 = io_entry_create_dp_vld | entry_flush_uncmit_0 | entry_clr_addr_info_vld; // @[ct_lsu_pfu_sdb_cmp.scala 178:65]
  wire  entry_addr_set_0 = entry_addr_dp_set_0 & io_entry_addr0_act; // @[ct_lsu_pfu_sdb_cmp.scala 354:52]
  wire  _GEN_2 = entry_addr_set_0 | entry_addr_vld_reg0; // @[ct_lsu_pfu_sdb_cmp.scala 181:42 182:29 176:38]
  wire [7:0] _entry_cmit_hit0_0_T_1 = {io_rtu_yy_xx_commit0,io_rtu_yy_xx_commit0_iid}; // @[ct_lsu_pfu_sdb_cmp.scala 329:44]
  wire [7:0] _entry_cmit_hit0_0_T_3 = {1'h1,entry_iid_0_reg}; // @[ct_lsu_pfu_sdb_cmp.scala 329:80]
  wire  entry_cmit_hit0_0 = _entry_cmit_hit0_0_T_1 == _entry_cmit_hit0_0_T_3; // @[ct_lsu_pfu_sdb_cmp.scala 329:73]
  wire [7:0] _entry_cmit_hit1_0_T_1 = {io_rtu_yy_xx_commit1,io_rtu_yy_xx_commit1_iid}; // @[ct_lsu_pfu_sdb_cmp.scala 330:44]
  wire  entry_cmit_hit1_0 = _entry_cmit_hit1_0_T_1 == _entry_cmit_hit0_0_T_3; // @[ct_lsu_pfu_sdb_cmp.scala 330:73]
  wire [7:0] _entry_cmit_hit2_0_T_1 = {io_rtu_yy_xx_commit2,io_rtu_yy_xx_commit2_iid}; // @[ct_lsu_pfu_sdb_cmp.scala 331:44]
  wire  entry_cmit_hit2_0 = _entry_cmit_hit2_0_T_1 == _entry_cmit_hit0_0_T_3; // @[ct_lsu_pfu_sdb_cmp.scala 331:73]
  wire  entry_cmit_set_0 = (entry_cmit_hit0_0 | entry_cmit_hit1_0 | entry_cmit_hit2_0) & entry_addr_vld_reg0; // @[ct_lsu_pfu_sdb_cmp.scala 332:112]
  wire  _GEN_4 = entry_cmit_set_0 | entry_cmit_reg0; // @[ct_lsu_pfu_sdb_cmp.scala 194:42 195:25 189:34]
  wire  entry_addr_1_clk = x_lsu_entry_addr_1_gated_clk_clk_out; // @[ct_lsu_pfu_sdb_cmp.scala 139:20 58:30]
  reg [39:0] entry_addr_1_reg; // @[ct_lsu_pfu_sdb_cmp.scala 202:35]
  reg [6:0] entry_iid_1_reg; // @[ct_lsu_pfu_sdb_cmp.scala 203:34]
  wire  entry_flush_uncmit_1 = io_rtu_yy_xx_flush & _entry_newer_than_ld_da_1_T_2; // @[ct_lsu_pfu_sdb_cmp.scala 345:51]
  wire  _T_27 = io_entry_create_dp_vld | entry_flush_uncmit_1 | entry_clr_addr_info_vld; // @[ct_lsu_pfu_sdb_cmp.scala 217:65]
  wire  _GEN_8 = entry_addr_dp_set_1 | entry_addr_vld_reg1; // @[ct_lsu_pfu_sdb_cmp.scala 220:42 221:29 215:38]
  wire [7:0] _entry_cmit_hit0_1_T_3 = {1'h1,entry_iid_1_reg}; // @[ct_lsu_pfu_sdb_cmp.scala 334:80]
  wire  entry_cmit_hit0_1 = _entry_cmit_hit0_0_T_1 == _entry_cmit_hit0_1_T_3; // @[ct_lsu_pfu_sdb_cmp.scala 334:73]
  wire  entry_cmit_hit1_1 = _entry_cmit_hit1_0_T_1 == _entry_cmit_hit0_1_T_3; // @[ct_lsu_pfu_sdb_cmp.scala 335:73]
  wire  entry_cmit_hit2_1 = _entry_cmit_hit2_0_T_1 == _entry_cmit_hit0_1_T_3; // @[ct_lsu_pfu_sdb_cmp.scala 336:73]
  wire  entry_cmit_set_1 = (entry_cmit_hit0_1 | entry_cmit_hit1_1 | entry_cmit_hit2_1) & entry_addr_vld_reg1; // @[ct_lsu_pfu_sdb_cmp.scala 337:112]
  wire  _GEN_10 = entry_cmit_set_1 | entry_cmit_reg1; // @[ct_lsu_pfu_sdb_cmp.scala 233:42 234:25 228:34]
  wire  entry_addr_2_clk = x_lsu_entry_addr_2_gated_clk_clk_out; // @[ct_lsu_pfu_sdb_cmp.scala 149:20 61:30]
  reg [39:0] entry_addr_2_reg; // @[ct_lsu_pfu_sdb_cmp.scala 242:35]
  reg [6:0] entry_iid_2_reg; // @[ct_lsu_pfu_sdb_cmp.scala 243:34]
  wire  entry_flush_uncmit_2 = io_rtu_yy_xx_flush & _entry_newer_than_ld_da_2_T_2; // @[ct_lsu_pfu_sdb_cmp.scala 344:51]
  wire  _T_45 = io_entry_create_dp_vld | entry_flush_uncmit_2 | entry_clr_addr_info_vld; // @[ct_lsu_pfu_sdb_cmp.scala 257:65]
  wire  _GEN_14 = entry_addr_dp_set_2 | entry_addr_vld_reg2; // @[ct_lsu_pfu_sdb_cmp.scala 260:42 261:29 255:38]
  wire [7:0] _entry_cmit_hit0_2_T_3 = {1'h1,entry_iid_2_reg}; // @[ct_lsu_pfu_sdb_cmp.scala 339:80]
  wire  entry_cmit_hit0_2 = _entry_cmit_hit0_0_T_1 == _entry_cmit_hit0_2_T_3; // @[ct_lsu_pfu_sdb_cmp.scala 339:73]
  wire  entry_cmit_hit1_2 = _entry_cmit_hit1_0_T_1 == _entry_cmit_hit0_2_T_3; // @[ct_lsu_pfu_sdb_cmp.scala 340:73]
  wire  entry_cmit_hit2_2 = _entry_cmit_hit2_0_T_1 == _entry_cmit_hit0_2_T_3; // @[ct_lsu_pfu_sdb_cmp.scala 341:73]
  wire  entry_cmit_set_2 = (entry_cmit_hit0_2 | entry_cmit_hit1_2 | entry_cmit_hit2_2) & entry_addr_vld_reg2; // @[ct_lsu_pfu_sdb_cmp.scala 342:112]
  wire  _GEN_16 = entry_cmit_set_2 | entry_cmit_reg2; // @[ct_lsu_pfu_sdb_cmp.scala 273:42 274:25 268:34]
  reg  entry_stride_neg_reg; // @[ct_lsu_pfu_sdb_cmp.scala 282:39]
  reg [10:0] entry_stride_reg; // @[ct_lsu_pfu_sdb_cmp.scala 283:35]
  wire [39:0] entry_stride_0to1 = entry_addr_1_reg - entry_addr_0_reg; // @[ct_lsu_pfu_sdb_cmp.scala 395:43]
  wire  entry_stride_create_vld = entry_cmit_all & ~io_entry_stride_keep & ~entry_addr_cmp_info_vld_reg; // @[ct_lsu_pfu_sdb_cmp.scala 413:67]
  wire  entry_stride_neg_set = entry_stride_0to1[39]; // @[ct_lsu_pfu_sdb_cmp.scala 397:44]
  reg  entry_stride_diff_eq_reg; // @[ct_lsu_pfu_sdb_cmp.scala 297:43]
  reg  entry_stride_0to1_neg_cross_2k_reg; // @[ct_lsu_pfu_sdb_cmp.scala 298:53]
  reg  entry_stride_0to1_pos_cross_2k_reg; // @[ct_lsu_pfu_sdb_cmp.scala 299:53]
  reg  entry_stride_0to1_zero_reg; // @[ct_lsu_pfu_sdb_cmp.scala 300:45]
  reg  entry_stride_cmp0_eq_reg; // @[ct_lsu_pfu_sdb_cmp.scala 301:43]
  wire  _GEN_20 = _entry_cmit_all_clk_en_T | entry_addr_cmp_info_vld_reg; // @[ct_lsu_pfu_sdb_cmp.scala 316:46 317:37 296:46]
  wire [39:0] entry_stride_1to2 = entry_addr_2_reg - entry_addr_1_reg; // @[ct_lsu_pfu_sdb_cmp.scala 396:43]
  wire  entry_stride_diff_eq_set = entry_stride_0to1 == entry_stride_1to2; // @[ct_lsu_pfu_sdb_cmp.scala 398:55]
  wire [11:0] _entry_stride_cmp0_eq_set_T_2 = {entry_stride_neg_reg,entry_stride_reg}; // @[ct_lsu_pfu_sdb_cmp.scala 399:76]
  wire  entry_stride_cmp0_eq_set = entry_stride_0to1[11:0] == _entry_stride_cmp0_eq_set_T_2; // @[ct_lsu_pfu_sdb_cmp.scala 399:55]
  wire  entry_stride_0to1_zero_set = entry_stride_0to1 == 40'h0; // @[ct_lsu_pfu_sdb_cmp.scala 402:60]
  wire [39:0] entry_stride_1to0 = entry_addr_0_reg - entry_addr_1_reg; // @[ct_lsu_pfu_sdb_cmp.scala 394:43]
  wire  entry_stride_0to1_cross_2k = entry_stride_neg_reg & entry_stride_0to1_neg_cross_2k_reg | ~entry_stride_neg_reg
     & entry_stride_0to1_pos_cross_2k_reg; // @[ct_lsu_pfu_sdb_cmp.scala 403:98]
  wire  entry_normal_stride = ~entry_stride_0to1_zero_reg & ~entry_stride_0to1_cross_2k & entry_stride_diff_eq_reg; // @[ct_lsu_pfu_sdb_cmp.scala 406:90]
  wire  entry_stride_neg_ge_cache_line = ~(entry_stride_reg[10] & entry_stride_reg[9] & entry_stride_reg[8] &
    entry_stride_reg[7] & entry_stride_reg[6]); // @[ct_lsu_pfu_sdb_cmp.scala 419:37]
  wire  entry_stride_pos_ge_cache_line = entry_stride_reg[10] | entry_stride_reg[9] | entry_stride_reg[8] |
    entry_stride_reg[7] | entry_stride_reg[6]; // @[ct_lsu_pfu_sdb_cmp.scala 420:132]
  wire  entry_stride_ge_cache_line = entry_stride_neg_reg ? entry_stride_neg_ge_cache_line :
    entry_stride_pos_ge_cache_line; // @[ct_lsu_pfu_sdb_cmp.scala 421:36]
  gated_clk_cell x_lsu_entry_cmit_all_gated_clk ( // @[ct_lsu_pfu_sdb_cmp.scala 117:46]
    .clk_in(x_lsu_entry_cmit_all_gated_clk_clk_in),
    .clk_out(x_lsu_entry_cmit_all_gated_clk_clk_out),
    .external_en(x_lsu_entry_cmit_all_gated_clk_external_en),
    .global_en(x_lsu_entry_cmit_all_gated_clk_global_en),
    .local_en(x_lsu_entry_cmit_all_gated_clk_local_en),
    .module_en(x_lsu_entry_cmit_all_gated_clk_module_en),
    .pad_yy_icg_scan_en(x_lsu_entry_cmit_all_gated_clk_pad_yy_icg_scan_en)
  );
  gated_clk_cell x_lsu_entry_addr_0_gated_clk ( // @[ct_lsu_pfu_sdb_cmp.scala 127:44]
    .clk_in(x_lsu_entry_addr_0_gated_clk_clk_in),
    .clk_out(x_lsu_entry_addr_0_gated_clk_clk_out),
    .external_en(x_lsu_entry_addr_0_gated_clk_external_en),
    .global_en(x_lsu_entry_addr_0_gated_clk_global_en),
    .local_en(x_lsu_entry_addr_0_gated_clk_local_en),
    .module_en(x_lsu_entry_addr_0_gated_clk_module_en),
    .pad_yy_icg_scan_en(x_lsu_entry_addr_0_gated_clk_pad_yy_icg_scan_en)
  );
  gated_clk_cell x_lsu_entry_addr_1_gated_clk ( // @[ct_lsu_pfu_sdb_cmp.scala 137:44]
    .clk_in(x_lsu_entry_addr_1_gated_clk_clk_in),
    .clk_out(x_lsu_entry_addr_1_gated_clk_clk_out),
    .external_en(x_lsu_entry_addr_1_gated_clk_external_en),
    .global_en(x_lsu_entry_addr_1_gated_clk_global_en),
    .local_en(x_lsu_entry_addr_1_gated_clk_local_en),
    .module_en(x_lsu_entry_addr_1_gated_clk_module_en),
    .pad_yy_icg_scan_en(x_lsu_entry_addr_1_gated_clk_pad_yy_icg_scan_en)
  );
  gated_clk_cell x_lsu_entry_addr_2_gated_clk ( // @[ct_lsu_pfu_sdb_cmp.scala 147:44]
    .clk_in(x_lsu_entry_addr_2_gated_clk_clk_in),
    .clk_out(x_lsu_entry_addr_2_gated_clk_clk_out),
    .external_en(x_lsu_entry_addr_2_gated_clk_external_en),
    .global_en(x_lsu_entry_addr_2_gated_clk_global_en),
    .local_en(x_lsu_entry_addr_2_gated_clk_local_en),
    .module_en(x_lsu_entry_addr_2_gated_clk_module_en),
    .pad_yy_icg_scan_en(x_lsu_entry_addr_2_gated_clk_pad_yy_icg_scan_en)
  );
  ct_rtu_compare_iid x_lsu_sdb_cmp_0 ( // @[ct_lsu_pfu_sdb_cmp.scala 371:31]
    .x_iid0(x_lsu_sdb_cmp_0_x_iid0),
    .x_iid0_older(x_lsu_sdb_cmp_0_x_iid0_older),
    .x_iid1(x_lsu_sdb_cmp_0_x_iid1)
  );
  ct_rtu_compare_iid x_lsu_sdb_cmp_1 ( // @[ct_lsu_pfu_sdb_cmp.scala 378:31]
    .x_iid0(x_lsu_sdb_cmp_1_x_iid0),
    .x_iid0_older(x_lsu_sdb_cmp_1_x_iid0_older),
    .x_iid1(x_lsu_sdb_cmp_1_x_iid1)
  );
  ct_rtu_compare_iid x_lsu_sdb_cmp_2 ( // @[ct_lsu_pfu_sdb_cmp.scala 385:31]
    .x_iid0(x_lsu_sdb_cmp_2_x_iid0),
    .x_iid0_older(x_lsu_sdb_cmp_2_x_iid0_older),
    .x_iid1(x_lsu_sdb_cmp_2_x_iid1)
  );
  assign io_entry_addr_cmp_info_vld = entry_addr_cmp_info_vld_reg; // @[ct_lsu_pfu_sdb_cmp.scala 424:57]
  assign io_entry_check_stride_success = entry_normal_stride & entry_stride_cmp0_eq_reg; // @[ct_lsu_pfu_sdb_cmp.scala 407:53]
  assign io_entry_normal_stride = ~entry_stride_0to1_zero_reg & ~entry_stride_0to1_cross_2k & entry_stride_diff_eq_reg; // @[ct_lsu_pfu_sdb_cmp.scala 406:90]
  assign io_entry_stride = entry_stride_reg; // @[ct_lsu_pfu_sdb_cmp.scala 285:18 44:26]
  assign io_entry_stride_neg = entry_stride_neg_reg; // @[ct_lsu_pfu_sdb_cmp.scala 428:43]
  assign io_entry_strideh_6to0 = entry_stride_ge_cache_line ? entry_stride_reg[6:0] : 7'h40; // @[ct_lsu_pfu_sdb_cmp.scala 422:28]
  assign x_lsu_entry_cmit_all_gated_clk_clk_in = io_forever_cpuclk; // @[ct_lsu_pfu_sdb_cmp.scala 118:44]
  assign x_lsu_entry_cmit_all_gated_clk_external_en = 1'h0; // @[ct_lsu_pfu_sdb_cmp.scala 120:49]
  assign x_lsu_entry_cmit_all_gated_clk_global_en = io_cp0_yy_clk_en; // @[ct_lsu_pfu_sdb_cmp.scala 121:47]
  assign x_lsu_entry_cmit_all_gated_clk_local_en = io_entry_create_gateclk_en | io_entry_vld & entry_cmit_all; // @[ct_lsu_pfu_sdb_cmp.scala 116:52]
  assign x_lsu_entry_cmit_all_gated_clk_module_en = io_cp0_lsu_icg_en; // @[ct_lsu_pfu_sdb_cmp.scala 123:47]
  assign x_lsu_entry_cmit_all_gated_clk_pad_yy_icg_scan_en = io_pad_yy_icg_scan_en; // @[ct_lsu_pfu_sdb_cmp.scala 124:56]
  assign x_lsu_entry_addr_0_gated_clk_clk_in = io_forever_cpuclk; // @[ct_lsu_pfu_sdb_cmp.scala 128:42]
  assign x_lsu_entry_addr_0_gated_clk_external_en = 1'h0; // @[ct_lsu_pfu_sdb_cmp.scala 130:47]
  assign x_lsu_entry_addr_0_gated_clk_global_en = io_cp0_yy_clk_en; // @[ct_lsu_pfu_sdb_cmp.scala 131:45]
  assign x_lsu_entry_addr_0_gated_clk_local_en = io_entry_pf_inst_vld & ~entry_addr_vld_reg0; // @[ct_lsu_pfu_sdb_cmp.scala 351:46]
  assign x_lsu_entry_addr_0_gated_clk_module_en = io_cp0_lsu_icg_en; // @[ct_lsu_pfu_sdb_cmp.scala 133:45]
  assign x_lsu_entry_addr_0_gated_clk_pad_yy_icg_scan_en = io_pad_yy_icg_scan_en; // @[ct_lsu_pfu_sdb_cmp.scala 134:54]
  assign x_lsu_entry_addr_1_gated_clk_clk_in = io_forever_cpuclk; // @[ct_lsu_pfu_sdb_cmp.scala 138:42]
  assign x_lsu_entry_addr_1_gated_clk_external_en = 1'h0; // @[ct_lsu_pfu_sdb_cmp.scala 140:47]
  assign x_lsu_entry_addr_1_gated_clk_global_en = io_cp0_yy_clk_en; // @[ct_lsu_pfu_sdb_cmp.scala 141:45]
  assign x_lsu_entry_addr_1_gated_clk_local_en = io_entry_pf_inst_vld & ~entry_newer_than_ld_da_0 & (entry_addr_vld_reg0
     & ~entry_addr_vld_reg1 | entry_newer_than_ld_da_1); // @[ct_lsu_pfu_sdb_cmp.scala 352:85]
  assign x_lsu_entry_addr_1_gated_clk_module_en = io_cp0_lsu_icg_en; // @[ct_lsu_pfu_sdb_cmp.scala 143:45]
  assign x_lsu_entry_addr_1_gated_clk_pad_yy_icg_scan_en = io_pad_yy_icg_scan_en; // @[ct_lsu_pfu_sdb_cmp.scala 144:54]
  assign x_lsu_entry_addr_2_gated_clk_clk_in = io_forever_cpuclk; // @[ct_lsu_pfu_sdb_cmp.scala 148:42]
  assign x_lsu_entry_addr_2_gated_clk_external_en = 1'h0; // @[ct_lsu_pfu_sdb_cmp.scala 150:47]
  assign x_lsu_entry_addr_2_gated_clk_global_en = io_cp0_yy_clk_en; // @[ct_lsu_pfu_sdb_cmp.scala 151:45]
  assign x_lsu_entry_addr_2_gated_clk_local_en = _entry_addr_dp_set_1_T_2 & (entry_addr_vld_reg0 & entry_addr_vld_reg1
     & ~entry_addr_vld_reg2 | entry_newer_than_ld_da_2); // @[ct_lsu_pfu_sdb_cmp.scala 353:84]
  assign x_lsu_entry_addr_2_gated_clk_module_en = io_cp0_lsu_icg_en; // @[ct_lsu_pfu_sdb_cmp.scala 153:45]
  assign x_lsu_entry_addr_2_gated_clk_pad_yy_icg_scan_en = io_pad_yy_icg_scan_en; // @[ct_lsu_pfu_sdb_cmp.scala 154:54]
  assign x_lsu_sdb_cmp_0_x_iid0 = io_ld_da_iid; // @[ct_lsu_pfu_sdb_cmp.scala 372:41]
  assign x_lsu_sdb_cmp_0_x_iid1 = entry_iid_0_reg; // @[ct_lsu_pfu_sdb_cmp.scala 374:43]
  assign x_lsu_sdb_cmp_1_x_iid0 = io_ld_da_iid; // @[ct_lsu_pfu_sdb_cmp.scala 379:41]
  assign x_lsu_sdb_cmp_1_x_iid1 = entry_iid_1_reg; // @[ct_lsu_pfu_sdb_cmp.scala 381:43]
  assign x_lsu_sdb_cmp_2_x_iid0 = io_ld_da_iid; // @[ct_lsu_pfu_sdb_cmp.scala 386:41]
  assign x_lsu_sdb_cmp_2_x_iid1 = entry_iid_2_reg; // @[ct_lsu_pfu_sdb_cmp.scala 388:43]
  always @(posedge io_entry_clk or posedge _T_49) begin
    if (_T_49) begin // @[ct_lsu_pfu_sdb_cmp.scala 270:93]
      entry_cmit_reg2 <= 1'h0; // @[ct_lsu_pfu_sdb_cmp.scala 271:25]
    end else if (_T_45) begin
      entry_cmit_reg2 <= 1'h0;
    end else begin
      entry_cmit_reg2 <= _GEN_16;
    end
  end
  always @(posedge io_entry_clk or posedge _T_49) begin
    if (_T_49) begin // @[ct_lsu_pfu_sdb_cmp.scala 230:93]
      entry_cmit_reg1 <= 1'h0; // @[ct_lsu_pfu_sdb_cmp.scala 231:25]
    end else if (_T_27) begin
      entry_cmit_reg1 <= 1'h0;
    end else begin
      entry_cmit_reg1 <= _GEN_10;
    end
  end
  always @(posedge io_entry_clk or posedge _T_49) begin
    if (_T_49) begin // @[ct_lsu_pfu_sdb_cmp.scala 191:93]
      entry_cmit_reg0 <= 1'h0; // @[ct_lsu_pfu_sdb_cmp.scala 192:25]
    end else if (_T_9) begin
      entry_cmit_reg0 <= 1'h0;
    end else begin
      entry_cmit_reg0 <= _GEN_4;
    end
  end
  always @(posedge io_entry_clk or posedge _T_49) begin
    if (_T_49) begin // @[ct_lsu_pfu_sdb_cmp.scala 178:93]
      entry_addr_vld_reg0 <= 1'h0; // @[ct_lsu_pfu_sdb_cmp.scala 179:29]
    end else if (io_entry_create_dp_vld | entry_flush_uncmit_0 | entry_clr_addr_info_vld) begin
      entry_addr_vld_reg0 <= 1'h0;
    end else begin
      entry_addr_vld_reg0 <= _GEN_2;
    end
  end
  always @(posedge io_entry_clk or posedge _T_49) begin
    if (_T_49) begin // @[ct_lsu_pfu_sdb_cmp.scala 217:93]
      entry_addr_vld_reg1 <= 1'h0; // @[ct_lsu_pfu_sdb_cmp.scala 218:29]
    end else if (io_entry_create_dp_vld | entry_flush_uncmit_1 | entry_clr_addr_info_vld) begin
      entry_addr_vld_reg1 <= 1'h0;
    end else begin
      entry_addr_vld_reg1 <= _GEN_8;
    end
  end
  always @(posedge io_entry_clk or posedge _T_49) begin
    if (_T_49) begin // @[ct_lsu_pfu_sdb_cmp.scala 257:93]
      entry_addr_vld_reg2 <= 1'h0; // @[ct_lsu_pfu_sdb_cmp.scala 258:29]
    end else if (io_entry_create_dp_vld | entry_flush_uncmit_2 | entry_clr_addr_info_vld) begin
      entry_addr_vld_reg2 <= 1'h0;
    end else begin
      entry_addr_vld_reg2 <= _GEN_14;
    end
  end
  always @(posedge entry_addr_0_clk or posedge _T_49) begin
    if (_T_49) begin // @[ct_lsu_pfu_sdb_cmp.scala 167:40]
      entry_addr_0_reg <= 40'h0; // @[ct_lsu_pfu_sdb_cmp.scala 168:26]
    end else if (entry_addr_dp_set_0) begin // @[ct_lsu_pfu_sdb_cmp.scala 163:35]
      entry_addr_0_reg <= io_pipe_va;
    end
  end
  always @(posedge entry_addr_0_clk or posedge _T_49) begin
    if (_T_49) begin // @[ct_lsu_pfu_sdb_cmp.scala 167:40]
      entry_iid_0_reg <= 7'h0; // @[ct_lsu_pfu_sdb_cmp.scala 169:25]
    end else if (entry_addr_dp_set_0) begin // @[ct_lsu_pfu_sdb_cmp.scala 164:34]
      entry_iid_0_reg <= io_ld_da_iid;
    end
  end
  always @(posedge entry_cmit_all_clk or posedge _T_49) begin
    if (_T_49) begin // @[ct_lsu_pfu_sdb_cmp.scala 308:61]
      entry_addr_cmp_info_vld_reg <= 1'h0; // @[ct_lsu_pfu_sdb_cmp.scala 309:37]
    end else if (io_entry_create_dp_vld | entry_clr_addr_info_vld) begin
      entry_addr_cmp_info_vld_reg <= 1'h0;
    end else begin
      entry_addr_cmp_info_vld_reg <= _GEN_20;
    end
  end
  always @(posedge entry_addr_1_clk or posedge _T_49) begin
    if (_T_49) begin // @[ct_lsu_pfu_sdb_cmp.scala 206:40]
      entry_addr_1_reg <= 40'h0; // @[ct_lsu_pfu_sdb_cmp.scala 207:26]
    end else if (entry_addr_dp_set_1) begin // @[ct_lsu_pfu_sdb_cmp.scala 202:35]
      entry_addr_1_reg <= io_pipe_va;
    end
  end
  always @(posedge entry_addr_1_clk or posedge _T_49) begin
    if (_T_49) begin // @[ct_lsu_pfu_sdb_cmp.scala 206:40]
      entry_iid_1_reg <= 7'h0; // @[ct_lsu_pfu_sdb_cmp.scala 208:25]
    end else if (entry_addr_dp_set_1) begin // @[ct_lsu_pfu_sdb_cmp.scala 203:34]
      entry_iid_1_reg <= io_ld_da_iid;
    end
  end
  always @(posedge entry_addr_2_clk or posedge _T_49) begin
    if (_T_49) begin // @[ct_lsu_pfu_sdb_cmp.scala 246:40]
      entry_addr_2_reg <= 40'h0; // @[ct_lsu_pfu_sdb_cmp.scala 366:27]
    end else if (entry_addr_dp_set_2) begin // @[ct_lsu_pfu_sdb_cmp.scala 242:35]
      if (entry_newer_than_ld_da_1) begin
        entry_addr_2_reg <= entry_addr_1_reg;
      end else begin
        entry_addr_2_reg <= io_pipe_va;
      end
    end
  end
  always @(posedge entry_addr_2_clk or posedge _T_49) begin
    if (_T_49) begin // @[ct_lsu_pfu_sdb_cmp.scala 246:40]
      entry_iid_2_reg <= 7'h0; // @[ct_lsu_pfu_sdb_cmp.scala 367:26]
    end else if (entry_addr_dp_set_2) begin // @[ct_lsu_pfu_sdb_cmp.scala 243:34]
      if (entry_newer_than_ld_da_1) begin
        entry_iid_2_reg <= entry_iid_1_reg;
      end else begin
        entry_iid_2_reg <= io_ld_da_iid;
      end
    end
  end
  always @(posedge entry_cmit_all_clk or posedge _T_49) begin
    if (_T_49) begin // @[ct_lsu_pfu_sdb_cmp.scala 286:36]
      entry_stride_neg_reg <= 1'h0; // @[ct_lsu_pfu_sdb_cmp.scala 287:30]
    end else if (entry_stride_create_vld) begin // @[ct_lsu_pfu_sdb_cmp.scala 282:39]
      entry_stride_neg_reg <= entry_stride_neg_set;
    end
  end
  always @(posedge entry_cmit_all_clk or posedge _T_49) begin
    if (_T_49) begin // @[ct_lsu_pfu_sdb_cmp.scala 286:36]
      entry_stride_reg <= 11'h0; // @[ct_lsu_pfu_sdb_cmp.scala 288:26]
    end else if (entry_stride_create_vld) begin // @[ct_lsu_pfu_sdb_cmp.scala 283:35]
      entry_stride_reg <= entry_stride_0to1[10:0];
    end
  end
  always @(posedge entry_cmit_all_clk or posedge _T_49) begin
    if (_T_49) begin // @[ct_lsu_pfu_sdb_cmp.scala 308:61]
      entry_stride_diff_eq_reg <= 1'h0; // @[ct_lsu_pfu_sdb_cmp.scala 310:34]
    end else if (io_entry_create_dp_vld | entry_clr_addr_info_vld) begin // @[ct_lsu_pfu_sdb_cmp.scala 316:46]
      entry_stride_diff_eq_reg <= 1'h0; // @[ct_lsu_pfu_sdb_cmp.scala 318:34]
    end else if (_entry_cmit_all_clk_en_T) begin // @[ct_lsu_pfu_sdb_cmp.scala 297:43]
      entry_stride_diff_eq_reg <= entry_stride_diff_eq_set;
    end
  end
  always @(posedge entry_cmit_all_clk or posedge _T_49) begin
    if (_T_49) begin // @[ct_lsu_pfu_sdb_cmp.scala 308:61]
      entry_stride_0to1_neg_cross_2k_reg <= 1'h0; // @[ct_lsu_pfu_sdb_cmp.scala 314:44]
    end else if (io_entry_create_dp_vld | entry_clr_addr_info_vld) begin // @[ct_lsu_pfu_sdb_cmp.scala 316:46]
      entry_stride_0to1_neg_cross_2k_reg <= 1'h0; // @[ct_lsu_pfu_sdb_cmp.scala 401:44]
    end else if (_entry_cmit_all_clk_en_T) begin // @[ct_lsu_pfu_sdb_cmp.scala 298:53]
      if (entry_stride_1to0[39:12] == 28'h0) begin
        entry_stride_0to1_neg_cross_2k_reg <= 1'h0;
      end else begin
        entry_stride_0to1_neg_cross_2k_reg <= 1'h1;
      end
    end
  end
  always @(posedge entry_cmit_all_clk or posedge _T_49) begin
    if (_T_49) begin // @[ct_lsu_pfu_sdb_cmp.scala 308:61]
      entry_stride_0to1_pos_cross_2k_reg <= 1'h0; // @[ct_lsu_pfu_sdb_cmp.scala 313:44]
    end else if (io_entry_create_dp_vld | entry_clr_addr_info_vld) begin // @[ct_lsu_pfu_sdb_cmp.scala 316:46]
      entry_stride_0to1_pos_cross_2k_reg <= 1'h0; // @[ct_lsu_pfu_sdb_cmp.scala 400:44]
    end else if (_entry_cmit_all_clk_en_T) begin // @[ct_lsu_pfu_sdb_cmp.scala 299:53]
      if (entry_stride_0to1[39:12] == 28'h0) begin
        entry_stride_0to1_pos_cross_2k_reg <= 1'h0;
      end else begin
        entry_stride_0to1_pos_cross_2k_reg <= 1'h1;
      end
    end
  end
  always @(posedge entry_cmit_all_clk or posedge _T_49) begin
    if (_T_49) begin // @[ct_lsu_pfu_sdb_cmp.scala 308:61]
      entry_stride_0to1_zero_reg <= 1'h0; // @[ct_lsu_pfu_sdb_cmp.scala 312:36]
    end else if (io_entry_create_dp_vld | entry_clr_addr_info_vld) begin // @[ct_lsu_pfu_sdb_cmp.scala 316:46]
      entry_stride_0to1_zero_reg <= 1'h0; // @[ct_lsu_pfu_sdb_cmp.scala 320:36]
    end else if (_entry_cmit_all_clk_en_T) begin // @[ct_lsu_pfu_sdb_cmp.scala 300:45]
      entry_stride_0to1_zero_reg <= entry_stride_0to1_zero_set;
    end
  end
  always @(posedge entry_cmit_all_clk or posedge _T_49) begin
    if (_T_49) begin // @[ct_lsu_pfu_sdb_cmp.scala 308:61]
      entry_stride_cmp0_eq_reg <= 1'h0; // @[ct_lsu_pfu_sdb_cmp.scala 311:34]
    end else if (io_entry_create_dp_vld | entry_clr_addr_info_vld) begin // @[ct_lsu_pfu_sdb_cmp.scala 316:46]
      entry_stride_cmp0_eq_reg <= 1'h0; // @[ct_lsu_pfu_sdb_cmp.scala 319:34]
    end else if (_entry_cmit_all_clk_en_T) begin // @[ct_lsu_pfu_sdb_cmp.scala 301:43]
      entry_stride_cmp0_eq_reg <= entry_stride_cmp0_eq_set;
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
  entry_cmit_reg2 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  entry_cmit_reg1 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  entry_cmit_reg0 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  entry_addr_vld_reg0 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  entry_addr_vld_reg1 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  entry_addr_vld_reg2 = _RAND_5[0:0];
  _RAND_6 = {2{`RANDOM}};
  entry_addr_0_reg = _RAND_6[39:0];
  _RAND_7 = {1{`RANDOM}};
  entry_iid_0_reg = _RAND_7[6:0];
  _RAND_8 = {1{`RANDOM}};
  entry_addr_cmp_info_vld_reg = _RAND_8[0:0];
  _RAND_9 = {2{`RANDOM}};
  entry_addr_1_reg = _RAND_9[39:0];
  _RAND_10 = {1{`RANDOM}};
  entry_iid_1_reg = _RAND_10[6:0];
  _RAND_11 = {2{`RANDOM}};
  entry_addr_2_reg = _RAND_11[39:0];
  _RAND_12 = {1{`RANDOM}};
  entry_iid_2_reg = _RAND_12[6:0];
  _RAND_13 = {1{`RANDOM}};
  entry_stride_neg_reg = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  entry_stride_reg = _RAND_14[10:0];
  _RAND_15 = {1{`RANDOM}};
  entry_stride_diff_eq_reg = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  entry_stride_0to1_neg_cross_2k_reg = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  entry_stride_0to1_pos_cross_2k_reg = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  entry_stride_0to1_zero_reg = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  entry_stride_cmp0_eq_reg = _RAND_19[0:0];
`endif // RANDOMIZE_REG_INIT
  if (_T_49) begin
    entry_cmit_reg2 = 1'h0;
  end
  if (_T_49) begin
    entry_cmit_reg1 = 1'h0;
  end
  if (_T_49) begin
    entry_cmit_reg0 = 1'h0;
  end
  if (_T_49) begin
    entry_addr_vld_reg0 = 1'h0;
  end
  if (_T_49) begin
    entry_addr_vld_reg1 = 1'h0;
  end
  if (_T_49) begin
    entry_addr_vld_reg2 = 1'h0;
  end
  if (_T_49) begin
    entry_addr_0_reg = 40'h0;
  end
  if (_T_49) begin
    entry_iid_0_reg = 7'h0;
  end
  if (_T_49) begin
    entry_addr_cmp_info_vld_reg = 1'h0;
  end
  if (_T_49) begin
    entry_addr_1_reg = 40'h0;
  end
  if (_T_49) begin
    entry_iid_1_reg = 7'h0;
  end
  if (_T_49) begin
    entry_addr_2_reg = 40'h0;
  end
  if (_T_49) begin
    entry_iid_2_reg = 7'h0;
  end
  if (_T_49) begin
    entry_stride_neg_reg = 1'h0;
  end
  if (_T_49) begin
    entry_stride_reg = 11'h0;
  end
  if (_T_49) begin
    entry_stride_diff_eq_reg = 1'h0;
  end
  if (_T_49) begin
    entry_stride_0to1_neg_cross_2k_reg = 1'h0;
  end
  if (_T_49) begin
    entry_stride_0to1_pos_cross_2k_reg = 1'h0;
  end
  if (_T_49) begin
    entry_stride_0to1_zero_reg = 1'h0;
  end
  if (_T_49) begin
    entry_stride_cmp0_eq_reg = 1'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
