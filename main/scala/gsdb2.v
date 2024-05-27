module gsdb(
  input         clock,
  input         reset,
  input         io_cp0_lsu_icg_en,
  input         io_cp0_yy_clk_en,
  input         io_cp0_yy_dcache_pref_en,
  input         io_cpurst_b,
  input         io_forever_cpuclk,
  input  [6:0]  io_ld_da_iid,
  input         io_ld_da_pfu_act_vld,
  input         io_ld_da_pfu_pf_inst_vld,
  input  [39:0] io_ld_da_pfu_va,
  input         io_pad_yy_icg_scan_en,
  input         io_pfu_gpfb_vld,
  input         io_pfu_pop_all_vld,
  input         io_rtu_yy_xx_commit0,
  input  [6:0]  io_rtu_yy_xx_commit0_iid,
  input         io_rtu_yy_xx_commit1,
  input  [6:0]  io_rtu_yy_xx_commit1_iid,
  input         io_rtu_yy_xx_commit2,
  input  [6:0]  io_rtu_yy_xx_commit2_iid,
  input         io_rtu_yy_xx_flush,
  output        io_pfu_gsdb_gpfb_create_vld,
  output        io_pfu_gsdb_gpfb_pop_req,
  output [10:0] io_pfu_gsdb_stride,
  output        io_pfu_gsdb_stride_neg,
  output [6:0]  io_pfu_gsdb_strideh_6to0
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
`endif // RANDOMIZE_REG_INIT
  wire  x_lsu_pfu_gsdb_gated_clk_clk_in; // @[gsdb.scala 86:40]
  wire  x_lsu_pfu_gsdb_gated_clk_external_en; // @[gsdb.scala 86:40]
  wire  x_lsu_pfu_gsdb_gated_clk_global_en; // @[gsdb.scala 86:40]
  wire  x_lsu_pfu_gsdb_gated_clk_local_en; // @[gsdb.scala 86:40]
  wire  x_lsu_pfu_gsdb_gated_clk_module_en; // @[gsdb.scala 86:40]
  wire  x_lsu_pfu_gsdb_gated_clk_pad_yy_icg_scan_en; // @[gsdb.scala 86:40]
  wire  x_lsu_pfu_gsdb_gated_clk_clk_out; // @[gsdb.scala 86:40]
  wire  x_lsu_pfu_gsdb_pf_inst_vld_gated_clk_clk_in; // @[gsdb.scala 87:52]
  wire  x_lsu_pfu_gsdb_pf_inst_vld_gated_clk_external_en; // @[gsdb.scala 87:52]
  wire  x_lsu_pfu_gsdb_pf_inst_vld_gated_clk_global_en; // @[gsdb.scala 87:52]
  wire  x_lsu_pfu_gsdb_pf_inst_vld_gated_clk_local_en; // @[gsdb.scala 87:52]
  wire  x_lsu_pfu_gsdb_pf_inst_vld_gated_clk_module_en; // @[gsdb.scala 87:52]
  wire  x_lsu_pfu_gsdb_pf_inst_vld_gated_clk_pad_yy_icg_scan_en; // @[gsdb.scala 87:52]
  wire  x_lsu_pfu_gsdb_pf_inst_vld_gated_clk_clk_out; // @[gsdb.scala 87:52]
  wire  ct_lsu_pfu_sdb_cmp_cp0_lsu_icg_en; // @[gsdb.scala 169:39]
  wire  ct_lsu_pfu_sdb_cmp_cp0_yy_clk_en; // @[gsdb.scala 169:39]
  wire  ct_lsu_pfu_sdb_cmp_cpurst_b; // @[gsdb.scala 169:39]
  wire  ct_lsu_pfu_sdb_cmp_entry_addr0_act; // @[gsdb.scala 169:39]
  wire  ct_lsu_pfu_sdb_cmp_entry_clk; // @[gsdb.scala 169:39]
  wire  ct_lsu_pfu_sdb_cmp_entry_create_dp_vld; // @[gsdb.scala 169:39]
  wire  ct_lsu_pfu_sdb_cmp_entry_create_gateclk_en; // @[gsdb.scala 169:39]
  wire  ct_lsu_pfu_sdb_cmp_entry_pf_inst_vld; // @[gsdb.scala 169:39]
  wire  ct_lsu_pfu_sdb_cmp_entry_stride_keep; // @[gsdb.scala 169:39]
  wire  ct_lsu_pfu_sdb_cmp_entry_vld; // @[gsdb.scala 169:39]
  wire  ct_lsu_pfu_sdb_cmp_forever_cpuclk; // @[gsdb.scala 169:39]
  wire [6:0] ct_lsu_pfu_sdb_cmp_ld_da_iid; // @[gsdb.scala 169:39]
  wire  ct_lsu_pfu_sdb_cmp_pad_yy_icg_scan_en; // @[gsdb.scala 169:39]
  wire [39:0] ct_lsu_pfu_sdb_cmp_pipe_va; // @[gsdb.scala 169:39]
  wire  ct_lsu_pfu_sdb_cmp_rtu_yy_xx_commit0; // @[gsdb.scala 169:39]
  wire [6:0] ct_lsu_pfu_sdb_cmp_rtu_yy_xx_commit0_iid; // @[gsdb.scala 169:39]
  wire  ct_lsu_pfu_sdb_cmp_rtu_yy_xx_commit1; // @[gsdb.scala 169:39]
  wire [6:0] ct_lsu_pfu_sdb_cmp_rtu_yy_xx_commit1_iid; // @[gsdb.scala 169:39]
  wire  ct_lsu_pfu_sdb_cmp_rtu_yy_xx_commit2; // @[gsdb.scala 169:39]
  wire [6:0] ct_lsu_pfu_sdb_cmp_rtu_yy_xx_commit2_iid; // @[gsdb.scala 169:39]
  wire  ct_lsu_pfu_sdb_cmp_rtu_yy_xx_flush; // @[gsdb.scala 169:39]
  wire  ct_lsu_pfu_sdb_cmp_entry_addr_cmp_info_vld; // @[gsdb.scala 169:39]
  wire  ct_lsu_pfu_sdb_cmp_entry_check_stride_success; // @[gsdb.scala 169:39]
  wire  ct_lsu_pfu_sdb_cmp_entry_normal_stride; // @[gsdb.scala 169:39]
  wire [10:0] ct_lsu_pfu_sdb_cmp_entry_stride; // @[gsdb.scala 169:39]
  wire  ct_lsu_pfu_sdb_cmp_entry_stride_neg; // @[gsdb.scala 169:39]
  wire [6:0] ct_lsu_pfu_sdb_cmp_entry_strideh_6to0; // @[gsdb.scala 169:39]
  wire [6:0] ct_rtu_compare_iid_x_iid0; // @[gsdb.scala 272:44]
  wire  ct_rtu_compare_iid_x_iid0_older; // @[gsdb.scala 272:44]
  wire [6:0] ct_rtu_compare_iid_x_iid1; // @[gsdb.scala 272:44]
  wire  pfu_gsdb_clk = x_lsu_pfu_gsdb_gated_clk_clk_out; // @[gsdb.scala 88:26 gsdb.scala 95:16]
  reg  pfu_gsdb_vld; // @[gsdb.scala 124:29]
  wire  _T_48 = ~pfu_gsdb_vld; // @[gsdb.scala 252:37]
  wire  pfu_gsdb_create_vld = _T_48 & io_cp0_yy_dcache_pref_en; // @[gsdb.scala 252:51]
  wire  _T_1 = ~io_cpurst_b; // @[gsdb.scala 111:88]
  wire  _T_2 = ~io_cpurst_b; // @[gsdb.scala 111:114]
  wire  pfu_gsdb_pf_inst_vld_clk = x_lsu_pfu_gsdb_pf_inst_vld_gated_clk_clk_out; // @[gsdb.scala 96:38 gsdb.scala 103:28]
  reg [6:0] pfu_gsdb_newest_pf_inst_iid; // @[gsdb.scala 112:22]
  wire  _T_4 = _T_1 | pfu_gsdb_create_vld; // @[gsdb.scala 113:23]
  reg  _T_11; // @[gsdb.scala 126:47]
  wire  _T_84 = ~_T_11; // @[gsdb.scala 287:67]
  wire  pfu_gsdb_newest_pf_inst_flush_uncmit = io_rtu_yy_xx_flush & _T_84; // @[gsdb.scala 287:64]
  wire  _T_5 = _T_4 | pfu_gsdb_newest_pf_inst_flush_uncmit; // @[gsdb.scala 113:49]
  wire  pfu_gsdb_pf_inst_vld = pfu_gsdb_vld & io_ld_da_pfu_pf_inst_vld; // @[gsdb.scala 246:42]
  wire  _T_6 = pfu_gsdb_vld & pfu_gsdb_pf_inst_vld; // @[gsdb.scala 115:30]
  reg  pfu_gsdb_state_is_get_stride; // @[gsdb.scala 124:29]
  reg  pfu_gsdb_state_is_check_stride; // @[gsdb.scala 124:29]
  reg  pfu_gsdb_state_is_monitor_stride; // @[gsdb.scala 124:29]
  reg  _T_10; // @[gsdb.scala 125:46]
  reg [1:0] _T_12; // @[gsdb.scala 127:42]
  wire [3:0] _T_30 = {pfu_gsdb_vld,pfu_gsdb_state_is_monitor_stride,pfu_gsdb_state_is_check_stride,pfu_gsdb_state_is_get_stride}; // @[gsdb.scala 205:52]
  wire  _T_31 = 4'h0 == _T_30; // @[Conditional.scala 37:30]
  wire  _T_32 = 4'h9 == _T_30; // @[Conditional.scala 37:30]
  wire  _T_26 = ct_lsu_pfu_sdb_cmp_entry_addr_cmp_info_vld; // @[gsdb.scala 171:42 gsdb.scala 195:32]
  wire  _T_27 = ct_lsu_pfu_sdb_cmp_entry_normal_stride; // @[gsdb.scala 172:38 gsdb.scala 196:28]
  wire  _T_33 = _T_26 & _T_27; // @[gsdb.scala 215:42]
  wire  _T_34 = 4'ha == _T_30; // @[Conditional.scala 37:30]
  wire  _T_25 = ct_lsu_pfu_sdb_cmp_entry_check_stride_success; // @[gsdb.scala 170:45 gsdb.scala 194:35]
  wire  _T_35 = _T_26 & _T_25; // @[gsdb.scala 222:42]
  wire  _T_36 = ~_T_25; // @[gsdb.scala 224:51]
  wire  _T_37 = _T_26 & _T_36; // @[gsdb.scala 224:48]
  wire  _T_38 = 4'hc == _T_30; // @[Conditional.scala 37:30]
  wire  confidence_min = _T_12 == 2'h0; // @[gsdb.scala 260:48]
  wire  _T_40 = _T_36 & confidence_min; // @[gsdb.scala 231:77]
  wire  _T_41 = ~io_pfu_gpfb_vld; // @[gsdb.scala 231:98]
  wire  _T_42 = _T_40 | _T_41; // @[gsdb.scala 231:95]
  wire  _T_43 = _T_26 & _T_42; // @[gsdb.scala 231:42]
  wire  _GEN_38 = _T_38 & _T_43; // @[Conditional.scala 39:67]
  wire  _GEN_27 = _T_37 ? 1'h0 : 1'h1; // @[gsdb.scala 224:82]
  wire  _GEN_31 = _T_35 ? 1'h0 : _GEN_27; // @[gsdb.scala 222:76]
  wire  _GEN_43 = _T_34 & _GEN_31; // @[Conditional.scala 39:67]
  wire  _GEN_36 = _T_43 ? 1'h0 : 1'h1; // @[gsdb.scala 231:116]
  wire  _GEN_40 = _T_38 & _GEN_36; // @[Conditional.scala 39:67]
  wire  _GEN_45 = _T_34 | _T_38; // @[Conditional.scala 39:67]
  wire  _GEN_49 = _T_32 | _GEN_45; // @[Conditional.scala 39:67]
  wire  _GEN_10 = _T_6 | _T_10; // @[gsdb.scala 143:55]
  wire  _T_81 = ~_T_10; // @[gsdb.scala 285:77]
  wire  _T_78 = ct_rtu_compare_iid_x_iid0_older | _T_11; // @[gsdb.scala 283:127]
  wire  pfu_gsdb_newest_pf_inst_older_than_ld_da = _T_10 & _T_78; // @[gsdb.scala 283:81]
  wire  _T_82 = _T_81 | pfu_gsdb_newest_pf_inst_older_than_ld_da; // @[gsdb.scala 285:106]
  wire  pfu_gsdb_newest_pf_inst_set = _T_6 & _T_82; // @[gsdb.scala 285:73]
  wire  _T_19 = _T_1 | pfu_gsdb_newest_pf_inst_set; // @[gsdb.scala 147:24]
  wire [7:0] _T_66 = {io_rtu_yy_xx_commit0,io_rtu_yy_xx_commit0_iid}; // @[Cat.scala 29:58]
  wire [7:0] _T_67 = {1'h1,pfu_gsdb_newest_pf_inst_iid}; // @[Cat.scala 29:58]
  wire  pfu_gsdb_newest_pf_inst_cmit_hit0 = _T_66 == _T_67; // @[gsdb.scala 277:94]
  wire [7:0] _T_69 = {io_rtu_yy_xx_commit1,io_rtu_yy_xx_commit0_iid}; // @[Cat.scala 29:58]
  wire  pfu_gsdb_newest_pf_inst_cmit_hit1 = _T_69 == _T_67; // @[gsdb.scala 278:94]
  wire  _T_75 = pfu_gsdb_newest_pf_inst_cmit_hit0 | pfu_gsdb_newest_pf_inst_cmit_hit1; // @[gsdb.scala 281:77]
  wire [7:0] _T_72 = {io_rtu_yy_xx_commit2,io_rtu_yy_xx_commit0_iid}; // @[Cat.scala 29:58]
  wire  pfu_gsdb_newest_pf_inst_cmit_hit2 = _T_72 == _T_67; // @[gsdb.scala 279:94]
  wire  _T_76 = _T_75 | pfu_gsdb_newest_pf_inst_cmit_hit2; // @[gsdb.scala 281:115]
  wire  pfu_gsdb_newest_pf_inst_cmit_set = _T_76 & _T_10; // @[gsdb.scala 281:154]
  wire  _GEN_12 = pfu_gsdb_newest_pf_inst_cmit_set | _T_11; // @[gsdb.scala 149:51]
  wire [1:0] _T_22 = _T_12 - 2'h1; // @[gsdb.scala 161:58]
  wire [1:0] _T_24 = _T_12 + 2'h1; // @[gsdb.scala 163:58]
  wire  _T_59 = pfu_gsdb_state_is_monitor_stride & _T_26; // @[gsdb.scala 265:61]
  wire  _T_60 = _T_59 & _T_25; // @[gsdb.scala 265:91]
  wire  confidence_max = _T_12 == 2'h3; // @[gsdb.scala 259:48]
  wire  _T_61 = ~confidence_max; // @[gsdb.scala 265:127]
  wire  confidence_add_vld = _T_60 & _T_61; // @[gsdb.scala 265:124]
  wire  _T_56 = _T_59 & _T_36; // @[gsdb.scala 263:91]
  wire  _T_57 = ~confidence_min; // @[gsdb.scala 263:128]
  wire  confidence_sub_vld = _T_56 & _T_57; // @[gsdb.scala 263:125]
  wire  _T_52 = pfu_gsdb_state_is_check_stride & _T_26; // @[gsdb.scala 261:59]
  wire  confidence_reset = _T_52 & _T_25; // @[gsdb.scala 261:89]
  wire  _T_45 = ~pfu_gsdb_state_is_get_stride; // @[gsdb.scala 247:74]
  wire  _T_46 = _T_45 | io_ld_da_pfu_act_vld; // @[gsdb.scala 247:106]
  wire  _T_63 = pfu_gsdb_state_is_monitor_stride & io_pfu_gpfb_vld; // @[gsdb.scala 267:65]
  wire  _T_89 = _T_59 & confidence_min; // @[gsdb.scala 293:96]
  gated_clk_cell x_lsu_pfu_gsdb_gated_clk ( // @[gsdb.scala 86:40]
    .clk_in(x_lsu_pfu_gsdb_gated_clk_clk_in),
    .external_en(x_lsu_pfu_gsdb_gated_clk_external_en),
    .global_en(x_lsu_pfu_gsdb_gated_clk_global_en),
    .local_en(x_lsu_pfu_gsdb_gated_clk_local_en),
    .module_en(x_lsu_pfu_gsdb_gated_clk_module_en),
    .pad_yy_icg_scan_en(x_lsu_pfu_gsdb_gated_clk_pad_yy_icg_scan_en),
    .clk_out(x_lsu_pfu_gsdb_gated_clk_clk_out)
  );
  gated_clk_cell x_lsu_pfu_gsdb_pf_inst_vld_gated_clk ( // @[gsdb.scala 87:52]
    .clk_in(x_lsu_pfu_gsdb_pf_inst_vld_gated_clk_clk_in),
    .external_en(x_lsu_pfu_gsdb_pf_inst_vld_gated_clk_external_en),
    .global_en(x_lsu_pfu_gsdb_pf_inst_vld_gated_clk_global_en),
    .local_en(x_lsu_pfu_gsdb_pf_inst_vld_gated_clk_local_en),
    .module_en(x_lsu_pfu_gsdb_pf_inst_vld_gated_clk_module_en),
    .pad_yy_icg_scan_en(x_lsu_pfu_gsdb_pf_inst_vld_gated_clk_pad_yy_icg_scan_en),
    .clk_out(x_lsu_pfu_gsdb_pf_inst_vld_gated_clk_clk_out)
  );
  ct_lsu_pfu_sdb_cmp ct_lsu_pfu_sdb_cmp ( // @[gsdb.scala 169:39]
    .cp0_lsu_icg_en(ct_lsu_pfu_sdb_cmp_cp0_lsu_icg_en),
    .cp0_yy_clk_en(ct_lsu_pfu_sdb_cmp_cp0_yy_clk_en),
    .cpurst_b(ct_lsu_pfu_sdb_cmp_cpurst_b),
    .entry_addr0_act(ct_lsu_pfu_sdb_cmp_entry_addr0_act),
    .entry_clk(ct_lsu_pfu_sdb_cmp_entry_clk),
    .entry_create_dp_vld(ct_lsu_pfu_sdb_cmp_entry_create_dp_vld),
    .entry_create_gateclk_en(ct_lsu_pfu_sdb_cmp_entry_create_gateclk_en),
    .entry_pf_inst_vld(ct_lsu_pfu_sdb_cmp_entry_pf_inst_vld),
    .entry_stride_keep(ct_lsu_pfu_sdb_cmp_entry_stride_keep),
    .entry_vld(ct_lsu_pfu_sdb_cmp_entry_vld),
    .forever_cpuclk(ct_lsu_pfu_sdb_cmp_forever_cpuclk),
    .ld_da_iid(ct_lsu_pfu_sdb_cmp_ld_da_iid),
    .pad_yy_icg_scan_en(ct_lsu_pfu_sdb_cmp_pad_yy_icg_scan_en),
    .pipe_va(ct_lsu_pfu_sdb_cmp_pipe_va),
    .rtu_yy_xx_commit0(ct_lsu_pfu_sdb_cmp_rtu_yy_xx_commit0),
    .rtu_yy_xx_commit0_iid(ct_lsu_pfu_sdb_cmp_rtu_yy_xx_commit0_iid),
    .rtu_yy_xx_commit1(ct_lsu_pfu_sdb_cmp_rtu_yy_xx_commit1),
    .rtu_yy_xx_commit1_iid(ct_lsu_pfu_sdb_cmp_rtu_yy_xx_commit1_iid),
    .rtu_yy_xx_commit2(ct_lsu_pfu_sdb_cmp_rtu_yy_xx_commit2),
    .rtu_yy_xx_commit2_iid(ct_lsu_pfu_sdb_cmp_rtu_yy_xx_commit2_iid),
    .rtu_yy_xx_flush(ct_lsu_pfu_sdb_cmp_rtu_yy_xx_flush),
    .entry_addr_cmp_info_vld(ct_lsu_pfu_sdb_cmp_entry_addr_cmp_info_vld),
    .entry_check_stride_success(ct_lsu_pfu_sdb_cmp_entry_check_stride_success),
    .entry_normal_stride(ct_lsu_pfu_sdb_cmp_entry_normal_stride),
    .entry_stride(ct_lsu_pfu_sdb_cmp_entry_stride),
    .entry_stride_neg(ct_lsu_pfu_sdb_cmp_entry_stride_neg),
    .entry_strideh_6to0(ct_lsu_pfu_sdb_cmp_entry_strideh_6to0)
  );
  ct_rtu_compare_iid ct_rtu_compare_iid ( // @[gsdb.scala 272:44]
    .x_iid0(ct_rtu_compare_iid_x_iid0),
    .x_iid0_older(ct_rtu_compare_iid_x_iid0_older),
    .x_iid1(ct_rtu_compare_iid_x_iid1)
  );
  assign io_pfu_gsdb_gpfb_create_vld = _T_52 & _T_25; // @[gsdb.scala 292:33]
  assign io_pfu_gsdb_gpfb_pop_req = _T_89 & _T_36; // @[gsdb.scala 293:30]
  assign io_pfu_gsdb_stride = ct_lsu_pfu_sdb_cmp_entry_stride; // @[gsdb.scala 197:24]
  assign io_pfu_gsdb_stride_neg = ct_lsu_pfu_sdb_cmp_entry_stride_neg; // @[gsdb.scala 198:28]
  assign io_pfu_gsdb_strideh_6to0 = ct_lsu_pfu_sdb_cmp_entry_strideh_6to0; // @[gsdb.scala 199:30]
  assign x_lsu_pfu_gsdb_gated_clk_clk_in = io_forever_cpuclk; // @[gsdb.scala 89:38]
  assign x_lsu_pfu_gsdb_gated_clk_external_en = 1'h0; // @[gsdb.scala 90:43]
  assign x_lsu_pfu_gsdb_gated_clk_global_en = io_cp0_yy_clk_en; // @[gsdb.scala 91:41]
  assign x_lsu_pfu_gsdb_gated_clk_local_en = pfu_gsdb_vld | pfu_gsdb_create_vld; // @[gsdb.scala 92:40]
  assign x_lsu_pfu_gsdb_gated_clk_module_en = io_cp0_lsu_icg_en; // @[gsdb.scala 93:41]
  assign x_lsu_pfu_gsdb_gated_clk_pad_yy_icg_scan_en = io_pad_yy_icg_scan_en; // @[gsdb.scala 94:50]
  assign x_lsu_pfu_gsdb_pf_inst_vld_gated_clk_clk_in = io_forever_cpuclk; // @[gsdb.scala 97:50]
  assign x_lsu_pfu_gsdb_pf_inst_vld_gated_clk_external_en = 1'h0; // @[gsdb.scala 98:55]
  assign x_lsu_pfu_gsdb_pf_inst_vld_gated_clk_global_en = io_cp0_yy_clk_en; // @[gsdb.scala 99:53]
  assign x_lsu_pfu_gsdb_pf_inst_vld_gated_clk_local_en = pfu_gsdb_vld & io_ld_da_pfu_pf_inst_vld; // @[gsdb.scala 100:52]
  assign x_lsu_pfu_gsdb_pf_inst_vld_gated_clk_module_en = io_cp0_lsu_icg_en; // @[gsdb.scala 101:53]
  assign x_lsu_pfu_gsdb_pf_inst_vld_gated_clk_pad_yy_icg_scan_en = io_pad_yy_icg_scan_en; // @[gsdb.scala 102:62]
  assign ct_lsu_pfu_sdb_cmp_cp0_lsu_icg_en = io_cp0_lsu_icg_en; // @[gsdb.scala 173:45]
  assign ct_lsu_pfu_sdb_cmp_cp0_yy_clk_en = io_cp0_yy_clk_en; // @[gsdb.scala 174:44]
  assign ct_lsu_pfu_sdb_cmp_cpurst_b = io_cpurst_b; // @[gsdb.scala 175:39]
  assign ct_lsu_pfu_sdb_cmp_entry_addr0_act = pfu_gsdb_newest_pf_inst_older_than_ld_da & _T_46; // @[gsdb.scala 176:46]
  assign ct_lsu_pfu_sdb_cmp_entry_clk = x_lsu_pfu_gsdb_gated_clk_clk_out; // @[gsdb.scala 177:40]
  assign ct_lsu_pfu_sdb_cmp_entry_create_dp_vld = _T_48 & io_cp0_yy_dcache_pref_en; // @[gsdb.scala 178:50]
  assign ct_lsu_pfu_sdb_cmp_entry_create_gateclk_en = _T_48 & io_cp0_yy_dcache_pref_en; // @[gsdb.scala 179:54]
  assign ct_lsu_pfu_sdb_cmp_entry_pf_inst_vld = pfu_gsdb_vld & io_ld_da_pfu_pf_inst_vld; // @[gsdb.scala 180:48]
  assign ct_lsu_pfu_sdb_cmp_entry_stride_keep = _T_63 & _T_57; // @[gsdb.scala 181:48]
  assign ct_lsu_pfu_sdb_cmp_entry_vld = pfu_gsdb_vld; // @[gsdb.scala 182:40]
  assign ct_lsu_pfu_sdb_cmp_forever_cpuclk = io_forever_cpuclk; // @[gsdb.scala 183:45]
  assign ct_lsu_pfu_sdb_cmp_ld_da_iid = io_ld_da_iid; // @[gsdb.scala 184:40]
  assign ct_lsu_pfu_sdb_cmp_pad_yy_icg_scan_en = io_pad_yy_icg_scan_en; // @[gsdb.scala 185:49]
  assign ct_lsu_pfu_sdb_cmp_pipe_va = io_ld_da_pfu_va; // @[gsdb.scala 186:38]
  assign ct_lsu_pfu_sdb_cmp_rtu_yy_xx_commit0 = io_rtu_yy_xx_commit0; // @[gsdb.scala 187:48]
  assign ct_lsu_pfu_sdb_cmp_rtu_yy_xx_commit0_iid = io_rtu_yy_xx_commit0_iid; // @[gsdb.scala 188:52]
  assign ct_lsu_pfu_sdb_cmp_rtu_yy_xx_commit1 = io_rtu_yy_xx_commit1; // @[gsdb.scala 189:48]
  assign ct_lsu_pfu_sdb_cmp_rtu_yy_xx_commit1_iid = io_rtu_yy_xx_commit1_iid; // @[gsdb.scala 190:52]
  assign ct_lsu_pfu_sdb_cmp_rtu_yy_xx_commit2 = io_rtu_yy_xx_commit2; // @[gsdb.scala 191:48]
  assign ct_lsu_pfu_sdb_cmp_rtu_yy_xx_commit2_iid = io_rtu_yy_xx_commit2_iid; // @[gsdb.scala 192:52]
  assign ct_lsu_pfu_sdb_cmp_rtu_yy_xx_flush = io_rtu_yy_xx_flush; // @[gsdb.scala 193:46]
  assign ct_rtu_compare_iid_x_iid0 = pfu_gsdb_newest_pf_inst_iid; // @[gsdb.scala 273:42]
  assign ct_rtu_compare_iid_x_iid1 = io_ld_da_iid; // @[gsdb.scala 275:42]
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
  pfu_gsdb_vld = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  pfu_gsdb_newest_pf_inst_iid = _RAND_1[6:0];
  _RAND_2 = {1{`RANDOM}};
  _T_11 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  pfu_gsdb_state_is_get_stride = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  pfu_gsdb_state_is_check_stride = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  pfu_gsdb_state_is_monitor_stride = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  _T_10 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  _T_12 = _RAND_7[1:0];
`endif // RANDOMIZE_REG_INIT
  if (_T_2) begin
    pfu_gsdb_newest_pf_inst_iid = 7'h0;
  end
  if (_T_2) begin
    _T_11 = 1'h0;
  end
  if (_T_2) begin
    _T_10 = 1'h0;
  end
  if (_T_2) begin
    _T_12 = 2'h2;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge pfu_gsdb_clk) begin
    if (_T_1) begin
      pfu_gsdb_vld <= 1'h0;
    end else if (io_pfu_pop_all_vld) begin
      pfu_gsdb_vld <= 1'h0;
    end else if (_T_31) begin
      pfu_gsdb_vld <= pfu_gsdb_create_vld;
    end else begin
      pfu_gsdb_vld <= _GEN_49;
    end
    if (_T_1) begin
      pfu_gsdb_state_is_get_stride <= 1'h0;
    end else if (io_pfu_pop_all_vld) begin
      pfu_gsdb_state_is_get_stride <= 1'h0;
    end else if (_T_31) begin
      pfu_gsdb_state_is_get_stride <= pfu_gsdb_create_vld;
    end else if (_T_32) begin
      if (_T_33) begin
        pfu_gsdb_state_is_get_stride <= 1'h0;
      end else begin
        pfu_gsdb_state_is_get_stride <= 1'h1;
      end
    end else if (_T_34) begin
      if (_T_35) begin
        pfu_gsdb_state_is_get_stride <= 1'h0;
      end else begin
        pfu_gsdb_state_is_get_stride <= _T_37;
      end
    end else begin
      pfu_gsdb_state_is_get_stride <= _GEN_38;
    end
    if (_T_1) begin
      pfu_gsdb_state_is_check_stride <= 1'h0;
    end else if (io_pfu_pop_all_vld) begin
      pfu_gsdb_state_is_check_stride <= 1'h0;
    end else if (_T_31) begin
      pfu_gsdb_state_is_check_stride <= 1'h0;
    end else if (_T_32) begin
      pfu_gsdb_state_is_check_stride <= _T_33;
    end else begin
      pfu_gsdb_state_is_check_stride <= _GEN_43;
    end
    if (_T_1) begin
      pfu_gsdb_state_is_monitor_stride <= 1'h0;
    end else if (io_pfu_pop_all_vld) begin
      pfu_gsdb_state_is_monitor_stride <= 1'h0;
    end else if (_T_31) begin
      pfu_gsdb_state_is_monitor_stride <= 1'h0;
    end else if (_T_32) begin
      pfu_gsdb_state_is_monitor_stride <= 1'h0;
    end else if (_T_34) begin
      pfu_gsdb_state_is_monitor_stride <= _T_35;
    end else begin
      pfu_gsdb_state_is_monitor_stride <= _GEN_40;
    end
  end
  always @(posedge pfu_gsdb_pf_inst_vld_clk or posedge _T_2) begin
    if (_T_2) begin
      pfu_gsdb_newest_pf_inst_iid <= 7'h0;
    end else if (_T_5) begin
      pfu_gsdb_newest_pf_inst_iid <= 7'h0;
    end else if (_T_6) begin
      pfu_gsdb_newest_pf_inst_iid <= io_ld_da_iid;
    end
  end
  always @(posedge pfu_gsdb_clk or posedge _T_2) begin
    if (_T_2) begin
      _T_11 <= 1'h0;
    end else if (_T_19) begin
      _T_11 <= 1'h0;
    end else begin
      _T_11 <= _GEN_12;
    end
  end
  always @(posedge pfu_gsdb_clk or posedge _T_2) begin
    if (_T_2) begin
      _T_10 <= 1'h0;
    end else if (_T_5) begin
      _T_10 <= 1'h0;
    end else begin
      _T_10 <= _GEN_10;
    end
  end
  always @(posedge pfu_gsdb_clk or posedge _T_2) begin
    if (_T_2) begin
      _T_12 <= 2'h2;
    end else if (_T_1) begin
      _T_12 <= 2'h0;
    end else if (confidence_reset) begin
      _T_12 <= 2'h2;
    end else if (confidence_sub_vld) begin
      _T_12 <= _T_22;
    end else if (confidence_add_vld) begin
      _T_12 <= _T_24;
    end
  end
endmodule
