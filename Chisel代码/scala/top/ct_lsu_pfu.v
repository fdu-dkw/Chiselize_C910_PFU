module ct_lsu_pfu(
  input         amr_wa_cancel,
  input         bus_arb_pfu_ar_grnt,
  input         bus_arb_pfu_ar_ready,
  input         cp0_lsu_dcache_en,
  input         cp0_lsu_dcache_pref_en,
  input         cp0_lsu_icg_en,
  input         cp0_lsu_l2_pref_en,
  input         cp0_lsu_l2_st_pref_en,
  input         cp0_lsu_no_op_req,
  input         cp0_lsu_pfu_mmu_dis,
  input  [29:0] cp0_lsu_timeout_cnt,
  input         cp0_yy_clk_en,
  input         cp0_yy_dcache_pref_en,
  input  [1:0]  cp0_yy_priv_mode,
  input         cpurst_b,
  input         forever_cpuclk,
  input         icc_idle,
  input  [6:0]  ld_da_iid,
  input  [14:0] ld_da_ldfifo_pc,
  input         ld_da_page_sec_ff,
  input         ld_da_page_share_ff,
  input         ld_da_pfu_act_dp_vld,
  input         ld_da_pfu_act_vld,
  input         ld_da_pfu_biu_req_hit_idx,
  input         ld_da_pfu_evict_cnt_vld,
  input         ld_da_pfu_pf_inst_vld,
  input  [39:0] ld_da_pfu_va,
  input  [39:0] ld_da_ppfu_va,
  input  [27:0] ld_da_ppn_ff,
  input         lfb_addr_full,
  input         lfb_addr_less2,
  input         lfb_pfu_biu_req_hit_idx,
  input  [4:0]  lfb_pfu_create_id,
  input  [8:0]  lfb_pfu_dcache_hit,
  input  [8:0]  lfb_pfu_dcache_miss,
  input         lfb_pfu_rready_grnt,
  input         lm_pfu_biu_req_hit_idx,
  input  [3:0]  lsu_pfu_l1_dist_sel,
  input  [3:0]  lsu_pfu_l2_dist_sel,
  input         lsu_special_clk,
  input  [27:0] mmu_lsu_pa2,
  input         mmu_lsu_pa2_err,
  input         mmu_lsu_pa2_vld,
  input         mmu_lsu_sec2,
  input         mmu_lsu_share2,
  input         pad_yy_icg_scan_en,
  input         rb_pfu_biu_req_hit_idx,
  input         rb_pfu_nc_no_pending,
  input         rtu_yy_xx_commit0,
  input  [6:0]  rtu_yy_xx_commit0_iid,
  input         rtu_yy_xx_commit1,
  input  [6:0]  rtu_yy_xx_commit1_iid,
  input         rtu_yy_xx_commit2,
  input  [6:0]  rtu_yy_xx_commit2_iid,
  input         rtu_yy_xx_flush,
  input         sq_pfu_pop_synci_inst,
  input  [6:0]  st_da_iid,
  input         st_da_page_sec_ff,
  input         st_da_page_share_ff,
  input  [14:0] st_da_pc,
  input         st_da_pfu_act_dp_vld,
  input         st_da_pfu_act_vld,
  input         st_da_pfu_biu_req_hit_idx,
  input         st_da_pfu_evict_cnt_vld,
  input         st_da_pfu_pf_inst_vld,
  input  [39:0] st_da_ppfu_va,
  input  [27:0] st_da_ppn_ff,
  input         vb_pfu_biu_req_hit_idx,
  input         wmb_pfu_biu_req_hit_idx,
  output [27:0] lsu_mmu_va2,
  output        lsu_mmu_va2_vld,
  output [39:0] pfu_biu_ar_addr,
  output [1:0]  pfu_biu_ar_bar,
  output [1:0]  pfu_biu_ar_burst,
  output [3:0]  pfu_biu_ar_cache,
  output [1:0]  pfu_biu_ar_domain,
  output        pfu_biu_ar_dp_req,
  output [4:0]  pfu_biu_ar_id,
  output [1:0]  pfu_biu_ar_len,
  output        pfu_biu_ar_lock,
  output [2:0]  pfu_biu_ar_prot,
  output        pfu_biu_ar_req,
  output        pfu_biu_ar_req_gateclk_en,
  output [2:0]  pfu_biu_ar_size,
  output [3:0]  pfu_biu_ar_snoop,
  output [2:0]  pfu_biu_ar_user,
  output [39:0] pfu_biu_req_addr,
  output        pfu_icc_ready,
  output        pfu_lfb_create_dp_vld,
  output        pfu_lfb_create_gateclk_en,
  output        pfu_lfb_create_req,
  output        pfu_lfb_create_vld,
  output [3:0]  pfu_lfb_id,
  output        pfu_part_empty,
  output        pfu_pfb_empty,
  output        pfu_sdb_create_gateclk_en,
  output        pfu_sdb_empty
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [63:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
`endif // RANDOMIZE_REG_INIT
  wire  x_lsu_pfu_mmu_pe_gated_clk_clk_in; // @[pfu.scala 302:42]
  wire  x_lsu_pfu_mmu_pe_gated_clk_global_en; // @[pfu.scala 302:42]
  wire  x_lsu_pfu_mmu_pe_gated_clk_module_en; // @[pfu.scala 302:42]
  wire  x_lsu_pfu_mmu_pe_gated_clk_local_en; // @[pfu.scala 302:42]
  wire  x_lsu_pfu_mmu_pe_gated_clk_external_en; // @[pfu.scala 302:42]
  wire  x_lsu_pfu_mmu_pe_gated_clk_pad_yy_icg_scan_en; // @[pfu.scala 302:42]
  wire  x_lsu_pfu_mmu_pe_gated_clk_clk_out; // @[pfu.scala 302:42]
  wire  x_lsu_pfu_biu_pe_gated_clk_clk_in; // @[pfu.scala 314:42]
  wire  x_lsu_pfu_biu_pe_gated_clk_global_en; // @[pfu.scala 314:42]
  wire  x_lsu_pfu_biu_pe_gated_clk_module_en; // @[pfu.scala 314:42]
  wire  x_lsu_pfu_biu_pe_gated_clk_local_en; // @[pfu.scala 314:42]
  wire  x_lsu_pfu_biu_pe_gated_clk_external_en; // @[pfu.scala 314:42]
  wire  x_lsu_pfu_biu_pe_gated_clk_pad_yy_icg_scan_en; // @[pfu.scala 314:42]
  wire  x_lsu_pfu_biu_pe_gated_clk_clk_out; // @[pfu.scala 314:42]
  wire  ct_lsu_pfu_pmb_entry_amr_wa_cancel; // @[pfu.scala 328:11]
  wire  ct_lsu_pfu_pmb_entry_cp0_lsu_icg_en; // @[pfu.scala 328:11]
  wire  ct_lsu_pfu_pmb_entry_cp0_lsu_l2_st_pref_en; // @[pfu.scala 328:11]
  wire  ct_lsu_pfu_pmb_entry_cp0_yy_clk_en; // @[pfu.scala 328:11]
  wire  ct_lsu_pfu_pmb_entry_cpurst_b; // @[pfu.scala 328:11]
  wire [14:0] ct_lsu_pfu_pmb_entry_ld_da_ldfifo_pc; // @[pfu.scala 328:11]
  wire  ct_lsu_pfu_pmb_entry_ld_da_pfu_act_dp_vld; // @[pfu.scala 328:11]
  wire  ct_lsu_pfu_pmb_entry_ld_da_pfu_evict_cnt_vld; // @[pfu.scala 328:11]
  wire  ct_lsu_pfu_pmb_entry_ld_da_pfu_pf_inst_vld; // @[pfu.scala 328:11]
  wire  ct_lsu_pfu_pmb_entry_lsu_special_clk; // @[pfu.scala 328:11]
  wire  ct_lsu_pfu_pmb_entry_pad_yy_icg_scan_en; // @[pfu.scala 328:11]
  wire  ct_lsu_pfu_pmb_entry_pfu_pmb_entry_create_dp_vld_x; // @[pfu.scala 328:11]
  wire  ct_lsu_pfu_pmb_entry_pfu_pmb_entry_create_gateclk_en_x; // @[pfu.scala 328:11]
  wire  ct_lsu_pfu_pmb_entry_pfu_pmb_entry_create_vld_x; // @[pfu.scala 328:11]
  wire  ct_lsu_pfu_pmb_entry_pfu_pmb_entry_ready_grnt_x; // @[pfu.scala 328:11]
  wire  ct_lsu_pfu_pmb_entry_pfu_pop_all_part_vld; // @[pfu.scala 328:11]
  wire [14:0] ct_lsu_pfu_pmb_entry_pipe_create_pc; // @[pfu.scala 328:11]
  wire [7:0] ct_lsu_pfu_pmb_entry_pmb_timeout_cnt_val; // @[pfu.scala 328:11]
  wire [14:0] ct_lsu_pfu_pmb_entry_st_da_pc; // @[pfu.scala 328:11]
  wire  ct_lsu_pfu_pmb_entry_st_da_pfu_evict_cnt_vld; // @[pfu.scala 328:11]
  wire  ct_lsu_pfu_pmb_entry_st_da_pfu_pf_inst_vld; // @[pfu.scala 328:11]
  wire  ct_lsu_pfu_pmb_entry_pfu_pmb_entry_evict_x; // @[pfu.scala 328:11]
  wire  ct_lsu_pfu_pmb_entry_pfu_pmb_entry_hit_pc_x; // @[pfu.scala 328:11]
  wire [14:0] ct_lsu_pfu_pmb_entry_pfu_pmb_entry_pc_v; // @[pfu.scala 328:11]
  wire  ct_lsu_pfu_pmb_entry_pfu_pmb_entry_ready_x; // @[pfu.scala 328:11]
  wire  ct_lsu_pfu_pmb_entry_pfu_pmb_entry_type_ld_x; // @[pfu.scala 328:11]
  wire  ct_lsu_pfu_pmb_entry_pfu_pmb_entry_vld_x; // @[pfu.scala 328:11]
  wire  ct_lsu_pfu_pmb_entry_1_amr_wa_cancel; // @[pfu.scala 329:11]
  wire  ct_lsu_pfu_pmb_entry_1_cp0_lsu_icg_en; // @[pfu.scala 329:11]
  wire  ct_lsu_pfu_pmb_entry_1_cp0_lsu_l2_st_pref_en; // @[pfu.scala 329:11]
  wire  ct_lsu_pfu_pmb_entry_1_cp0_yy_clk_en; // @[pfu.scala 329:11]
  wire  ct_lsu_pfu_pmb_entry_1_cpurst_b; // @[pfu.scala 329:11]
  wire [14:0] ct_lsu_pfu_pmb_entry_1_ld_da_ldfifo_pc; // @[pfu.scala 329:11]
  wire  ct_lsu_pfu_pmb_entry_1_ld_da_pfu_act_dp_vld; // @[pfu.scala 329:11]
  wire  ct_lsu_pfu_pmb_entry_1_ld_da_pfu_evict_cnt_vld; // @[pfu.scala 329:11]
  wire  ct_lsu_pfu_pmb_entry_1_ld_da_pfu_pf_inst_vld; // @[pfu.scala 329:11]
  wire  ct_lsu_pfu_pmb_entry_1_lsu_special_clk; // @[pfu.scala 329:11]
  wire  ct_lsu_pfu_pmb_entry_1_pad_yy_icg_scan_en; // @[pfu.scala 329:11]
  wire  ct_lsu_pfu_pmb_entry_1_pfu_pmb_entry_create_dp_vld_x; // @[pfu.scala 329:11]
  wire  ct_lsu_pfu_pmb_entry_1_pfu_pmb_entry_create_gateclk_en_x; // @[pfu.scala 329:11]
  wire  ct_lsu_pfu_pmb_entry_1_pfu_pmb_entry_create_vld_x; // @[pfu.scala 329:11]
  wire  ct_lsu_pfu_pmb_entry_1_pfu_pmb_entry_ready_grnt_x; // @[pfu.scala 329:11]
  wire  ct_lsu_pfu_pmb_entry_1_pfu_pop_all_part_vld; // @[pfu.scala 329:11]
  wire [14:0] ct_lsu_pfu_pmb_entry_1_pipe_create_pc; // @[pfu.scala 329:11]
  wire [7:0] ct_lsu_pfu_pmb_entry_1_pmb_timeout_cnt_val; // @[pfu.scala 329:11]
  wire [14:0] ct_lsu_pfu_pmb_entry_1_st_da_pc; // @[pfu.scala 329:11]
  wire  ct_lsu_pfu_pmb_entry_1_st_da_pfu_evict_cnt_vld; // @[pfu.scala 329:11]
  wire  ct_lsu_pfu_pmb_entry_1_st_da_pfu_pf_inst_vld; // @[pfu.scala 329:11]
  wire  ct_lsu_pfu_pmb_entry_1_pfu_pmb_entry_evict_x; // @[pfu.scala 329:11]
  wire  ct_lsu_pfu_pmb_entry_1_pfu_pmb_entry_hit_pc_x; // @[pfu.scala 329:11]
  wire [14:0] ct_lsu_pfu_pmb_entry_1_pfu_pmb_entry_pc_v; // @[pfu.scala 329:11]
  wire  ct_lsu_pfu_pmb_entry_1_pfu_pmb_entry_ready_x; // @[pfu.scala 329:11]
  wire  ct_lsu_pfu_pmb_entry_1_pfu_pmb_entry_type_ld_x; // @[pfu.scala 329:11]
  wire  ct_lsu_pfu_pmb_entry_1_pfu_pmb_entry_vld_x; // @[pfu.scala 329:11]
  wire  ct_lsu_pfu_pmb_entry_2_amr_wa_cancel; // @[pfu.scala 330:11]
  wire  ct_lsu_pfu_pmb_entry_2_cp0_lsu_icg_en; // @[pfu.scala 330:11]
  wire  ct_lsu_pfu_pmb_entry_2_cp0_lsu_l2_st_pref_en; // @[pfu.scala 330:11]
  wire  ct_lsu_pfu_pmb_entry_2_cp0_yy_clk_en; // @[pfu.scala 330:11]
  wire  ct_lsu_pfu_pmb_entry_2_cpurst_b; // @[pfu.scala 330:11]
  wire [14:0] ct_lsu_pfu_pmb_entry_2_ld_da_ldfifo_pc; // @[pfu.scala 330:11]
  wire  ct_lsu_pfu_pmb_entry_2_ld_da_pfu_act_dp_vld; // @[pfu.scala 330:11]
  wire  ct_lsu_pfu_pmb_entry_2_ld_da_pfu_evict_cnt_vld; // @[pfu.scala 330:11]
  wire  ct_lsu_pfu_pmb_entry_2_ld_da_pfu_pf_inst_vld; // @[pfu.scala 330:11]
  wire  ct_lsu_pfu_pmb_entry_2_lsu_special_clk; // @[pfu.scala 330:11]
  wire  ct_lsu_pfu_pmb_entry_2_pad_yy_icg_scan_en; // @[pfu.scala 330:11]
  wire  ct_lsu_pfu_pmb_entry_2_pfu_pmb_entry_create_dp_vld_x; // @[pfu.scala 330:11]
  wire  ct_lsu_pfu_pmb_entry_2_pfu_pmb_entry_create_gateclk_en_x; // @[pfu.scala 330:11]
  wire  ct_lsu_pfu_pmb_entry_2_pfu_pmb_entry_create_vld_x; // @[pfu.scala 330:11]
  wire  ct_lsu_pfu_pmb_entry_2_pfu_pmb_entry_ready_grnt_x; // @[pfu.scala 330:11]
  wire  ct_lsu_pfu_pmb_entry_2_pfu_pop_all_part_vld; // @[pfu.scala 330:11]
  wire [14:0] ct_lsu_pfu_pmb_entry_2_pipe_create_pc; // @[pfu.scala 330:11]
  wire [7:0] ct_lsu_pfu_pmb_entry_2_pmb_timeout_cnt_val; // @[pfu.scala 330:11]
  wire [14:0] ct_lsu_pfu_pmb_entry_2_st_da_pc; // @[pfu.scala 330:11]
  wire  ct_lsu_pfu_pmb_entry_2_st_da_pfu_evict_cnt_vld; // @[pfu.scala 330:11]
  wire  ct_lsu_pfu_pmb_entry_2_st_da_pfu_pf_inst_vld; // @[pfu.scala 330:11]
  wire  ct_lsu_pfu_pmb_entry_2_pfu_pmb_entry_evict_x; // @[pfu.scala 330:11]
  wire  ct_lsu_pfu_pmb_entry_2_pfu_pmb_entry_hit_pc_x; // @[pfu.scala 330:11]
  wire [14:0] ct_lsu_pfu_pmb_entry_2_pfu_pmb_entry_pc_v; // @[pfu.scala 330:11]
  wire  ct_lsu_pfu_pmb_entry_2_pfu_pmb_entry_ready_x; // @[pfu.scala 330:11]
  wire  ct_lsu_pfu_pmb_entry_2_pfu_pmb_entry_type_ld_x; // @[pfu.scala 330:11]
  wire  ct_lsu_pfu_pmb_entry_2_pfu_pmb_entry_vld_x; // @[pfu.scala 330:11]
  wire  ct_lsu_pfu_pmb_entry_3_amr_wa_cancel; // @[pfu.scala 331:11]
  wire  ct_lsu_pfu_pmb_entry_3_cp0_lsu_icg_en; // @[pfu.scala 331:11]
  wire  ct_lsu_pfu_pmb_entry_3_cp0_lsu_l2_st_pref_en; // @[pfu.scala 331:11]
  wire  ct_lsu_pfu_pmb_entry_3_cp0_yy_clk_en; // @[pfu.scala 331:11]
  wire  ct_lsu_pfu_pmb_entry_3_cpurst_b; // @[pfu.scala 331:11]
  wire [14:0] ct_lsu_pfu_pmb_entry_3_ld_da_ldfifo_pc; // @[pfu.scala 331:11]
  wire  ct_lsu_pfu_pmb_entry_3_ld_da_pfu_act_dp_vld; // @[pfu.scala 331:11]
  wire  ct_lsu_pfu_pmb_entry_3_ld_da_pfu_evict_cnt_vld; // @[pfu.scala 331:11]
  wire  ct_lsu_pfu_pmb_entry_3_ld_da_pfu_pf_inst_vld; // @[pfu.scala 331:11]
  wire  ct_lsu_pfu_pmb_entry_3_lsu_special_clk; // @[pfu.scala 331:11]
  wire  ct_lsu_pfu_pmb_entry_3_pad_yy_icg_scan_en; // @[pfu.scala 331:11]
  wire  ct_lsu_pfu_pmb_entry_3_pfu_pmb_entry_create_dp_vld_x; // @[pfu.scala 331:11]
  wire  ct_lsu_pfu_pmb_entry_3_pfu_pmb_entry_create_gateclk_en_x; // @[pfu.scala 331:11]
  wire  ct_lsu_pfu_pmb_entry_3_pfu_pmb_entry_create_vld_x; // @[pfu.scala 331:11]
  wire  ct_lsu_pfu_pmb_entry_3_pfu_pmb_entry_ready_grnt_x; // @[pfu.scala 331:11]
  wire  ct_lsu_pfu_pmb_entry_3_pfu_pop_all_part_vld; // @[pfu.scala 331:11]
  wire [14:0] ct_lsu_pfu_pmb_entry_3_pipe_create_pc; // @[pfu.scala 331:11]
  wire [7:0] ct_lsu_pfu_pmb_entry_3_pmb_timeout_cnt_val; // @[pfu.scala 331:11]
  wire [14:0] ct_lsu_pfu_pmb_entry_3_st_da_pc; // @[pfu.scala 331:11]
  wire  ct_lsu_pfu_pmb_entry_3_st_da_pfu_evict_cnt_vld; // @[pfu.scala 331:11]
  wire  ct_lsu_pfu_pmb_entry_3_st_da_pfu_pf_inst_vld; // @[pfu.scala 331:11]
  wire  ct_lsu_pfu_pmb_entry_3_pfu_pmb_entry_evict_x; // @[pfu.scala 331:11]
  wire  ct_lsu_pfu_pmb_entry_3_pfu_pmb_entry_hit_pc_x; // @[pfu.scala 331:11]
  wire [14:0] ct_lsu_pfu_pmb_entry_3_pfu_pmb_entry_pc_v; // @[pfu.scala 331:11]
  wire  ct_lsu_pfu_pmb_entry_3_pfu_pmb_entry_ready_x; // @[pfu.scala 331:11]
  wire  ct_lsu_pfu_pmb_entry_3_pfu_pmb_entry_type_ld_x; // @[pfu.scala 331:11]
  wire  ct_lsu_pfu_pmb_entry_3_pfu_pmb_entry_vld_x; // @[pfu.scala 331:11]
  wire  ct_lsu_pfu_pmb_entry_4_amr_wa_cancel; // @[pfu.scala 332:11]
  wire  ct_lsu_pfu_pmb_entry_4_cp0_lsu_icg_en; // @[pfu.scala 332:11]
  wire  ct_lsu_pfu_pmb_entry_4_cp0_lsu_l2_st_pref_en; // @[pfu.scala 332:11]
  wire  ct_lsu_pfu_pmb_entry_4_cp0_yy_clk_en; // @[pfu.scala 332:11]
  wire  ct_lsu_pfu_pmb_entry_4_cpurst_b; // @[pfu.scala 332:11]
  wire [14:0] ct_lsu_pfu_pmb_entry_4_ld_da_ldfifo_pc; // @[pfu.scala 332:11]
  wire  ct_lsu_pfu_pmb_entry_4_ld_da_pfu_act_dp_vld; // @[pfu.scala 332:11]
  wire  ct_lsu_pfu_pmb_entry_4_ld_da_pfu_evict_cnt_vld; // @[pfu.scala 332:11]
  wire  ct_lsu_pfu_pmb_entry_4_ld_da_pfu_pf_inst_vld; // @[pfu.scala 332:11]
  wire  ct_lsu_pfu_pmb_entry_4_lsu_special_clk; // @[pfu.scala 332:11]
  wire  ct_lsu_pfu_pmb_entry_4_pad_yy_icg_scan_en; // @[pfu.scala 332:11]
  wire  ct_lsu_pfu_pmb_entry_4_pfu_pmb_entry_create_dp_vld_x; // @[pfu.scala 332:11]
  wire  ct_lsu_pfu_pmb_entry_4_pfu_pmb_entry_create_gateclk_en_x; // @[pfu.scala 332:11]
  wire  ct_lsu_pfu_pmb_entry_4_pfu_pmb_entry_create_vld_x; // @[pfu.scala 332:11]
  wire  ct_lsu_pfu_pmb_entry_4_pfu_pmb_entry_ready_grnt_x; // @[pfu.scala 332:11]
  wire  ct_lsu_pfu_pmb_entry_4_pfu_pop_all_part_vld; // @[pfu.scala 332:11]
  wire [14:0] ct_lsu_pfu_pmb_entry_4_pipe_create_pc; // @[pfu.scala 332:11]
  wire [7:0] ct_lsu_pfu_pmb_entry_4_pmb_timeout_cnt_val; // @[pfu.scala 332:11]
  wire [14:0] ct_lsu_pfu_pmb_entry_4_st_da_pc; // @[pfu.scala 332:11]
  wire  ct_lsu_pfu_pmb_entry_4_st_da_pfu_evict_cnt_vld; // @[pfu.scala 332:11]
  wire  ct_lsu_pfu_pmb_entry_4_st_da_pfu_pf_inst_vld; // @[pfu.scala 332:11]
  wire  ct_lsu_pfu_pmb_entry_4_pfu_pmb_entry_evict_x; // @[pfu.scala 332:11]
  wire  ct_lsu_pfu_pmb_entry_4_pfu_pmb_entry_hit_pc_x; // @[pfu.scala 332:11]
  wire [14:0] ct_lsu_pfu_pmb_entry_4_pfu_pmb_entry_pc_v; // @[pfu.scala 332:11]
  wire  ct_lsu_pfu_pmb_entry_4_pfu_pmb_entry_ready_x; // @[pfu.scala 332:11]
  wire  ct_lsu_pfu_pmb_entry_4_pfu_pmb_entry_type_ld_x; // @[pfu.scala 332:11]
  wire  ct_lsu_pfu_pmb_entry_4_pfu_pmb_entry_vld_x; // @[pfu.scala 332:11]
  wire  ct_lsu_pfu_pmb_entry_5_amr_wa_cancel; // @[pfu.scala 333:11]
  wire  ct_lsu_pfu_pmb_entry_5_cp0_lsu_icg_en; // @[pfu.scala 333:11]
  wire  ct_lsu_pfu_pmb_entry_5_cp0_lsu_l2_st_pref_en; // @[pfu.scala 333:11]
  wire  ct_lsu_pfu_pmb_entry_5_cp0_yy_clk_en; // @[pfu.scala 333:11]
  wire  ct_lsu_pfu_pmb_entry_5_cpurst_b; // @[pfu.scala 333:11]
  wire [14:0] ct_lsu_pfu_pmb_entry_5_ld_da_ldfifo_pc; // @[pfu.scala 333:11]
  wire  ct_lsu_pfu_pmb_entry_5_ld_da_pfu_act_dp_vld; // @[pfu.scala 333:11]
  wire  ct_lsu_pfu_pmb_entry_5_ld_da_pfu_evict_cnt_vld; // @[pfu.scala 333:11]
  wire  ct_lsu_pfu_pmb_entry_5_ld_da_pfu_pf_inst_vld; // @[pfu.scala 333:11]
  wire  ct_lsu_pfu_pmb_entry_5_lsu_special_clk; // @[pfu.scala 333:11]
  wire  ct_lsu_pfu_pmb_entry_5_pad_yy_icg_scan_en; // @[pfu.scala 333:11]
  wire  ct_lsu_pfu_pmb_entry_5_pfu_pmb_entry_create_dp_vld_x; // @[pfu.scala 333:11]
  wire  ct_lsu_pfu_pmb_entry_5_pfu_pmb_entry_create_gateclk_en_x; // @[pfu.scala 333:11]
  wire  ct_lsu_pfu_pmb_entry_5_pfu_pmb_entry_create_vld_x; // @[pfu.scala 333:11]
  wire  ct_lsu_pfu_pmb_entry_5_pfu_pmb_entry_ready_grnt_x; // @[pfu.scala 333:11]
  wire  ct_lsu_pfu_pmb_entry_5_pfu_pop_all_part_vld; // @[pfu.scala 333:11]
  wire [14:0] ct_lsu_pfu_pmb_entry_5_pipe_create_pc; // @[pfu.scala 333:11]
  wire [7:0] ct_lsu_pfu_pmb_entry_5_pmb_timeout_cnt_val; // @[pfu.scala 333:11]
  wire [14:0] ct_lsu_pfu_pmb_entry_5_st_da_pc; // @[pfu.scala 333:11]
  wire  ct_lsu_pfu_pmb_entry_5_st_da_pfu_evict_cnt_vld; // @[pfu.scala 333:11]
  wire  ct_lsu_pfu_pmb_entry_5_st_da_pfu_pf_inst_vld; // @[pfu.scala 333:11]
  wire  ct_lsu_pfu_pmb_entry_5_pfu_pmb_entry_evict_x; // @[pfu.scala 333:11]
  wire  ct_lsu_pfu_pmb_entry_5_pfu_pmb_entry_hit_pc_x; // @[pfu.scala 333:11]
  wire [14:0] ct_lsu_pfu_pmb_entry_5_pfu_pmb_entry_pc_v; // @[pfu.scala 333:11]
  wire  ct_lsu_pfu_pmb_entry_5_pfu_pmb_entry_ready_x; // @[pfu.scala 333:11]
  wire  ct_lsu_pfu_pmb_entry_5_pfu_pmb_entry_type_ld_x; // @[pfu.scala 333:11]
  wire  ct_lsu_pfu_pmb_entry_5_pfu_pmb_entry_vld_x; // @[pfu.scala 333:11]
  wire  ct_lsu_pfu_pmb_entry_6_amr_wa_cancel; // @[pfu.scala 334:11]
  wire  ct_lsu_pfu_pmb_entry_6_cp0_lsu_icg_en; // @[pfu.scala 334:11]
  wire  ct_lsu_pfu_pmb_entry_6_cp0_lsu_l2_st_pref_en; // @[pfu.scala 334:11]
  wire  ct_lsu_pfu_pmb_entry_6_cp0_yy_clk_en; // @[pfu.scala 334:11]
  wire  ct_lsu_pfu_pmb_entry_6_cpurst_b; // @[pfu.scala 334:11]
  wire [14:0] ct_lsu_pfu_pmb_entry_6_ld_da_ldfifo_pc; // @[pfu.scala 334:11]
  wire  ct_lsu_pfu_pmb_entry_6_ld_da_pfu_act_dp_vld; // @[pfu.scala 334:11]
  wire  ct_lsu_pfu_pmb_entry_6_ld_da_pfu_evict_cnt_vld; // @[pfu.scala 334:11]
  wire  ct_lsu_pfu_pmb_entry_6_ld_da_pfu_pf_inst_vld; // @[pfu.scala 334:11]
  wire  ct_lsu_pfu_pmb_entry_6_lsu_special_clk; // @[pfu.scala 334:11]
  wire  ct_lsu_pfu_pmb_entry_6_pad_yy_icg_scan_en; // @[pfu.scala 334:11]
  wire  ct_lsu_pfu_pmb_entry_6_pfu_pmb_entry_create_dp_vld_x; // @[pfu.scala 334:11]
  wire  ct_lsu_pfu_pmb_entry_6_pfu_pmb_entry_create_gateclk_en_x; // @[pfu.scala 334:11]
  wire  ct_lsu_pfu_pmb_entry_6_pfu_pmb_entry_create_vld_x; // @[pfu.scala 334:11]
  wire  ct_lsu_pfu_pmb_entry_6_pfu_pmb_entry_ready_grnt_x; // @[pfu.scala 334:11]
  wire  ct_lsu_pfu_pmb_entry_6_pfu_pop_all_part_vld; // @[pfu.scala 334:11]
  wire [14:0] ct_lsu_pfu_pmb_entry_6_pipe_create_pc; // @[pfu.scala 334:11]
  wire [7:0] ct_lsu_pfu_pmb_entry_6_pmb_timeout_cnt_val; // @[pfu.scala 334:11]
  wire [14:0] ct_lsu_pfu_pmb_entry_6_st_da_pc; // @[pfu.scala 334:11]
  wire  ct_lsu_pfu_pmb_entry_6_st_da_pfu_evict_cnt_vld; // @[pfu.scala 334:11]
  wire  ct_lsu_pfu_pmb_entry_6_st_da_pfu_pf_inst_vld; // @[pfu.scala 334:11]
  wire  ct_lsu_pfu_pmb_entry_6_pfu_pmb_entry_evict_x; // @[pfu.scala 334:11]
  wire  ct_lsu_pfu_pmb_entry_6_pfu_pmb_entry_hit_pc_x; // @[pfu.scala 334:11]
  wire [14:0] ct_lsu_pfu_pmb_entry_6_pfu_pmb_entry_pc_v; // @[pfu.scala 334:11]
  wire  ct_lsu_pfu_pmb_entry_6_pfu_pmb_entry_ready_x; // @[pfu.scala 334:11]
  wire  ct_lsu_pfu_pmb_entry_6_pfu_pmb_entry_type_ld_x; // @[pfu.scala 334:11]
  wire  ct_lsu_pfu_pmb_entry_6_pfu_pmb_entry_vld_x; // @[pfu.scala 334:11]
  wire  ct_lsu_pfu_pmb_entry_7_amr_wa_cancel; // @[pfu.scala 335:11]
  wire  ct_lsu_pfu_pmb_entry_7_cp0_lsu_icg_en; // @[pfu.scala 335:11]
  wire  ct_lsu_pfu_pmb_entry_7_cp0_lsu_l2_st_pref_en; // @[pfu.scala 335:11]
  wire  ct_lsu_pfu_pmb_entry_7_cp0_yy_clk_en; // @[pfu.scala 335:11]
  wire  ct_lsu_pfu_pmb_entry_7_cpurst_b; // @[pfu.scala 335:11]
  wire [14:0] ct_lsu_pfu_pmb_entry_7_ld_da_ldfifo_pc; // @[pfu.scala 335:11]
  wire  ct_lsu_pfu_pmb_entry_7_ld_da_pfu_act_dp_vld; // @[pfu.scala 335:11]
  wire  ct_lsu_pfu_pmb_entry_7_ld_da_pfu_evict_cnt_vld; // @[pfu.scala 335:11]
  wire  ct_lsu_pfu_pmb_entry_7_ld_da_pfu_pf_inst_vld; // @[pfu.scala 335:11]
  wire  ct_lsu_pfu_pmb_entry_7_lsu_special_clk; // @[pfu.scala 335:11]
  wire  ct_lsu_pfu_pmb_entry_7_pad_yy_icg_scan_en; // @[pfu.scala 335:11]
  wire  ct_lsu_pfu_pmb_entry_7_pfu_pmb_entry_create_dp_vld_x; // @[pfu.scala 335:11]
  wire  ct_lsu_pfu_pmb_entry_7_pfu_pmb_entry_create_gateclk_en_x; // @[pfu.scala 335:11]
  wire  ct_lsu_pfu_pmb_entry_7_pfu_pmb_entry_create_vld_x; // @[pfu.scala 335:11]
  wire  ct_lsu_pfu_pmb_entry_7_pfu_pmb_entry_ready_grnt_x; // @[pfu.scala 335:11]
  wire  ct_lsu_pfu_pmb_entry_7_pfu_pop_all_part_vld; // @[pfu.scala 335:11]
  wire [14:0] ct_lsu_pfu_pmb_entry_7_pipe_create_pc; // @[pfu.scala 335:11]
  wire [7:0] ct_lsu_pfu_pmb_entry_7_pmb_timeout_cnt_val; // @[pfu.scala 335:11]
  wire [14:0] ct_lsu_pfu_pmb_entry_7_st_da_pc; // @[pfu.scala 335:11]
  wire  ct_lsu_pfu_pmb_entry_7_st_da_pfu_evict_cnt_vld; // @[pfu.scala 335:11]
  wire  ct_lsu_pfu_pmb_entry_7_st_da_pfu_pf_inst_vld; // @[pfu.scala 335:11]
  wire  ct_lsu_pfu_pmb_entry_7_pfu_pmb_entry_evict_x; // @[pfu.scala 335:11]
  wire  ct_lsu_pfu_pmb_entry_7_pfu_pmb_entry_hit_pc_x; // @[pfu.scala 335:11]
  wire [14:0] ct_lsu_pfu_pmb_entry_7_pfu_pmb_entry_pc_v; // @[pfu.scala 335:11]
  wire  ct_lsu_pfu_pmb_entry_7_pfu_pmb_entry_ready_x; // @[pfu.scala 335:11]
  wire  ct_lsu_pfu_pmb_entry_7_pfu_pmb_entry_type_ld_x; // @[pfu.scala 335:11]
  wire  ct_lsu_pfu_pmb_entry_7_pfu_pmb_entry_vld_x; // @[pfu.scala 335:11]
  wire  ct_lsu_pfu_sdb_entry_amr_wa_cancel; // @[pfu.scala 418:43]
  wire  ct_lsu_pfu_sdb_entry_cp0_lsu_icg_en; // @[pfu.scala 418:43]
  wire  ct_lsu_pfu_sdb_entry_cp0_lsu_l2_st_pref_en; // @[pfu.scala 418:43]
  wire  ct_lsu_pfu_sdb_entry_cp0_yy_clk_en; // @[pfu.scala 418:43]
  wire  ct_lsu_pfu_sdb_entry_cpurst_b; // @[pfu.scala 418:43]
  wire [6:0] ct_lsu_pfu_sdb_entry_ld_da_iid; // @[pfu.scala 418:43]
  wire [14:0] ct_lsu_pfu_sdb_entry_ld_da_ldfifo_pc; // @[pfu.scala 418:43]
  wire  ct_lsu_pfu_sdb_entry_ld_da_pfu_act_dp_vld; // @[pfu.scala 418:43]
  wire  ct_lsu_pfu_sdb_entry_ld_da_pfu_evict_cnt_vld; // @[pfu.scala 418:43]
  wire  ct_lsu_pfu_sdb_entry_ld_da_pfu_pf_inst_vld; // @[pfu.scala 418:43]
  wire [39:0] ct_lsu_pfu_sdb_entry_ld_da_ppfu_va; // @[pfu.scala 418:43]
  wire  ct_lsu_pfu_sdb_entry_lsu_special_clk; // @[pfu.scala 418:43]
  wire  ct_lsu_pfu_sdb_entry_pad_yy_icg_scan_en; // @[pfu.scala 418:43]
  wire  ct_lsu_pfu_sdb_entry_pfu_pop_all_part_vld; // @[pfu.scala 418:43]
  wire [14:0] ct_lsu_pfu_sdb_entry_pfu_sdb_create_pc; // @[pfu.scala 418:43]
  wire  ct_lsu_pfu_sdb_entry_pfu_sdb_create_type_ld; // @[pfu.scala 418:43]
  wire  ct_lsu_pfu_sdb_entry_pfu_sdb_entry_create_dp_vld_x; // @[pfu.scala 418:43]
  wire  ct_lsu_pfu_sdb_entry_pfu_sdb_entry_create_gateclk_en_x; // @[pfu.scala 418:43]
  wire  ct_lsu_pfu_sdb_entry_pfu_sdb_entry_create_vld_x; // @[pfu.scala 418:43]
  wire  ct_lsu_pfu_sdb_entry_pfu_sdb_entry_ready_grnt_x; // @[pfu.scala 418:43]
  wire  ct_lsu_pfu_sdb_entry_rtu_yy_xx_commit0; // @[pfu.scala 418:43]
  wire [6:0] ct_lsu_pfu_sdb_entry_rtu_yy_xx_commit0_iid; // @[pfu.scala 418:43]
  wire  ct_lsu_pfu_sdb_entry_rtu_yy_xx_commit1; // @[pfu.scala 418:43]
  wire [6:0] ct_lsu_pfu_sdb_entry_rtu_yy_xx_commit1_iid; // @[pfu.scala 418:43]
  wire  ct_lsu_pfu_sdb_entry_rtu_yy_xx_commit2; // @[pfu.scala 418:43]
  wire [6:0] ct_lsu_pfu_sdb_entry_rtu_yy_xx_commit2_iid; // @[pfu.scala 418:43]
  wire  ct_lsu_pfu_sdb_entry_rtu_yy_xx_flush; // @[pfu.scala 418:43]
  wire [7:0] ct_lsu_pfu_sdb_entry_sdb_timeout_cnt_val; // @[pfu.scala 418:43]
  wire [6:0] ct_lsu_pfu_sdb_entry_st_da_iid; // @[pfu.scala 418:43]
  wire [14:0] ct_lsu_pfu_sdb_entry_st_da_pc; // @[pfu.scala 418:43]
  wire  ct_lsu_pfu_sdb_entry_st_da_pfu_evict_cnt_vld; // @[pfu.scala 418:43]
  wire  ct_lsu_pfu_sdb_entry_st_da_pfu_pf_inst_vld; // @[pfu.scala 418:43]
  wire [39:0] ct_lsu_pfu_sdb_entry_st_da_ppfu_va; // @[pfu.scala 418:43]
  wire  ct_lsu_pfu_sdb_entry_pfu_sdb_entry_evict_x; // @[pfu.scala 418:43]
  wire  ct_lsu_pfu_sdb_entry_pfu_sdb_entry_hit_pc_x; // @[pfu.scala 418:43]
  wire [14:0] ct_lsu_pfu_sdb_entry_pfu_sdb_entry_pc_v; // @[pfu.scala 418:43]
  wire  ct_lsu_pfu_sdb_entry_pfu_sdb_entry_ready_x; // @[pfu.scala 418:43]
  wire  ct_lsu_pfu_sdb_entry_pfu_sdb_entry_stride_neg_x; // @[pfu.scala 418:43]
  wire [10:0] ct_lsu_pfu_sdb_entry_pfu_sdb_entry_stride_v; // @[pfu.scala 418:43]
  wire [6:0] ct_lsu_pfu_sdb_entry_pfu_sdb_entry_strideh_6to0_v; // @[pfu.scala 418:43]
  wire  ct_lsu_pfu_sdb_entry_pfu_sdb_entry_type_ld_x; // @[pfu.scala 418:43]
  wire  ct_lsu_pfu_sdb_entry_pfu_sdb_entry_vld_x; // @[pfu.scala 418:43]
  wire  ct_lsu_pfu_sdb_entry_1_amr_wa_cancel; // @[pfu.scala 418:80]
  wire  ct_lsu_pfu_sdb_entry_1_cp0_lsu_icg_en; // @[pfu.scala 418:80]
  wire  ct_lsu_pfu_sdb_entry_1_cp0_lsu_l2_st_pref_en; // @[pfu.scala 418:80]
  wire  ct_lsu_pfu_sdb_entry_1_cp0_yy_clk_en; // @[pfu.scala 418:80]
  wire  ct_lsu_pfu_sdb_entry_1_cpurst_b; // @[pfu.scala 418:80]
  wire [6:0] ct_lsu_pfu_sdb_entry_1_ld_da_iid; // @[pfu.scala 418:80]
  wire [14:0] ct_lsu_pfu_sdb_entry_1_ld_da_ldfifo_pc; // @[pfu.scala 418:80]
  wire  ct_lsu_pfu_sdb_entry_1_ld_da_pfu_act_dp_vld; // @[pfu.scala 418:80]
  wire  ct_lsu_pfu_sdb_entry_1_ld_da_pfu_evict_cnt_vld; // @[pfu.scala 418:80]
  wire  ct_lsu_pfu_sdb_entry_1_ld_da_pfu_pf_inst_vld; // @[pfu.scala 418:80]
  wire [39:0] ct_lsu_pfu_sdb_entry_1_ld_da_ppfu_va; // @[pfu.scala 418:80]
  wire  ct_lsu_pfu_sdb_entry_1_lsu_special_clk; // @[pfu.scala 418:80]
  wire  ct_lsu_pfu_sdb_entry_1_pad_yy_icg_scan_en; // @[pfu.scala 418:80]
  wire  ct_lsu_pfu_sdb_entry_1_pfu_pop_all_part_vld; // @[pfu.scala 418:80]
  wire [14:0] ct_lsu_pfu_sdb_entry_1_pfu_sdb_create_pc; // @[pfu.scala 418:80]
  wire  ct_lsu_pfu_sdb_entry_1_pfu_sdb_create_type_ld; // @[pfu.scala 418:80]
  wire  ct_lsu_pfu_sdb_entry_1_pfu_sdb_entry_create_dp_vld_x; // @[pfu.scala 418:80]
  wire  ct_lsu_pfu_sdb_entry_1_pfu_sdb_entry_create_gateclk_en_x; // @[pfu.scala 418:80]
  wire  ct_lsu_pfu_sdb_entry_1_pfu_sdb_entry_create_vld_x; // @[pfu.scala 418:80]
  wire  ct_lsu_pfu_sdb_entry_1_pfu_sdb_entry_ready_grnt_x; // @[pfu.scala 418:80]
  wire  ct_lsu_pfu_sdb_entry_1_rtu_yy_xx_commit0; // @[pfu.scala 418:80]
  wire [6:0] ct_lsu_pfu_sdb_entry_1_rtu_yy_xx_commit0_iid; // @[pfu.scala 418:80]
  wire  ct_lsu_pfu_sdb_entry_1_rtu_yy_xx_commit1; // @[pfu.scala 418:80]
  wire [6:0] ct_lsu_pfu_sdb_entry_1_rtu_yy_xx_commit1_iid; // @[pfu.scala 418:80]
  wire  ct_lsu_pfu_sdb_entry_1_rtu_yy_xx_commit2; // @[pfu.scala 418:80]
  wire [6:0] ct_lsu_pfu_sdb_entry_1_rtu_yy_xx_commit2_iid; // @[pfu.scala 418:80]
  wire  ct_lsu_pfu_sdb_entry_1_rtu_yy_xx_flush; // @[pfu.scala 418:80]
  wire [7:0] ct_lsu_pfu_sdb_entry_1_sdb_timeout_cnt_val; // @[pfu.scala 418:80]
  wire [6:0] ct_lsu_pfu_sdb_entry_1_st_da_iid; // @[pfu.scala 418:80]
  wire [14:0] ct_lsu_pfu_sdb_entry_1_st_da_pc; // @[pfu.scala 418:80]
  wire  ct_lsu_pfu_sdb_entry_1_st_da_pfu_evict_cnt_vld; // @[pfu.scala 418:80]
  wire  ct_lsu_pfu_sdb_entry_1_st_da_pfu_pf_inst_vld; // @[pfu.scala 418:80]
  wire [39:0] ct_lsu_pfu_sdb_entry_1_st_da_ppfu_va; // @[pfu.scala 418:80]
  wire  ct_lsu_pfu_sdb_entry_1_pfu_sdb_entry_evict_x; // @[pfu.scala 418:80]
  wire  ct_lsu_pfu_sdb_entry_1_pfu_sdb_entry_hit_pc_x; // @[pfu.scala 418:80]
  wire [14:0] ct_lsu_pfu_sdb_entry_1_pfu_sdb_entry_pc_v; // @[pfu.scala 418:80]
  wire  ct_lsu_pfu_sdb_entry_1_pfu_sdb_entry_ready_x; // @[pfu.scala 418:80]
  wire  ct_lsu_pfu_sdb_entry_1_pfu_sdb_entry_stride_neg_x; // @[pfu.scala 418:80]
  wire [10:0] ct_lsu_pfu_sdb_entry_1_pfu_sdb_entry_stride_v; // @[pfu.scala 418:80]
  wire [6:0] ct_lsu_pfu_sdb_entry_1_pfu_sdb_entry_strideh_6to0_v; // @[pfu.scala 418:80]
  wire  ct_lsu_pfu_sdb_entry_1_pfu_sdb_entry_type_ld_x; // @[pfu.scala 418:80]
  wire  ct_lsu_pfu_sdb_entry_1_pfu_sdb_entry_vld_x; // @[pfu.scala 418:80]
  wire  ct_lsu_pfu_pfb_entry_amr_wa_cancel; // @[pfu.scala 522:11]
  wire  ct_lsu_pfu_pfb_entry_cp0_lsu_icg_en; // @[pfu.scala 522:11]
  wire  ct_lsu_pfu_pfb_entry_cp0_lsu_l2_st_pref_en; // @[pfu.scala 522:11]
  wire  ct_lsu_pfu_pfb_entry_cp0_lsu_pfu_mmu_dis; // @[pfu.scala 522:11]
  wire  ct_lsu_pfu_pfb_entry_cp0_yy_clk_en; // @[pfu.scala 522:11]
  wire [1:0] ct_lsu_pfu_pfb_entry_cp0_yy_priv_mode; // @[pfu.scala 522:11]
  wire  ct_lsu_pfu_pfb_entry_cpurst_b; // @[pfu.scala 522:11]
  wire [14:0] ct_lsu_pfu_pfb_entry_ld_da_ldfifo_pc; // @[pfu.scala 522:11]
  wire  ct_lsu_pfu_pfb_entry_ld_da_page_sec_ff; // @[pfu.scala 522:11]
  wire  ct_lsu_pfu_pfb_entry_ld_da_page_share_ff; // @[pfu.scala 522:11]
  wire  ct_lsu_pfu_pfb_entry_ld_da_pfu_act_dp_vld; // @[pfu.scala 522:11]
  wire  ct_lsu_pfu_pfb_entry_ld_da_pfu_act_vld; // @[pfu.scala 522:11]
  wire  ct_lsu_pfu_pfb_entry_ld_da_pfu_evict_cnt_vld; // @[pfu.scala 522:11]
  wire  ct_lsu_pfu_pfb_entry_ld_da_pfu_pf_inst_vld; // @[pfu.scala 522:11]
  wire [39:0] ct_lsu_pfu_pfb_entry_ld_da_ppfu_va; // @[pfu.scala 522:11]
  wire [27:0] ct_lsu_pfu_pfb_entry_ld_da_ppn_ff; // @[pfu.scala 522:11]
  wire [3:0] ct_lsu_pfu_pfb_entry_lsu_pfu_l1_dist_sel; // @[pfu.scala 522:11]
  wire [3:0] ct_lsu_pfu_pfb_entry_lsu_pfu_l2_dist_sel; // @[pfu.scala 522:11]
  wire  ct_lsu_pfu_pfb_entry_lsu_special_clk; // @[pfu.scala 522:11]
  wire  ct_lsu_pfu_pfb_entry_pad_yy_icg_scan_en; // @[pfu.scala 522:11]
  wire [5:0] ct_lsu_pfu_pfb_entry_pfb_no_req_cnt_val; // @[pfu.scala 522:11]
  wire [7:0] ct_lsu_pfu_pfb_entry_pfb_timeout_cnt_val; // @[pfu.scala 522:11]
  wire  ct_lsu_pfu_pfb_entry_pfu_biu_pe_req_sel_l1; // @[pfu.scala 522:11]
  wire  ct_lsu_pfu_pfb_entry_pfu_dcache_pref_en; // @[pfu.scala 522:11]
  wire  ct_lsu_pfu_pfb_entry_pfu_get_page_sec; // @[pfu.scala 522:11]
  wire  ct_lsu_pfu_pfb_entry_pfu_get_page_share; // @[pfu.scala 522:11]
  wire [27:0] ct_lsu_pfu_pfb_entry_pfu_get_ppn; // @[pfu.scala 522:11]
  wire  ct_lsu_pfu_pfb_entry_pfu_get_ppn_err; // @[pfu.scala 522:11]
  wire  ct_lsu_pfu_pfb_entry_pfu_get_ppn_vld; // @[pfu.scala 522:11]
  wire  ct_lsu_pfu_pfb_entry_pfu_l2_pref_en; // @[pfu.scala 522:11]
  wire  ct_lsu_pfu_pfb_entry_pfu_mmu_pe_req_sel_l1; // @[pfu.scala 522:11]
  wire [14:0] ct_lsu_pfu_pfb_entry_pfu_pfb_create_pc; // @[pfu.scala 522:11]
  wire [10:0] ct_lsu_pfu_pfb_entry_pfu_pfb_create_stride; // @[pfu.scala 522:11]
  wire  ct_lsu_pfu_pfb_entry_pfu_pfb_create_stride_neg; // @[pfu.scala 522:11]
  wire [6:0] ct_lsu_pfu_pfb_entry_pfu_pfb_create_strideh_6to0; // @[pfu.scala 522:11]
  wire  ct_lsu_pfu_pfb_entry_pfu_pfb_create_type_ld; // @[pfu.scala 522:11]
  wire  ct_lsu_pfu_pfb_entry_pfu_pfb_entry_biu_pe_req_grnt_x; // @[pfu.scala 522:11]
  wire  ct_lsu_pfu_pfb_entry_pfu_pfb_entry_create_dp_vld_x; // @[pfu.scala 522:11]
  wire  ct_lsu_pfu_pfb_entry_pfu_pfb_entry_create_gateclk_en_x; // @[pfu.scala 522:11]
  wire  ct_lsu_pfu_pfb_entry_pfu_pfb_entry_create_vld_x; // @[pfu.scala 522:11]
  wire  ct_lsu_pfu_pfb_entry_pfu_pfb_entry_from_lfb_dcache_hit_x; // @[pfu.scala 522:11]
  wire  ct_lsu_pfu_pfb_entry_pfu_pfb_entry_from_lfb_dcache_miss_x; // @[pfu.scala 522:11]
  wire  ct_lsu_pfu_pfb_entry_pfu_pfb_entry_mmu_pe_req_grnt_x; // @[pfu.scala 522:11]
  wire  ct_lsu_pfu_pfb_entry_pfu_pop_all_part_vld; // @[pfu.scala 522:11]
  wire  ct_lsu_pfu_pfb_entry_st_da_page_sec_ff; // @[pfu.scala 522:11]
  wire  ct_lsu_pfu_pfb_entry_st_da_page_share_ff; // @[pfu.scala 522:11]
  wire [14:0] ct_lsu_pfu_pfb_entry_st_da_pc; // @[pfu.scala 522:11]
  wire  ct_lsu_pfu_pfb_entry_st_da_pfu_act_vld; // @[pfu.scala 522:11]
  wire  ct_lsu_pfu_pfb_entry_st_da_pfu_evict_cnt_vld; // @[pfu.scala 522:11]
  wire  ct_lsu_pfu_pfb_entry_st_da_pfu_pf_inst_vld; // @[pfu.scala 522:11]
  wire [39:0] ct_lsu_pfu_pfb_entry_st_da_ppfu_va; // @[pfu.scala 522:11]
  wire [27:0] ct_lsu_pfu_pfb_entry_st_da_ppn_ff; // @[pfu.scala 522:11]
  wire [1:0] ct_lsu_pfu_pfb_entry_pfu_pfb_entry_biu_pe_req_src_v; // @[pfu.scala 522:11]
  wire  ct_lsu_pfu_pfb_entry_pfu_pfb_entry_biu_pe_req_x; // @[pfu.scala 522:11]
  wire  ct_lsu_pfu_pfb_entry_pfu_pfb_entry_evict_x; // @[pfu.scala 522:11]
  wire  ct_lsu_pfu_pfb_entry_pfu_pfb_entry_hit_pc_x; // @[pfu.scala 522:11]
  wire  ct_lsu_pfu_pfb_entry_pfu_pfb_entry_l1_page_sec_x; // @[pfu.scala 522:11]
  wire  ct_lsu_pfu_pfb_entry_pfu_pfb_entry_l1_page_share_x; // @[pfu.scala 522:11]
  wire [39:0] ct_lsu_pfu_pfb_entry_pfu_pfb_entry_l1_pf_addr_v; // @[pfu.scala 522:11]
  wire [27:0] ct_lsu_pfu_pfb_entry_pfu_pfb_entry_l1_vpn_v; // @[pfu.scala 522:11]
  wire  ct_lsu_pfu_pfb_entry_pfu_pfb_entry_l2_page_sec_x; // @[pfu.scala 522:11]
  wire  ct_lsu_pfu_pfb_entry_pfu_pfb_entry_l2_page_share_x; // @[pfu.scala 522:11]
  wire [39:0] ct_lsu_pfu_pfb_entry_pfu_pfb_entry_l2_pf_addr_v; // @[pfu.scala 522:11]
  wire [27:0] ct_lsu_pfu_pfb_entry_pfu_pfb_entry_l2_vpn_v; // @[pfu.scala 522:11]
  wire [1:0] ct_lsu_pfu_pfb_entry_pfu_pfb_entry_mmu_pe_req_src_v; // @[pfu.scala 522:11]
  wire  ct_lsu_pfu_pfb_entry_pfu_pfb_entry_mmu_pe_req_x; // @[pfu.scala 522:11]
  wire [1:0] ct_lsu_pfu_pfb_entry_pfu_pfb_entry_priv_mode_v; // @[pfu.scala 522:11]
  wire  ct_lsu_pfu_pfb_entry_pfu_pfb_entry_vld_x; // @[pfu.scala 522:11]
  wire  ct_lsu_pfu_pfb_entry_1_amr_wa_cancel; // @[pfu.scala 523:11]
  wire  ct_lsu_pfu_pfb_entry_1_cp0_lsu_icg_en; // @[pfu.scala 523:11]
  wire  ct_lsu_pfu_pfb_entry_1_cp0_lsu_l2_st_pref_en; // @[pfu.scala 523:11]
  wire  ct_lsu_pfu_pfb_entry_1_cp0_lsu_pfu_mmu_dis; // @[pfu.scala 523:11]
  wire  ct_lsu_pfu_pfb_entry_1_cp0_yy_clk_en; // @[pfu.scala 523:11]
  wire [1:0] ct_lsu_pfu_pfb_entry_1_cp0_yy_priv_mode; // @[pfu.scala 523:11]
  wire  ct_lsu_pfu_pfb_entry_1_cpurst_b; // @[pfu.scala 523:11]
  wire [14:0] ct_lsu_pfu_pfb_entry_1_ld_da_ldfifo_pc; // @[pfu.scala 523:11]
  wire  ct_lsu_pfu_pfb_entry_1_ld_da_page_sec_ff; // @[pfu.scala 523:11]
  wire  ct_lsu_pfu_pfb_entry_1_ld_da_page_share_ff; // @[pfu.scala 523:11]
  wire  ct_lsu_pfu_pfb_entry_1_ld_da_pfu_act_dp_vld; // @[pfu.scala 523:11]
  wire  ct_lsu_pfu_pfb_entry_1_ld_da_pfu_act_vld; // @[pfu.scala 523:11]
  wire  ct_lsu_pfu_pfb_entry_1_ld_da_pfu_evict_cnt_vld; // @[pfu.scala 523:11]
  wire  ct_lsu_pfu_pfb_entry_1_ld_da_pfu_pf_inst_vld; // @[pfu.scala 523:11]
  wire [39:0] ct_lsu_pfu_pfb_entry_1_ld_da_ppfu_va; // @[pfu.scala 523:11]
  wire [27:0] ct_lsu_pfu_pfb_entry_1_ld_da_ppn_ff; // @[pfu.scala 523:11]
  wire [3:0] ct_lsu_pfu_pfb_entry_1_lsu_pfu_l1_dist_sel; // @[pfu.scala 523:11]
  wire [3:0] ct_lsu_pfu_pfb_entry_1_lsu_pfu_l2_dist_sel; // @[pfu.scala 523:11]
  wire  ct_lsu_pfu_pfb_entry_1_lsu_special_clk; // @[pfu.scala 523:11]
  wire  ct_lsu_pfu_pfb_entry_1_pad_yy_icg_scan_en; // @[pfu.scala 523:11]
  wire [5:0] ct_lsu_pfu_pfb_entry_1_pfb_no_req_cnt_val; // @[pfu.scala 523:11]
  wire [7:0] ct_lsu_pfu_pfb_entry_1_pfb_timeout_cnt_val; // @[pfu.scala 523:11]
  wire  ct_lsu_pfu_pfb_entry_1_pfu_biu_pe_req_sel_l1; // @[pfu.scala 523:11]
  wire  ct_lsu_pfu_pfb_entry_1_pfu_dcache_pref_en; // @[pfu.scala 523:11]
  wire  ct_lsu_pfu_pfb_entry_1_pfu_get_page_sec; // @[pfu.scala 523:11]
  wire  ct_lsu_pfu_pfb_entry_1_pfu_get_page_share; // @[pfu.scala 523:11]
  wire [27:0] ct_lsu_pfu_pfb_entry_1_pfu_get_ppn; // @[pfu.scala 523:11]
  wire  ct_lsu_pfu_pfb_entry_1_pfu_get_ppn_err; // @[pfu.scala 523:11]
  wire  ct_lsu_pfu_pfb_entry_1_pfu_get_ppn_vld; // @[pfu.scala 523:11]
  wire  ct_lsu_pfu_pfb_entry_1_pfu_l2_pref_en; // @[pfu.scala 523:11]
  wire  ct_lsu_pfu_pfb_entry_1_pfu_mmu_pe_req_sel_l1; // @[pfu.scala 523:11]
  wire [14:0] ct_lsu_pfu_pfb_entry_1_pfu_pfb_create_pc; // @[pfu.scala 523:11]
  wire [10:0] ct_lsu_pfu_pfb_entry_1_pfu_pfb_create_stride; // @[pfu.scala 523:11]
  wire  ct_lsu_pfu_pfb_entry_1_pfu_pfb_create_stride_neg; // @[pfu.scala 523:11]
  wire [6:0] ct_lsu_pfu_pfb_entry_1_pfu_pfb_create_strideh_6to0; // @[pfu.scala 523:11]
  wire  ct_lsu_pfu_pfb_entry_1_pfu_pfb_create_type_ld; // @[pfu.scala 523:11]
  wire  ct_lsu_pfu_pfb_entry_1_pfu_pfb_entry_biu_pe_req_grnt_x; // @[pfu.scala 523:11]
  wire  ct_lsu_pfu_pfb_entry_1_pfu_pfb_entry_create_dp_vld_x; // @[pfu.scala 523:11]
  wire  ct_lsu_pfu_pfb_entry_1_pfu_pfb_entry_create_gateclk_en_x; // @[pfu.scala 523:11]
  wire  ct_lsu_pfu_pfb_entry_1_pfu_pfb_entry_create_vld_x; // @[pfu.scala 523:11]
  wire  ct_lsu_pfu_pfb_entry_1_pfu_pfb_entry_from_lfb_dcache_hit_x; // @[pfu.scala 523:11]
  wire  ct_lsu_pfu_pfb_entry_1_pfu_pfb_entry_from_lfb_dcache_miss_x; // @[pfu.scala 523:11]
  wire  ct_lsu_pfu_pfb_entry_1_pfu_pfb_entry_mmu_pe_req_grnt_x; // @[pfu.scala 523:11]
  wire  ct_lsu_pfu_pfb_entry_1_pfu_pop_all_part_vld; // @[pfu.scala 523:11]
  wire  ct_lsu_pfu_pfb_entry_1_st_da_page_sec_ff; // @[pfu.scala 523:11]
  wire  ct_lsu_pfu_pfb_entry_1_st_da_page_share_ff; // @[pfu.scala 523:11]
  wire [14:0] ct_lsu_pfu_pfb_entry_1_st_da_pc; // @[pfu.scala 523:11]
  wire  ct_lsu_pfu_pfb_entry_1_st_da_pfu_act_vld; // @[pfu.scala 523:11]
  wire  ct_lsu_pfu_pfb_entry_1_st_da_pfu_evict_cnt_vld; // @[pfu.scala 523:11]
  wire  ct_lsu_pfu_pfb_entry_1_st_da_pfu_pf_inst_vld; // @[pfu.scala 523:11]
  wire [39:0] ct_lsu_pfu_pfb_entry_1_st_da_ppfu_va; // @[pfu.scala 523:11]
  wire [27:0] ct_lsu_pfu_pfb_entry_1_st_da_ppn_ff; // @[pfu.scala 523:11]
  wire [1:0] ct_lsu_pfu_pfb_entry_1_pfu_pfb_entry_biu_pe_req_src_v; // @[pfu.scala 523:11]
  wire  ct_lsu_pfu_pfb_entry_1_pfu_pfb_entry_biu_pe_req_x; // @[pfu.scala 523:11]
  wire  ct_lsu_pfu_pfb_entry_1_pfu_pfb_entry_evict_x; // @[pfu.scala 523:11]
  wire  ct_lsu_pfu_pfb_entry_1_pfu_pfb_entry_hit_pc_x; // @[pfu.scala 523:11]
  wire  ct_lsu_pfu_pfb_entry_1_pfu_pfb_entry_l1_page_sec_x; // @[pfu.scala 523:11]
  wire  ct_lsu_pfu_pfb_entry_1_pfu_pfb_entry_l1_page_share_x; // @[pfu.scala 523:11]
  wire [39:0] ct_lsu_pfu_pfb_entry_1_pfu_pfb_entry_l1_pf_addr_v; // @[pfu.scala 523:11]
  wire [27:0] ct_lsu_pfu_pfb_entry_1_pfu_pfb_entry_l1_vpn_v; // @[pfu.scala 523:11]
  wire  ct_lsu_pfu_pfb_entry_1_pfu_pfb_entry_l2_page_sec_x; // @[pfu.scala 523:11]
  wire  ct_lsu_pfu_pfb_entry_1_pfu_pfb_entry_l2_page_share_x; // @[pfu.scala 523:11]
  wire [39:0] ct_lsu_pfu_pfb_entry_1_pfu_pfb_entry_l2_pf_addr_v; // @[pfu.scala 523:11]
  wire [27:0] ct_lsu_pfu_pfb_entry_1_pfu_pfb_entry_l2_vpn_v; // @[pfu.scala 523:11]
  wire [1:0] ct_lsu_pfu_pfb_entry_1_pfu_pfb_entry_mmu_pe_req_src_v; // @[pfu.scala 523:11]
  wire  ct_lsu_pfu_pfb_entry_1_pfu_pfb_entry_mmu_pe_req_x; // @[pfu.scala 523:11]
  wire [1:0] ct_lsu_pfu_pfb_entry_1_pfu_pfb_entry_priv_mode_v; // @[pfu.scala 523:11]
  wire  ct_lsu_pfu_pfb_entry_1_pfu_pfb_entry_vld_x; // @[pfu.scala 523:11]
  wire  ct_lsu_pfu_pfb_entry_2_amr_wa_cancel; // @[pfu.scala 524:11]
  wire  ct_lsu_pfu_pfb_entry_2_cp0_lsu_icg_en; // @[pfu.scala 524:11]
  wire  ct_lsu_pfu_pfb_entry_2_cp0_lsu_l2_st_pref_en; // @[pfu.scala 524:11]
  wire  ct_lsu_pfu_pfb_entry_2_cp0_lsu_pfu_mmu_dis; // @[pfu.scala 524:11]
  wire  ct_lsu_pfu_pfb_entry_2_cp0_yy_clk_en; // @[pfu.scala 524:11]
  wire [1:0] ct_lsu_pfu_pfb_entry_2_cp0_yy_priv_mode; // @[pfu.scala 524:11]
  wire  ct_lsu_pfu_pfb_entry_2_cpurst_b; // @[pfu.scala 524:11]
  wire [14:0] ct_lsu_pfu_pfb_entry_2_ld_da_ldfifo_pc; // @[pfu.scala 524:11]
  wire  ct_lsu_pfu_pfb_entry_2_ld_da_page_sec_ff; // @[pfu.scala 524:11]
  wire  ct_lsu_pfu_pfb_entry_2_ld_da_page_share_ff; // @[pfu.scala 524:11]
  wire  ct_lsu_pfu_pfb_entry_2_ld_da_pfu_act_dp_vld; // @[pfu.scala 524:11]
  wire  ct_lsu_pfu_pfb_entry_2_ld_da_pfu_act_vld; // @[pfu.scala 524:11]
  wire  ct_lsu_pfu_pfb_entry_2_ld_da_pfu_evict_cnt_vld; // @[pfu.scala 524:11]
  wire  ct_lsu_pfu_pfb_entry_2_ld_da_pfu_pf_inst_vld; // @[pfu.scala 524:11]
  wire [39:0] ct_lsu_pfu_pfb_entry_2_ld_da_ppfu_va; // @[pfu.scala 524:11]
  wire [27:0] ct_lsu_pfu_pfb_entry_2_ld_da_ppn_ff; // @[pfu.scala 524:11]
  wire [3:0] ct_lsu_pfu_pfb_entry_2_lsu_pfu_l1_dist_sel; // @[pfu.scala 524:11]
  wire [3:0] ct_lsu_pfu_pfb_entry_2_lsu_pfu_l2_dist_sel; // @[pfu.scala 524:11]
  wire  ct_lsu_pfu_pfb_entry_2_lsu_special_clk; // @[pfu.scala 524:11]
  wire  ct_lsu_pfu_pfb_entry_2_pad_yy_icg_scan_en; // @[pfu.scala 524:11]
  wire [5:0] ct_lsu_pfu_pfb_entry_2_pfb_no_req_cnt_val; // @[pfu.scala 524:11]
  wire [7:0] ct_lsu_pfu_pfb_entry_2_pfb_timeout_cnt_val; // @[pfu.scala 524:11]
  wire  ct_lsu_pfu_pfb_entry_2_pfu_biu_pe_req_sel_l1; // @[pfu.scala 524:11]
  wire  ct_lsu_pfu_pfb_entry_2_pfu_dcache_pref_en; // @[pfu.scala 524:11]
  wire  ct_lsu_pfu_pfb_entry_2_pfu_get_page_sec; // @[pfu.scala 524:11]
  wire  ct_lsu_pfu_pfb_entry_2_pfu_get_page_share; // @[pfu.scala 524:11]
  wire [27:0] ct_lsu_pfu_pfb_entry_2_pfu_get_ppn; // @[pfu.scala 524:11]
  wire  ct_lsu_pfu_pfb_entry_2_pfu_get_ppn_err; // @[pfu.scala 524:11]
  wire  ct_lsu_pfu_pfb_entry_2_pfu_get_ppn_vld; // @[pfu.scala 524:11]
  wire  ct_lsu_pfu_pfb_entry_2_pfu_l2_pref_en; // @[pfu.scala 524:11]
  wire  ct_lsu_pfu_pfb_entry_2_pfu_mmu_pe_req_sel_l1; // @[pfu.scala 524:11]
  wire [14:0] ct_lsu_pfu_pfb_entry_2_pfu_pfb_create_pc; // @[pfu.scala 524:11]
  wire [10:0] ct_lsu_pfu_pfb_entry_2_pfu_pfb_create_stride; // @[pfu.scala 524:11]
  wire  ct_lsu_pfu_pfb_entry_2_pfu_pfb_create_stride_neg; // @[pfu.scala 524:11]
  wire [6:0] ct_lsu_pfu_pfb_entry_2_pfu_pfb_create_strideh_6to0; // @[pfu.scala 524:11]
  wire  ct_lsu_pfu_pfb_entry_2_pfu_pfb_create_type_ld; // @[pfu.scala 524:11]
  wire  ct_lsu_pfu_pfb_entry_2_pfu_pfb_entry_biu_pe_req_grnt_x; // @[pfu.scala 524:11]
  wire  ct_lsu_pfu_pfb_entry_2_pfu_pfb_entry_create_dp_vld_x; // @[pfu.scala 524:11]
  wire  ct_lsu_pfu_pfb_entry_2_pfu_pfb_entry_create_gateclk_en_x; // @[pfu.scala 524:11]
  wire  ct_lsu_pfu_pfb_entry_2_pfu_pfb_entry_create_vld_x; // @[pfu.scala 524:11]
  wire  ct_lsu_pfu_pfb_entry_2_pfu_pfb_entry_from_lfb_dcache_hit_x; // @[pfu.scala 524:11]
  wire  ct_lsu_pfu_pfb_entry_2_pfu_pfb_entry_from_lfb_dcache_miss_x; // @[pfu.scala 524:11]
  wire  ct_lsu_pfu_pfb_entry_2_pfu_pfb_entry_mmu_pe_req_grnt_x; // @[pfu.scala 524:11]
  wire  ct_lsu_pfu_pfb_entry_2_pfu_pop_all_part_vld; // @[pfu.scala 524:11]
  wire  ct_lsu_pfu_pfb_entry_2_st_da_page_sec_ff; // @[pfu.scala 524:11]
  wire  ct_lsu_pfu_pfb_entry_2_st_da_page_share_ff; // @[pfu.scala 524:11]
  wire [14:0] ct_lsu_pfu_pfb_entry_2_st_da_pc; // @[pfu.scala 524:11]
  wire  ct_lsu_pfu_pfb_entry_2_st_da_pfu_act_vld; // @[pfu.scala 524:11]
  wire  ct_lsu_pfu_pfb_entry_2_st_da_pfu_evict_cnt_vld; // @[pfu.scala 524:11]
  wire  ct_lsu_pfu_pfb_entry_2_st_da_pfu_pf_inst_vld; // @[pfu.scala 524:11]
  wire [39:0] ct_lsu_pfu_pfb_entry_2_st_da_ppfu_va; // @[pfu.scala 524:11]
  wire [27:0] ct_lsu_pfu_pfb_entry_2_st_da_ppn_ff; // @[pfu.scala 524:11]
  wire [1:0] ct_lsu_pfu_pfb_entry_2_pfu_pfb_entry_biu_pe_req_src_v; // @[pfu.scala 524:11]
  wire  ct_lsu_pfu_pfb_entry_2_pfu_pfb_entry_biu_pe_req_x; // @[pfu.scala 524:11]
  wire  ct_lsu_pfu_pfb_entry_2_pfu_pfb_entry_evict_x; // @[pfu.scala 524:11]
  wire  ct_lsu_pfu_pfb_entry_2_pfu_pfb_entry_hit_pc_x; // @[pfu.scala 524:11]
  wire  ct_lsu_pfu_pfb_entry_2_pfu_pfb_entry_l1_page_sec_x; // @[pfu.scala 524:11]
  wire  ct_lsu_pfu_pfb_entry_2_pfu_pfb_entry_l1_page_share_x; // @[pfu.scala 524:11]
  wire [39:0] ct_lsu_pfu_pfb_entry_2_pfu_pfb_entry_l1_pf_addr_v; // @[pfu.scala 524:11]
  wire [27:0] ct_lsu_pfu_pfb_entry_2_pfu_pfb_entry_l1_vpn_v; // @[pfu.scala 524:11]
  wire  ct_lsu_pfu_pfb_entry_2_pfu_pfb_entry_l2_page_sec_x; // @[pfu.scala 524:11]
  wire  ct_lsu_pfu_pfb_entry_2_pfu_pfb_entry_l2_page_share_x; // @[pfu.scala 524:11]
  wire [39:0] ct_lsu_pfu_pfb_entry_2_pfu_pfb_entry_l2_pf_addr_v; // @[pfu.scala 524:11]
  wire [27:0] ct_lsu_pfu_pfb_entry_2_pfu_pfb_entry_l2_vpn_v; // @[pfu.scala 524:11]
  wire [1:0] ct_lsu_pfu_pfb_entry_2_pfu_pfb_entry_mmu_pe_req_src_v; // @[pfu.scala 524:11]
  wire  ct_lsu_pfu_pfb_entry_2_pfu_pfb_entry_mmu_pe_req_x; // @[pfu.scala 524:11]
  wire [1:0] ct_lsu_pfu_pfb_entry_2_pfu_pfb_entry_priv_mode_v; // @[pfu.scala 524:11]
  wire  ct_lsu_pfu_pfb_entry_2_pfu_pfb_entry_vld_x; // @[pfu.scala 524:11]
  wire  ct_lsu_pfu_pfb_entry_3_amr_wa_cancel; // @[pfu.scala 525:11]
  wire  ct_lsu_pfu_pfb_entry_3_cp0_lsu_icg_en; // @[pfu.scala 525:11]
  wire  ct_lsu_pfu_pfb_entry_3_cp0_lsu_l2_st_pref_en; // @[pfu.scala 525:11]
  wire  ct_lsu_pfu_pfb_entry_3_cp0_lsu_pfu_mmu_dis; // @[pfu.scala 525:11]
  wire  ct_lsu_pfu_pfb_entry_3_cp0_yy_clk_en; // @[pfu.scala 525:11]
  wire [1:0] ct_lsu_pfu_pfb_entry_3_cp0_yy_priv_mode; // @[pfu.scala 525:11]
  wire  ct_lsu_pfu_pfb_entry_3_cpurst_b; // @[pfu.scala 525:11]
  wire [14:0] ct_lsu_pfu_pfb_entry_3_ld_da_ldfifo_pc; // @[pfu.scala 525:11]
  wire  ct_lsu_pfu_pfb_entry_3_ld_da_page_sec_ff; // @[pfu.scala 525:11]
  wire  ct_lsu_pfu_pfb_entry_3_ld_da_page_share_ff; // @[pfu.scala 525:11]
  wire  ct_lsu_pfu_pfb_entry_3_ld_da_pfu_act_dp_vld; // @[pfu.scala 525:11]
  wire  ct_lsu_pfu_pfb_entry_3_ld_da_pfu_act_vld; // @[pfu.scala 525:11]
  wire  ct_lsu_pfu_pfb_entry_3_ld_da_pfu_evict_cnt_vld; // @[pfu.scala 525:11]
  wire  ct_lsu_pfu_pfb_entry_3_ld_da_pfu_pf_inst_vld; // @[pfu.scala 525:11]
  wire [39:0] ct_lsu_pfu_pfb_entry_3_ld_da_ppfu_va; // @[pfu.scala 525:11]
  wire [27:0] ct_lsu_pfu_pfb_entry_3_ld_da_ppn_ff; // @[pfu.scala 525:11]
  wire [3:0] ct_lsu_pfu_pfb_entry_3_lsu_pfu_l1_dist_sel; // @[pfu.scala 525:11]
  wire [3:0] ct_lsu_pfu_pfb_entry_3_lsu_pfu_l2_dist_sel; // @[pfu.scala 525:11]
  wire  ct_lsu_pfu_pfb_entry_3_lsu_special_clk; // @[pfu.scala 525:11]
  wire  ct_lsu_pfu_pfb_entry_3_pad_yy_icg_scan_en; // @[pfu.scala 525:11]
  wire [5:0] ct_lsu_pfu_pfb_entry_3_pfb_no_req_cnt_val; // @[pfu.scala 525:11]
  wire [7:0] ct_lsu_pfu_pfb_entry_3_pfb_timeout_cnt_val; // @[pfu.scala 525:11]
  wire  ct_lsu_pfu_pfb_entry_3_pfu_biu_pe_req_sel_l1; // @[pfu.scala 525:11]
  wire  ct_lsu_pfu_pfb_entry_3_pfu_dcache_pref_en; // @[pfu.scala 525:11]
  wire  ct_lsu_pfu_pfb_entry_3_pfu_get_page_sec; // @[pfu.scala 525:11]
  wire  ct_lsu_pfu_pfb_entry_3_pfu_get_page_share; // @[pfu.scala 525:11]
  wire [27:0] ct_lsu_pfu_pfb_entry_3_pfu_get_ppn; // @[pfu.scala 525:11]
  wire  ct_lsu_pfu_pfb_entry_3_pfu_get_ppn_err; // @[pfu.scala 525:11]
  wire  ct_lsu_pfu_pfb_entry_3_pfu_get_ppn_vld; // @[pfu.scala 525:11]
  wire  ct_lsu_pfu_pfb_entry_3_pfu_l2_pref_en; // @[pfu.scala 525:11]
  wire  ct_lsu_pfu_pfb_entry_3_pfu_mmu_pe_req_sel_l1; // @[pfu.scala 525:11]
  wire [14:0] ct_lsu_pfu_pfb_entry_3_pfu_pfb_create_pc; // @[pfu.scala 525:11]
  wire [10:0] ct_lsu_pfu_pfb_entry_3_pfu_pfb_create_stride; // @[pfu.scala 525:11]
  wire  ct_lsu_pfu_pfb_entry_3_pfu_pfb_create_stride_neg; // @[pfu.scala 525:11]
  wire [6:0] ct_lsu_pfu_pfb_entry_3_pfu_pfb_create_strideh_6to0; // @[pfu.scala 525:11]
  wire  ct_lsu_pfu_pfb_entry_3_pfu_pfb_create_type_ld; // @[pfu.scala 525:11]
  wire  ct_lsu_pfu_pfb_entry_3_pfu_pfb_entry_biu_pe_req_grnt_x; // @[pfu.scala 525:11]
  wire  ct_lsu_pfu_pfb_entry_3_pfu_pfb_entry_create_dp_vld_x; // @[pfu.scala 525:11]
  wire  ct_lsu_pfu_pfb_entry_3_pfu_pfb_entry_create_gateclk_en_x; // @[pfu.scala 525:11]
  wire  ct_lsu_pfu_pfb_entry_3_pfu_pfb_entry_create_vld_x; // @[pfu.scala 525:11]
  wire  ct_lsu_pfu_pfb_entry_3_pfu_pfb_entry_from_lfb_dcache_hit_x; // @[pfu.scala 525:11]
  wire  ct_lsu_pfu_pfb_entry_3_pfu_pfb_entry_from_lfb_dcache_miss_x; // @[pfu.scala 525:11]
  wire  ct_lsu_pfu_pfb_entry_3_pfu_pfb_entry_mmu_pe_req_grnt_x; // @[pfu.scala 525:11]
  wire  ct_lsu_pfu_pfb_entry_3_pfu_pop_all_part_vld; // @[pfu.scala 525:11]
  wire  ct_lsu_pfu_pfb_entry_3_st_da_page_sec_ff; // @[pfu.scala 525:11]
  wire  ct_lsu_pfu_pfb_entry_3_st_da_page_share_ff; // @[pfu.scala 525:11]
  wire [14:0] ct_lsu_pfu_pfb_entry_3_st_da_pc; // @[pfu.scala 525:11]
  wire  ct_lsu_pfu_pfb_entry_3_st_da_pfu_act_vld; // @[pfu.scala 525:11]
  wire  ct_lsu_pfu_pfb_entry_3_st_da_pfu_evict_cnt_vld; // @[pfu.scala 525:11]
  wire  ct_lsu_pfu_pfb_entry_3_st_da_pfu_pf_inst_vld; // @[pfu.scala 525:11]
  wire [39:0] ct_lsu_pfu_pfb_entry_3_st_da_ppfu_va; // @[pfu.scala 525:11]
  wire [27:0] ct_lsu_pfu_pfb_entry_3_st_da_ppn_ff; // @[pfu.scala 525:11]
  wire [1:0] ct_lsu_pfu_pfb_entry_3_pfu_pfb_entry_biu_pe_req_src_v; // @[pfu.scala 525:11]
  wire  ct_lsu_pfu_pfb_entry_3_pfu_pfb_entry_biu_pe_req_x; // @[pfu.scala 525:11]
  wire  ct_lsu_pfu_pfb_entry_3_pfu_pfb_entry_evict_x; // @[pfu.scala 525:11]
  wire  ct_lsu_pfu_pfb_entry_3_pfu_pfb_entry_hit_pc_x; // @[pfu.scala 525:11]
  wire  ct_lsu_pfu_pfb_entry_3_pfu_pfb_entry_l1_page_sec_x; // @[pfu.scala 525:11]
  wire  ct_lsu_pfu_pfb_entry_3_pfu_pfb_entry_l1_page_share_x; // @[pfu.scala 525:11]
  wire [39:0] ct_lsu_pfu_pfb_entry_3_pfu_pfb_entry_l1_pf_addr_v; // @[pfu.scala 525:11]
  wire [27:0] ct_lsu_pfu_pfb_entry_3_pfu_pfb_entry_l1_vpn_v; // @[pfu.scala 525:11]
  wire  ct_lsu_pfu_pfb_entry_3_pfu_pfb_entry_l2_page_sec_x; // @[pfu.scala 525:11]
  wire  ct_lsu_pfu_pfb_entry_3_pfu_pfb_entry_l2_page_share_x; // @[pfu.scala 525:11]
  wire [39:0] ct_lsu_pfu_pfb_entry_3_pfu_pfb_entry_l2_pf_addr_v; // @[pfu.scala 525:11]
  wire [27:0] ct_lsu_pfu_pfb_entry_3_pfu_pfb_entry_l2_vpn_v; // @[pfu.scala 525:11]
  wire [1:0] ct_lsu_pfu_pfb_entry_3_pfu_pfb_entry_mmu_pe_req_src_v; // @[pfu.scala 525:11]
  wire  ct_lsu_pfu_pfb_entry_3_pfu_pfb_entry_mmu_pe_req_x; // @[pfu.scala 525:11]
  wire [1:0] ct_lsu_pfu_pfb_entry_3_pfu_pfb_entry_priv_mode_v; // @[pfu.scala 525:11]
  wire  ct_lsu_pfu_pfb_entry_3_pfu_pfb_entry_vld_x; // @[pfu.scala 525:11]
  wire  ct_lsu_pfu_pfb_entry_4_amr_wa_cancel; // @[pfu.scala 526:11]
  wire  ct_lsu_pfu_pfb_entry_4_cp0_lsu_icg_en; // @[pfu.scala 526:11]
  wire  ct_lsu_pfu_pfb_entry_4_cp0_lsu_l2_st_pref_en; // @[pfu.scala 526:11]
  wire  ct_lsu_pfu_pfb_entry_4_cp0_lsu_pfu_mmu_dis; // @[pfu.scala 526:11]
  wire  ct_lsu_pfu_pfb_entry_4_cp0_yy_clk_en; // @[pfu.scala 526:11]
  wire [1:0] ct_lsu_pfu_pfb_entry_4_cp0_yy_priv_mode; // @[pfu.scala 526:11]
  wire  ct_lsu_pfu_pfb_entry_4_cpurst_b; // @[pfu.scala 526:11]
  wire [14:0] ct_lsu_pfu_pfb_entry_4_ld_da_ldfifo_pc; // @[pfu.scala 526:11]
  wire  ct_lsu_pfu_pfb_entry_4_ld_da_page_sec_ff; // @[pfu.scala 526:11]
  wire  ct_lsu_pfu_pfb_entry_4_ld_da_page_share_ff; // @[pfu.scala 526:11]
  wire  ct_lsu_pfu_pfb_entry_4_ld_da_pfu_act_dp_vld; // @[pfu.scala 526:11]
  wire  ct_lsu_pfu_pfb_entry_4_ld_da_pfu_act_vld; // @[pfu.scala 526:11]
  wire  ct_lsu_pfu_pfb_entry_4_ld_da_pfu_evict_cnt_vld; // @[pfu.scala 526:11]
  wire  ct_lsu_pfu_pfb_entry_4_ld_da_pfu_pf_inst_vld; // @[pfu.scala 526:11]
  wire [39:0] ct_lsu_pfu_pfb_entry_4_ld_da_ppfu_va; // @[pfu.scala 526:11]
  wire [27:0] ct_lsu_pfu_pfb_entry_4_ld_da_ppn_ff; // @[pfu.scala 526:11]
  wire [3:0] ct_lsu_pfu_pfb_entry_4_lsu_pfu_l1_dist_sel; // @[pfu.scala 526:11]
  wire [3:0] ct_lsu_pfu_pfb_entry_4_lsu_pfu_l2_dist_sel; // @[pfu.scala 526:11]
  wire  ct_lsu_pfu_pfb_entry_4_lsu_special_clk; // @[pfu.scala 526:11]
  wire  ct_lsu_pfu_pfb_entry_4_pad_yy_icg_scan_en; // @[pfu.scala 526:11]
  wire [5:0] ct_lsu_pfu_pfb_entry_4_pfb_no_req_cnt_val; // @[pfu.scala 526:11]
  wire [7:0] ct_lsu_pfu_pfb_entry_4_pfb_timeout_cnt_val; // @[pfu.scala 526:11]
  wire  ct_lsu_pfu_pfb_entry_4_pfu_biu_pe_req_sel_l1; // @[pfu.scala 526:11]
  wire  ct_lsu_pfu_pfb_entry_4_pfu_dcache_pref_en; // @[pfu.scala 526:11]
  wire  ct_lsu_pfu_pfb_entry_4_pfu_get_page_sec; // @[pfu.scala 526:11]
  wire  ct_lsu_pfu_pfb_entry_4_pfu_get_page_share; // @[pfu.scala 526:11]
  wire [27:0] ct_lsu_pfu_pfb_entry_4_pfu_get_ppn; // @[pfu.scala 526:11]
  wire  ct_lsu_pfu_pfb_entry_4_pfu_get_ppn_err; // @[pfu.scala 526:11]
  wire  ct_lsu_pfu_pfb_entry_4_pfu_get_ppn_vld; // @[pfu.scala 526:11]
  wire  ct_lsu_pfu_pfb_entry_4_pfu_l2_pref_en; // @[pfu.scala 526:11]
  wire  ct_lsu_pfu_pfb_entry_4_pfu_mmu_pe_req_sel_l1; // @[pfu.scala 526:11]
  wire [14:0] ct_lsu_pfu_pfb_entry_4_pfu_pfb_create_pc; // @[pfu.scala 526:11]
  wire [10:0] ct_lsu_pfu_pfb_entry_4_pfu_pfb_create_stride; // @[pfu.scala 526:11]
  wire  ct_lsu_pfu_pfb_entry_4_pfu_pfb_create_stride_neg; // @[pfu.scala 526:11]
  wire [6:0] ct_lsu_pfu_pfb_entry_4_pfu_pfb_create_strideh_6to0; // @[pfu.scala 526:11]
  wire  ct_lsu_pfu_pfb_entry_4_pfu_pfb_create_type_ld; // @[pfu.scala 526:11]
  wire  ct_lsu_pfu_pfb_entry_4_pfu_pfb_entry_biu_pe_req_grnt_x; // @[pfu.scala 526:11]
  wire  ct_lsu_pfu_pfb_entry_4_pfu_pfb_entry_create_dp_vld_x; // @[pfu.scala 526:11]
  wire  ct_lsu_pfu_pfb_entry_4_pfu_pfb_entry_create_gateclk_en_x; // @[pfu.scala 526:11]
  wire  ct_lsu_pfu_pfb_entry_4_pfu_pfb_entry_create_vld_x; // @[pfu.scala 526:11]
  wire  ct_lsu_pfu_pfb_entry_4_pfu_pfb_entry_from_lfb_dcache_hit_x; // @[pfu.scala 526:11]
  wire  ct_lsu_pfu_pfb_entry_4_pfu_pfb_entry_from_lfb_dcache_miss_x; // @[pfu.scala 526:11]
  wire  ct_lsu_pfu_pfb_entry_4_pfu_pfb_entry_mmu_pe_req_grnt_x; // @[pfu.scala 526:11]
  wire  ct_lsu_pfu_pfb_entry_4_pfu_pop_all_part_vld; // @[pfu.scala 526:11]
  wire  ct_lsu_pfu_pfb_entry_4_st_da_page_sec_ff; // @[pfu.scala 526:11]
  wire  ct_lsu_pfu_pfb_entry_4_st_da_page_share_ff; // @[pfu.scala 526:11]
  wire [14:0] ct_lsu_pfu_pfb_entry_4_st_da_pc; // @[pfu.scala 526:11]
  wire  ct_lsu_pfu_pfb_entry_4_st_da_pfu_act_vld; // @[pfu.scala 526:11]
  wire  ct_lsu_pfu_pfb_entry_4_st_da_pfu_evict_cnt_vld; // @[pfu.scala 526:11]
  wire  ct_lsu_pfu_pfb_entry_4_st_da_pfu_pf_inst_vld; // @[pfu.scala 526:11]
  wire [39:0] ct_lsu_pfu_pfb_entry_4_st_da_ppfu_va; // @[pfu.scala 526:11]
  wire [27:0] ct_lsu_pfu_pfb_entry_4_st_da_ppn_ff; // @[pfu.scala 526:11]
  wire [1:0] ct_lsu_pfu_pfb_entry_4_pfu_pfb_entry_biu_pe_req_src_v; // @[pfu.scala 526:11]
  wire  ct_lsu_pfu_pfb_entry_4_pfu_pfb_entry_biu_pe_req_x; // @[pfu.scala 526:11]
  wire  ct_lsu_pfu_pfb_entry_4_pfu_pfb_entry_evict_x; // @[pfu.scala 526:11]
  wire  ct_lsu_pfu_pfb_entry_4_pfu_pfb_entry_hit_pc_x; // @[pfu.scala 526:11]
  wire  ct_lsu_pfu_pfb_entry_4_pfu_pfb_entry_l1_page_sec_x; // @[pfu.scala 526:11]
  wire  ct_lsu_pfu_pfb_entry_4_pfu_pfb_entry_l1_page_share_x; // @[pfu.scala 526:11]
  wire [39:0] ct_lsu_pfu_pfb_entry_4_pfu_pfb_entry_l1_pf_addr_v; // @[pfu.scala 526:11]
  wire [27:0] ct_lsu_pfu_pfb_entry_4_pfu_pfb_entry_l1_vpn_v; // @[pfu.scala 526:11]
  wire  ct_lsu_pfu_pfb_entry_4_pfu_pfb_entry_l2_page_sec_x; // @[pfu.scala 526:11]
  wire  ct_lsu_pfu_pfb_entry_4_pfu_pfb_entry_l2_page_share_x; // @[pfu.scala 526:11]
  wire [39:0] ct_lsu_pfu_pfb_entry_4_pfu_pfb_entry_l2_pf_addr_v; // @[pfu.scala 526:11]
  wire [27:0] ct_lsu_pfu_pfb_entry_4_pfu_pfb_entry_l2_vpn_v; // @[pfu.scala 526:11]
  wire [1:0] ct_lsu_pfu_pfb_entry_4_pfu_pfb_entry_mmu_pe_req_src_v; // @[pfu.scala 526:11]
  wire  ct_lsu_pfu_pfb_entry_4_pfu_pfb_entry_mmu_pe_req_x; // @[pfu.scala 526:11]
  wire [1:0] ct_lsu_pfu_pfb_entry_4_pfu_pfb_entry_priv_mode_v; // @[pfu.scala 526:11]
  wire  ct_lsu_pfu_pfb_entry_4_pfu_pfb_entry_vld_x; // @[pfu.scala 526:11]
  wire  ct_lsu_pfu_pfb_entry_5_amr_wa_cancel; // @[pfu.scala 527:11]
  wire  ct_lsu_pfu_pfb_entry_5_cp0_lsu_icg_en; // @[pfu.scala 527:11]
  wire  ct_lsu_pfu_pfb_entry_5_cp0_lsu_l2_st_pref_en; // @[pfu.scala 527:11]
  wire  ct_lsu_pfu_pfb_entry_5_cp0_lsu_pfu_mmu_dis; // @[pfu.scala 527:11]
  wire  ct_lsu_pfu_pfb_entry_5_cp0_yy_clk_en; // @[pfu.scala 527:11]
  wire [1:0] ct_lsu_pfu_pfb_entry_5_cp0_yy_priv_mode; // @[pfu.scala 527:11]
  wire  ct_lsu_pfu_pfb_entry_5_cpurst_b; // @[pfu.scala 527:11]
  wire [14:0] ct_lsu_pfu_pfb_entry_5_ld_da_ldfifo_pc; // @[pfu.scala 527:11]
  wire  ct_lsu_pfu_pfb_entry_5_ld_da_page_sec_ff; // @[pfu.scala 527:11]
  wire  ct_lsu_pfu_pfb_entry_5_ld_da_page_share_ff; // @[pfu.scala 527:11]
  wire  ct_lsu_pfu_pfb_entry_5_ld_da_pfu_act_dp_vld; // @[pfu.scala 527:11]
  wire  ct_lsu_pfu_pfb_entry_5_ld_da_pfu_act_vld; // @[pfu.scala 527:11]
  wire  ct_lsu_pfu_pfb_entry_5_ld_da_pfu_evict_cnt_vld; // @[pfu.scala 527:11]
  wire  ct_lsu_pfu_pfb_entry_5_ld_da_pfu_pf_inst_vld; // @[pfu.scala 527:11]
  wire [39:0] ct_lsu_pfu_pfb_entry_5_ld_da_ppfu_va; // @[pfu.scala 527:11]
  wire [27:0] ct_lsu_pfu_pfb_entry_5_ld_da_ppn_ff; // @[pfu.scala 527:11]
  wire [3:0] ct_lsu_pfu_pfb_entry_5_lsu_pfu_l1_dist_sel; // @[pfu.scala 527:11]
  wire [3:0] ct_lsu_pfu_pfb_entry_5_lsu_pfu_l2_dist_sel; // @[pfu.scala 527:11]
  wire  ct_lsu_pfu_pfb_entry_5_lsu_special_clk; // @[pfu.scala 527:11]
  wire  ct_lsu_pfu_pfb_entry_5_pad_yy_icg_scan_en; // @[pfu.scala 527:11]
  wire [5:0] ct_lsu_pfu_pfb_entry_5_pfb_no_req_cnt_val; // @[pfu.scala 527:11]
  wire [7:0] ct_lsu_pfu_pfb_entry_5_pfb_timeout_cnt_val; // @[pfu.scala 527:11]
  wire  ct_lsu_pfu_pfb_entry_5_pfu_biu_pe_req_sel_l1; // @[pfu.scala 527:11]
  wire  ct_lsu_pfu_pfb_entry_5_pfu_dcache_pref_en; // @[pfu.scala 527:11]
  wire  ct_lsu_pfu_pfb_entry_5_pfu_get_page_sec; // @[pfu.scala 527:11]
  wire  ct_lsu_pfu_pfb_entry_5_pfu_get_page_share; // @[pfu.scala 527:11]
  wire [27:0] ct_lsu_pfu_pfb_entry_5_pfu_get_ppn; // @[pfu.scala 527:11]
  wire  ct_lsu_pfu_pfb_entry_5_pfu_get_ppn_err; // @[pfu.scala 527:11]
  wire  ct_lsu_pfu_pfb_entry_5_pfu_get_ppn_vld; // @[pfu.scala 527:11]
  wire  ct_lsu_pfu_pfb_entry_5_pfu_l2_pref_en; // @[pfu.scala 527:11]
  wire  ct_lsu_pfu_pfb_entry_5_pfu_mmu_pe_req_sel_l1; // @[pfu.scala 527:11]
  wire [14:0] ct_lsu_pfu_pfb_entry_5_pfu_pfb_create_pc; // @[pfu.scala 527:11]
  wire [10:0] ct_lsu_pfu_pfb_entry_5_pfu_pfb_create_stride; // @[pfu.scala 527:11]
  wire  ct_lsu_pfu_pfb_entry_5_pfu_pfb_create_stride_neg; // @[pfu.scala 527:11]
  wire [6:0] ct_lsu_pfu_pfb_entry_5_pfu_pfb_create_strideh_6to0; // @[pfu.scala 527:11]
  wire  ct_lsu_pfu_pfb_entry_5_pfu_pfb_create_type_ld; // @[pfu.scala 527:11]
  wire  ct_lsu_pfu_pfb_entry_5_pfu_pfb_entry_biu_pe_req_grnt_x; // @[pfu.scala 527:11]
  wire  ct_lsu_pfu_pfb_entry_5_pfu_pfb_entry_create_dp_vld_x; // @[pfu.scala 527:11]
  wire  ct_lsu_pfu_pfb_entry_5_pfu_pfb_entry_create_gateclk_en_x; // @[pfu.scala 527:11]
  wire  ct_lsu_pfu_pfb_entry_5_pfu_pfb_entry_create_vld_x; // @[pfu.scala 527:11]
  wire  ct_lsu_pfu_pfb_entry_5_pfu_pfb_entry_from_lfb_dcache_hit_x; // @[pfu.scala 527:11]
  wire  ct_lsu_pfu_pfb_entry_5_pfu_pfb_entry_from_lfb_dcache_miss_x; // @[pfu.scala 527:11]
  wire  ct_lsu_pfu_pfb_entry_5_pfu_pfb_entry_mmu_pe_req_grnt_x; // @[pfu.scala 527:11]
  wire  ct_lsu_pfu_pfb_entry_5_pfu_pop_all_part_vld; // @[pfu.scala 527:11]
  wire  ct_lsu_pfu_pfb_entry_5_st_da_page_sec_ff; // @[pfu.scala 527:11]
  wire  ct_lsu_pfu_pfb_entry_5_st_da_page_share_ff; // @[pfu.scala 527:11]
  wire [14:0] ct_lsu_pfu_pfb_entry_5_st_da_pc; // @[pfu.scala 527:11]
  wire  ct_lsu_pfu_pfb_entry_5_st_da_pfu_act_vld; // @[pfu.scala 527:11]
  wire  ct_lsu_pfu_pfb_entry_5_st_da_pfu_evict_cnt_vld; // @[pfu.scala 527:11]
  wire  ct_lsu_pfu_pfb_entry_5_st_da_pfu_pf_inst_vld; // @[pfu.scala 527:11]
  wire [39:0] ct_lsu_pfu_pfb_entry_5_st_da_ppfu_va; // @[pfu.scala 527:11]
  wire [27:0] ct_lsu_pfu_pfb_entry_5_st_da_ppn_ff; // @[pfu.scala 527:11]
  wire [1:0] ct_lsu_pfu_pfb_entry_5_pfu_pfb_entry_biu_pe_req_src_v; // @[pfu.scala 527:11]
  wire  ct_lsu_pfu_pfb_entry_5_pfu_pfb_entry_biu_pe_req_x; // @[pfu.scala 527:11]
  wire  ct_lsu_pfu_pfb_entry_5_pfu_pfb_entry_evict_x; // @[pfu.scala 527:11]
  wire  ct_lsu_pfu_pfb_entry_5_pfu_pfb_entry_hit_pc_x; // @[pfu.scala 527:11]
  wire  ct_lsu_pfu_pfb_entry_5_pfu_pfb_entry_l1_page_sec_x; // @[pfu.scala 527:11]
  wire  ct_lsu_pfu_pfb_entry_5_pfu_pfb_entry_l1_page_share_x; // @[pfu.scala 527:11]
  wire [39:0] ct_lsu_pfu_pfb_entry_5_pfu_pfb_entry_l1_pf_addr_v; // @[pfu.scala 527:11]
  wire [27:0] ct_lsu_pfu_pfb_entry_5_pfu_pfb_entry_l1_vpn_v; // @[pfu.scala 527:11]
  wire  ct_lsu_pfu_pfb_entry_5_pfu_pfb_entry_l2_page_sec_x; // @[pfu.scala 527:11]
  wire  ct_lsu_pfu_pfb_entry_5_pfu_pfb_entry_l2_page_share_x; // @[pfu.scala 527:11]
  wire [39:0] ct_lsu_pfu_pfb_entry_5_pfu_pfb_entry_l2_pf_addr_v; // @[pfu.scala 527:11]
  wire [27:0] ct_lsu_pfu_pfb_entry_5_pfu_pfb_entry_l2_vpn_v; // @[pfu.scala 527:11]
  wire [1:0] ct_lsu_pfu_pfb_entry_5_pfu_pfb_entry_mmu_pe_req_src_v; // @[pfu.scala 527:11]
  wire  ct_lsu_pfu_pfb_entry_5_pfu_pfb_entry_mmu_pe_req_x; // @[pfu.scala 527:11]
  wire [1:0] ct_lsu_pfu_pfb_entry_5_pfu_pfb_entry_priv_mode_v; // @[pfu.scala 527:11]
  wire  ct_lsu_pfu_pfb_entry_5_pfu_pfb_entry_vld_x; // @[pfu.scala 527:11]
  wire  ct_lsu_pfu_pfb_entry_6_amr_wa_cancel; // @[pfu.scala 528:11]
  wire  ct_lsu_pfu_pfb_entry_6_cp0_lsu_icg_en; // @[pfu.scala 528:11]
  wire  ct_lsu_pfu_pfb_entry_6_cp0_lsu_l2_st_pref_en; // @[pfu.scala 528:11]
  wire  ct_lsu_pfu_pfb_entry_6_cp0_lsu_pfu_mmu_dis; // @[pfu.scala 528:11]
  wire  ct_lsu_pfu_pfb_entry_6_cp0_yy_clk_en; // @[pfu.scala 528:11]
  wire [1:0] ct_lsu_pfu_pfb_entry_6_cp0_yy_priv_mode; // @[pfu.scala 528:11]
  wire  ct_lsu_pfu_pfb_entry_6_cpurst_b; // @[pfu.scala 528:11]
  wire [14:0] ct_lsu_pfu_pfb_entry_6_ld_da_ldfifo_pc; // @[pfu.scala 528:11]
  wire  ct_lsu_pfu_pfb_entry_6_ld_da_page_sec_ff; // @[pfu.scala 528:11]
  wire  ct_lsu_pfu_pfb_entry_6_ld_da_page_share_ff; // @[pfu.scala 528:11]
  wire  ct_lsu_pfu_pfb_entry_6_ld_da_pfu_act_dp_vld; // @[pfu.scala 528:11]
  wire  ct_lsu_pfu_pfb_entry_6_ld_da_pfu_act_vld; // @[pfu.scala 528:11]
  wire  ct_lsu_pfu_pfb_entry_6_ld_da_pfu_evict_cnt_vld; // @[pfu.scala 528:11]
  wire  ct_lsu_pfu_pfb_entry_6_ld_da_pfu_pf_inst_vld; // @[pfu.scala 528:11]
  wire [39:0] ct_lsu_pfu_pfb_entry_6_ld_da_ppfu_va; // @[pfu.scala 528:11]
  wire [27:0] ct_lsu_pfu_pfb_entry_6_ld_da_ppn_ff; // @[pfu.scala 528:11]
  wire [3:0] ct_lsu_pfu_pfb_entry_6_lsu_pfu_l1_dist_sel; // @[pfu.scala 528:11]
  wire [3:0] ct_lsu_pfu_pfb_entry_6_lsu_pfu_l2_dist_sel; // @[pfu.scala 528:11]
  wire  ct_lsu_pfu_pfb_entry_6_lsu_special_clk; // @[pfu.scala 528:11]
  wire  ct_lsu_pfu_pfb_entry_6_pad_yy_icg_scan_en; // @[pfu.scala 528:11]
  wire [5:0] ct_lsu_pfu_pfb_entry_6_pfb_no_req_cnt_val; // @[pfu.scala 528:11]
  wire [7:0] ct_lsu_pfu_pfb_entry_6_pfb_timeout_cnt_val; // @[pfu.scala 528:11]
  wire  ct_lsu_pfu_pfb_entry_6_pfu_biu_pe_req_sel_l1; // @[pfu.scala 528:11]
  wire  ct_lsu_pfu_pfb_entry_6_pfu_dcache_pref_en; // @[pfu.scala 528:11]
  wire  ct_lsu_pfu_pfb_entry_6_pfu_get_page_sec; // @[pfu.scala 528:11]
  wire  ct_lsu_pfu_pfb_entry_6_pfu_get_page_share; // @[pfu.scala 528:11]
  wire [27:0] ct_lsu_pfu_pfb_entry_6_pfu_get_ppn; // @[pfu.scala 528:11]
  wire  ct_lsu_pfu_pfb_entry_6_pfu_get_ppn_err; // @[pfu.scala 528:11]
  wire  ct_lsu_pfu_pfb_entry_6_pfu_get_ppn_vld; // @[pfu.scala 528:11]
  wire  ct_lsu_pfu_pfb_entry_6_pfu_l2_pref_en; // @[pfu.scala 528:11]
  wire  ct_lsu_pfu_pfb_entry_6_pfu_mmu_pe_req_sel_l1; // @[pfu.scala 528:11]
  wire [14:0] ct_lsu_pfu_pfb_entry_6_pfu_pfb_create_pc; // @[pfu.scala 528:11]
  wire [10:0] ct_lsu_pfu_pfb_entry_6_pfu_pfb_create_stride; // @[pfu.scala 528:11]
  wire  ct_lsu_pfu_pfb_entry_6_pfu_pfb_create_stride_neg; // @[pfu.scala 528:11]
  wire [6:0] ct_lsu_pfu_pfb_entry_6_pfu_pfb_create_strideh_6to0; // @[pfu.scala 528:11]
  wire  ct_lsu_pfu_pfb_entry_6_pfu_pfb_create_type_ld; // @[pfu.scala 528:11]
  wire  ct_lsu_pfu_pfb_entry_6_pfu_pfb_entry_biu_pe_req_grnt_x; // @[pfu.scala 528:11]
  wire  ct_lsu_pfu_pfb_entry_6_pfu_pfb_entry_create_dp_vld_x; // @[pfu.scala 528:11]
  wire  ct_lsu_pfu_pfb_entry_6_pfu_pfb_entry_create_gateclk_en_x; // @[pfu.scala 528:11]
  wire  ct_lsu_pfu_pfb_entry_6_pfu_pfb_entry_create_vld_x; // @[pfu.scala 528:11]
  wire  ct_lsu_pfu_pfb_entry_6_pfu_pfb_entry_from_lfb_dcache_hit_x; // @[pfu.scala 528:11]
  wire  ct_lsu_pfu_pfb_entry_6_pfu_pfb_entry_from_lfb_dcache_miss_x; // @[pfu.scala 528:11]
  wire  ct_lsu_pfu_pfb_entry_6_pfu_pfb_entry_mmu_pe_req_grnt_x; // @[pfu.scala 528:11]
  wire  ct_lsu_pfu_pfb_entry_6_pfu_pop_all_part_vld; // @[pfu.scala 528:11]
  wire  ct_lsu_pfu_pfb_entry_6_st_da_page_sec_ff; // @[pfu.scala 528:11]
  wire  ct_lsu_pfu_pfb_entry_6_st_da_page_share_ff; // @[pfu.scala 528:11]
  wire [14:0] ct_lsu_pfu_pfb_entry_6_st_da_pc; // @[pfu.scala 528:11]
  wire  ct_lsu_pfu_pfb_entry_6_st_da_pfu_act_vld; // @[pfu.scala 528:11]
  wire  ct_lsu_pfu_pfb_entry_6_st_da_pfu_evict_cnt_vld; // @[pfu.scala 528:11]
  wire  ct_lsu_pfu_pfb_entry_6_st_da_pfu_pf_inst_vld; // @[pfu.scala 528:11]
  wire [39:0] ct_lsu_pfu_pfb_entry_6_st_da_ppfu_va; // @[pfu.scala 528:11]
  wire [27:0] ct_lsu_pfu_pfb_entry_6_st_da_ppn_ff; // @[pfu.scala 528:11]
  wire [1:0] ct_lsu_pfu_pfb_entry_6_pfu_pfb_entry_biu_pe_req_src_v; // @[pfu.scala 528:11]
  wire  ct_lsu_pfu_pfb_entry_6_pfu_pfb_entry_biu_pe_req_x; // @[pfu.scala 528:11]
  wire  ct_lsu_pfu_pfb_entry_6_pfu_pfb_entry_evict_x; // @[pfu.scala 528:11]
  wire  ct_lsu_pfu_pfb_entry_6_pfu_pfb_entry_hit_pc_x; // @[pfu.scala 528:11]
  wire  ct_lsu_pfu_pfb_entry_6_pfu_pfb_entry_l1_page_sec_x; // @[pfu.scala 528:11]
  wire  ct_lsu_pfu_pfb_entry_6_pfu_pfb_entry_l1_page_share_x; // @[pfu.scala 528:11]
  wire [39:0] ct_lsu_pfu_pfb_entry_6_pfu_pfb_entry_l1_pf_addr_v; // @[pfu.scala 528:11]
  wire [27:0] ct_lsu_pfu_pfb_entry_6_pfu_pfb_entry_l1_vpn_v; // @[pfu.scala 528:11]
  wire  ct_lsu_pfu_pfb_entry_6_pfu_pfb_entry_l2_page_sec_x; // @[pfu.scala 528:11]
  wire  ct_lsu_pfu_pfb_entry_6_pfu_pfb_entry_l2_page_share_x; // @[pfu.scala 528:11]
  wire [39:0] ct_lsu_pfu_pfb_entry_6_pfu_pfb_entry_l2_pf_addr_v; // @[pfu.scala 528:11]
  wire [27:0] ct_lsu_pfu_pfb_entry_6_pfu_pfb_entry_l2_vpn_v; // @[pfu.scala 528:11]
  wire [1:0] ct_lsu_pfu_pfb_entry_6_pfu_pfb_entry_mmu_pe_req_src_v; // @[pfu.scala 528:11]
  wire  ct_lsu_pfu_pfb_entry_6_pfu_pfb_entry_mmu_pe_req_x; // @[pfu.scala 528:11]
  wire [1:0] ct_lsu_pfu_pfb_entry_6_pfu_pfb_entry_priv_mode_v; // @[pfu.scala 528:11]
  wire  ct_lsu_pfu_pfb_entry_6_pfu_pfb_entry_vld_x; // @[pfu.scala 528:11]
  wire  ct_lsu_pfu_pfb_entry_7_amr_wa_cancel; // @[pfu.scala 529:11]
  wire  ct_lsu_pfu_pfb_entry_7_cp0_lsu_icg_en; // @[pfu.scala 529:11]
  wire  ct_lsu_pfu_pfb_entry_7_cp0_lsu_l2_st_pref_en; // @[pfu.scala 529:11]
  wire  ct_lsu_pfu_pfb_entry_7_cp0_lsu_pfu_mmu_dis; // @[pfu.scala 529:11]
  wire  ct_lsu_pfu_pfb_entry_7_cp0_yy_clk_en; // @[pfu.scala 529:11]
  wire [1:0] ct_lsu_pfu_pfb_entry_7_cp0_yy_priv_mode; // @[pfu.scala 529:11]
  wire  ct_lsu_pfu_pfb_entry_7_cpurst_b; // @[pfu.scala 529:11]
  wire [14:0] ct_lsu_pfu_pfb_entry_7_ld_da_ldfifo_pc; // @[pfu.scala 529:11]
  wire  ct_lsu_pfu_pfb_entry_7_ld_da_page_sec_ff; // @[pfu.scala 529:11]
  wire  ct_lsu_pfu_pfb_entry_7_ld_da_page_share_ff; // @[pfu.scala 529:11]
  wire  ct_lsu_pfu_pfb_entry_7_ld_da_pfu_act_dp_vld; // @[pfu.scala 529:11]
  wire  ct_lsu_pfu_pfb_entry_7_ld_da_pfu_act_vld; // @[pfu.scala 529:11]
  wire  ct_lsu_pfu_pfb_entry_7_ld_da_pfu_evict_cnt_vld; // @[pfu.scala 529:11]
  wire  ct_lsu_pfu_pfb_entry_7_ld_da_pfu_pf_inst_vld; // @[pfu.scala 529:11]
  wire [39:0] ct_lsu_pfu_pfb_entry_7_ld_da_ppfu_va; // @[pfu.scala 529:11]
  wire [27:0] ct_lsu_pfu_pfb_entry_7_ld_da_ppn_ff; // @[pfu.scala 529:11]
  wire [3:0] ct_lsu_pfu_pfb_entry_7_lsu_pfu_l1_dist_sel; // @[pfu.scala 529:11]
  wire [3:0] ct_lsu_pfu_pfb_entry_7_lsu_pfu_l2_dist_sel; // @[pfu.scala 529:11]
  wire  ct_lsu_pfu_pfb_entry_7_lsu_special_clk; // @[pfu.scala 529:11]
  wire  ct_lsu_pfu_pfb_entry_7_pad_yy_icg_scan_en; // @[pfu.scala 529:11]
  wire [5:0] ct_lsu_pfu_pfb_entry_7_pfb_no_req_cnt_val; // @[pfu.scala 529:11]
  wire [7:0] ct_lsu_pfu_pfb_entry_7_pfb_timeout_cnt_val; // @[pfu.scala 529:11]
  wire  ct_lsu_pfu_pfb_entry_7_pfu_biu_pe_req_sel_l1; // @[pfu.scala 529:11]
  wire  ct_lsu_pfu_pfb_entry_7_pfu_dcache_pref_en; // @[pfu.scala 529:11]
  wire  ct_lsu_pfu_pfb_entry_7_pfu_get_page_sec; // @[pfu.scala 529:11]
  wire  ct_lsu_pfu_pfb_entry_7_pfu_get_page_share; // @[pfu.scala 529:11]
  wire [27:0] ct_lsu_pfu_pfb_entry_7_pfu_get_ppn; // @[pfu.scala 529:11]
  wire  ct_lsu_pfu_pfb_entry_7_pfu_get_ppn_err; // @[pfu.scala 529:11]
  wire  ct_lsu_pfu_pfb_entry_7_pfu_get_ppn_vld; // @[pfu.scala 529:11]
  wire  ct_lsu_pfu_pfb_entry_7_pfu_l2_pref_en; // @[pfu.scala 529:11]
  wire  ct_lsu_pfu_pfb_entry_7_pfu_mmu_pe_req_sel_l1; // @[pfu.scala 529:11]
  wire [14:0] ct_lsu_pfu_pfb_entry_7_pfu_pfb_create_pc; // @[pfu.scala 529:11]
  wire [10:0] ct_lsu_pfu_pfb_entry_7_pfu_pfb_create_stride; // @[pfu.scala 529:11]
  wire  ct_lsu_pfu_pfb_entry_7_pfu_pfb_create_stride_neg; // @[pfu.scala 529:11]
  wire [6:0] ct_lsu_pfu_pfb_entry_7_pfu_pfb_create_strideh_6to0; // @[pfu.scala 529:11]
  wire  ct_lsu_pfu_pfb_entry_7_pfu_pfb_create_type_ld; // @[pfu.scala 529:11]
  wire  ct_lsu_pfu_pfb_entry_7_pfu_pfb_entry_biu_pe_req_grnt_x; // @[pfu.scala 529:11]
  wire  ct_lsu_pfu_pfb_entry_7_pfu_pfb_entry_create_dp_vld_x; // @[pfu.scala 529:11]
  wire  ct_lsu_pfu_pfb_entry_7_pfu_pfb_entry_create_gateclk_en_x; // @[pfu.scala 529:11]
  wire  ct_lsu_pfu_pfb_entry_7_pfu_pfb_entry_create_vld_x; // @[pfu.scala 529:11]
  wire  ct_lsu_pfu_pfb_entry_7_pfu_pfb_entry_from_lfb_dcache_hit_x; // @[pfu.scala 529:11]
  wire  ct_lsu_pfu_pfb_entry_7_pfu_pfb_entry_from_lfb_dcache_miss_x; // @[pfu.scala 529:11]
  wire  ct_lsu_pfu_pfb_entry_7_pfu_pfb_entry_mmu_pe_req_grnt_x; // @[pfu.scala 529:11]
  wire  ct_lsu_pfu_pfb_entry_7_pfu_pop_all_part_vld; // @[pfu.scala 529:11]
  wire  ct_lsu_pfu_pfb_entry_7_st_da_page_sec_ff; // @[pfu.scala 529:11]
  wire  ct_lsu_pfu_pfb_entry_7_st_da_page_share_ff; // @[pfu.scala 529:11]
  wire [14:0] ct_lsu_pfu_pfb_entry_7_st_da_pc; // @[pfu.scala 529:11]
  wire  ct_lsu_pfu_pfb_entry_7_st_da_pfu_act_vld; // @[pfu.scala 529:11]
  wire  ct_lsu_pfu_pfb_entry_7_st_da_pfu_evict_cnt_vld; // @[pfu.scala 529:11]
  wire  ct_lsu_pfu_pfb_entry_7_st_da_pfu_pf_inst_vld; // @[pfu.scala 529:11]
  wire [39:0] ct_lsu_pfu_pfb_entry_7_st_da_ppfu_va; // @[pfu.scala 529:11]
  wire [27:0] ct_lsu_pfu_pfb_entry_7_st_da_ppn_ff; // @[pfu.scala 529:11]
  wire [1:0] ct_lsu_pfu_pfb_entry_7_pfu_pfb_entry_biu_pe_req_src_v; // @[pfu.scala 529:11]
  wire  ct_lsu_pfu_pfb_entry_7_pfu_pfb_entry_biu_pe_req_x; // @[pfu.scala 529:11]
  wire  ct_lsu_pfu_pfb_entry_7_pfu_pfb_entry_evict_x; // @[pfu.scala 529:11]
  wire  ct_lsu_pfu_pfb_entry_7_pfu_pfb_entry_hit_pc_x; // @[pfu.scala 529:11]
  wire  ct_lsu_pfu_pfb_entry_7_pfu_pfb_entry_l1_page_sec_x; // @[pfu.scala 529:11]
  wire  ct_lsu_pfu_pfb_entry_7_pfu_pfb_entry_l1_page_share_x; // @[pfu.scala 529:11]
  wire [39:0] ct_lsu_pfu_pfb_entry_7_pfu_pfb_entry_l1_pf_addr_v; // @[pfu.scala 529:11]
  wire [27:0] ct_lsu_pfu_pfb_entry_7_pfu_pfb_entry_l1_vpn_v; // @[pfu.scala 529:11]
  wire  ct_lsu_pfu_pfb_entry_7_pfu_pfb_entry_l2_page_sec_x; // @[pfu.scala 529:11]
  wire  ct_lsu_pfu_pfb_entry_7_pfu_pfb_entry_l2_page_share_x; // @[pfu.scala 529:11]
  wire [39:0] ct_lsu_pfu_pfb_entry_7_pfu_pfb_entry_l2_pf_addr_v; // @[pfu.scala 529:11]
  wire [27:0] ct_lsu_pfu_pfb_entry_7_pfu_pfb_entry_l2_vpn_v; // @[pfu.scala 529:11]
  wire [1:0] ct_lsu_pfu_pfb_entry_7_pfu_pfb_entry_mmu_pe_req_src_v; // @[pfu.scala 529:11]
  wire  ct_lsu_pfu_pfb_entry_7_pfu_pfb_entry_mmu_pe_req_x; // @[pfu.scala 529:11]
  wire [1:0] ct_lsu_pfu_pfb_entry_7_pfu_pfb_entry_priv_mode_v; // @[pfu.scala 529:11]
  wire  ct_lsu_pfu_pfb_entry_7_pfu_pfb_entry_vld_x; // @[pfu.scala 529:11]
  wire  x_ct_lsu_pfu_gsdb_cp0_lsu_icg_en; // @[pfu.scala 655:33]
  wire  x_ct_lsu_pfu_gsdb_cp0_yy_clk_en; // @[pfu.scala 655:33]
  wire  x_ct_lsu_pfu_gsdb_cp0_yy_dcache_pref_en; // @[pfu.scala 655:33]
  wire  x_ct_lsu_pfu_gsdb_cpurst_b; // @[pfu.scala 655:33]
  wire  x_ct_lsu_pfu_gsdb_forever_cpuclk; // @[pfu.scala 655:33]
  wire [6:0] x_ct_lsu_pfu_gsdb_ld_da_iid; // @[pfu.scala 655:33]
  wire  x_ct_lsu_pfu_gsdb_ld_da_pfu_act_vld; // @[pfu.scala 655:33]
  wire  x_ct_lsu_pfu_gsdb_ld_da_pfu_pf_inst_vld; // @[pfu.scala 655:33]
  wire [39:0] x_ct_lsu_pfu_gsdb_ld_da_pfu_va; // @[pfu.scala 655:33]
  wire  x_ct_lsu_pfu_gsdb_pad_yy_icg_scan_en; // @[pfu.scala 655:33]
  wire  x_ct_lsu_pfu_gsdb_pfu_gpfb_vld; // @[pfu.scala 655:33]
  wire  x_ct_lsu_pfu_gsdb_pfu_pop_all_vld; // @[pfu.scala 655:33]
  wire  x_ct_lsu_pfu_gsdb_rtu_yy_xx_commit0; // @[pfu.scala 655:33]
  wire [6:0] x_ct_lsu_pfu_gsdb_rtu_yy_xx_commit0_iid; // @[pfu.scala 655:33]
  wire  x_ct_lsu_pfu_gsdb_rtu_yy_xx_commit1; // @[pfu.scala 655:33]
  wire [6:0] x_ct_lsu_pfu_gsdb_rtu_yy_xx_commit1_iid; // @[pfu.scala 655:33]
  wire  x_ct_lsu_pfu_gsdb_rtu_yy_xx_commit2; // @[pfu.scala 655:33]
  wire [6:0] x_ct_lsu_pfu_gsdb_rtu_yy_xx_commit2_iid; // @[pfu.scala 655:33]
  wire  x_ct_lsu_pfu_gsdb_rtu_yy_xx_flush; // @[pfu.scala 655:33]
  wire  x_ct_lsu_pfu_gsdb_pfu_gsdb_gpfb_create_vld; // @[pfu.scala 655:33]
  wire  x_ct_lsu_pfu_gsdb_pfu_gsdb_gpfb_pop_req; // @[pfu.scala 655:33]
  wire [10:0] x_ct_lsu_pfu_gsdb_pfu_gsdb_stride; // @[pfu.scala 655:33]
  wire  x_ct_lsu_pfu_gsdb_pfu_gsdb_stride_neg; // @[pfu.scala 655:33]
  wire [6:0] x_ct_lsu_pfu_gsdb_pfu_gsdb_strideh_6to0; // @[pfu.scala 655:33]
  wire  x_ct_lsu_pfu_gpfb_cp0_lsu_icg_en; // @[pfu.scala 681:33]
  wire  x_ct_lsu_pfu_gpfb_cp0_lsu_pfu_mmu_dis; // @[pfu.scala 681:33]
  wire  x_ct_lsu_pfu_gpfb_cp0_yy_clk_en; // @[pfu.scala 681:33]
  wire [1:0] x_ct_lsu_pfu_gpfb_cp0_yy_priv_mode; // @[pfu.scala 681:33]
  wire  x_ct_lsu_pfu_gpfb_cpurst_b; // @[pfu.scala 681:33]
  wire  x_ct_lsu_pfu_gpfb_forever_cpuclk; // @[pfu.scala 681:33]
  wire  x_ct_lsu_pfu_gpfb_ld_da_page_sec_ff; // @[pfu.scala 681:33]
  wire  x_ct_lsu_pfu_gpfb_ld_da_page_share_ff; // @[pfu.scala 681:33]
  wire  x_ct_lsu_pfu_gpfb_ld_da_pfu_act_vld; // @[pfu.scala 681:33]
  wire  x_ct_lsu_pfu_gpfb_ld_da_pfu_pf_inst_vld; // @[pfu.scala 681:33]
  wire [39:0] x_ct_lsu_pfu_gpfb_ld_da_pfu_va; // @[pfu.scala 681:33]
  wire [27:0] x_ct_lsu_pfu_gpfb_ld_da_ppn_ff; // @[pfu.scala 681:33]
  wire [3:0] x_ct_lsu_pfu_gpfb_lsu_pfu_l1_dist_sel; // @[pfu.scala 681:33]
  wire [3:0] x_ct_lsu_pfu_gpfb_lsu_pfu_l2_dist_sel; // @[pfu.scala 681:33]
  wire  x_ct_lsu_pfu_gpfb_pad_yy_icg_scan_en; // @[pfu.scala 681:33]
  wire  x_ct_lsu_pfu_gpfb_pfu_biu_pe_req_sel_l1; // @[pfu.scala 681:33]
  wire  x_ct_lsu_pfu_gpfb_pfu_dcache_pref_en; // @[pfu.scala 681:33]
  wire  x_ct_lsu_pfu_gpfb_pfu_get_page_sec; // @[pfu.scala 681:33]
  wire  x_ct_lsu_pfu_gpfb_pfu_get_page_share; // @[pfu.scala 681:33]
  wire [27:0] x_ct_lsu_pfu_gpfb_pfu_get_ppn; // @[pfu.scala 681:33]
  wire  x_ct_lsu_pfu_gpfb_pfu_get_ppn_err; // @[pfu.scala 681:33]
  wire  x_ct_lsu_pfu_gpfb_pfu_get_ppn_vld; // @[pfu.scala 681:33]
  wire  x_ct_lsu_pfu_gpfb_pfu_gpfb_biu_pe_req_grnt; // @[pfu.scala 681:33]
  wire  x_ct_lsu_pfu_gpfb_pfu_gpfb_from_lfb_dcache_hit; // @[pfu.scala 681:33]
  wire  x_ct_lsu_pfu_gpfb_pfu_gpfb_from_lfb_dcache_miss; // @[pfu.scala 681:33]
  wire  x_ct_lsu_pfu_gpfb_pfu_gpfb_mmu_pe_req_grnt; // @[pfu.scala 681:33]
  wire  x_ct_lsu_pfu_gpfb_pfu_gsdb_gpfb_create_vld; // @[pfu.scala 681:33]
  wire  x_ct_lsu_pfu_gpfb_pfu_gsdb_gpfb_pop_req; // @[pfu.scala 681:33]
  wire [10:0] x_ct_lsu_pfu_gpfb_pfu_gsdb_stride; // @[pfu.scala 681:33]
  wire  x_ct_lsu_pfu_gpfb_pfu_gsdb_stride_neg; // @[pfu.scala 681:33]
  wire [6:0] x_ct_lsu_pfu_gpfb_pfu_gsdb_strideh_6to0; // @[pfu.scala 681:33]
  wire  x_ct_lsu_pfu_gpfb_pfu_l2_pref_en; // @[pfu.scala 681:33]
  wire  x_ct_lsu_pfu_gpfb_pfu_mmu_pe_req_sel_l1; // @[pfu.scala 681:33]
  wire  x_ct_lsu_pfu_gpfb_pfu_pop_all_vld; // @[pfu.scala 681:33]
  wire  x_ct_lsu_pfu_gpfb_pfu_gpfb_biu_pe_req; // @[pfu.scala 681:33]
  wire [1:0] x_ct_lsu_pfu_gpfb_pfu_gpfb_biu_pe_req_src; // @[pfu.scala 681:33]
  wire  x_ct_lsu_pfu_gpfb_pfu_gpfb_l1_page_sec; // @[pfu.scala 681:33]
  wire  x_ct_lsu_pfu_gpfb_pfu_gpfb_l1_page_share; // @[pfu.scala 681:33]
  wire [39:0] x_ct_lsu_pfu_gpfb_pfu_gpfb_l1_pf_addr; // @[pfu.scala 681:33]
  wire [27:0] x_ct_lsu_pfu_gpfb_pfu_gpfb_l1_vpn; // @[pfu.scala 681:33]
  wire  x_ct_lsu_pfu_gpfb_pfu_gpfb_l2_page_sec; // @[pfu.scala 681:33]
  wire  x_ct_lsu_pfu_gpfb_pfu_gpfb_l2_page_share; // @[pfu.scala 681:33]
  wire [39:0] x_ct_lsu_pfu_gpfb_pfu_gpfb_l2_pf_addr; // @[pfu.scala 681:33]
  wire [27:0] x_ct_lsu_pfu_gpfb_pfu_gpfb_l2_vpn; // @[pfu.scala 681:33]
  wire  x_ct_lsu_pfu_gpfb_pfu_gpfb_mmu_pe_req; // @[pfu.scala 681:33]
  wire [1:0] x_ct_lsu_pfu_gpfb_pfu_gpfb_mmu_pe_req_src; // @[pfu.scala 681:33]
  wire [1:0] x_ct_lsu_pfu_gpfb_pfu_gpfb_priv_mode; // @[pfu.scala 681:33]
  wire  x_ct_lsu_pfu_gpfb_pfu_gpfb_vld; // @[pfu.scala 681:33]
  wire  pfu_gpfb_mmu_pe_req = x_ct_lsu_pfu_gpfb_pfu_gpfb_mmu_pe_req; // @[pfu.scala 185:33 717:23]
  wire  pfu_pfb_entry_mmu_pe_req_7 = ct_lsu_pfu_pfb_entry_7_pfu_pfb_entry_mmu_pe_req_x; // @[pfu.scala 233:38 588:33]
  wire  pfu_pfb_entry_mmu_pe_req_6 = ct_lsu_pfu_pfb_entry_6_pfu_pfb_entry_mmu_pe_req_x; // @[pfu.scala 233:38 588:33]
  wire  pfu_pfb_entry_mmu_pe_req_5 = ct_lsu_pfu_pfb_entry_5_pfu_pfb_entry_mmu_pe_req_x; // @[pfu.scala 233:38 588:33]
  wire  pfu_pfb_entry_mmu_pe_req_4 = ct_lsu_pfu_pfb_entry_4_pfu_pfb_entry_mmu_pe_req_x; // @[pfu.scala 233:38 588:33]
  wire  pfu_pfb_entry_mmu_pe_req_3 = ct_lsu_pfu_pfb_entry_3_pfu_pfb_entry_mmu_pe_req_x; // @[pfu.scala 233:38 588:33]
  wire  pfu_pfb_entry_mmu_pe_req_2 = ct_lsu_pfu_pfb_entry_2_pfu_pfb_entry_mmu_pe_req_x; // @[pfu.scala 233:38 588:33]
  wire  pfu_pfb_entry_mmu_pe_req_1 = ct_lsu_pfu_pfb_entry_1_pfu_pfb_entry_mmu_pe_req_x; // @[pfu.scala 233:38 588:33]
  wire  pfu_pfb_entry_mmu_pe_req_0 = ct_lsu_pfu_pfb_entry_pfu_pfb_entry_mmu_pe_req_x; // @[pfu.scala 233:38 588:33]
  wire [8:0] pfu_all_pfb_mmu_pe_req = {pfu_gpfb_mmu_pe_req,pfu_pfb_entry_mmu_pe_req_7,pfu_pfb_entry_mmu_pe_req_6,
    pfu_pfb_entry_mmu_pe_req_5,pfu_pfb_entry_mmu_pe_req_4,pfu_pfb_entry_mmu_pe_req_3,pfu_pfb_entry_mmu_pe_req_2,
    pfu_pfb_entry_mmu_pe_req_1,pfu_pfb_entry_mmu_pe_req_0}; // @[pfu.scala 774:49]
  wire  pfu_mmu_pe_req = |pfu_all_pfb_mmu_pe_req; // @[pfu.scala 775:44]
  wire  pfu_gpfb_biu_pe_req = x_ct_lsu_pfu_gpfb_pfu_gpfb_biu_pe_req; // @[pfu.scala 172:33 704:23]
  wire  pfu_pfb_entry_biu_pe_req_7 = ct_lsu_pfu_pfb_entry_7_pfu_pfb_entry_biu_pe_req_x; // @[pfu.scala 215:38 570:33]
  wire  pfu_pfb_entry_biu_pe_req_6 = ct_lsu_pfu_pfb_entry_6_pfu_pfb_entry_biu_pe_req_x; // @[pfu.scala 215:38 570:33]
  wire  pfu_pfb_entry_biu_pe_req_5 = ct_lsu_pfu_pfb_entry_5_pfu_pfb_entry_biu_pe_req_x; // @[pfu.scala 215:38 570:33]
  wire  pfu_pfb_entry_biu_pe_req_4 = ct_lsu_pfu_pfb_entry_4_pfu_pfb_entry_biu_pe_req_x; // @[pfu.scala 215:38 570:33]
  wire  pfu_pfb_entry_biu_pe_req_3 = ct_lsu_pfu_pfb_entry_3_pfu_pfb_entry_biu_pe_req_x; // @[pfu.scala 215:38 570:33]
  wire  pfu_pfb_entry_biu_pe_req_2 = ct_lsu_pfu_pfb_entry_2_pfu_pfb_entry_biu_pe_req_x; // @[pfu.scala 215:38 570:33]
  wire  pfu_pfb_entry_biu_pe_req_1 = ct_lsu_pfu_pfb_entry_1_pfu_pfb_entry_biu_pe_req_x; // @[pfu.scala 215:38 570:33]
  wire  pfu_pfb_entry_biu_pe_req_0 = ct_lsu_pfu_pfb_entry_pfu_pfb_entry_biu_pe_req_x; // @[pfu.scala 215:38 570:33]
  wire [8:0] pfu_all_pfb_biu_pe_req = {pfu_gpfb_biu_pe_req,pfu_pfb_entry_biu_pe_req_7,pfu_pfb_entry_biu_pe_req_6,
    pfu_pfb_entry_biu_pe_req_5,pfu_pfb_entry_biu_pe_req_4,pfu_pfb_entry_biu_pe_req_3,pfu_pfb_entry_biu_pe_req_2,
    pfu_pfb_entry_biu_pe_req_1,pfu_pfb_entry_biu_pe_req_0}; // @[pfu.scala 861:49]
  wire  pfu_biu_pe_req = |pfu_all_pfb_biu_pe_req; // @[pfu.scala 862:44]
  wire  pfu_biu_pe_clk = x_lsu_pfu_biu_pe_gated_clk_clk_out; // @[pfu.scala 147:28 316:18]
  wire  _T_125 = ~cpurst_b; // @[pfu.scala 818:52]
  reg  pfu_biu_req_unmask_reg; // @[pfu.scala 819:41]
  wire  pipe_create_dp_vld = ld_da_pfu_act_dp_vld | st_da_pfu_act_dp_vld; // @[pfu.scala 397:49]
  wire  pfu_pmb_entry_hit_pc_7 = ct_lsu_pfu_pmb_entry_7_pfu_pmb_entry_hit_pc_x; // @[pfu.scala 250:34 353:29]
  wire  pfu_pmb_entry_hit_pc_6 = ct_lsu_pfu_pmb_entry_6_pfu_pmb_entry_hit_pc_x; // @[pfu.scala 250:34 353:29]
  wire  pfu_pmb_entry_hit_pc_5 = ct_lsu_pfu_pmb_entry_5_pfu_pmb_entry_hit_pc_x; // @[pfu.scala 250:34 353:29]
  wire  pfu_pmb_entry_hit_pc_4 = ct_lsu_pfu_pmb_entry_4_pfu_pmb_entry_hit_pc_x; // @[pfu.scala 250:34 353:29]
  wire  pfu_pmb_entry_hit_pc_3 = ct_lsu_pfu_pmb_entry_3_pfu_pmb_entry_hit_pc_x; // @[pfu.scala 250:34 353:29]
  wire  pfu_pmb_entry_hit_pc_2 = ct_lsu_pfu_pmb_entry_2_pfu_pmb_entry_hit_pc_x; // @[pfu.scala 250:34 353:29]
  wire  pfu_pmb_entry_hit_pc_1 = ct_lsu_pfu_pmb_entry_1_pfu_pmb_entry_hit_pc_x; // @[pfu.scala 250:34 353:29]
  wire  pfu_pmb_entry_hit_pc_0 = ct_lsu_pfu_pmb_entry_pfu_pmb_entry_hit_pc_x; // @[pfu.scala 250:34 353:29]
  wire [7:0] _pfu_pmb_hit_pc_T = {pfu_pmb_entry_hit_pc_7,pfu_pmb_entry_hit_pc_6,pfu_pmb_entry_hit_pc_5,
    pfu_pmb_entry_hit_pc_4,pfu_pmb_entry_hit_pc_3,pfu_pmb_entry_hit_pc_2,pfu_pmb_entry_hit_pc_1,pfu_pmb_entry_hit_pc_0}; // @[pfu.scala 400:42]
  wire  pfu_pmb_hit_pc = |_pfu_pmb_hit_pc_T; // @[pfu.scala 400:49]
  wire  pfu_sdb_entry_hit_pc_1 = ct_lsu_pfu_sdb_entry_1_pfu_sdb_entry_hit_pc_x; // @[pfu.scala 271:34 440:29]
  wire  pfu_sdb_entry_hit_pc_0 = ct_lsu_pfu_sdb_entry_pfu_sdb_entry_hit_pc_x; // @[pfu.scala 271:34 440:29]
  wire [1:0] _pfu_sdb_hit_pc_T = {pfu_sdb_entry_hit_pc_1,pfu_sdb_entry_hit_pc_0}; // @[pfu.scala 401:42]
  wire  pfu_sdb_hit_pc = |_pfu_sdb_hit_pc_T; // @[pfu.scala 401:49]
  wire  pfu_pfb_entry_hit_pc_7 = ct_lsu_pfu_pfb_entry_7_pfu_pfb_entry_hit_pc_x; // @[pfu.scala 224:34 577:29]
  wire  pfu_pfb_entry_hit_pc_6 = ct_lsu_pfu_pfb_entry_6_pfu_pfb_entry_hit_pc_x; // @[pfu.scala 224:34 577:29]
  wire  pfu_pfb_entry_hit_pc_5 = ct_lsu_pfu_pfb_entry_5_pfu_pfb_entry_hit_pc_x; // @[pfu.scala 224:34 577:29]
  wire  pfu_pfb_entry_hit_pc_4 = ct_lsu_pfu_pfb_entry_4_pfu_pfb_entry_hit_pc_x; // @[pfu.scala 224:34 577:29]
  wire  pfu_pfb_entry_hit_pc_3 = ct_lsu_pfu_pfb_entry_3_pfu_pfb_entry_hit_pc_x; // @[pfu.scala 224:34 577:29]
  wire  pfu_pfb_entry_hit_pc_2 = ct_lsu_pfu_pfb_entry_2_pfu_pfb_entry_hit_pc_x; // @[pfu.scala 224:34 577:29]
  wire  pfu_pfb_entry_hit_pc_1 = ct_lsu_pfu_pfb_entry_1_pfu_pfb_entry_hit_pc_x; // @[pfu.scala 224:34 577:29]
  wire  pfu_pfb_entry_hit_pc_0 = ct_lsu_pfu_pfb_entry_pfu_pfb_entry_hit_pc_x; // @[pfu.scala 224:34 577:29]
  wire [7:0] _pfu_pfb_hit_pc_T = {pfu_pfb_entry_hit_pc_7,pfu_pfb_entry_hit_pc_6,pfu_pfb_entry_hit_pc_5,
    pfu_pfb_entry_hit_pc_4,pfu_pfb_entry_hit_pc_3,pfu_pfb_entry_hit_pc_2,pfu_pfb_entry_hit_pc_1,pfu_pfb_entry_hit_pc_0}; // @[pfu.scala 402:42]
  wire  pfu_pfb_hit_pc = |_pfu_pfb_hit_pc_T; // @[pfu.scala 402:49]
  wire  pfu_hit_pc = pfu_pmb_hit_pc | pfu_sdb_hit_pc | pfu_pfb_hit_pc; // @[pfu.scala 403:50]
  wire  _pfu_pmb_create_dp_vld_T = ~pfu_hit_pc; // @[pfu.scala 406:50]
  wire  pfu_gpfb_vld = x_ct_lsu_pfu_gpfb_pfu_gpfb_vld; // @[pfu.scala 189:26 721:16]
  wire  _pfu_pmb_create_dp_vld_T_2 = ~pfu_gpfb_vld; // @[pfu.scala 406:65]
  wire  pfu_pmb_create_dp_vld = pipe_create_dp_vld & ~pfu_hit_pc & ~pfu_gpfb_vld; // @[pfu.scala 406:62]
  wire  pfu_pmb_entry_vld_7 = ct_lsu_pfu_pmb_entry_7_pfu_pmb_entry_vld_x; // @[pfu.scala 255:31 358:26]
  wire  pfu_pmb_entry_vld_6 = ct_lsu_pfu_pmb_entry_6_pfu_pmb_entry_vld_x; // @[pfu.scala 255:31 358:26]
  wire  pfu_pmb_entry_vld_5 = ct_lsu_pfu_pmb_entry_5_pfu_pmb_entry_vld_x; // @[pfu.scala 255:31 358:26]
  wire  pfu_pmb_entry_vld_4 = ct_lsu_pfu_pmb_entry_4_pfu_pmb_entry_vld_x; // @[pfu.scala 255:31 358:26]
  wire  pfu_pmb_entry_vld_3 = ct_lsu_pfu_pmb_entry_3_pfu_pmb_entry_vld_x; // @[pfu.scala 255:31 358:26]
  wire  pfu_pmb_entry_vld_2 = ct_lsu_pfu_pmb_entry_2_pfu_pmb_entry_vld_x; // @[pfu.scala 255:31 358:26]
  wire  pfu_pmb_entry_vld_1 = ct_lsu_pfu_pmb_entry_1_pfu_pmb_entry_vld_x; // @[pfu.scala 255:31 358:26]
  wire  pfu_pmb_entry_vld_0 = ct_lsu_pfu_pmb_entry_pfu_pmb_entry_vld_x; // @[pfu.scala 255:31 358:26]
  wire [7:0] _pfu_pmb_full_T = {pfu_pmb_entry_vld_7,pfu_pmb_entry_vld_6,pfu_pmb_entry_vld_5,pfu_pmb_entry_vld_4,
    pfu_pmb_entry_vld_3,pfu_pmb_entry_vld_2,pfu_pmb_entry_vld_1,pfu_pmb_entry_vld_0}; // @[pfu.scala 380:37]
  wire  pfu_pmb_full = &_pfu_pmb_full_T; // @[pfu.scala 380:44]
  wire  pfu_pmb_entry_evict_0 = ct_lsu_pfu_pmb_entry_pfu_pmb_entry_evict_x; // @[pfu.scala 249:33 352:28]
  wire  pfu_pmb_entry_evict_1 = ct_lsu_pfu_pmb_entry_1_pfu_pmb_entry_evict_x; // @[pfu.scala 249:33 352:28]
  wire  pfu_pmb_entry_evict_2 = ct_lsu_pfu_pmb_entry_2_pfu_pmb_entry_evict_x; // @[pfu.scala 249:33 352:28]
  wire  pfu_pmb_entry_evict_3 = ct_lsu_pfu_pmb_entry_3_pfu_pmb_entry_evict_x; // @[pfu.scala 249:33 352:28]
  wire  pfu_pmb_entry_evict_4 = ct_lsu_pfu_pmb_entry_4_pfu_pmb_entry_evict_x; // @[pfu.scala 249:33 352:28]
  wire  pfu_pmb_entry_evict_5 = ct_lsu_pfu_pmb_entry_5_pfu_pmb_entry_evict_x; // @[pfu.scala 249:33 352:28]
  wire  pfu_pmb_entry_evict_6 = ct_lsu_pfu_pmb_entry_6_pfu_pmb_entry_evict_x; // @[pfu.scala 249:33 352:28]
  wire  pfu_pmb_entry_evict_7 = ct_lsu_pfu_pmb_entry_7_pfu_pmb_entry_evict_x; // @[pfu.scala 249:33 352:28]
  wire [14:0] _pfu_pmb_evict_create_ptr_T_16 = pfu_pmb_entry_evict_7 ? 15'h80 : 15'h0; // @[Mux.scala 101:16]
  wire [14:0] _pfu_pmb_evict_create_ptr_T_17 = pfu_pmb_entry_evict_6 ? 15'h40 : _pfu_pmb_evict_create_ptr_T_16; // @[Mux.scala 101:16]
  wire [14:0] _pfu_pmb_evict_create_ptr_T_18 = pfu_pmb_entry_evict_5 ? 15'h20 : _pfu_pmb_evict_create_ptr_T_17; // @[Mux.scala 101:16]
  wire [14:0] _pfu_pmb_evict_create_ptr_T_19 = pfu_pmb_entry_evict_4 ? 15'h10 : _pfu_pmb_evict_create_ptr_T_18; // @[Mux.scala 101:16]
  wire [14:0] _pfu_pmb_evict_create_ptr_T_20 = pfu_pmb_entry_evict_3 ? 15'h8 : _pfu_pmb_evict_create_ptr_T_19; // @[Mux.scala 101:16]
  wire [14:0] _pfu_pmb_evict_create_ptr_T_21 = pfu_pmb_entry_evict_2 ? 15'h4 : _pfu_pmb_evict_create_ptr_T_20; // @[Mux.scala 101:16]
  wire [14:0] _pfu_pmb_evict_create_ptr_T_22 = pfu_pmb_entry_evict_1 ? 15'h2 : _pfu_pmb_evict_create_ptr_T_21; // @[Mux.scala 101:16]
  wire [14:0] _pfu_pmb_evict_create_ptr_T_23 = pfu_pmb_entry_evict_0 ? 15'h1 : _pfu_pmb_evict_create_ptr_T_22; // @[Mux.scala 101:16]
  wire [7:0] pfu_pmb_evict_create_ptr = _pfu_pmb_evict_create_ptr_T_23[7:0]; // @[pfu.scala 127:38 377:28]
  wire [14:0] _pfu_pmb_empty_create_ptr_T_16 = pfu_pmb_entry_vld_7 ? 15'h80 : 15'h0; // @[Mux.scala 101:16]
  wire [14:0] _pfu_pmb_empty_create_ptr_T_17 = pfu_pmb_entry_vld_6 ? 15'h40 : _pfu_pmb_empty_create_ptr_T_16; // @[Mux.scala 101:16]
  wire [14:0] _pfu_pmb_empty_create_ptr_T_18 = pfu_pmb_entry_vld_5 ? 15'h20 : _pfu_pmb_empty_create_ptr_T_17; // @[Mux.scala 101:16]
  wire [14:0] _pfu_pmb_empty_create_ptr_T_19 = pfu_pmb_entry_vld_4 ? 15'h10 : _pfu_pmb_empty_create_ptr_T_18; // @[Mux.scala 101:16]
  wire [14:0] _pfu_pmb_empty_create_ptr_T_20 = pfu_pmb_entry_vld_3 ? 15'h8 : _pfu_pmb_empty_create_ptr_T_19; // @[Mux.scala 101:16]
  wire [14:0] _pfu_pmb_empty_create_ptr_T_21 = pfu_pmb_entry_vld_2 ? 15'h4 : _pfu_pmb_empty_create_ptr_T_20; // @[Mux.scala 101:16]
  wire [14:0] _pfu_pmb_empty_create_ptr_T_22 = pfu_pmb_entry_vld_1 ? 15'h2 : _pfu_pmb_empty_create_ptr_T_21; // @[Mux.scala 101:16]
  wire [14:0] _pfu_pmb_empty_create_ptr_T_23 = pfu_pmb_entry_vld_0 ? 15'h1 : _pfu_pmb_empty_create_ptr_T_22; // @[Mux.scala 101:16]
  wire [7:0] pfu_pmb_empty_create_ptr = _pfu_pmb_empty_create_ptr_T_23[7:0]; // @[pfu.scala 126:38 374:28]
  wire [7:0] pfu_pmb_create_ptr = pfu_pmb_full ? pfu_pmb_evict_create_ptr : pfu_pmb_empty_create_ptr; // @[pfu.scala 381:22 382:30 383:24]
  wire [7:0] pfu_pmb_entry_create_dp_vld = pfu_pmb_create_dp_vld ? pfu_pmb_create_ptr : 8'h0; // @[pfu.scala 410:37]
  wire  pfu_pmb_create_gateclk_en = pipe_create_dp_vld & _pfu_pmb_create_dp_vld_T_2; // @[pfu.scala 407:51]
  wire [7:0] pfu_pmb_entry_create_gateclk_en = pfu_pmb_create_gateclk_en ? pfu_pmb_create_ptr : 8'h0; // @[pfu.scala 411:41]
  wire  pipe_create_vld = ld_da_pfu_act_vld | st_da_pfu_act_vld & ~ld_da_pfu_act_dp_vld; // @[pfu.scala 395:43]
  wire  pfu_pmb_create_vld = pipe_create_vld & _pfu_pmb_create_dp_vld_T & _pfu_pmb_create_dp_vld_T_2; // @[pfu.scala 405:56]
  wire [7:0] pfu_pmb_entry_create_vld = pfu_pmb_create_vld ? pfu_pmb_create_ptr : 8'h0; // @[pfu.scala 409:34]
  wire  pfu_sdb_entry_vld_1 = ct_lsu_pfu_sdb_entry_1_pfu_sdb_entry_vld_x; // @[pfu.scala 279:31 448:26]
  wire  pfu_sdb_entry_vld_0 = ct_lsu_pfu_sdb_entry_pfu_sdb_entry_vld_x; // @[pfu.scala 279:31 448:26]
  wire [1:0] _pfu_sdb_full_T = {pfu_sdb_entry_vld_1,pfu_sdb_entry_vld_0}; // @[pfu.scala 493:37]
  wire  pfu_sdb_full = &_pfu_sdb_full_T; // @[pfu.scala 493:44]
  wire  pfu_sdb_entry_evict_1 = ct_lsu_pfu_sdb_entry_1_pfu_sdb_entry_evict_x; // @[pfu.scala 270:33 439:28]
  wire  pfu_sdb_entry_evict_0 = ct_lsu_pfu_sdb_entry_pfu_sdb_entry_evict_x; // @[pfu.scala 270:33 439:28]
  wire [1:0] _pfu_sdb_has_evict_T = {pfu_sdb_entry_evict_1,pfu_sdb_entry_evict_0}; // @[pfu.scala 494:44]
  wire  pfu_sdb_has_evict = |_pfu_sdb_has_evict_T; // @[pfu.scala 494:51]
  wire  pfu_pmb_ready_grnt = ~pfu_sdb_full | pfu_sdb_has_evict; // @[pfu.scala 503:39]
  wire  pfu_pmb_entry_ready_0 = ct_lsu_pfu_pmb_entry_pfu_pmb_entry_ready_x; // @[pfu.scala 252:33 356:28]
  wire  pfu_pmb_entry_ready_1 = ct_lsu_pfu_pmb_entry_1_pfu_pmb_entry_ready_x; // @[pfu.scala 252:33 356:28]
  wire  pfu_pmb_entry_ready_2 = ct_lsu_pfu_pmb_entry_2_pfu_pmb_entry_ready_x; // @[pfu.scala 252:33 356:28]
  wire  pfu_pmb_entry_ready_3 = ct_lsu_pfu_pmb_entry_3_pfu_pmb_entry_ready_x; // @[pfu.scala 252:33 356:28]
  wire  pfu_pmb_entry_ready_4 = ct_lsu_pfu_pmb_entry_4_pfu_pmb_entry_ready_x; // @[pfu.scala 252:33 356:28]
  wire  pfu_pmb_entry_ready_5 = ct_lsu_pfu_pmb_entry_5_pfu_pmb_entry_ready_x; // @[pfu.scala 252:33 356:28]
  wire  pfu_pmb_entry_ready_6 = ct_lsu_pfu_pmb_entry_6_pfu_pmb_entry_ready_x; // @[pfu.scala 252:33 356:28]
  wire  pfu_pmb_entry_ready_7 = ct_lsu_pfu_pmb_entry_7_pfu_pmb_entry_ready_x; // @[pfu.scala 252:33 356:28]
  wire [14:0] _pfu_pmb_pop_ptr_T_16 = pfu_pmb_entry_ready_7 ? 15'h80 : 15'h0; // @[Mux.scala 101:16]
  wire [14:0] _pfu_pmb_pop_ptr_T_17 = pfu_pmb_entry_ready_6 ? 15'h40 : _pfu_pmb_pop_ptr_T_16; // @[Mux.scala 101:16]
  wire [14:0] _pfu_pmb_pop_ptr_T_18 = pfu_pmb_entry_ready_5 ? 15'h20 : _pfu_pmb_pop_ptr_T_17; // @[Mux.scala 101:16]
  wire [14:0] _pfu_pmb_pop_ptr_T_19 = pfu_pmb_entry_ready_4 ? 15'h10 : _pfu_pmb_pop_ptr_T_18; // @[Mux.scala 101:16]
  wire [14:0] _pfu_pmb_pop_ptr_T_20 = pfu_pmb_entry_ready_3 ? 15'h8 : _pfu_pmb_pop_ptr_T_19; // @[Mux.scala 101:16]
  wire [14:0] _pfu_pmb_pop_ptr_T_21 = pfu_pmb_entry_ready_2 ? 15'h4 : _pfu_pmb_pop_ptr_T_20; // @[Mux.scala 101:16]
  wire [14:0] _pfu_pmb_pop_ptr_T_22 = pfu_pmb_entry_ready_1 ? 15'h2 : _pfu_pmb_pop_ptr_T_21; // @[Mux.scala 101:16]
  wire [14:0] _pfu_pmb_pop_ptr_T_23 = pfu_pmb_entry_ready_0 ? 15'h1 : _pfu_pmb_pop_ptr_T_22; // @[Mux.scala 101:16]
  wire [7:0] pfu_pmb_pop_ptr = _pfu_pmb_pop_ptr_T_23[7:0]; // @[pfu.scala 128:29 468:19]
  wire  _pfu_pmb_entry_ready_grnt_T_1 = pfu_pmb_ready_grnt & pfu_pmb_pop_ptr[0]; // @[pfu.scala 505:31]
  wire  _pfu_pmb_entry_ready_grnt_T_3 = pfu_pmb_ready_grnt & pfu_pmb_pop_ptr[1]; // @[pfu.scala 505:31]
  wire  _pfu_pmb_entry_ready_grnt_T_5 = pfu_pmb_ready_grnt & pfu_pmb_pop_ptr[2]; // @[pfu.scala 505:31]
  wire  _pfu_pmb_entry_ready_grnt_T_7 = pfu_pmb_ready_grnt & pfu_pmb_pop_ptr[3]; // @[pfu.scala 505:31]
  wire  _pfu_pmb_entry_ready_grnt_T_9 = pfu_pmb_ready_grnt & pfu_pmb_pop_ptr[4]; // @[pfu.scala 505:31]
  wire  _pfu_pmb_entry_ready_grnt_T_11 = pfu_pmb_ready_grnt & pfu_pmb_pop_ptr[5]; // @[pfu.scala 505:31]
  wire  _pfu_pmb_entry_ready_grnt_T_13 = pfu_pmb_ready_grnt & pfu_pmb_pop_ptr[6]; // @[pfu.scala 505:31]
  wire  _pfu_pmb_entry_ready_grnt_T_15 = pfu_pmb_ready_grnt & pfu_pmb_pop_ptr[7]; // @[pfu.scala 505:31]
  wire [7:0] pfu_pmb_entry_ready_grnt = {_pfu_pmb_entry_ready_grnt_T_1,_pfu_pmb_entry_ready_grnt_T_3,
    _pfu_pmb_entry_ready_grnt_T_5,_pfu_pmb_entry_ready_grnt_T_7,_pfu_pmb_entry_ready_grnt_T_9,
    _pfu_pmb_entry_ready_grnt_T_11,_pfu_pmb_entry_ready_grnt_T_13,_pfu_pmb_entry_ready_grnt_T_15}; // @[pfu.scala 506:14]
  wire  pfu_sdb_create_vld = pfu_pmb_entry_ready_0 | pfu_pmb_entry_ready_1 | pfu_pmb_entry_ready_2 |
    pfu_pmb_entry_ready_3 | pfu_pmb_entry_ready_4 | pfu_pmb_entry_ready_5 | pfu_pmb_entry_ready_6 |
    pfu_pmb_entry_ready_7; // @[pfu.scala 509:54]
  wire [1:0] _pfu_sdb_entry_create_dp_vld_T = {pfu_sdb_create_vld,pfu_sdb_create_vld}; // @[pfu.scala 514:57]
  wire [1:0] _pfu_sdb_evict_create_ptr_T_2 = pfu_sdb_entry_evict_1 ? 2'h2 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] pfu_sdb_evict_create_ptr = pfu_sdb_entry_evict_0 ? 2'h1 : _pfu_sdb_evict_create_ptr_T_2; // @[Mux.scala 101:16]
  wire  _pfu_sdb_empty_create_ptr_T = ~pfu_sdb_entry_vld_0; // @[pfu.scala 483:27]
  wire  _pfu_sdb_empty_create_ptr_T_1 = ~pfu_sdb_entry_vld_1; // @[pfu.scala 484:27]
  wire [1:0] _pfu_sdb_empty_create_ptr_T_2 = _pfu_sdb_empty_create_ptr_T_1 ? 2'h2 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] pfu_sdb_empty_create_ptr = _pfu_sdb_empty_create_ptr_T ? 2'h1 : _pfu_sdb_empty_create_ptr_T_2; // @[Mux.scala 101:16]
  wire [1:0] pfu_sdb_create_ptr = pfu_sdb_full ? pfu_sdb_evict_create_ptr : pfu_sdb_empty_create_ptr; // @[pfu.scala 496:33 497:24 499:24]
  wire [1:0] pfu_sdb_entry_create_dp_vld = _pfu_sdb_entry_create_dp_vld_T & pfu_sdb_create_ptr; // @[pfu.scala 514:83]
  wire  pfu_pfb_entry_vld_7 = ct_lsu_pfu_pfb_entry_7_pfu_pfb_entry_vld_x; // @[pfu.scala 237:31 590:26]
  wire  pfu_pfb_entry_vld_6 = ct_lsu_pfu_pfb_entry_6_pfu_pfb_entry_vld_x; // @[pfu.scala 237:31 590:26]
  wire  pfu_pfb_entry_vld_5 = ct_lsu_pfu_pfb_entry_5_pfu_pfb_entry_vld_x; // @[pfu.scala 237:31 590:26]
  wire  pfu_pfb_entry_vld_4 = ct_lsu_pfu_pfb_entry_4_pfu_pfb_entry_vld_x; // @[pfu.scala 237:31 590:26]
  wire  pfu_pfb_entry_vld_3 = ct_lsu_pfu_pfb_entry_3_pfu_pfb_entry_vld_x; // @[pfu.scala 237:31 590:26]
  wire  pfu_pfb_entry_vld_2 = ct_lsu_pfu_pfb_entry_2_pfu_pfb_entry_vld_x; // @[pfu.scala 237:31 590:26]
  wire  pfu_pfb_entry_vld_1 = ct_lsu_pfu_pfb_entry_1_pfu_pfb_entry_vld_x; // @[pfu.scala 237:31 590:26]
  wire  pfu_pfb_entry_vld_0 = ct_lsu_pfu_pfb_entry_pfu_pfb_entry_vld_x; // @[pfu.scala 237:31 590:26]
  wire [7:0] _pfu_pfb_full_T = {pfu_pfb_entry_vld_7,pfu_pfb_entry_vld_6,pfu_pfb_entry_vld_5,pfu_pfb_entry_vld_4,
    pfu_pfb_entry_vld_3,pfu_pfb_entry_vld_2,pfu_pfb_entry_vld_1,pfu_pfb_entry_vld_0}; // @[pfu.scala 634:37]
  wire  pfu_pfb_full = &_pfu_pfb_full_T; // @[pfu.scala 634:44]
  wire  pfu_pfb_entry_evict_7 = ct_lsu_pfu_pfb_entry_7_pfu_pfb_entry_evict_x; // @[pfu.scala 221:33 574:28]
  wire  pfu_pfb_entry_evict_6 = ct_lsu_pfu_pfb_entry_6_pfu_pfb_entry_evict_x; // @[pfu.scala 221:33 574:28]
  wire  pfu_pfb_entry_evict_5 = ct_lsu_pfu_pfb_entry_5_pfu_pfb_entry_evict_x; // @[pfu.scala 221:33 574:28]
  wire  pfu_pfb_entry_evict_4 = ct_lsu_pfu_pfb_entry_4_pfu_pfb_entry_evict_x; // @[pfu.scala 221:33 574:28]
  wire  pfu_pfb_entry_evict_3 = ct_lsu_pfu_pfb_entry_3_pfu_pfb_entry_evict_x; // @[pfu.scala 221:33 574:28]
  wire  pfu_pfb_entry_evict_2 = ct_lsu_pfu_pfb_entry_2_pfu_pfb_entry_evict_x; // @[pfu.scala 221:33 574:28]
  wire  pfu_pfb_entry_evict_1 = ct_lsu_pfu_pfb_entry_1_pfu_pfb_entry_evict_x; // @[pfu.scala 221:33 574:28]
  wire  pfu_pfb_entry_evict_0 = ct_lsu_pfu_pfb_entry_pfu_pfb_entry_evict_x; // @[pfu.scala 221:33 574:28]
  wire [7:0] _pfu_pfb_has_evict_T = {pfu_pfb_entry_evict_7,pfu_pfb_entry_evict_6,pfu_pfb_entry_evict_5,
    pfu_pfb_entry_evict_4,pfu_pfb_entry_evict_3,pfu_pfb_entry_evict_2,pfu_pfb_entry_evict_1,pfu_pfb_entry_evict_0}; // @[pfu.scala 635:44]
  wire  pfu_pfb_has_evict = |_pfu_pfb_has_evict_T; // @[pfu.scala 635:51]
  wire  pfu_sdb_ready_grnt = ~pfu_pfb_full | pfu_pfb_has_evict; // @[pfu.scala 640:39]
  wire [1:0] _pfu_sdb_entry_ready_grnt_T = {pfu_sdb_ready_grnt,pfu_sdb_ready_grnt}; // @[pfu.scala 641:58]
  wire  pfu_sdb_entry_ready_0 = ct_lsu_pfu_sdb_entry_pfu_sdb_entry_ready_x; // @[pfu.scala 273:33 443:28]
  wire  _pfu_sdb_pop_ptr_T = ~pfu_sdb_entry_ready_0; // @[pfu.scala 607:29]
  wire  pfu_sdb_entry_ready_1 = ct_lsu_pfu_sdb_entry_1_pfu_sdb_entry_ready_x; // @[pfu.scala 273:33 443:28]
  wire  _pfu_sdb_pop_ptr_T_1 = ~pfu_sdb_entry_ready_1; // @[pfu.scala 608:29]
  wire [1:0] _pfu_sdb_pop_ptr_T_2 = _pfu_sdb_pop_ptr_T_1 ? 2'h2 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] pfu_sdb_pop_ptr = _pfu_sdb_pop_ptr_T ? 2'h1 : _pfu_sdb_pop_ptr_T_2; // @[Mux.scala 101:16]
  wire [1:0] pfu_sdb_entry_ready_grnt = _pfu_sdb_entry_ready_grnt_T & pfu_sdb_pop_ptr; // @[pfu.scala 641:88]
  wire [14:0] pfu_pmb_entry_pc_0 = ct_lsu_pfu_pmb_entry_pfu_pmb_entry_pc_v; // @[pfu.scala 251:30 354:25]
  wire [14:0] _pfu_sdb_create_pc_T_2 = pfu_pmb_pop_ptr[0] ? pfu_pmb_entry_pc_0 : 15'h0; // @[pfu.scala 473:8]
  wire [14:0] pfu_pmb_entry_pc_1 = ct_lsu_pfu_pmb_entry_1_pfu_pmb_entry_pc_v; // @[pfu.scala 251:30 354:25]
  wire [14:0] _pfu_sdb_create_pc_T_5 = pfu_pmb_pop_ptr[1] ? pfu_pmb_entry_pc_1 : 15'h0; // @[pfu.scala 473:8]
  wire [14:0] pfu_pmb_entry_pc_2 = ct_lsu_pfu_pmb_entry_2_pfu_pmb_entry_pc_v; // @[pfu.scala 251:30 354:25]
  wire [14:0] _pfu_sdb_create_pc_T_8 = pfu_pmb_pop_ptr[2] ? pfu_pmb_entry_pc_2 : 15'h0; // @[pfu.scala 473:8]
  wire [14:0] pfu_pmb_entry_pc_3 = ct_lsu_pfu_pmb_entry_3_pfu_pmb_entry_pc_v; // @[pfu.scala 251:30 354:25]
  wire [14:0] _pfu_sdb_create_pc_T_11 = pfu_pmb_pop_ptr[3] ? pfu_pmb_entry_pc_3 : 15'h0; // @[pfu.scala 473:8]
  wire [14:0] pfu_pmb_entry_pc_4 = ct_lsu_pfu_pmb_entry_4_pfu_pmb_entry_pc_v; // @[pfu.scala 251:30 354:25]
  wire [14:0] _pfu_sdb_create_pc_T_14 = pfu_pmb_pop_ptr[4] ? pfu_pmb_entry_pc_4 : 15'h0; // @[pfu.scala 473:8]
  wire [14:0] pfu_pmb_entry_pc_5 = ct_lsu_pfu_pmb_entry_5_pfu_pmb_entry_pc_v; // @[pfu.scala 251:30 354:25]
  wire [14:0] _pfu_sdb_create_pc_T_17 = pfu_pmb_pop_ptr[5] ? pfu_pmb_entry_pc_5 : 15'h0; // @[pfu.scala 473:8]
  wire [14:0] pfu_pmb_entry_pc_6 = ct_lsu_pfu_pmb_entry_6_pfu_pmb_entry_pc_v; // @[pfu.scala 251:30 354:25]
  wire [14:0] _pfu_sdb_create_pc_T_20 = pfu_pmb_pop_ptr[6] ? pfu_pmb_entry_pc_6 : 15'h0; // @[pfu.scala 473:8]
  wire [14:0] pfu_pmb_entry_pc_7 = ct_lsu_pfu_pmb_entry_7_pfu_pmb_entry_pc_v; // @[pfu.scala 251:30 354:25]
  wire [14:0] _pfu_sdb_create_pc_T_23 = pfu_pmb_pop_ptr[7] ? pfu_pmb_entry_pc_7 : 15'h0; // @[pfu.scala 473:8]
  wire [14:0] _pfu_sdb_create_pc_T_24 = _pfu_sdb_create_pc_T_2 | _pfu_sdb_create_pc_T_5; // @[pfu.scala 474:14]
  wire [14:0] _pfu_sdb_create_pc_T_25 = _pfu_sdb_create_pc_T_24 | _pfu_sdb_create_pc_T_8; // @[pfu.scala 474:14]
  wire [14:0] _pfu_sdb_create_pc_T_26 = _pfu_sdb_create_pc_T_25 | _pfu_sdb_create_pc_T_11; // @[pfu.scala 474:14]
  wire [14:0] _pfu_sdb_create_pc_T_27 = _pfu_sdb_create_pc_T_26 | _pfu_sdb_create_pc_T_14; // @[pfu.scala 474:14]
  wire [14:0] _pfu_sdb_create_pc_T_28 = _pfu_sdb_create_pc_T_27 | _pfu_sdb_create_pc_T_17; // @[pfu.scala 474:14]
  wire [14:0] _pfu_sdb_create_pc_T_29 = _pfu_sdb_create_pc_T_28 | _pfu_sdb_create_pc_T_20; // @[pfu.scala 474:14]
  wire  pfu_pmb_entry_type_ld_1 = ct_lsu_pfu_pmb_entry_1_pfu_pmb_entry_type_ld_x; // @[pfu.scala 254:35 357:30]
  wire  pfu_pmb_entry_type_ld_0 = ct_lsu_pfu_pmb_entry_pfu_pmb_entry_type_ld_x; // @[pfu.scala 254:35 357:30]
  wire  pfu_pmb_entry_type_ld_3 = ct_lsu_pfu_pmb_entry_3_pfu_pmb_entry_type_ld_x; // @[pfu.scala 254:35 357:30]
  wire  pfu_pmb_entry_type_ld_2 = ct_lsu_pfu_pmb_entry_2_pfu_pmb_entry_type_ld_x; // @[pfu.scala 254:35 357:30]
  wire  pfu_pmb_entry_type_ld_5 = ct_lsu_pfu_pmb_entry_5_pfu_pmb_entry_type_ld_x; // @[pfu.scala 254:35 357:30]
  wire  pfu_pmb_entry_type_ld_4 = ct_lsu_pfu_pmb_entry_4_pfu_pmb_entry_type_ld_x; // @[pfu.scala 254:35 357:30]
  wire  pfu_pmb_entry_type_ld_7 = ct_lsu_pfu_pmb_entry_7_pfu_pmb_entry_type_ld_x; // @[pfu.scala 254:35 357:30]
  wire  pfu_pmb_entry_type_ld_6 = ct_lsu_pfu_pmb_entry_6_pfu_pmb_entry_type_ld_x; // @[pfu.scala 254:35 357:30]
  wire [7:0] _pfu_sdb_create_type_ld_T = {pfu_pmb_entry_type_ld_7,pfu_pmb_entry_type_ld_6,pfu_pmb_entry_type_ld_5,
    pfu_pmb_entry_type_ld_4,pfu_pmb_entry_type_ld_3,pfu_pmb_entry_type_ld_2,pfu_pmb_entry_type_ld_1,
    pfu_pmb_entry_type_ld_0}; // @[pfu.scala 476:70]
  wire [7:0] _pfu_sdb_create_type_ld_T_1 = pfu_pmb_pop_ptr & _pfu_sdb_create_type_ld_T; // @[pfu.scala 476:46]
  wire  _pfu_biu_req_bus_grnt_T = ~lfb_addr_full; // @[pfu.scala 865:55]
  wire  _pfu_biu_req_bus_grnt_T_1 = lfb_pfu_rready_grnt | rb_pfu_nc_no_pending; // @[pfu.scala 865:100]
  reg  pfu_biu_req_l1_reg; // @[pfu.scala 833:37]
  wire  _pfu_biu_req_bus_grnt_T_3 = ~pfu_biu_req_l1_reg; // @[pfu.scala 865:131]
  wire  _pfu_biu_req_bus_grnt_T_4 = ~lfb_addr_full & (lfb_pfu_rready_grnt | rb_pfu_nc_no_pending) | ~
    pfu_biu_req_l1_reg; // @[pfu.scala 865:128]
  wire  pfu_biu_req_bus_grnt = bus_arb_pfu_ar_ready & (~lfb_addr_full & (lfb_pfu_rready_grnt |
    rb_pfu_nc_no_pending) | ~pfu_biu_req_l1_reg); // @[pfu.scala 865:51]
  wire  pfu_biu_pe_update_permit = ~pfu_biu_req_unmask_reg | pfu_biu_req_bus_grnt; // @[pfu.scala 868:51]
  reg [8:0] pfu_biu_req_priority_reg; // @[pfu.scala 839:43]
  wire [8:0] _pfu_all_pfb_biu_pe_req_ptiority_0_T = ~pfu_biu_req_priority_reg; // @[pfu.scala 879:66]
  wire [8:0] pfu_all_pfb_biu_pe_req_ptiority_0 = pfu_all_pfb_biu_pe_req & _pfu_all_pfb_biu_pe_req_ptiority_0_T; // @[pfu.scala 879:63]
  wire  pfu_biu_pe_req_ptiority_0 = |pfu_all_pfb_biu_pe_req_ptiority_0; // @[pfu.scala 882:66]
  wire [16:0] _pfu_biu_pe_req_ptr_priority_0_T_27 = pfu_all_pfb_biu_pe_req_ptiority_0[8] ? 17'h100 : 17'h0; // @[Mux.scala 101:16]
  wire [16:0] _pfu_biu_pe_req_ptr_priority_0_T_28 = pfu_all_pfb_biu_pe_req_ptiority_0[7] ? 17'h80 :
    _pfu_biu_pe_req_ptr_priority_0_T_27; // @[Mux.scala 101:16]
  wire [16:0] _pfu_biu_pe_req_ptr_priority_0_T_29 = pfu_all_pfb_biu_pe_req_ptiority_0[6] ? 17'h40 :
    _pfu_biu_pe_req_ptr_priority_0_T_28; // @[Mux.scala 101:16]
  wire [16:0] _pfu_biu_pe_req_ptr_priority_0_T_30 = pfu_all_pfb_biu_pe_req_ptiority_0[5] ? 17'h20 :
    _pfu_biu_pe_req_ptr_priority_0_T_29; // @[Mux.scala 101:16]
  wire [16:0] _pfu_biu_pe_req_ptr_priority_0_T_31 = pfu_all_pfb_biu_pe_req_ptiority_0[4] ? 17'h10 :
    _pfu_biu_pe_req_ptr_priority_0_T_30; // @[Mux.scala 101:16]
  wire [16:0] _pfu_biu_pe_req_ptr_priority_0_T_32 = pfu_all_pfb_biu_pe_req_ptiority_0[3] ? 17'h8 :
    _pfu_biu_pe_req_ptr_priority_0_T_31; // @[Mux.scala 101:16]
  wire [16:0] _pfu_biu_pe_req_ptr_priority_0_T_33 = pfu_all_pfb_biu_pe_req_ptiority_0[2] ? 17'h4 :
    _pfu_biu_pe_req_ptr_priority_0_T_32; // @[Mux.scala 101:16]
  wire [16:0] _pfu_biu_pe_req_ptr_priority_0_T_34 = pfu_all_pfb_biu_pe_req_ptiority_0[1] ? 17'h2 :
    _pfu_biu_pe_req_ptr_priority_0_T_33; // @[Mux.scala 101:16]
  wire [16:0] _pfu_biu_pe_req_ptr_priority_0_T_35 = pfu_all_pfb_biu_pe_req_ptiority_0[0] ? 17'h1 :
    _pfu_biu_pe_req_ptr_priority_0_T_34; // @[Mux.scala 101:16]
  wire [8:0] pfu_biu_pe_req_ptr_priority_0 = _pfu_biu_pe_req_ptr_priority_0_T_35[8:0]; // @[pfu.scala 109:43 885:33]
  wire [8:0] pfu_all_pfb_biu_pe_req_ptiority_1 = pfu_all_pfb_biu_pe_req & pfu_biu_req_priority_reg; // @[pfu.scala 880:63]
  wire [16:0] _pfu_biu_pe_req_ptr_priority_1_T_27 = pfu_all_pfb_biu_pe_req_ptiority_1[8] ? 17'h100 : 17'h0; // @[Mux.scala 101:16]
  wire [16:0] _pfu_biu_pe_req_ptr_priority_1_T_28 = pfu_all_pfb_biu_pe_req_ptiority_1[7] ? 17'h80 :
    _pfu_biu_pe_req_ptr_priority_1_T_27; // @[Mux.scala 101:16]
  wire [16:0] _pfu_biu_pe_req_ptr_priority_1_T_29 = pfu_all_pfb_biu_pe_req_ptiority_1[6] ? 17'h40 :
    _pfu_biu_pe_req_ptr_priority_1_T_28; // @[Mux.scala 101:16]
  wire [16:0] _pfu_biu_pe_req_ptr_priority_1_T_30 = pfu_all_pfb_biu_pe_req_ptiority_1[5] ? 17'h20 :
    _pfu_biu_pe_req_ptr_priority_1_T_29; // @[Mux.scala 101:16]
  wire [16:0] _pfu_biu_pe_req_ptr_priority_1_T_31 = pfu_all_pfb_biu_pe_req_ptiority_1[4] ? 17'h10 :
    _pfu_biu_pe_req_ptr_priority_1_T_30; // @[Mux.scala 101:16]
  wire [16:0] _pfu_biu_pe_req_ptr_priority_1_T_32 = pfu_all_pfb_biu_pe_req_ptiority_1[3] ? 17'h8 :
    _pfu_biu_pe_req_ptr_priority_1_T_31; // @[Mux.scala 101:16]
  wire [16:0] _pfu_biu_pe_req_ptr_priority_1_T_33 = pfu_all_pfb_biu_pe_req_ptiority_1[2] ? 17'h4 :
    _pfu_biu_pe_req_ptr_priority_1_T_32; // @[Mux.scala 101:16]
  wire [16:0] _pfu_biu_pe_req_ptr_priority_1_T_34 = pfu_all_pfb_biu_pe_req_ptiority_1[1] ? 17'h2 :
    _pfu_biu_pe_req_ptr_priority_1_T_33; // @[Mux.scala 101:16]
  wire [16:0] _pfu_biu_pe_req_ptr_priority_1_T_35 = pfu_all_pfb_biu_pe_req_ptiority_1[0] ? 17'h1 :
    _pfu_biu_pe_req_ptr_priority_1_T_34; // @[Mux.scala 101:16]
  wire [8:0] pfu_biu_pe_req_ptr_priority_1 = _pfu_biu_pe_req_ptr_priority_1_T_35[8:0]; // @[pfu.scala 110:43 888:33]
  wire [8:0] pfu_biu_pe_req_ptr = pfu_biu_pe_req_ptiority_0 ? pfu_biu_pe_req_ptr_priority_0 :
    pfu_biu_pe_req_ptr_priority_1; // @[pfu.scala 891:28]
  wire [1:0] pfu_pfb_entry_biu_pe_req_src_0 = ct_lsu_pfu_pfb_entry_pfu_pfb_entry_biu_pe_req_src_v; // @[pfu.scala 217:42 569:37]
  wire [1:0] _pfu_biu_pe_req_src_T_2 = pfu_biu_pe_req_ptr[0] ? pfu_pfb_entry_biu_pe_req_src_0 : 2'h0; // @[pfu.scala 908:8]
  wire [1:0] pfu_pfb_entry_biu_pe_req_src_1 = ct_lsu_pfu_pfb_entry_1_pfu_pfb_entry_biu_pe_req_src_v; // @[pfu.scala 217:42 569:37]
  wire [1:0] _pfu_biu_pe_req_src_T_5 = pfu_biu_pe_req_ptr[1] ? pfu_pfb_entry_biu_pe_req_src_1 : 2'h0; // @[pfu.scala 908:8]
  wire [1:0] _pfu_biu_pe_req_src_T_24 = _pfu_biu_pe_req_src_T_2 | _pfu_biu_pe_req_src_T_5; // @[pfu.scala 909:14]
  wire [1:0] pfu_pfb_entry_biu_pe_req_src_2 = ct_lsu_pfu_pfb_entry_2_pfu_pfb_entry_biu_pe_req_src_v; // @[pfu.scala 217:42 569:37]
  wire [1:0] _pfu_biu_pe_req_src_T_8 = pfu_biu_pe_req_ptr[2] ? pfu_pfb_entry_biu_pe_req_src_2 : 2'h0; // @[pfu.scala 908:8]
  wire [1:0] _pfu_biu_pe_req_src_T_25 = _pfu_biu_pe_req_src_T_24 | _pfu_biu_pe_req_src_T_8; // @[pfu.scala 909:14]
  wire [1:0] pfu_pfb_entry_biu_pe_req_src_3 = ct_lsu_pfu_pfb_entry_3_pfu_pfb_entry_biu_pe_req_src_v; // @[pfu.scala 217:42 569:37]
  wire [1:0] _pfu_biu_pe_req_src_T_11 = pfu_biu_pe_req_ptr[3] ? pfu_pfb_entry_biu_pe_req_src_3 : 2'h0; // @[pfu.scala 908:8]
  wire [1:0] _pfu_biu_pe_req_src_T_26 = _pfu_biu_pe_req_src_T_25 | _pfu_biu_pe_req_src_T_11; // @[pfu.scala 909:14]
  wire [1:0] pfu_pfb_entry_biu_pe_req_src_4 = ct_lsu_pfu_pfb_entry_4_pfu_pfb_entry_biu_pe_req_src_v; // @[pfu.scala 217:42 569:37]
  wire [1:0] _pfu_biu_pe_req_src_T_14 = pfu_biu_pe_req_ptr[4] ? pfu_pfb_entry_biu_pe_req_src_4 : 2'h0; // @[pfu.scala 908:8]
  wire [1:0] _pfu_biu_pe_req_src_T_27 = _pfu_biu_pe_req_src_T_26 | _pfu_biu_pe_req_src_T_14; // @[pfu.scala 909:14]
  wire [1:0] pfu_pfb_entry_biu_pe_req_src_5 = ct_lsu_pfu_pfb_entry_5_pfu_pfb_entry_biu_pe_req_src_v; // @[pfu.scala 217:42 569:37]
  wire [1:0] _pfu_biu_pe_req_src_T_17 = pfu_biu_pe_req_ptr[5] ? pfu_pfb_entry_biu_pe_req_src_5 : 2'h0; // @[pfu.scala 908:8]
  wire [1:0] _pfu_biu_pe_req_src_T_28 = _pfu_biu_pe_req_src_T_27 | _pfu_biu_pe_req_src_T_17; // @[pfu.scala 909:14]
  wire [1:0] pfu_pfb_entry_biu_pe_req_src_6 = ct_lsu_pfu_pfb_entry_6_pfu_pfb_entry_biu_pe_req_src_v; // @[pfu.scala 217:42 569:37]
  wire [1:0] _pfu_biu_pe_req_src_T_20 = pfu_biu_pe_req_ptr[6] ? pfu_pfb_entry_biu_pe_req_src_6 : 2'h0; // @[pfu.scala 908:8]
  wire [1:0] _pfu_biu_pe_req_src_T_29 = _pfu_biu_pe_req_src_T_28 | _pfu_biu_pe_req_src_T_20; // @[pfu.scala 909:14]
  wire [1:0] pfu_pfb_entry_biu_pe_req_src_7 = ct_lsu_pfu_pfb_entry_7_pfu_pfb_entry_biu_pe_req_src_v; // @[pfu.scala 217:42 569:37]
  wire [1:0] _pfu_biu_pe_req_src_T_23 = pfu_biu_pe_req_ptr[7] ? pfu_pfb_entry_biu_pe_req_src_7 : 2'h0; // @[pfu.scala 908:8]
  wire [1:0] _pfu_biu_pe_req_src_T_30 = _pfu_biu_pe_req_src_T_29 | _pfu_biu_pe_req_src_T_23; // @[pfu.scala 909:14]
  wire [16:0] _pfu_mmu_pe_req_ptr_T_27 = pfu_all_pfb_mmu_pe_req[8] ? 17'h100 : 17'h0; // @[Mux.scala 101:16]
  wire [16:0] _pfu_mmu_pe_req_ptr_T_28 = pfu_all_pfb_mmu_pe_req[7] ? 17'h80 : _pfu_mmu_pe_req_ptr_T_27; // @[Mux.scala 101:16]
  wire [16:0] _pfu_mmu_pe_req_ptr_T_29 = pfu_all_pfb_mmu_pe_req[6] ? 17'h40 : _pfu_mmu_pe_req_ptr_T_28; // @[Mux.scala 101:16]
  wire [16:0] _pfu_mmu_pe_req_ptr_T_30 = pfu_all_pfb_mmu_pe_req[5] ? 17'h20 : _pfu_mmu_pe_req_ptr_T_29; // @[Mux.scala 101:16]
  wire [16:0] _pfu_mmu_pe_req_ptr_T_31 = pfu_all_pfb_mmu_pe_req[4] ? 17'h10 : _pfu_mmu_pe_req_ptr_T_30; // @[Mux.scala 101:16]
  wire [16:0] _pfu_mmu_pe_req_ptr_T_32 = pfu_all_pfb_mmu_pe_req[3] ? 17'h8 : _pfu_mmu_pe_req_ptr_T_31; // @[Mux.scala 101:16]
  wire [16:0] _pfu_mmu_pe_req_ptr_T_33 = pfu_all_pfb_mmu_pe_req[2] ? 17'h4 : _pfu_mmu_pe_req_ptr_T_32; // @[Mux.scala 101:16]
  wire [16:0] _pfu_mmu_pe_req_ptr_T_34 = pfu_all_pfb_mmu_pe_req[1] ? 17'h2 : _pfu_mmu_pe_req_ptr_T_33; // @[Mux.scala 101:16]
  wire [16:0] _pfu_mmu_pe_req_ptr_T_35 = pfu_all_pfb_mmu_pe_req[0] ? 17'h1 : _pfu_mmu_pe_req_ptr_T_34; // @[Mux.scala 101:16]
  wire [8:0] pfu_mmu_pe_req_ptr = _pfu_mmu_pe_req_ptr_T_35[8:0]; // @[pfu.scala 119:32 781:22]
  wire [1:0] pfu_gpfb_biu_pe_req_src = x_ct_lsu_pfu_gpfb_pfu_gpfb_biu_pe_req_src; // @[pfu.scala 174:37 706:27]
  wire [1:0] _pfu_biu_pe_req_src_T_33 = pfu_mmu_pe_req_ptr[8] ? pfu_gpfb_biu_pe_req_src : 2'h0; // @[pfu.scala 909:24]
  wire [1:0] pfu_biu_pe_req_src = _pfu_biu_pe_req_src_T_30 | _pfu_biu_pe_req_src_T_33; // @[pfu.scala 909:19]
  wire  pfu_biu_pe_req_sel_l1 = pfu_biu_pe_req_src[0] & ~lfb_addr_less2; // @[pfu.scala 911:57]
  wire  pfu_biu_pe_req_grnt = pfu_biu_pe_update_permit & (pfu_biu_pe_req_sel_l1 | pfu_biu_pe_req_src[0]); // @[pfu.scala 872:51]
  wire [8:0] _pfu_pfb_entry_biu_pe_req_grnt_T = pfu_biu_pe_req_grnt ? pfu_biu_pe_req_ptr : 9'h0; // @[pfu.scala 876:39]
  wire [7:0] pfu_pfb_entry_biu_pe_req_grnt = _pfu_pfb_entry_biu_pe_req_grnt_T[7:0]; // @[pfu.scala 216:43 876:33]
  wire [1:0] _pfu_pfb_create_vld_T = {pfu_sdb_entry_ready_1,pfu_sdb_entry_ready_0}; // @[pfu.scala 644:45]
  wire  pfu_pfb_create_vld = |_pfu_pfb_create_vld_T; // @[pfu.scala 644:52]
  wire [14:0] _pfu_pfb_evict_create_ptr_T_16 = pfu_pfb_entry_evict_7 ? 15'h80 : 15'h0; // @[Mux.scala 101:16]
  wire [14:0] _pfu_pfb_evict_create_ptr_T_17 = pfu_pfb_entry_evict_6 ? 15'h40 : _pfu_pfb_evict_create_ptr_T_16; // @[Mux.scala 101:16]
  wire [14:0] _pfu_pfb_evict_create_ptr_T_18 = pfu_pfb_entry_evict_5 ? 15'h20 : _pfu_pfb_evict_create_ptr_T_17; // @[Mux.scala 101:16]
  wire [14:0] _pfu_pfb_evict_create_ptr_T_19 = pfu_pfb_entry_evict_4 ? 15'h10 : _pfu_pfb_evict_create_ptr_T_18; // @[Mux.scala 101:16]
  wire [14:0] _pfu_pfb_evict_create_ptr_T_20 = pfu_pfb_entry_evict_3 ? 15'h8 : _pfu_pfb_evict_create_ptr_T_19; // @[Mux.scala 101:16]
  wire [14:0] _pfu_pfb_evict_create_ptr_T_21 = pfu_pfb_entry_evict_2 ? 15'h4 : _pfu_pfb_evict_create_ptr_T_20; // @[Mux.scala 101:16]
  wire [14:0] _pfu_pfb_evict_create_ptr_T_22 = pfu_pfb_entry_evict_1 ? 15'h2 : _pfu_pfb_evict_create_ptr_T_21; // @[Mux.scala 101:16]
  wire [14:0] _pfu_pfb_evict_create_ptr_T_23 = pfu_pfb_entry_evict_0 ? 15'h1 : _pfu_pfb_evict_create_ptr_T_22; // @[Mux.scala 101:16]
  wire [7:0] pfu_pfb_evict_create_ptr = _pfu_pfb_evict_create_ptr_T_23[7:0]; // @[pfu.scala 125:38 630:28]
  wire  _pfu_pfb_empty_create_ptr_T_1 = ~pfu_pfb_entry_vld_0; // @[pfu.scala 627:5]
  wire  _pfu_pfb_empty_create_ptr_T_4 = ~pfu_pfb_entry_vld_1; // @[pfu.scala 627:5]
  wire  _pfu_pfb_empty_create_ptr_T_7 = ~pfu_pfb_entry_vld_2; // @[pfu.scala 627:5]
  wire  _pfu_pfb_empty_create_ptr_T_10 = ~pfu_pfb_entry_vld_3; // @[pfu.scala 627:5]
  wire  _pfu_pfb_empty_create_ptr_T_13 = ~pfu_pfb_entry_vld_4; // @[pfu.scala 627:5]
  wire  _pfu_pfb_empty_create_ptr_T_16 = ~pfu_pfb_entry_vld_5; // @[pfu.scala 627:5]
  wire  _pfu_pfb_empty_create_ptr_T_19 = ~pfu_pfb_entry_vld_6; // @[pfu.scala 627:5]
  wire  _pfu_pfb_empty_create_ptr_T_22 = ~pfu_pfb_entry_vld_7; // @[pfu.scala 627:5]
  wire [14:0] _pfu_pfb_empty_create_ptr_T_24 = _pfu_pfb_empty_create_ptr_T_22 ? 15'h80 : 15'h0; // @[Mux.scala 101:16]
  wire [14:0] _pfu_pfb_empty_create_ptr_T_25 = _pfu_pfb_empty_create_ptr_T_19 ? 15'h40 : _pfu_pfb_empty_create_ptr_T_24; // @[Mux.scala 101:16]
  wire [14:0] _pfu_pfb_empty_create_ptr_T_26 = _pfu_pfb_empty_create_ptr_T_16 ? 15'h20 : _pfu_pfb_empty_create_ptr_T_25; // @[Mux.scala 101:16]
  wire [14:0] _pfu_pfb_empty_create_ptr_T_27 = _pfu_pfb_empty_create_ptr_T_13 ? 15'h10 : _pfu_pfb_empty_create_ptr_T_26; // @[Mux.scala 101:16]
  wire [14:0] _pfu_pfb_empty_create_ptr_T_28 = _pfu_pfb_empty_create_ptr_T_10 ? 15'h8 : _pfu_pfb_empty_create_ptr_T_27; // @[Mux.scala 101:16]
  wire [14:0] _pfu_pfb_empty_create_ptr_T_29 = _pfu_pfb_empty_create_ptr_T_7 ? 15'h4 : _pfu_pfb_empty_create_ptr_T_28; // @[Mux.scala 101:16]
  wire [14:0] _pfu_pfb_empty_create_ptr_T_30 = _pfu_pfb_empty_create_ptr_T_4 ? 15'h2 : _pfu_pfb_empty_create_ptr_T_29; // @[Mux.scala 101:16]
  wire [14:0] _pfu_pfb_empty_create_ptr_T_31 = _pfu_pfb_empty_create_ptr_T_1 ? 15'h1 : _pfu_pfb_empty_create_ptr_T_30; // @[Mux.scala 101:16]
  wire [7:0] pfu_pfb_empty_create_ptr = _pfu_pfb_empty_create_ptr_T_31[7:0]; // @[pfu.scala 124:38 626:28]
  wire [7:0] pfu_pfb_create_ptr = pfu_pfb_full ? pfu_pfb_evict_create_ptr : pfu_pfb_empty_create_ptr; // @[pfu.scala 636:28]
  wire [7:0] pfu_pfb_entry_create_dp_vld = pfu_pfb_create_vld ? pfu_pfb_create_ptr : 8'h0; // @[pfu.scala 649:37]
  wire [7:0] pfu_pfb_entry_from_lfb_dcache_hit = lfb_pfu_dcache_hit[7:0]; // @[pfu.scala 966:61]
  wire [7:0] pfu_pfb_entry_from_lfb_dcache_miss = lfb_pfu_dcache_miss[7:0]; // @[pfu.scala 968:63]
  wire  pfu_mmu_pe_clk = x_lsu_pfu_mmu_pe_gated_clk_clk_out; // @[pfu.scala 199:28 304:18]
  reg  pfu_mmu_req_reg; // @[pfu.scala 741:34]
  wire  pfu_mmu_pe_update_permit = ~pfu_mmu_req_reg | mmu_lsu_pa2_vld; // @[pfu.scala 776:44]
  wire [8:0] _pfu_pfb_entry_mmu_pe_req_grnt_T = pfu_mmu_pe_update_permit ? pfu_mmu_pe_req_ptr : 9'h0; // @[pfu.scala 779:39]
  wire [7:0] pfu_pfb_entry_mmu_pe_req_grnt = _pfu_pfb_entry_mmu_pe_req_grnt_T[7:0]; // @[pfu.scala 234:43 779:33]
  wire  _T_118 = pfu_mmu_pe_update_permit & pfu_mmu_pe_req; // @[pfu.scala 748:42]
  wire  _GEN_3 = mmu_lsu_pa2_vld ? 1'h0 : pfu_mmu_req_reg; // @[pfu.scala 751:34 752:25 741:34]
  wire  _GEN_4 = pfu_mmu_pe_update_permit & pfu_mmu_pe_req | _GEN_3; // @[pfu.scala 748:61 749:25]
  wire  pfu_dcache_pref_en = cp0_lsu_dcache_en & cp0_lsu_dcache_pref_en; // @[pfu.scala 973:46]
  wire  pfu_pop_all_vld = ~icc_idle | ~(pfu_dcache_pref_en | cp0_lsu_l2_pref_en) | cp0_lsu_no_op_req |
    sq_pfu_pop_synci_inst; // @[pfu.scala 975:102]
  reg [27:0] pfu_mmu_req_vpn_reg; // @[pfu.scala 760:38]
  wire [1:0] pfu_pfb_entry_mmu_pe_req_src_0 = ct_lsu_pfu_pfb_entry_pfu_pfb_entry_mmu_pe_req_src_v; // @[pfu.scala 235:42 587:37]
  wire [1:0] _pfu_mmu_pe_req_src_T_2 = pfu_mmu_pe_req_ptr[0] ? pfu_pfb_entry_mmu_pe_req_src_0 : 2'h0; // @[pfu.scala 795:8]
  wire [1:0] pfu_pfb_entry_mmu_pe_req_src_1 = ct_lsu_pfu_pfb_entry_1_pfu_pfb_entry_mmu_pe_req_src_v; // @[pfu.scala 235:42 587:37]
  wire [1:0] _pfu_mmu_pe_req_src_T_5 = pfu_mmu_pe_req_ptr[1] ? pfu_pfb_entry_mmu_pe_req_src_1 : 2'h0; // @[pfu.scala 795:8]
  wire [1:0] _pfu_mmu_pe_req_src_T_24 = _pfu_mmu_pe_req_src_T_2 | _pfu_mmu_pe_req_src_T_5; // @[pfu.scala 796:14]
  wire [1:0] pfu_pfb_entry_mmu_pe_req_src_2 = ct_lsu_pfu_pfb_entry_2_pfu_pfb_entry_mmu_pe_req_src_v; // @[pfu.scala 235:42 587:37]
  wire [1:0] _pfu_mmu_pe_req_src_T_8 = pfu_mmu_pe_req_ptr[2] ? pfu_pfb_entry_mmu_pe_req_src_2 : 2'h0; // @[pfu.scala 795:8]
  wire [1:0] _pfu_mmu_pe_req_src_T_25 = _pfu_mmu_pe_req_src_T_24 | _pfu_mmu_pe_req_src_T_8; // @[pfu.scala 796:14]
  wire [1:0] pfu_pfb_entry_mmu_pe_req_src_3 = ct_lsu_pfu_pfb_entry_3_pfu_pfb_entry_mmu_pe_req_src_v; // @[pfu.scala 235:42 587:37]
  wire [1:0] _pfu_mmu_pe_req_src_T_11 = pfu_mmu_pe_req_ptr[3] ? pfu_pfb_entry_mmu_pe_req_src_3 : 2'h0; // @[pfu.scala 795:8]
  wire [1:0] _pfu_mmu_pe_req_src_T_26 = _pfu_mmu_pe_req_src_T_25 | _pfu_mmu_pe_req_src_T_11; // @[pfu.scala 796:14]
  wire [1:0] pfu_pfb_entry_mmu_pe_req_src_4 = ct_lsu_pfu_pfb_entry_4_pfu_pfb_entry_mmu_pe_req_src_v; // @[pfu.scala 235:42 587:37]
  wire [1:0] _pfu_mmu_pe_req_src_T_14 = pfu_mmu_pe_req_ptr[4] ? pfu_pfb_entry_mmu_pe_req_src_4 : 2'h0; // @[pfu.scala 795:8]
  wire [1:0] _pfu_mmu_pe_req_src_T_27 = _pfu_mmu_pe_req_src_T_26 | _pfu_mmu_pe_req_src_T_14; // @[pfu.scala 796:14]
  wire [1:0] pfu_pfb_entry_mmu_pe_req_src_5 = ct_lsu_pfu_pfb_entry_5_pfu_pfb_entry_mmu_pe_req_src_v; // @[pfu.scala 235:42 587:37]
  wire [1:0] _pfu_mmu_pe_req_src_T_17 = pfu_mmu_pe_req_ptr[5] ? pfu_pfb_entry_mmu_pe_req_src_5 : 2'h0; // @[pfu.scala 795:8]
  wire [1:0] _pfu_mmu_pe_req_src_T_28 = _pfu_mmu_pe_req_src_T_27 | _pfu_mmu_pe_req_src_T_17; // @[pfu.scala 796:14]
  wire [1:0] pfu_pfb_entry_mmu_pe_req_src_6 = ct_lsu_pfu_pfb_entry_6_pfu_pfb_entry_mmu_pe_req_src_v; // @[pfu.scala 235:42 587:37]
  wire [1:0] _pfu_mmu_pe_req_src_T_20 = pfu_mmu_pe_req_ptr[6] ? pfu_pfb_entry_mmu_pe_req_src_6 : 2'h0; // @[pfu.scala 795:8]
  wire [1:0] _pfu_mmu_pe_req_src_T_29 = _pfu_mmu_pe_req_src_T_28 | _pfu_mmu_pe_req_src_T_20; // @[pfu.scala 796:14]
  wire [1:0] pfu_pfb_entry_mmu_pe_req_src_7 = ct_lsu_pfu_pfb_entry_7_pfu_pfb_entry_mmu_pe_req_src_v; // @[pfu.scala 235:42 587:37]
  wire [1:0] _pfu_mmu_pe_req_src_T_23 = pfu_mmu_pe_req_ptr[7] ? pfu_pfb_entry_mmu_pe_req_src_7 : 2'h0; // @[pfu.scala 795:8]
  wire [1:0] _pfu_mmu_pe_req_src_T_30 = _pfu_mmu_pe_req_src_T_29 | _pfu_mmu_pe_req_src_T_23; // @[pfu.scala 796:14]
  wire [1:0] pfu_gpfb_mmu_pe_req_src = x_ct_lsu_pfu_gpfb_pfu_gpfb_mmu_pe_req_src; // @[pfu.scala 187:37 719:27]
  wire [1:0] _pfu_mmu_pe_req_src_T_33 = pfu_mmu_pe_req_ptr[8] ? pfu_gpfb_mmu_pe_req_src : 2'h0; // @[pfu.scala 796:24]
  wire [1:0] pfu_mmu_pe_req_src = _pfu_mmu_pe_req_src_T_30 | _pfu_mmu_pe_req_src_T_33; // @[pfu.scala 796:19]
  wire  pfu_mmu_pe_req_sel_l1 = pfu_mmu_pe_req_src[0]; // @[pfu.scala 798:46]
  wire [27:0] pfu_pfb_entry_l1_vpn_0 = ct_lsu_pfu_pfb_entry_pfu_pfb_entry_l1_vpn_v; // @[pfu.scala 228:34 581:29]
  wire [27:0] _pfu_mmu_l1_pe_req_vpn_T_2 = pfu_mmu_pe_req_ptr[0] ? pfu_pfb_entry_l1_vpn_0 : 28'h0; // @[pfu.scala 787:8]
  wire [27:0] pfu_pfb_entry_l1_vpn_1 = ct_lsu_pfu_pfb_entry_1_pfu_pfb_entry_l1_vpn_v; // @[pfu.scala 228:34 581:29]
  wire [27:0] _pfu_mmu_l1_pe_req_vpn_T_5 = pfu_mmu_pe_req_ptr[1] ? pfu_pfb_entry_l1_vpn_1 : 28'h0; // @[pfu.scala 787:8]
  wire [27:0] _pfu_mmu_l1_pe_req_vpn_T_24 = _pfu_mmu_l1_pe_req_vpn_T_2 | _pfu_mmu_l1_pe_req_vpn_T_5; // @[pfu.scala 788:14]
  wire [27:0] pfu_pfb_entry_l1_vpn_2 = ct_lsu_pfu_pfb_entry_2_pfu_pfb_entry_l1_vpn_v; // @[pfu.scala 228:34 581:29]
  wire [27:0] _pfu_mmu_l1_pe_req_vpn_T_8 = pfu_mmu_pe_req_ptr[2] ? pfu_pfb_entry_l1_vpn_2 : 28'h0; // @[pfu.scala 787:8]
  wire [27:0] _pfu_mmu_l1_pe_req_vpn_T_25 = _pfu_mmu_l1_pe_req_vpn_T_24 | _pfu_mmu_l1_pe_req_vpn_T_8; // @[pfu.scala 788:14]
  wire [27:0] pfu_pfb_entry_l1_vpn_3 = ct_lsu_pfu_pfb_entry_3_pfu_pfb_entry_l1_vpn_v; // @[pfu.scala 228:34 581:29]
  wire [27:0] _pfu_mmu_l1_pe_req_vpn_T_11 = pfu_mmu_pe_req_ptr[3] ? pfu_pfb_entry_l1_vpn_3 : 28'h0; // @[pfu.scala 787:8]
  wire [27:0] _pfu_mmu_l1_pe_req_vpn_T_26 = _pfu_mmu_l1_pe_req_vpn_T_25 | _pfu_mmu_l1_pe_req_vpn_T_11; // @[pfu.scala 788:14]
  wire [27:0] pfu_pfb_entry_l1_vpn_4 = ct_lsu_pfu_pfb_entry_4_pfu_pfb_entry_l1_vpn_v; // @[pfu.scala 228:34 581:29]
  wire [27:0] _pfu_mmu_l1_pe_req_vpn_T_14 = pfu_mmu_pe_req_ptr[4] ? pfu_pfb_entry_l1_vpn_4 : 28'h0; // @[pfu.scala 787:8]
  wire [27:0] _pfu_mmu_l1_pe_req_vpn_T_27 = _pfu_mmu_l1_pe_req_vpn_T_26 | _pfu_mmu_l1_pe_req_vpn_T_14; // @[pfu.scala 788:14]
  wire [27:0] pfu_pfb_entry_l1_vpn_5 = ct_lsu_pfu_pfb_entry_5_pfu_pfb_entry_l1_vpn_v; // @[pfu.scala 228:34 581:29]
  wire [27:0] _pfu_mmu_l1_pe_req_vpn_T_17 = pfu_mmu_pe_req_ptr[5] ? pfu_pfb_entry_l1_vpn_5 : 28'h0; // @[pfu.scala 787:8]
  wire [27:0] _pfu_mmu_l1_pe_req_vpn_T_28 = _pfu_mmu_l1_pe_req_vpn_T_27 | _pfu_mmu_l1_pe_req_vpn_T_17; // @[pfu.scala 788:14]
  wire [27:0] pfu_pfb_entry_l1_vpn_6 = ct_lsu_pfu_pfb_entry_6_pfu_pfb_entry_l1_vpn_v; // @[pfu.scala 228:34 581:29]
  wire [27:0] _pfu_mmu_l1_pe_req_vpn_T_20 = pfu_mmu_pe_req_ptr[6] ? pfu_pfb_entry_l1_vpn_6 : 28'h0; // @[pfu.scala 787:8]
  wire [27:0] _pfu_mmu_l1_pe_req_vpn_T_29 = _pfu_mmu_l1_pe_req_vpn_T_28 | _pfu_mmu_l1_pe_req_vpn_T_20; // @[pfu.scala 788:14]
  wire [27:0] pfu_pfb_entry_l1_vpn_7 = ct_lsu_pfu_pfb_entry_7_pfu_pfb_entry_l1_vpn_v; // @[pfu.scala 228:34 581:29]
  wire [27:0] _pfu_mmu_l1_pe_req_vpn_T_23 = pfu_mmu_pe_req_ptr[7] ? pfu_pfb_entry_l1_vpn_7 : 28'h0; // @[pfu.scala 787:8]
  wire [27:0] _pfu_mmu_l1_pe_req_vpn_T_30 = _pfu_mmu_l1_pe_req_vpn_T_29 | _pfu_mmu_l1_pe_req_vpn_T_23; // @[pfu.scala 788:14]
  wire [27:0] pfu_gpfb_l1_vpn = x_ct_lsu_pfu_gpfb_pfu_gpfb_l1_vpn; // @[pfu.scala 180:29 712:19]
  wire [27:0] _pfu_mmu_l1_pe_req_vpn_T_33 = pfu_mmu_pe_req_ptr[8] ? pfu_gpfb_l1_vpn : 28'h0; // @[pfu.scala 788:24]
  wire [27:0] pfu_mmu_l1_pe_req_vpn = _pfu_mmu_l1_pe_req_vpn_T_30 | _pfu_mmu_l1_pe_req_vpn_T_33; // @[pfu.scala 788:19]
  wire [27:0] pfu_pfb_entry_l2_vpn_0 = ct_lsu_pfu_pfb_entry_pfu_pfb_entry_l2_vpn_v; // @[pfu.scala 232:34 585:29]
  wire [27:0] _pfu_mmu_l2_pe_req_vpn_T_2 = pfu_mmu_pe_req_ptr[0] ? pfu_pfb_entry_l2_vpn_0 : 28'h0; // @[pfu.scala 791:8]
  wire [27:0] pfu_pfb_entry_l2_vpn_1 = ct_lsu_pfu_pfb_entry_1_pfu_pfb_entry_l2_vpn_v; // @[pfu.scala 232:34 585:29]
  wire [27:0] _pfu_mmu_l2_pe_req_vpn_T_5 = pfu_mmu_pe_req_ptr[1] ? pfu_pfb_entry_l2_vpn_1 : 28'h0; // @[pfu.scala 791:8]
  wire [27:0] _pfu_mmu_l2_pe_req_vpn_T_24 = _pfu_mmu_l2_pe_req_vpn_T_2 | _pfu_mmu_l2_pe_req_vpn_T_5; // @[pfu.scala 792:14]
  wire [27:0] pfu_pfb_entry_l2_vpn_2 = ct_lsu_pfu_pfb_entry_2_pfu_pfb_entry_l2_vpn_v; // @[pfu.scala 232:34 585:29]
  wire [27:0] _pfu_mmu_l2_pe_req_vpn_T_8 = pfu_mmu_pe_req_ptr[2] ? pfu_pfb_entry_l2_vpn_2 : 28'h0; // @[pfu.scala 791:8]
  wire [27:0] _pfu_mmu_l2_pe_req_vpn_T_25 = _pfu_mmu_l2_pe_req_vpn_T_24 | _pfu_mmu_l2_pe_req_vpn_T_8; // @[pfu.scala 792:14]
  wire [27:0] pfu_pfb_entry_l2_vpn_3 = ct_lsu_pfu_pfb_entry_3_pfu_pfb_entry_l2_vpn_v; // @[pfu.scala 232:34 585:29]
  wire [27:0] _pfu_mmu_l2_pe_req_vpn_T_11 = pfu_mmu_pe_req_ptr[3] ? pfu_pfb_entry_l2_vpn_3 : 28'h0; // @[pfu.scala 791:8]
  wire [27:0] _pfu_mmu_l2_pe_req_vpn_T_26 = _pfu_mmu_l2_pe_req_vpn_T_25 | _pfu_mmu_l2_pe_req_vpn_T_11; // @[pfu.scala 792:14]
  wire [27:0] pfu_pfb_entry_l2_vpn_4 = ct_lsu_pfu_pfb_entry_4_pfu_pfb_entry_l2_vpn_v; // @[pfu.scala 232:34 585:29]
  wire [27:0] _pfu_mmu_l2_pe_req_vpn_T_14 = pfu_mmu_pe_req_ptr[4] ? pfu_pfb_entry_l2_vpn_4 : 28'h0; // @[pfu.scala 791:8]
  wire [27:0] _pfu_mmu_l2_pe_req_vpn_T_27 = _pfu_mmu_l2_pe_req_vpn_T_26 | _pfu_mmu_l2_pe_req_vpn_T_14; // @[pfu.scala 792:14]
  wire [27:0] pfu_pfb_entry_l2_vpn_5 = ct_lsu_pfu_pfb_entry_5_pfu_pfb_entry_l2_vpn_v; // @[pfu.scala 232:34 585:29]
  wire [27:0] _pfu_mmu_l2_pe_req_vpn_T_17 = pfu_mmu_pe_req_ptr[5] ? pfu_pfb_entry_l2_vpn_5 : 28'h0; // @[pfu.scala 791:8]
  wire [27:0] _pfu_mmu_l2_pe_req_vpn_T_28 = _pfu_mmu_l2_pe_req_vpn_T_27 | _pfu_mmu_l2_pe_req_vpn_T_17; // @[pfu.scala 792:14]
  wire [27:0] pfu_pfb_entry_l2_vpn_6 = ct_lsu_pfu_pfb_entry_6_pfu_pfb_entry_l2_vpn_v; // @[pfu.scala 232:34 585:29]
  wire [27:0] _pfu_mmu_l2_pe_req_vpn_T_20 = pfu_mmu_pe_req_ptr[6] ? pfu_pfb_entry_l2_vpn_6 : 28'h0; // @[pfu.scala 791:8]
  wire [27:0] _pfu_mmu_l2_pe_req_vpn_T_29 = _pfu_mmu_l2_pe_req_vpn_T_28 | _pfu_mmu_l2_pe_req_vpn_T_20; // @[pfu.scala 792:14]
  wire [27:0] pfu_pfb_entry_l2_vpn_7 = ct_lsu_pfu_pfb_entry_7_pfu_pfb_entry_l2_vpn_v; // @[pfu.scala 232:34 585:29]
  wire [27:0] _pfu_mmu_l2_pe_req_vpn_T_23 = pfu_mmu_pe_req_ptr[7] ? pfu_pfb_entry_l2_vpn_7 : 28'h0; // @[pfu.scala 791:8]
  wire [27:0] _pfu_mmu_l2_pe_req_vpn_T_30 = _pfu_mmu_l2_pe_req_vpn_T_29 | _pfu_mmu_l2_pe_req_vpn_T_23; // @[pfu.scala 792:14]
  wire [27:0] pfu_gpfb_l2_vpn = x_ct_lsu_pfu_gpfb_pfu_gpfb_l2_vpn; // @[pfu.scala 184:29 716:19]
  wire [27:0] _pfu_mmu_l2_pe_req_vpn_T_33 = pfu_mmu_pe_req_ptr[8] ? pfu_gpfb_l2_vpn : 28'h0; // @[pfu.scala 792:24]
  wire [27:0] pfu_mmu_l2_pe_req_vpn = _pfu_mmu_l2_pe_req_vpn_T_30 | _pfu_mmu_l2_pe_req_vpn_T_33; // @[pfu.scala 792:19]
  wire  _pfu_biu_req_hit_idx_T_2 = ld_da_pfu_biu_req_hit_idx | st_da_pfu_biu_req_hit_idx |
    lfb_pfu_biu_req_hit_idx | vb_pfu_biu_req_hit_idx; // @[pfu.scala 930:117]
  wire  pfu_biu_req_hit_idx = _pfu_biu_req_hit_idx_T_2 | rb_pfu_biu_req_hit_idx | wmb_pfu_biu_req_hit_idx |
    lm_pfu_biu_req_hit_idx; // @[pfu.scala 931:90]
  wire  pfu_biu_req_grnt = bus_arb_pfu_ar_grnt | pfu_biu_req_unmask_reg & pfu_biu_req_l1_reg & pfu_biu_req_hit_idx; // @[pfu.scala 863:46]
  wire  _GEN_9 = pfu_biu_req_grnt ? 1'h0 : pfu_biu_req_unmask_reg; // @[pfu.scala 827:35 828:32 819:41]
  wire  _GEN_10 = pfu_biu_pe_req_grnt | _GEN_9; // @[pfu.scala 824:38 825:32]
  reg [33:0] pfu_biu_req_addr_tto6_reg; // @[pfu.scala 834:44]
  reg  pfu_biu_req_page_sec_reg; // @[pfu.scala 835:43]
  reg  pfu_biu_req_page_share_reg; // @[pfu.scala 836:45]
  reg [1:0] pfu_biu_req_priv_mode_reg; // @[pfu.scala 837:44]
  reg [8:0] pfu_biu_req_ptr_reg; // @[pfu.scala 838:38]
  wire  pfu_biu_pe_update_vld = pfu_biu_pe_update_permit & pfu_biu_pe_req; // @[pfu.scala 869:53]
  wire [39:0] pfu_pfb_entry_l1_pf_addr_0 = ct_lsu_pfu_pfb_entry_pfu_pfb_entry_l1_pf_addr_v; // @[pfu.scala 227:38 580:33]
  wire [33:0] _pfu_biu_l1_pe_req_addr_tto6_T_3 = pfu_biu_pe_req_ptr[0] ? pfu_pfb_entry_l1_pf_addr_0[39:6] : 34'h0; // @[pfu.scala 895:8]
  wire [39:0] pfu_pfb_entry_l1_pf_addr_1 = ct_lsu_pfu_pfb_entry_1_pfu_pfb_entry_l1_pf_addr_v; // @[pfu.scala 227:38 580:33]
  wire [33:0] _pfu_biu_l1_pe_req_addr_tto6_T_7 = pfu_biu_pe_req_ptr[1] ? pfu_pfb_entry_l1_pf_addr_1[39:6] : 34'h0; // @[pfu.scala 895:8]
  wire [33:0] _pfu_biu_l1_pe_req_addr_tto6_T_32 = _pfu_biu_l1_pe_req_addr_tto6_T_3 | _pfu_biu_l1_pe_req_addr_tto6_T_7; // @[pfu.scala 896:14]
  wire [39:0] pfu_pfb_entry_l1_pf_addr_2 = ct_lsu_pfu_pfb_entry_2_pfu_pfb_entry_l1_pf_addr_v; // @[pfu.scala 227:38 580:33]
  wire [33:0] _pfu_biu_l1_pe_req_addr_tto6_T_11 = pfu_biu_pe_req_ptr[2] ? pfu_pfb_entry_l1_pf_addr_2[39:6] : 34'h0; // @[pfu.scala 895:8]
  wire [33:0] _pfu_biu_l1_pe_req_addr_tto6_T_33 = _pfu_biu_l1_pe_req_addr_tto6_T_32 | _pfu_biu_l1_pe_req_addr_tto6_T_11; // @[pfu.scala 896:14]
  wire [39:0] pfu_pfb_entry_l1_pf_addr_3 = ct_lsu_pfu_pfb_entry_3_pfu_pfb_entry_l1_pf_addr_v; // @[pfu.scala 227:38 580:33]
  wire [33:0] _pfu_biu_l1_pe_req_addr_tto6_T_15 = pfu_biu_pe_req_ptr[3] ? pfu_pfb_entry_l1_pf_addr_3[39:6] : 34'h0; // @[pfu.scala 895:8]
  wire [33:0] _pfu_biu_l1_pe_req_addr_tto6_T_34 = _pfu_biu_l1_pe_req_addr_tto6_T_33 | _pfu_biu_l1_pe_req_addr_tto6_T_15; // @[pfu.scala 896:14]
  wire [39:0] pfu_pfb_entry_l1_pf_addr_4 = ct_lsu_pfu_pfb_entry_4_pfu_pfb_entry_l1_pf_addr_v; // @[pfu.scala 227:38 580:33]
  wire [33:0] _pfu_biu_l1_pe_req_addr_tto6_T_19 = pfu_biu_pe_req_ptr[4] ? pfu_pfb_entry_l1_pf_addr_4[39:6] : 34'h0; // @[pfu.scala 895:8]
  wire [33:0] _pfu_biu_l1_pe_req_addr_tto6_T_35 = _pfu_biu_l1_pe_req_addr_tto6_T_34 | _pfu_biu_l1_pe_req_addr_tto6_T_19; // @[pfu.scala 896:14]
  wire [39:0] pfu_pfb_entry_l1_pf_addr_5 = ct_lsu_pfu_pfb_entry_5_pfu_pfb_entry_l1_pf_addr_v; // @[pfu.scala 227:38 580:33]
  wire [33:0] _pfu_biu_l1_pe_req_addr_tto6_T_23 = pfu_biu_pe_req_ptr[5] ? pfu_pfb_entry_l1_pf_addr_5[39:6] : 34'h0; // @[pfu.scala 895:8]
  wire [33:0] _pfu_biu_l1_pe_req_addr_tto6_T_36 = _pfu_biu_l1_pe_req_addr_tto6_T_35 | _pfu_biu_l1_pe_req_addr_tto6_T_23; // @[pfu.scala 896:14]
  wire [39:0] pfu_pfb_entry_l1_pf_addr_6 = ct_lsu_pfu_pfb_entry_6_pfu_pfb_entry_l1_pf_addr_v; // @[pfu.scala 227:38 580:33]
  wire [33:0] _pfu_biu_l1_pe_req_addr_tto6_T_27 = pfu_biu_pe_req_ptr[6] ? pfu_pfb_entry_l1_pf_addr_6[39:6] : 34'h0; // @[pfu.scala 895:8]
  wire [33:0] _pfu_biu_l1_pe_req_addr_tto6_T_37 = _pfu_biu_l1_pe_req_addr_tto6_T_36 | _pfu_biu_l1_pe_req_addr_tto6_T_27; // @[pfu.scala 896:14]
  wire [39:0] pfu_pfb_entry_l1_pf_addr_7 = ct_lsu_pfu_pfb_entry_7_pfu_pfb_entry_l1_pf_addr_v; // @[pfu.scala 227:38 580:33]
  wire [33:0] _pfu_biu_l1_pe_req_addr_tto6_T_31 = pfu_biu_pe_req_ptr[7] ? pfu_pfb_entry_l1_pf_addr_7[39:6] : 34'h0; // @[pfu.scala 895:8]
  wire [33:0] _pfu_biu_l1_pe_req_addr_tto6_T_38 = _pfu_biu_l1_pe_req_addr_tto6_T_37 | _pfu_biu_l1_pe_req_addr_tto6_T_31; // @[pfu.scala 896:14]
  wire [39:0] pfu_gpfb_l1_pf_addr = x_ct_lsu_pfu_gpfb_pfu_gpfb_l1_pf_addr; // @[pfu.scala 179:33 711:23]
  wire [33:0] _pfu_biu_l1_pe_req_addr_tto6_T_42 = pfu_mmu_pe_req_ptr[8] ? pfu_gpfb_l1_pf_addr[39:6] : 34'h0; // @[pfu.scala 896:24]
  wire [33:0] pfu_biu_l1_pe_req_addr_tto6 = _pfu_biu_l1_pe_req_addr_tto6_T_38 | _pfu_biu_l1_pe_req_addr_tto6_T_42; // @[pfu.scala 896:19]
  wire [39:0] pfu_pfb_entry_l2_pf_addr_0 = ct_lsu_pfu_pfb_entry_pfu_pfb_entry_l2_pf_addr_v; // @[pfu.scala 231:38 584:33]
  wire [33:0] _pfu_biu_l2_pe_req_addr_tto6_T_3 = pfu_biu_pe_req_ptr[0] ? pfu_pfb_entry_l2_pf_addr_0[39:6] : 34'h0; // @[pfu.scala 899:8]
  wire [39:0] pfu_pfb_entry_l2_pf_addr_1 = ct_lsu_pfu_pfb_entry_1_pfu_pfb_entry_l2_pf_addr_v; // @[pfu.scala 231:38 584:33]
  wire [33:0] _pfu_biu_l2_pe_req_addr_tto6_T_7 = pfu_biu_pe_req_ptr[1] ? pfu_pfb_entry_l2_pf_addr_1[39:6] : 34'h0; // @[pfu.scala 899:8]
  wire [33:0] _pfu_biu_l2_pe_req_addr_tto6_T_32 = _pfu_biu_l2_pe_req_addr_tto6_T_3 | _pfu_biu_l2_pe_req_addr_tto6_T_7; // @[pfu.scala 900:14]
  wire [39:0] pfu_pfb_entry_l2_pf_addr_2 = ct_lsu_pfu_pfb_entry_2_pfu_pfb_entry_l2_pf_addr_v; // @[pfu.scala 231:38 584:33]
  wire [33:0] _pfu_biu_l2_pe_req_addr_tto6_T_11 = pfu_biu_pe_req_ptr[2] ? pfu_pfb_entry_l2_pf_addr_2[39:6] : 34'h0; // @[pfu.scala 899:8]
  wire [33:0] _pfu_biu_l2_pe_req_addr_tto6_T_33 = _pfu_biu_l2_pe_req_addr_tto6_T_32 | _pfu_biu_l2_pe_req_addr_tto6_T_11; // @[pfu.scala 900:14]
  wire [39:0] pfu_pfb_entry_l2_pf_addr_3 = ct_lsu_pfu_pfb_entry_3_pfu_pfb_entry_l2_pf_addr_v; // @[pfu.scala 231:38 584:33]
  wire [33:0] _pfu_biu_l2_pe_req_addr_tto6_T_15 = pfu_biu_pe_req_ptr[3] ? pfu_pfb_entry_l2_pf_addr_3[39:6] : 34'h0; // @[pfu.scala 899:8]
  wire [33:0] _pfu_biu_l2_pe_req_addr_tto6_T_34 = _pfu_biu_l2_pe_req_addr_tto6_T_33 | _pfu_biu_l2_pe_req_addr_tto6_T_15; // @[pfu.scala 900:14]
  wire [39:0] pfu_pfb_entry_l2_pf_addr_4 = ct_lsu_pfu_pfb_entry_4_pfu_pfb_entry_l2_pf_addr_v; // @[pfu.scala 231:38 584:33]
  wire [33:0] _pfu_biu_l2_pe_req_addr_tto6_T_19 = pfu_biu_pe_req_ptr[4] ? pfu_pfb_entry_l2_pf_addr_4[39:6] : 34'h0; // @[pfu.scala 899:8]
  wire [33:0] _pfu_biu_l2_pe_req_addr_tto6_T_35 = _pfu_biu_l2_pe_req_addr_tto6_T_34 | _pfu_biu_l2_pe_req_addr_tto6_T_19; // @[pfu.scala 900:14]
  wire [39:0] pfu_pfb_entry_l2_pf_addr_5 = ct_lsu_pfu_pfb_entry_5_pfu_pfb_entry_l2_pf_addr_v; // @[pfu.scala 231:38 584:33]
  wire [33:0] _pfu_biu_l2_pe_req_addr_tto6_T_23 = pfu_biu_pe_req_ptr[5] ? pfu_pfb_entry_l2_pf_addr_5[39:6] : 34'h0; // @[pfu.scala 899:8]
  wire [33:0] _pfu_biu_l2_pe_req_addr_tto6_T_36 = _pfu_biu_l2_pe_req_addr_tto6_T_35 | _pfu_biu_l2_pe_req_addr_tto6_T_23; // @[pfu.scala 900:14]
  wire [39:0] pfu_pfb_entry_l2_pf_addr_6 = ct_lsu_pfu_pfb_entry_6_pfu_pfb_entry_l2_pf_addr_v; // @[pfu.scala 231:38 584:33]
  wire [33:0] _pfu_biu_l2_pe_req_addr_tto6_T_27 = pfu_biu_pe_req_ptr[6] ? pfu_pfb_entry_l2_pf_addr_6[39:6] : 34'h0; // @[pfu.scala 899:8]
  wire [33:0] _pfu_biu_l2_pe_req_addr_tto6_T_37 = _pfu_biu_l2_pe_req_addr_tto6_T_36 | _pfu_biu_l2_pe_req_addr_tto6_T_27; // @[pfu.scala 900:14]
  wire [39:0] pfu_pfb_entry_l2_pf_addr_7 = ct_lsu_pfu_pfb_entry_7_pfu_pfb_entry_l2_pf_addr_v; // @[pfu.scala 231:38 584:33]
  wire [33:0] _pfu_biu_l2_pe_req_addr_tto6_T_31 = pfu_biu_pe_req_ptr[7] ? pfu_pfb_entry_l2_pf_addr_7[39:6] : 34'h0; // @[pfu.scala 899:8]
  wire [33:0] _pfu_biu_l2_pe_req_addr_tto6_T_38 = _pfu_biu_l2_pe_req_addr_tto6_T_37 | _pfu_biu_l2_pe_req_addr_tto6_T_31; // @[pfu.scala 900:14]
  wire [39:0] pfu_gpfb_l2_pf_addr = x_ct_lsu_pfu_gpfb_pfu_gpfb_l2_pf_addr; // @[pfu.scala 183:33 715:23]
  wire [33:0] _pfu_biu_l2_pe_req_addr_tto6_T_42 = pfu_mmu_pe_req_ptr[8] ? pfu_gpfb_l2_pf_addr[39:6] : 34'h0; // @[pfu.scala 900:24]
  wire [33:0] pfu_biu_l2_pe_req_addr_tto6 = _pfu_biu_l2_pe_req_addr_tto6_T_38 | _pfu_biu_l2_pe_req_addr_tto6_T_42; // @[pfu.scala 900:19]
  wire  pfu_gpfb_l1_page_sec = x_ct_lsu_pfu_gpfb_pfu_gpfb_l1_page_sec; // @[pfu.scala 177:34 709:24]
  wire  pfu_pfb_entry_l1_page_sec_7 = ct_lsu_pfu_pfb_entry_7_pfu_pfb_entry_l1_page_sec_x; // @[pfu.scala 225:39 578:34]
  wire  pfu_pfb_entry_l1_page_sec_6 = ct_lsu_pfu_pfb_entry_6_pfu_pfb_entry_l1_page_sec_x; // @[pfu.scala 225:39 578:34]
  wire  pfu_pfb_entry_l1_page_sec_5 = ct_lsu_pfu_pfb_entry_5_pfu_pfb_entry_l1_page_sec_x; // @[pfu.scala 225:39 578:34]
  wire  pfu_pfb_entry_l1_page_sec_4 = ct_lsu_pfu_pfb_entry_4_pfu_pfb_entry_l1_page_sec_x; // @[pfu.scala 225:39 578:34]
  wire  pfu_pfb_entry_l1_page_sec_3 = ct_lsu_pfu_pfb_entry_3_pfu_pfb_entry_l1_page_sec_x; // @[pfu.scala 225:39 578:34]
  wire  pfu_pfb_entry_l1_page_sec_2 = ct_lsu_pfu_pfb_entry_2_pfu_pfb_entry_l1_page_sec_x; // @[pfu.scala 225:39 578:34]
  wire  pfu_pfb_entry_l1_page_sec_1 = ct_lsu_pfu_pfb_entry_1_pfu_pfb_entry_l1_page_sec_x; // @[pfu.scala 225:39 578:34]
  wire  pfu_pfb_entry_l1_page_sec_0 = ct_lsu_pfu_pfb_entry_pfu_pfb_entry_l1_page_sec_x; // @[pfu.scala 225:39 578:34]
  wire [8:0] _pfu_biu_l1_pe_req_page_sec_T_1 = {pfu_gpfb_l1_page_sec,pfu_pfb_entry_l1_page_sec_7,
    pfu_pfb_entry_l1_page_sec_6,pfu_pfb_entry_l1_page_sec_5,pfu_pfb_entry_l1_page_sec_4,pfu_pfb_entry_l1_page_sec_3,
    pfu_pfb_entry_l1_page_sec_2,pfu_pfb_entry_l1_page_sec_1,pfu_pfb_entry_l1_page_sec_0}; // @[pfu.scala 902:77]
  wire [8:0] _pfu_biu_l1_pe_req_page_sec_T_2 = pfu_biu_pe_req_ptr & _pfu_biu_l1_pe_req_page_sec_T_1; // @[pfu.scala 902:53]
  wire  pfu_biu_l1_pe_req_page_sec = |_pfu_biu_l1_pe_req_page_sec_T_2; // @[pfu.scala 902:115]
  wire  pfu_gpfb_l2_page_sec = x_ct_lsu_pfu_gpfb_pfu_gpfb_l2_page_sec; // @[pfu.scala 181:34 713:24]
  wire  pfu_pfb_entry_l2_page_sec_7 = ct_lsu_pfu_pfb_entry_7_pfu_pfb_entry_l2_page_sec_x; // @[pfu.scala 229:39 582:34]
  wire  pfu_pfb_entry_l2_page_sec_6 = ct_lsu_pfu_pfb_entry_6_pfu_pfb_entry_l2_page_sec_x; // @[pfu.scala 229:39 582:34]
  wire  pfu_pfb_entry_l2_page_sec_5 = ct_lsu_pfu_pfb_entry_5_pfu_pfb_entry_l2_page_sec_x; // @[pfu.scala 229:39 582:34]
  wire  pfu_pfb_entry_l2_page_sec_4 = ct_lsu_pfu_pfb_entry_4_pfu_pfb_entry_l2_page_sec_x; // @[pfu.scala 229:39 582:34]
  wire  pfu_pfb_entry_l2_page_sec_3 = ct_lsu_pfu_pfb_entry_3_pfu_pfb_entry_l2_page_sec_x; // @[pfu.scala 229:39 582:34]
  wire  pfu_pfb_entry_l2_page_sec_2 = ct_lsu_pfu_pfb_entry_2_pfu_pfb_entry_l2_page_sec_x; // @[pfu.scala 229:39 582:34]
  wire  pfu_pfb_entry_l2_page_sec_1 = ct_lsu_pfu_pfb_entry_1_pfu_pfb_entry_l2_page_sec_x; // @[pfu.scala 229:39 582:34]
  wire  pfu_pfb_entry_l2_page_sec_0 = ct_lsu_pfu_pfb_entry_pfu_pfb_entry_l2_page_sec_x; // @[pfu.scala 229:39 582:34]
  wire [8:0] _pfu_biu_l2_pe_req_page_sec_T_1 = {pfu_gpfb_l2_page_sec,pfu_pfb_entry_l2_page_sec_7,
    pfu_pfb_entry_l2_page_sec_6,pfu_pfb_entry_l2_page_sec_5,pfu_pfb_entry_l2_page_sec_4,pfu_pfb_entry_l2_page_sec_3,
    pfu_pfb_entry_l2_page_sec_2,pfu_pfb_entry_l2_page_sec_1,pfu_pfb_entry_l2_page_sec_0}; // @[pfu.scala 903:77]
  wire [8:0] _pfu_biu_l2_pe_req_page_sec_T_2 = pfu_biu_pe_req_ptr & _pfu_biu_l2_pe_req_page_sec_T_1; // @[pfu.scala 903:53]
  wire  pfu_biu_l2_pe_req_page_sec = |_pfu_biu_l2_pe_req_page_sec_T_2; // @[pfu.scala 903:115]
  wire  pfu_gpfb_l1_page_share = x_ct_lsu_pfu_gpfb_pfu_gpfb_l1_page_share; // @[pfu.scala 178:36 710:26]
  wire  pfu_pfb_entry_l1_page_share_7 = ct_lsu_pfu_pfb_entry_7_pfu_pfb_entry_l1_page_share_x; // @[pfu.scala 226:41 579:36]
  wire  pfu_pfb_entry_l1_page_share_6 = ct_lsu_pfu_pfb_entry_6_pfu_pfb_entry_l1_page_share_x; // @[pfu.scala 226:41 579:36]
  wire  pfu_pfb_entry_l1_page_share_5 = ct_lsu_pfu_pfb_entry_5_pfu_pfb_entry_l1_page_share_x; // @[pfu.scala 226:41 579:36]
  wire  pfu_pfb_entry_l1_page_share_4 = ct_lsu_pfu_pfb_entry_4_pfu_pfb_entry_l1_page_share_x; // @[pfu.scala 226:41 579:36]
  wire  pfu_pfb_entry_l1_page_share_3 = ct_lsu_pfu_pfb_entry_3_pfu_pfb_entry_l1_page_share_x; // @[pfu.scala 226:41 579:36]
  wire  pfu_pfb_entry_l1_page_share_2 = ct_lsu_pfu_pfb_entry_2_pfu_pfb_entry_l1_page_share_x; // @[pfu.scala 226:41 579:36]
  wire  pfu_pfb_entry_l1_page_share_1 = ct_lsu_pfu_pfb_entry_1_pfu_pfb_entry_l1_page_share_x; // @[pfu.scala 226:41 579:36]
  wire  pfu_pfb_entry_l1_page_share_0 = ct_lsu_pfu_pfb_entry_pfu_pfb_entry_l1_page_share_x; // @[pfu.scala 226:41 579:36]
  wire [8:0] _pfu_biu_l1_pe_req_page_share_T_1 = {pfu_gpfb_l1_page_share,pfu_pfb_entry_l1_page_share_7,
    pfu_pfb_entry_l1_page_share_6,pfu_pfb_entry_l1_page_share_5,pfu_pfb_entry_l1_page_share_4,
    pfu_pfb_entry_l1_page_share_3,pfu_pfb_entry_l1_page_share_2,pfu_pfb_entry_l1_page_share_1,
    pfu_pfb_entry_l1_page_share_0}; // @[pfu.scala 904:81]
  wire [8:0] _pfu_biu_l1_pe_req_page_share_T_2 = pfu_biu_pe_req_ptr & _pfu_biu_l1_pe_req_page_share_T_1; // @[pfu.scala 904:55]
  wire  pfu_biu_l1_pe_req_page_share = |_pfu_biu_l1_pe_req_page_share_T_2; // @[pfu.scala 904:121]
  wire  pfu_gpfb_l2_page_share = x_ct_lsu_pfu_gpfb_pfu_gpfb_l2_page_share; // @[pfu.scala 182:36 714:26]
  wire  pfu_pfb_entry_l2_page_share_7 = ct_lsu_pfu_pfb_entry_7_pfu_pfb_entry_l2_page_share_x; // @[pfu.scala 230:41 583:36]
  wire  pfu_pfb_entry_l2_page_share_6 = ct_lsu_pfu_pfb_entry_6_pfu_pfb_entry_l2_page_share_x; // @[pfu.scala 230:41 583:36]
  wire  pfu_pfb_entry_l2_page_share_5 = ct_lsu_pfu_pfb_entry_5_pfu_pfb_entry_l2_page_share_x; // @[pfu.scala 230:41 583:36]
  wire  pfu_pfb_entry_l2_page_share_4 = ct_lsu_pfu_pfb_entry_4_pfu_pfb_entry_l2_page_share_x; // @[pfu.scala 230:41 583:36]
  wire  pfu_pfb_entry_l2_page_share_3 = ct_lsu_pfu_pfb_entry_3_pfu_pfb_entry_l2_page_share_x; // @[pfu.scala 230:41 583:36]
  wire  pfu_pfb_entry_l2_page_share_2 = ct_lsu_pfu_pfb_entry_2_pfu_pfb_entry_l2_page_share_x; // @[pfu.scala 230:41 583:36]
  wire  pfu_pfb_entry_l2_page_share_1 = ct_lsu_pfu_pfb_entry_1_pfu_pfb_entry_l2_page_share_x; // @[pfu.scala 230:41 583:36]
  wire  pfu_pfb_entry_l2_page_share_0 = ct_lsu_pfu_pfb_entry_pfu_pfb_entry_l2_page_share_x; // @[pfu.scala 230:41 583:36]
  wire [8:0] _pfu_biu_l2_pe_req_page_share_T_1 = {pfu_gpfb_l2_page_share,pfu_pfb_entry_l2_page_share_7,
    pfu_pfb_entry_l2_page_share_6,pfu_pfb_entry_l2_page_share_5,pfu_pfb_entry_l2_page_share_4,
    pfu_pfb_entry_l2_page_share_3,pfu_pfb_entry_l2_page_share_2,pfu_pfb_entry_l2_page_share_1,
    pfu_pfb_entry_l2_page_share_0}; // @[pfu.scala 905:81]
  wire [8:0] _pfu_biu_l2_pe_req_page_share_T_2 = pfu_biu_pe_req_ptr & _pfu_biu_l2_pe_req_page_share_T_1; // @[pfu.scala 905:55]
  wire  pfu_biu_l2_pe_req_page_share = |_pfu_biu_l2_pe_req_page_share_T_2; // @[pfu.scala 905:121]
  wire [1:0] pfu_pfb_entry_priv_mode_0 = ct_lsu_pfu_pfb_entry_pfu_pfb_entry_priv_mode_v; // @[pfu.scala 236:37 589:32]
  wire [1:0] _pfu_biu_pe_req_priv_mode_T_2 = pfu_biu_pe_req_ptr[0] ? pfu_pfb_entry_priv_mode_0 : 2'h0; // @[pfu.scala 918:8]
  wire [1:0] pfu_pfb_entry_priv_mode_1 = ct_lsu_pfu_pfb_entry_1_pfu_pfb_entry_priv_mode_v; // @[pfu.scala 236:37 589:32]
  wire [1:0] _pfu_biu_pe_req_priv_mode_T_5 = pfu_biu_pe_req_ptr[1] ? pfu_pfb_entry_priv_mode_1 : 2'h0; // @[pfu.scala 918:8]
  wire [1:0] _pfu_biu_pe_req_priv_mode_T_24 = _pfu_biu_pe_req_priv_mode_T_2 | _pfu_biu_pe_req_priv_mode_T_5; // @[pfu.scala 919:14]
  wire [1:0] pfu_pfb_entry_priv_mode_2 = ct_lsu_pfu_pfb_entry_2_pfu_pfb_entry_priv_mode_v; // @[pfu.scala 236:37 589:32]
  wire [1:0] _pfu_biu_pe_req_priv_mode_T_8 = pfu_biu_pe_req_ptr[2] ? pfu_pfb_entry_priv_mode_2 : 2'h0; // @[pfu.scala 918:8]
  wire [1:0] _pfu_biu_pe_req_priv_mode_T_25 = _pfu_biu_pe_req_priv_mode_T_24 | _pfu_biu_pe_req_priv_mode_T_8; // @[pfu.scala 919:14]
  wire [1:0] pfu_pfb_entry_priv_mode_3 = ct_lsu_pfu_pfb_entry_3_pfu_pfb_entry_priv_mode_v; // @[pfu.scala 236:37 589:32]
  wire [1:0] _pfu_biu_pe_req_priv_mode_T_11 = pfu_biu_pe_req_ptr[3] ? pfu_pfb_entry_priv_mode_3 : 2'h0; // @[pfu.scala 918:8]
  wire [1:0] _pfu_biu_pe_req_priv_mode_T_26 = _pfu_biu_pe_req_priv_mode_T_25 | _pfu_biu_pe_req_priv_mode_T_11; // @[pfu.scala 919:14]
  wire [1:0] pfu_pfb_entry_priv_mode_4 = ct_lsu_pfu_pfb_entry_4_pfu_pfb_entry_priv_mode_v; // @[pfu.scala 236:37 589:32]
  wire [1:0] _pfu_biu_pe_req_priv_mode_T_14 = pfu_biu_pe_req_ptr[4] ? pfu_pfb_entry_priv_mode_4 : 2'h0; // @[pfu.scala 918:8]
  wire [1:0] _pfu_biu_pe_req_priv_mode_T_27 = _pfu_biu_pe_req_priv_mode_T_26 | _pfu_biu_pe_req_priv_mode_T_14; // @[pfu.scala 919:14]
  wire [1:0] pfu_pfb_entry_priv_mode_5 = ct_lsu_pfu_pfb_entry_5_pfu_pfb_entry_priv_mode_v; // @[pfu.scala 236:37 589:32]
  wire [1:0] _pfu_biu_pe_req_priv_mode_T_17 = pfu_biu_pe_req_ptr[5] ? pfu_pfb_entry_priv_mode_5 : 2'h0; // @[pfu.scala 918:8]
  wire [1:0] _pfu_biu_pe_req_priv_mode_T_28 = _pfu_biu_pe_req_priv_mode_T_27 | _pfu_biu_pe_req_priv_mode_T_17; // @[pfu.scala 919:14]
  wire [1:0] pfu_pfb_entry_priv_mode_6 = ct_lsu_pfu_pfb_entry_6_pfu_pfb_entry_priv_mode_v; // @[pfu.scala 236:37 589:32]
  wire [1:0] _pfu_biu_pe_req_priv_mode_T_20 = pfu_biu_pe_req_ptr[6] ? pfu_pfb_entry_priv_mode_6 : 2'h0; // @[pfu.scala 918:8]
  wire [1:0] _pfu_biu_pe_req_priv_mode_T_29 = _pfu_biu_pe_req_priv_mode_T_28 | _pfu_biu_pe_req_priv_mode_T_20; // @[pfu.scala 919:14]
  wire [1:0] pfu_pfb_entry_priv_mode_7 = ct_lsu_pfu_pfb_entry_7_pfu_pfb_entry_priv_mode_v; // @[pfu.scala 236:37 589:32]
  wire [1:0] _pfu_biu_pe_req_priv_mode_T_23 = pfu_biu_pe_req_ptr[7] ? pfu_pfb_entry_priv_mode_7 : 2'h0; // @[pfu.scala 918:8]
  wire [1:0] _pfu_biu_pe_req_priv_mode_T_30 = _pfu_biu_pe_req_priv_mode_T_29 | _pfu_biu_pe_req_priv_mode_T_23; // @[pfu.scala 919:14]
  wire [1:0] pfu_gpfb_priv_mode = x_ct_lsu_pfu_gpfb_pfu_gpfb_priv_mode; // @[pfu.scala 188:32 720:22]
  wire [1:0] _pfu_biu_pe_req_priv_mode_T_33 = pfu_mmu_pe_req_ptr[8] ? pfu_gpfb_priv_mode : 2'h0; // @[pfu.scala 919:24]
  wire [1:0] pfu_biu_pe_req_priv_mode = _pfu_biu_pe_req_priv_mode_T_30 | _pfu_biu_pe_req_priv_mode_T_33; // @[pfu.scala 919:19]
  wire [9:0] _pfu_biu_req_priority_next_T_2 = pfu_biu_pe_req_ptr[0] ? 10'h3ff : 10'h0; // @[pfu.scala 924:8]
  wire [8:0] _pfu_biu_req_priority_next_T_5 = pfu_biu_pe_req_ptr[1] ? 9'h1ff : 9'h0; // @[pfu.scala 924:8]
  wire [9:0] _GEN_19 = {{1'd0}, _pfu_biu_req_priority_next_T_5}; // @[pfu.scala 925:14]
  wire [9:0] _pfu_biu_req_priority_next_T_27 = _pfu_biu_req_priority_next_T_2 | _GEN_19; // @[pfu.scala 925:14]
  wire [7:0] _pfu_biu_req_priority_next_T_8 = pfu_biu_pe_req_ptr[2] ? 8'hff : 8'h0; // @[pfu.scala 924:8]
  wire [9:0] _GEN_20 = {{2'd0}, _pfu_biu_req_priority_next_T_8}; // @[pfu.scala 925:14]
  wire [9:0] _pfu_biu_req_priority_next_T_28 = _pfu_biu_req_priority_next_T_27 | _GEN_20; // @[pfu.scala 925:14]
  wire [6:0] _pfu_biu_req_priority_next_T_11 = pfu_biu_pe_req_ptr[3] ? 7'h7f : 7'h0; // @[pfu.scala 924:8]
  wire [9:0] _GEN_21 = {{3'd0}, _pfu_biu_req_priority_next_T_11}; // @[pfu.scala 925:14]
  wire [9:0] _pfu_biu_req_priority_next_T_29 = _pfu_biu_req_priority_next_T_28 | _GEN_21; // @[pfu.scala 925:14]
  wire [5:0] _pfu_biu_req_priority_next_T_14 = pfu_biu_pe_req_ptr[4] ? 6'h3f : 6'h0; // @[pfu.scala 924:8]
  wire [9:0] _GEN_22 = {{4'd0}, _pfu_biu_req_priority_next_T_14}; // @[pfu.scala 925:14]
  wire [9:0] _pfu_biu_req_priority_next_T_30 = _pfu_biu_req_priority_next_T_29 | _GEN_22; // @[pfu.scala 925:14]
  wire [4:0] _pfu_biu_req_priority_next_T_17 = pfu_biu_pe_req_ptr[5] ? 5'h1f : 5'h0; // @[pfu.scala 924:8]
  wire [9:0] _GEN_23 = {{5'd0}, _pfu_biu_req_priority_next_T_17}; // @[pfu.scala 925:14]
  wire [9:0] _pfu_biu_req_priority_next_T_31 = _pfu_biu_req_priority_next_T_30 | _GEN_23; // @[pfu.scala 925:14]
  wire [3:0] _pfu_biu_req_priority_next_T_20 = pfu_biu_pe_req_ptr[6] ? 4'hf : 4'h0; // @[pfu.scala 924:8]
  wire [9:0] _GEN_24 = {{6'd0}, _pfu_biu_req_priority_next_T_20}; // @[pfu.scala 925:14]
  wire [9:0] _pfu_biu_req_priority_next_T_32 = _pfu_biu_req_priority_next_T_31 | _GEN_24; // @[pfu.scala 925:14]
  wire [2:0] _pfu_biu_req_priority_next_T_23 = pfu_biu_pe_req_ptr[7] ? 3'h7 : 3'h0; // @[pfu.scala 924:8]
  wire [9:0] _GEN_25 = {{7'd0}, _pfu_biu_req_priority_next_T_23}; // @[pfu.scala 925:14]
  wire [9:0] _pfu_biu_req_priority_next_T_33 = _pfu_biu_req_priority_next_T_32 | _GEN_25; // @[pfu.scala 925:14]
  wire [1:0] _pfu_biu_req_priority_next_T_26 = pfu_biu_pe_req_ptr[8] ? 2'h3 : 2'h0; // @[pfu.scala 924:8]
  wire [9:0] _GEN_26 = {{8'd0}, _pfu_biu_req_priority_next_T_26}; // @[pfu.scala 925:14]
  wire [9:0] _pfu_biu_req_priority_next_T_34 = _pfu_biu_req_priority_next_T_33 | _GEN_26; // @[pfu.scala 925:14]
  wire [8:0] pfu_biu_req_priority_next = _pfu_biu_req_priority_next_T_34[8:0]; // @[pfu.scala 164:39 923:29]
  wire  _io_pfu_biu_ar_req_T_1 = pfu_biu_req_unmask_reg & ~cp0_lsu_no_op_req; // @[pfu.scala 934:43]
  wire  _io_pfu_biu_ar_req_T_6 = ~pfu_biu_req_hit_idx & _pfu_biu_req_bus_grnt_T & _pfu_biu_req_bus_grnt_T_1; // @[pfu.scala 934:114]
  wire  _io_pfu_biu_ar_req_T_8 = _io_pfu_biu_ar_req_T_6 | _pfu_biu_req_bus_grnt_T_3; // @[pfu.scala 935:57]
  wire [1:0] _io_pfu_biu_ar_prot_T = {1'h0,pfu_biu_req_page_sec_reg}; // @[pfu.scala 949:29]
  wire [1:0] _io_pfu_biu_ar_user_T_2 = {_pfu_biu_req_bus_grnt_T_3,cp0_yy_priv_mode[1]}; // @[pfu.scala 950:48]
  wire [3:0] _io_pfu_lfb_id_T_5 = pfu_biu_req_ptr_reg[1] ? 4'h1 : 4'h0; // @[pfu.scala 956:8]
  wire [3:0] _io_pfu_lfb_id_T_8 = pfu_biu_req_ptr_reg[2] ? 4'h2 : 4'h0; // @[pfu.scala 956:8]
  wire [3:0] _io_pfu_lfb_id_T_11 = pfu_biu_req_ptr_reg[3] ? 4'h3 : 4'h0; // @[pfu.scala 956:8]
  wire [3:0] _io_pfu_lfb_id_T_14 = pfu_biu_req_ptr_reg[4] ? 4'h4 : 4'h0; // @[pfu.scala 956:8]
  wire [3:0] _io_pfu_lfb_id_T_17 = pfu_biu_req_ptr_reg[5] ? 4'h5 : 4'h0; // @[pfu.scala 956:8]
  wire [3:0] _io_pfu_lfb_id_T_20 = pfu_biu_req_ptr_reg[6] ? 4'h6 : 4'h0; // @[pfu.scala 956:8]
  wire [3:0] _io_pfu_lfb_id_T_23 = pfu_biu_req_ptr_reg[7] ? 4'h7 : 4'h0; // @[pfu.scala 956:8]
  wire [3:0] _io_pfu_lfb_id_T_26 = pfu_biu_req_ptr_reg[8] ? 4'h8 : 4'h0; // @[pfu.scala 956:8]
  wire [3:0] _io_pfu_lfb_id_T_28 = _io_pfu_lfb_id_T_5 | _io_pfu_lfb_id_T_8; // @[pfu.scala 957:14]
  wire [3:0] _io_pfu_lfb_id_T_29 = _io_pfu_lfb_id_T_28 | _io_pfu_lfb_id_T_11; // @[pfu.scala 957:14]
  wire [3:0] _io_pfu_lfb_id_T_30 = _io_pfu_lfb_id_T_29 | _io_pfu_lfb_id_T_14; // @[pfu.scala 957:14]
  wire [3:0] _io_pfu_lfb_id_T_31 = _io_pfu_lfb_id_T_30 | _io_pfu_lfb_id_T_17; // @[pfu.scala 957:14]
  wire [3:0] _io_pfu_lfb_id_T_32 = _io_pfu_lfb_id_T_31 | _io_pfu_lfb_id_T_20; // @[pfu.scala 957:14]
  wire [3:0] _io_pfu_lfb_id_T_33 = _io_pfu_lfb_id_T_32 | _io_pfu_lfb_id_T_23; // @[pfu.scala 957:14]
  wire  _pfu_pmb_empty_T_6 = pfu_pmb_entry_vld_0 | pfu_pmb_entry_vld_1 | pfu_pmb_entry_vld_2 | pfu_pmb_entry_vld_3 |
    pfu_pmb_entry_vld_4 | pfu_pmb_entry_vld_5 | pfu_pmb_entry_vld_6 | pfu_pmb_entry_vld_7; // @[pfu.scala 979:48]
  wire  pfu_pmb_empty = ~(pfu_pmb_entry_vld_0 | pfu_pmb_entry_vld_1 | pfu_pmb_entry_vld_2 | pfu_pmb_entry_vld_3 |
    pfu_pmb_entry_vld_4 | pfu_pmb_entry_vld_5 | pfu_pmb_entry_vld_6 | pfu_pmb_entry_vld_7); // @[pfu.scala 979:20]
  gated_clk_cell x_lsu_pfu_mmu_pe_gated_clk ( // @[pfu.scala 302:42]
    .clk_in(x_lsu_pfu_mmu_pe_gated_clk_clk_in),
    .global_en(x_lsu_pfu_mmu_pe_gated_clk_global_en),
    .module_en(x_lsu_pfu_mmu_pe_gated_clk_module_en),
    .local_en(x_lsu_pfu_mmu_pe_gated_clk_local_en),
    .external_en(x_lsu_pfu_mmu_pe_gated_clk_external_en),
    .pad_yy_icg_scan_en(x_lsu_pfu_mmu_pe_gated_clk_pad_yy_icg_scan_en),
    .clk_out(x_lsu_pfu_mmu_pe_gated_clk_clk_out)
  );
  gated_clk_cell x_lsu_pfu_biu_pe_gated_clk ( // @[pfu.scala 314:42]
    .clk_in(x_lsu_pfu_biu_pe_gated_clk_clk_in),
    .global_en(x_lsu_pfu_biu_pe_gated_clk_global_en),
    .module_en(x_lsu_pfu_biu_pe_gated_clk_module_en),
    .local_en(x_lsu_pfu_biu_pe_gated_clk_local_en),
    .external_en(x_lsu_pfu_biu_pe_gated_clk_external_en),
    .pad_yy_icg_scan_en(x_lsu_pfu_biu_pe_gated_clk_pad_yy_icg_scan_en),
    .clk_out(x_lsu_pfu_biu_pe_gated_clk_clk_out)
  );
  ct_lsu_pfu_pmb_entry ct_lsu_pfu_pmb_entry ( // @[pfu.scala 328:11]
    .amr_wa_cancel(ct_lsu_pfu_pmb_entry_amr_wa_cancel),
    .cp0_lsu_icg_en(ct_lsu_pfu_pmb_entry_cp0_lsu_icg_en),
    .cp0_lsu_l2_st_pref_en(ct_lsu_pfu_pmb_entry_cp0_lsu_l2_st_pref_en),
    .cp0_yy_clk_en(ct_lsu_pfu_pmb_entry_cp0_yy_clk_en),
    .cpurst_b(ct_lsu_pfu_pmb_entry_cpurst_b),
    .ld_da_ldfifo_pc(ct_lsu_pfu_pmb_entry_ld_da_ldfifo_pc),
    .ld_da_pfu_act_dp_vld(ct_lsu_pfu_pmb_entry_ld_da_pfu_act_dp_vld),
    .ld_da_pfu_evict_cnt_vld(ct_lsu_pfu_pmb_entry_ld_da_pfu_evict_cnt_vld),
    .ld_da_pfu_pf_inst_vld(ct_lsu_pfu_pmb_entry_ld_da_pfu_pf_inst_vld),
    .lsu_special_clk(ct_lsu_pfu_pmb_entry_lsu_special_clk),
    .pad_yy_icg_scan_en(ct_lsu_pfu_pmb_entry_pad_yy_icg_scan_en),
    .pfu_pmb_entry_create_dp_vld_x(ct_lsu_pfu_pmb_entry_pfu_pmb_entry_create_dp_vld_x),
    .pfu_pmb_entry_create_gateclk_en_x(ct_lsu_pfu_pmb_entry_pfu_pmb_entry_create_gateclk_en_x),
    .pfu_pmb_entry_create_vld_x(ct_lsu_pfu_pmb_entry_pfu_pmb_entry_create_vld_x),
    .pfu_pmb_entry_ready_grnt_x(ct_lsu_pfu_pmb_entry_pfu_pmb_entry_ready_grnt_x),
    .pfu_pop_all_part_vld(ct_lsu_pfu_pmb_entry_pfu_pop_all_part_vld),
    .pipe_create_pc(ct_lsu_pfu_pmb_entry_pipe_create_pc),
    .pmb_timeout_cnt_val(ct_lsu_pfu_pmb_entry_pmb_timeout_cnt_val),
    .st_da_pc(ct_lsu_pfu_pmb_entry_st_da_pc),
    .st_da_pfu_evict_cnt_vld(ct_lsu_pfu_pmb_entry_st_da_pfu_evict_cnt_vld),
    .st_da_pfu_pf_inst_vld(ct_lsu_pfu_pmb_entry_st_da_pfu_pf_inst_vld),
    .pfu_pmb_entry_evict_x(ct_lsu_pfu_pmb_entry_pfu_pmb_entry_evict_x),
    .pfu_pmb_entry_hit_pc_x(ct_lsu_pfu_pmb_entry_pfu_pmb_entry_hit_pc_x),
    .pfu_pmb_entry_pc_v(ct_lsu_pfu_pmb_entry_pfu_pmb_entry_pc_v),
    .pfu_pmb_entry_ready_x(ct_lsu_pfu_pmb_entry_pfu_pmb_entry_ready_x),
    .pfu_pmb_entry_type_ld_x(ct_lsu_pfu_pmb_entry_pfu_pmb_entry_type_ld_x),
    .pfu_pmb_entry_vld_x(ct_lsu_pfu_pmb_entry_pfu_pmb_entry_vld_x)
  );
  ct_lsu_pfu_pmb_entry ct_lsu_pfu_pmb_entry_1 ( // @[pfu.scala 329:11]
    .amr_wa_cancel(ct_lsu_pfu_pmb_entry_1_amr_wa_cancel),
    .cp0_lsu_icg_en(ct_lsu_pfu_pmb_entry_1_cp0_lsu_icg_en),
    .cp0_lsu_l2_st_pref_en(ct_lsu_pfu_pmb_entry_1_cp0_lsu_l2_st_pref_en),
    .cp0_yy_clk_en(ct_lsu_pfu_pmb_entry_1_cp0_yy_clk_en),
    .cpurst_b(ct_lsu_pfu_pmb_entry_1_cpurst_b),
    .ld_da_ldfifo_pc(ct_lsu_pfu_pmb_entry_1_ld_da_ldfifo_pc),
    .ld_da_pfu_act_dp_vld(ct_lsu_pfu_pmb_entry_1_ld_da_pfu_act_dp_vld),
    .ld_da_pfu_evict_cnt_vld(ct_lsu_pfu_pmb_entry_1_ld_da_pfu_evict_cnt_vld),
    .ld_da_pfu_pf_inst_vld(ct_lsu_pfu_pmb_entry_1_ld_da_pfu_pf_inst_vld),
    .lsu_special_clk(ct_lsu_pfu_pmb_entry_1_lsu_special_clk),
    .pad_yy_icg_scan_en(ct_lsu_pfu_pmb_entry_1_pad_yy_icg_scan_en),
    .pfu_pmb_entry_create_dp_vld_x(ct_lsu_pfu_pmb_entry_1_pfu_pmb_entry_create_dp_vld_x),
    .pfu_pmb_entry_create_gateclk_en_x(ct_lsu_pfu_pmb_entry_1_pfu_pmb_entry_create_gateclk_en_x),
    .pfu_pmb_entry_create_vld_x(ct_lsu_pfu_pmb_entry_1_pfu_pmb_entry_create_vld_x),
    .pfu_pmb_entry_ready_grnt_x(ct_lsu_pfu_pmb_entry_1_pfu_pmb_entry_ready_grnt_x),
    .pfu_pop_all_part_vld(ct_lsu_pfu_pmb_entry_1_pfu_pop_all_part_vld),
    .pipe_create_pc(ct_lsu_pfu_pmb_entry_1_pipe_create_pc),
    .pmb_timeout_cnt_val(ct_lsu_pfu_pmb_entry_1_pmb_timeout_cnt_val),
    .st_da_pc(ct_lsu_pfu_pmb_entry_1_st_da_pc),
    .st_da_pfu_evict_cnt_vld(ct_lsu_pfu_pmb_entry_1_st_da_pfu_evict_cnt_vld),
    .st_da_pfu_pf_inst_vld(ct_lsu_pfu_pmb_entry_1_st_da_pfu_pf_inst_vld),
    .pfu_pmb_entry_evict_x(ct_lsu_pfu_pmb_entry_1_pfu_pmb_entry_evict_x),
    .pfu_pmb_entry_hit_pc_x(ct_lsu_pfu_pmb_entry_1_pfu_pmb_entry_hit_pc_x),
    .pfu_pmb_entry_pc_v(ct_lsu_pfu_pmb_entry_1_pfu_pmb_entry_pc_v),
    .pfu_pmb_entry_ready_x(ct_lsu_pfu_pmb_entry_1_pfu_pmb_entry_ready_x),
    .pfu_pmb_entry_type_ld_x(ct_lsu_pfu_pmb_entry_1_pfu_pmb_entry_type_ld_x),
    .pfu_pmb_entry_vld_x(ct_lsu_pfu_pmb_entry_1_pfu_pmb_entry_vld_x)
  );
  ct_lsu_pfu_pmb_entry ct_lsu_pfu_pmb_entry_2 ( // @[pfu.scala 330:11]
    .amr_wa_cancel(ct_lsu_pfu_pmb_entry_2_amr_wa_cancel),
    .cp0_lsu_icg_en(ct_lsu_pfu_pmb_entry_2_cp0_lsu_icg_en),
    .cp0_lsu_l2_st_pref_en(ct_lsu_pfu_pmb_entry_2_cp0_lsu_l2_st_pref_en),
    .cp0_yy_clk_en(ct_lsu_pfu_pmb_entry_2_cp0_yy_clk_en),
    .cpurst_b(ct_lsu_pfu_pmb_entry_2_cpurst_b),
    .ld_da_ldfifo_pc(ct_lsu_pfu_pmb_entry_2_ld_da_ldfifo_pc),
    .ld_da_pfu_act_dp_vld(ct_lsu_pfu_pmb_entry_2_ld_da_pfu_act_dp_vld),
    .ld_da_pfu_evict_cnt_vld(ct_lsu_pfu_pmb_entry_2_ld_da_pfu_evict_cnt_vld),
    .ld_da_pfu_pf_inst_vld(ct_lsu_pfu_pmb_entry_2_ld_da_pfu_pf_inst_vld),
    .lsu_special_clk(ct_lsu_pfu_pmb_entry_2_lsu_special_clk),
    .pad_yy_icg_scan_en(ct_lsu_pfu_pmb_entry_2_pad_yy_icg_scan_en),
    .pfu_pmb_entry_create_dp_vld_x(ct_lsu_pfu_pmb_entry_2_pfu_pmb_entry_create_dp_vld_x),
    .pfu_pmb_entry_create_gateclk_en_x(ct_lsu_pfu_pmb_entry_2_pfu_pmb_entry_create_gateclk_en_x),
    .pfu_pmb_entry_create_vld_x(ct_lsu_pfu_pmb_entry_2_pfu_pmb_entry_create_vld_x),
    .pfu_pmb_entry_ready_grnt_x(ct_lsu_pfu_pmb_entry_2_pfu_pmb_entry_ready_grnt_x),
    .pfu_pop_all_part_vld(ct_lsu_pfu_pmb_entry_2_pfu_pop_all_part_vld),
    .pipe_create_pc(ct_lsu_pfu_pmb_entry_2_pipe_create_pc),
    .pmb_timeout_cnt_val(ct_lsu_pfu_pmb_entry_2_pmb_timeout_cnt_val),
    .st_da_pc(ct_lsu_pfu_pmb_entry_2_st_da_pc),
    .st_da_pfu_evict_cnt_vld(ct_lsu_pfu_pmb_entry_2_st_da_pfu_evict_cnt_vld),
    .st_da_pfu_pf_inst_vld(ct_lsu_pfu_pmb_entry_2_st_da_pfu_pf_inst_vld),
    .pfu_pmb_entry_evict_x(ct_lsu_pfu_pmb_entry_2_pfu_pmb_entry_evict_x),
    .pfu_pmb_entry_hit_pc_x(ct_lsu_pfu_pmb_entry_2_pfu_pmb_entry_hit_pc_x),
    .pfu_pmb_entry_pc_v(ct_lsu_pfu_pmb_entry_2_pfu_pmb_entry_pc_v),
    .pfu_pmb_entry_ready_x(ct_lsu_pfu_pmb_entry_2_pfu_pmb_entry_ready_x),
    .pfu_pmb_entry_type_ld_x(ct_lsu_pfu_pmb_entry_2_pfu_pmb_entry_type_ld_x),
    .pfu_pmb_entry_vld_x(ct_lsu_pfu_pmb_entry_2_pfu_pmb_entry_vld_x)
  );
  ct_lsu_pfu_pmb_entry ct_lsu_pfu_pmb_entry_3 ( // @[pfu.scala 331:11]
    .amr_wa_cancel(ct_lsu_pfu_pmb_entry_3_amr_wa_cancel),
    .cp0_lsu_icg_en(ct_lsu_pfu_pmb_entry_3_cp0_lsu_icg_en),
    .cp0_lsu_l2_st_pref_en(ct_lsu_pfu_pmb_entry_3_cp0_lsu_l2_st_pref_en),
    .cp0_yy_clk_en(ct_lsu_pfu_pmb_entry_3_cp0_yy_clk_en),
    .cpurst_b(ct_lsu_pfu_pmb_entry_3_cpurst_b),
    .ld_da_ldfifo_pc(ct_lsu_pfu_pmb_entry_3_ld_da_ldfifo_pc),
    .ld_da_pfu_act_dp_vld(ct_lsu_pfu_pmb_entry_3_ld_da_pfu_act_dp_vld),
    .ld_da_pfu_evict_cnt_vld(ct_lsu_pfu_pmb_entry_3_ld_da_pfu_evict_cnt_vld),
    .ld_da_pfu_pf_inst_vld(ct_lsu_pfu_pmb_entry_3_ld_da_pfu_pf_inst_vld),
    .lsu_special_clk(ct_lsu_pfu_pmb_entry_3_lsu_special_clk),
    .pad_yy_icg_scan_en(ct_lsu_pfu_pmb_entry_3_pad_yy_icg_scan_en),
    .pfu_pmb_entry_create_dp_vld_x(ct_lsu_pfu_pmb_entry_3_pfu_pmb_entry_create_dp_vld_x),
    .pfu_pmb_entry_create_gateclk_en_x(ct_lsu_pfu_pmb_entry_3_pfu_pmb_entry_create_gateclk_en_x),
    .pfu_pmb_entry_create_vld_x(ct_lsu_pfu_pmb_entry_3_pfu_pmb_entry_create_vld_x),
    .pfu_pmb_entry_ready_grnt_x(ct_lsu_pfu_pmb_entry_3_pfu_pmb_entry_ready_grnt_x),
    .pfu_pop_all_part_vld(ct_lsu_pfu_pmb_entry_3_pfu_pop_all_part_vld),
    .pipe_create_pc(ct_lsu_pfu_pmb_entry_3_pipe_create_pc),
    .pmb_timeout_cnt_val(ct_lsu_pfu_pmb_entry_3_pmb_timeout_cnt_val),
    .st_da_pc(ct_lsu_pfu_pmb_entry_3_st_da_pc),
    .st_da_pfu_evict_cnt_vld(ct_lsu_pfu_pmb_entry_3_st_da_pfu_evict_cnt_vld),
    .st_da_pfu_pf_inst_vld(ct_lsu_pfu_pmb_entry_3_st_da_pfu_pf_inst_vld),
    .pfu_pmb_entry_evict_x(ct_lsu_pfu_pmb_entry_3_pfu_pmb_entry_evict_x),
    .pfu_pmb_entry_hit_pc_x(ct_lsu_pfu_pmb_entry_3_pfu_pmb_entry_hit_pc_x),
    .pfu_pmb_entry_pc_v(ct_lsu_pfu_pmb_entry_3_pfu_pmb_entry_pc_v),
    .pfu_pmb_entry_ready_x(ct_lsu_pfu_pmb_entry_3_pfu_pmb_entry_ready_x),
    .pfu_pmb_entry_type_ld_x(ct_lsu_pfu_pmb_entry_3_pfu_pmb_entry_type_ld_x),
    .pfu_pmb_entry_vld_x(ct_lsu_pfu_pmb_entry_3_pfu_pmb_entry_vld_x)
  );
  ct_lsu_pfu_pmb_entry ct_lsu_pfu_pmb_entry_4 ( // @[pfu.scala 332:11]
    .amr_wa_cancel(ct_lsu_pfu_pmb_entry_4_amr_wa_cancel),
    .cp0_lsu_icg_en(ct_lsu_pfu_pmb_entry_4_cp0_lsu_icg_en),
    .cp0_lsu_l2_st_pref_en(ct_lsu_pfu_pmb_entry_4_cp0_lsu_l2_st_pref_en),
    .cp0_yy_clk_en(ct_lsu_pfu_pmb_entry_4_cp0_yy_clk_en),
    .cpurst_b(ct_lsu_pfu_pmb_entry_4_cpurst_b),
    .ld_da_ldfifo_pc(ct_lsu_pfu_pmb_entry_4_ld_da_ldfifo_pc),
    .ld_da_pfu_act_dp_vld(ct_lsu_pfu_pmb_entry_4_ld_da_pfu_act_dp_vld),
    .ld_da_pfu_evict_cnt_vld(ct_lsu_pfu_pmb_entry_4_ld_da_pfu_evict_cnt_vld),
    .ld_da_pfu_pf_inst_vld(ct_lsu_pfu_pmb_entry_4_ld_da_pfu_pf_inst_vld),
    .lsu_special_clk(ct_lsu_pfu_pmb_entry_4_lsu_special_clk),
    .pad_yy_icg_scan_en(ct_lsu_pfu_pmb_entry_4_pad_yy_icg_scan_en),
    .pfu_pmb_entry_create_dp_vld_x(ct_lsu_pfu_pmb_entry_4_pfu_pmb_entry_create_dp_vld_x),
    .pfu_pmb_entry_create_gateclk_en_x(ct_lsu_pfu_pmb_entry_4_pfu_pmb_entry_create_gateclk_en_x),
    .pfu_pmb_entry_create_vld_x(ct_lsu_pfu_pmb_entry_4_pfu_pmb_entry_create_vld_x),
    .pfu_pmb_entry_ready_grnt_x(ct_lsu_pfu_pmb_entry_4_pfu_pmb_entry_ready_grnt_x),
    .pfu_pop_all_part_vld(ct_lsu_pfu_pmb_entry_4_pfu_pop_all_part_vld),
    .pipe_create_pc(ct_lsu_pfu_pmb_entry_4_pipe_create_pc),
    .pmb_timeout_cnt_val(ct_lsu_pfu_pmb_entry_4_pmb_timeout_cnt_val),
    .st_da_pc(ct_lsu_pfu_pmb_entry_4_st_da_pc),
    .st_da_pfu_evict_cnt_vld(ct_lsu_pfu_pmb_entry_4_st_da_pfu_evict_cnt_vld),
    .st_da_pfu_pf_inst_vld(ct_lsu_pfu_pmb_entry_4_st_da_pfu_pf_inst_vld),
    .pfu_pmb_entry_evict_x(ct_lsu_pfu_pmb_entry_4_pfu_pmb_entry_evict_x),
    .pfu_pmb_entry_hit_pc_x(ct_lsu_pfu_pmb_entry_4_pfu_pmb_entry_hit_pc_x),
    .pfu_pmb_entry_pc_v(ct_lsu_pfu_pmb_entry_4_pfu_pmb_entry_pc_v),
    .pfu_pmb_entry_ready_x(ct_lsu_pfu_pmb_entry_4_pfu_pmb_entry_ready_x),
    .pfu_pmb_entry_type_ld_x(ct_lsu_pfu_pmb_entry_4_pfu_pmb_entry_type_ld_x),
    .pfu_pmb_entry_vld_x(ct_lsu_pfu_pmb_entry_4_pfu_pmb_entry_vld_x)
  );
  ct_lsu_pfu_pmb_entry ct_lsu_pfu_pmb_entry_5 ( // @[pfu.scala 333:11]
    .amr_wa_cancel(ct_lsu_pfu_pmb_entry_5_amr_wa_cancel),
    .cp0_lsu_icg_en(ct_lsu_pfu_pmb_entry_5_cp0_lsu_icg_en),
    .cp0_lsu_l2_st_pref_en(ct_lsu_pfu_pmb_entry_5_cp0_lsu_l2_st_pref_en),
    .cp0_yy_clk_en(ct_lsu_pfu_pmb_entry_5_cp0_yy_clk_en),
    .cpurst_b(ct_lsu_pfu_pmb_entry_5_cpurst_b),
    .ld_da_ldfifo_pc(ct_lsu_pfu_pmb_entry_5_ld_da_ldfifo_pc),
    .ld_da_pfu_act_dp_vld(ct_lsu_pfu_pmb_entry_5_ld_da_pfu_act_dp_vld),
    .ld_da_pfu_evict_cnt_vld(ct_lsu_pfu_pmb_entry_5_ld_da_pfu_evict_cnt_vld),
    .ld_da_pfu_pf_inst_vld(ct_lsu_pfu_pmb_entry_5_ld_da_pfu_pf_inst_vld),
    .lsu_special_clk(ct_lsu_pfu_pmb_entry_5_lsu_special_clk),
    .pad_yy_icg_scan_en(ct_lsu_pfu_pmb_entry_5_pad_yy_icg_scan_en),
    .pfu_pmb_entry_create_dp_vld_x(ct_lsu_pfu_pmb_entry_5_pfu_pmb_entry_create_dp_vld_x),
    .pfu_pmb_entry_create_gateclk_en_x(ct_lsu_pfu_pmb_entry_5_pfu_pmb_entry_create_gateclk_en_x),
    .pfu_pmb_entry_create_vld_x(ct_lsu_pfu_pmb_entry_5_pfu_pmb_entry_create_vld_x),
    .pfu_pmb_entry_ready_grnt_x(ct_lsu_pfu_pmb_entry_5_pfu_pmb_entry_ready_grnt_x),
    .pfu_pop_all_part_vld(ct_lsu_pfu_pmb_entry_5_pfu_pop_all_part_vld),
    .pipe_create_pc(ct_lsu_pfu_pmb_entry_5_pipe_create_pc),
    .pmb_timeout_cnt_val(ct_lsu_pfu_pmb_entry_5_pmb_timeout_cnt_val),
    .st_da_pc(ct_lsu_pfu_pmb_entry_5_st_da_pc),
    .st_da_pfu_evict_cnt_vld(ct_lsu_pfu_pmb_entry_5_st_da_pfu_evict_cnt_vld),
    .st_da_pfu_pf_inst_vld(ct_lsu_pfu_pmb_entry_5_st_da_pfu_pf_inst_vld),
    .pfu_pmb_entry_evict_x(ct_lsu_pfu_pmb_entry_5_pfu_pmb_entry_evict_x),
    .pfu_pmb_entry_hit_pc_x(ct_lsu_pfu_pmb_entry_5_pfu_pmb_entry_hit_pc_x),
    .pfu_pmb_entry_pc_v(ct_lsu_pfu_pmb_entry_5_pfu_pmb_entry_pc_v),
    .pfu_pmb_entry_ready_x(ct_lsu_pfu_pmb_entry_5_pfu_pmb_entry_ready_x),
    .pfu_pmb_entry_type_ld_x(ct_lsu_pfu_pmb_entry_5_pfu_pmb_entry_type_ld_x),
    .pfu_pmb_entry_vld_x(ct_lsu_pfu_pmb_entry_5_pfu_pmb_entry_vld_x)
  );
  ct_lsu_pfu_pmb_entry ct_lsu_pfu_pmb_entry_6 ( // @[pfu.scala 334:11]
    .amr_wa_cancel(ct_lsu_pfu_pmb_entry_6_amr_wa_cancel),
    .cp0_lsu_icg_en(ct_lsu_pfu_pmb_entry_6_cp0_lsu_icg_en),
    .cp0_lsu_l2_st_pref_en(ct_lsu_pfu_pmb_entry_6_cp0_lsu_l2_st_pref_en),
    .cp0_yy_clk_en(ct_lsu_pfu_pmb_entry_6_cp0_yy_clk_en),
    .cpurst_b(ct_lsu_pfu_pmb_entry_6_cpurst_b),
    .ld_da_ldfifo_pc(ct_lsu_pfu_pmb_entry_6_ld_da_ldfifo_pc),
    .ld_da_pfu_act_dp_vld(ct_lsu_pfu_pmb_entry_6_ld_da_pfu_act_dp_vld),
    .ld_da_pfu_evict_cnt_vld(ct_lsu_pfu_pmb_entry_6_ld_da_pfu_evict_cnt_vld),
    .ld_da_pfu_pf_inst_vld(ct_lsu_pfu_pmb_entry_6_ld_da_pfu_pf_inst_vld),
    .lsu_special_clk(ct_lsu_pfu_pmb_entry_6_lsu_special_clk),
    .pad_yy_icg_scan_en(ct_lsu_pfu_pmb_entry_6_pad_yy_icg_scan_en),
    .pfu_pmb_entry_create_dp_vld_x(ct_lsu_pfu_pmb_entry_6_pfu_pmb_entry_create_dp_vld_x),
    .pfu_pmb_entry_create_gateclk_en_x(ct_lsu_pfu_pmb_entry_6_pfu_pmb_entry_create_gateclk_en_x),
    .pfu_pmb_entry_create_vld_x(ct_lsu_pfu_pmb_entry_6_pfu_pmb_entry_create_vld_x),
    .pfu_pmb_entry_ready_grnt_x(ct_lsu_pfu_pmb_entry_6_pfu_pmb_entry_ready_grnt_x),
    .pfu_pop_all_part_vld(ct_lsu_pfu_pmb_entry_6_pfu_pop_all_part_vld),
    .pipe_create_pc(ct_lsu_pfu_pmb_entry_6_pipe_create_pc),
    .pmb_timeout_cnt_val(ct_lsu_pfu_pmb_entry_6_pmb_timeout_cnt_val),
    .st_da_pc(ct_lsu_pfu_pmb_entry_6_st_da_pc),
    .st_da_pfu_evict_cnt_vld(ct_lsu_pfu_pmb_entry_6_st_da_pfu_evict_cnt_vld),
    .st_da_pfu_pf_inst_vld(ct_lsu_pfu_pmb_entry_6_st_da_pfu_pf_inst_vld),
    .pfu_pmb_entry_evict_x(ct_lsu_pfu_pmb_entry_6_pfu_pmb_entry_evict_x),
    .pfu_pmb_entry_hit_pc_x(ct_lsu_pfu_pmb_entry_6_pfu_pmb_entry_hit_pc_x),
    .pfu_pmb_entry_pc_v(ct_lsu_pfu_pmb_entry_6_pfu_pmb_entry_pc_v),
    .pfu_pmb_entry_ready_x(ct_lsu_pfu_pmb_entry_6_pfu_pmb_entry_ready_x),
    .pfu_pmb_entry_type_ld_x(ct_lsu_pfu_pmb_entry_6_pfu_pmb_entry_type_ld_x),
    .pfu_pmb_entry_vld_x(ct_lsu_pfu_pmb_entry_6_pfu_pmb_entry_vld_x)
  );
  ct_lsu_pfu_pmb_entry ct_lsu_pfu_pmb_entry_7 ( // @[pfu.scala 335:11]
    .amr_wa_cancel(ct_lsu_pfu_pmb_entry_7_amr_wa_cancel),
    .cp0_lsu_icg_en(ct_lsu_pfu_pmb_entry_7_cp0_lsu_icg_en),
    .cp0_lsu_l2_st_pref_en(ct_lsu_pfu_pmb_entry_7_cp0_lsu_l2_st_pref_en),
    .cp0_yy_clk_en(ct_lsu_pfu_pmb_entry_7_cp0_yy_clk_en),
    .cpurst_b(ct_lsu_pfu_pmb_entry_7_cpurst_b),
    .ld_da_ldfifo_pc(ct_lsu_pfu_pmb_entry_7_ld_da_ldfifo_pc),
    .ld_da_pfu_act_dp_vld(ct_lsu_pfu_pmb_entry_7_ld_da_pfu_act_dp_vld),
    .ld_da_pfu_evict_cnt_vld(ct_lsu_pfu_pmb_entry_7_ld_da_pfu_evict_cnt_vld),
    .ld_da_pfu_pf_inst_vld(ct_lsu_pfu_pmb_entry_7_ld_da_pfu_pf_inst_vld),
    .lsu_special_clk(ct_lsu_pfu_pmb_entry_7_lsu_special_clk),
    .pad_yy_icg_scan_en(ct_lsu_pfu_pmb_entry_7_pad_yy_icg_scan_en),
    .pfu_pmb_entry_create_dp_vld_x(ct_lsu_pfu_pmb_entry_7_pfu_pmb_entry_create_dp_vld_x),
    .pfu_pmb_entry_create_gateclk_en_x(ct_lsu_pfu_pmb_entry_7_pfu_pmb_entry_create_gateclk_en_x),
    .pfu_pmb_entry_create_vld_x(ct_lsu_pfu_pmb_entry_7_pfu_pmb_entry_create_vld_x),
    .pfu_pmb_entry_ready_grnt_x(ct_lsu_pfu_pmb_entry_7_pfu_pmb_entry_ready_grnt_x),
    .pfu_pop_all_part_vld(ct_lsu_pfu_pmb_entry_7_pfu_pop_all_part_vld),
    .pipe_create_pc(ct_lsu_pfu_pmb_entry_7_pipe_create_pc),
    .pmb_timeout_cnt_val(ct_lsu_pfu_pmb_entry_7_pmb_timeout_cnt_val),
    .st_da_pc(ct_lsu_pfu_pmb_entry_7_st_da_pc),
    .st_da_pfu_evict_cnt_vld(ct_lsu_pfu_pmb_entry_7_st_da_pfu_evict_cnt_vld),
    .st_da_pfu_pf_inst_vld(ct_lsu_pfu_pmb_entry_7_st_da_pfu_pf_inst_vld),
    .pfu_pmb_entry_evict_x(ct_lsu_pfu_pmb_entry_7_pfu_pmb_entry_evict_x),
    .pfu_pmb_entry_hit_pc_x(ct_lsu_pfu_pmb_entry_7_pfu_pmb_entry_hit_pc_x),
    .pfu_pmb_entry_pc_v(ct_lsu_pfu_pmb_entry_7_pfu_pmb_entry_pc_v),
    .pfu_pmb_entry_ready_x(ct_lsu_pfu_pmb_entry_7_pfu_pmb_entry_ready_x),
    .pfu_pmb_entry_type_ld_x(ct_lsu_pfu_pmb_entry_7_pfu_pmb_entry_type_ld_x),
    .pfu_pmb_entry_vld_x(ct_lsu_pfu_pmb_entry_7_pfu_pmb_entry_vld_x)
  );
  ct_lsu_pfu_sdb_entry ct_lsu_pfu_sdb_entry ( // @[pfu.scala 418:43]
    .amr_wa_cancel(ct_lsu_pfu_sdb_entry_amr_wa_cancel),
    .cp0_lsu_icg_en(ct_lsu_pfu_sdb_entry_cp0_lsu_icg_en),
    .cp0_lsu_l2_st_pref_en(ct_lsu_pfu_sdb_entry_cp0_lsu_l2_st_pref_en),
    .cp0_yy_clk_en(ct_lsu_pfu_sdb_entry_cp0_yy_clk_en),
    .cpurst_b(ct_lsu_pfu_sdb_entry_cpurst_b),
    .ld_da_iid(ct_lsu_pfu_sdb_entry_ld_da_iid),
    .ld_da_ldfifo_pc(ct_lsu_pfu_sdb_entry_ld_da_ldfifo_pc),
    .ld_da_pfu_act_dp_vld(ct_lsu_pfu_sdb_entry_ld_da_pfu_act_dp_vld),
    .ld_da_pfu_evict_cnt_vld(ct_lsu_pfu_sdb_entry_ld_da_pfu_evict_cnt_vld),
    .ld_da_pfu_pf_inst_vld(ct_lsu_pfu_sdb_entry_ld_da_pfu_pf_inst_vld),
    .ld_da_ppfu_va(ct_lsu_pfu_sdb_entry_ld_da_ppfu_va),
    .lsu_special_clk(ct_lsu_pfu_sdb_entry_lsu_special_clk),
    .pad_yy_icg_scan_en(ct_lsu_pfu_sdb_entry_pad_yy_icg_scan_en),
    .pfu_pop_all_part_vld(ct_lsu_pfu_sdb_entry_pfu_pop_all_part_vld),
    .pfu_sdb_create_pc(ct_lsu_pfu_sdb_entry_pfu_sdb_create_pc),
    .pfu_sdb_create_type_ld(ct_lsu_pfu_sdb_entry_pfu_sdb_create_type_ld),
    .pfu_sdb_entry_create_dp_vld_x(ct_lsu_pfu_sdb_entry_pfu_sdb_entry_create_dp_vld_x),
    .pfu_sdb_entry_create_gateclk_en_x(ct_lsu_pfu_sdb_entry_pfu_sdb_entry_create_gateclk_en_x),
    .pfu_sdb_entry_create_vld_x(ct_lsu_pfu_sdb_entry_pfu_sdb_entry_create_vld_x),
    .pfu_sdb_entry_ready_grnt_x(ct_lsu_pfu_sdb_entry_pfu_sdb_entry_ready_grnt_x),
    .rtu_yy_xx_commit0(ct_lsu_pfu_sdb_entry_rtu_yy_xx_commit0),
    .rtu_yy_xx_commit0_iid(ct_lsu_pfu_sdb_entry_rtu_yy_xx_commit0_iid),
    .rtu_yy_xx_commit1(ct_lsu_pfu_sdb_entry_rtu_yy_xx_commit1),
    .rtu_yy_xx_commit1_iid(ct_lsu_pfu_sdb_entry_rtu_yy_xx_commit1_iid),
    .rtu_yy_xx_commit2(ct_lsu_pfu_sdb_entry_rtu_yy_xx_commit2),
    .rtu_yy_xx_commit2_iid(ct_lsu_pfu_sdb_entry_rtu_yy_xx_commit2_iid),
    .rtu_yy_xx_flush(ct_lsu_pfu_sdb_entry_rtu_yy_xx_flush),
    .sdb_timeout_cnt_val(ct_lsu_pfu_sdb_entry_sdb_timeout_cnt_val),
    .st_da_iid(ct_lsu_pfu_sdb_entry_st_da_iid),
    .st_da_pc(ct_lsu_pfu_sdb_entry_st_da_pc),
    .st_da_pfu_evict_cnt_vld(ct_lsu_pfu_sdb_entry_st_da_pfu_evict_cnt_vld),
    .st_da_pfu_pf_inst_vld(ct_lsu_pfu_sdb_entry_st_da_pfu_pf_inst_vld),
    .st_da_ppfu_va(ct_lsu_pfu_sdb_entry_st_da_ppfu_va),
    .pfu_sdb_entry_evict_x(ct_lsu_pfu_sdb_entry_pfu_sdb_entry_evict_x),
    .pfu_sdb_entry_hit_pc_x(ct_lsu_pfu_sdb_entry_pfu_sdb_entry_hit_pc_x),
    .pfu_sdb_entry_pc_v(ct_lsu_pfu_sdb_entry_pfu_sdb_entry_pc_v),
    .pfu_sdb_entry_ready_x(ct_lsu_pfu_sdb_entry_pfu_sdb_entry_ready_x),
    .pfu_sdb_entry_stride_neg_x(ct_lsu_pfu_sdb_entry_pfu_sdb_entry_stride_neg_x),
    .pfu_sdb_entry_stride_v(ct_lsu_pfu_sdb_entry_pfu_sdb_entry_stride_v),
    .pfu_sdb_entry_strideh_6to0_v(ct_lsu_pfu_sdb_entry_pfu_sdb_entry_strideh_6to0_v),
    .pfu_sdb_entry_type_ld_x(ct_lsu_pfu_sdb_entry_pfu_sdb_entry_type_ld_x),
    .pfu_sdb_entry_vld_x(ct_lsu_pfu_sdb_entry_pfu_sdb_entry_vld_x)
  );
  ct_lsu_pfu_sdb_entry ct_lsu_pfu_sdb_entry_1 ( // @[pfu.scala 418:80]
    .amr_wa_cancel(ct_lsu_pfu_sdb_entry_1_amr_wa_cancel),
    .cp0_lsu_icg_en(ct_lsu_pfu_sdb_entry_1_cp0_lsu_icg_en),
    .cp0_lsu_l2_st_pref_en(ct_lsu_pfu_sdb_entry_1_cp0_lsu_l2_st_pref_en),
    .cp0_yy_clk_en(ct_lsu_pfu_sdb_entry_1_cp0_yy_clk_en),
    .cpurst_b(ct_lsu_pfu_sdb_entry_1_cpurst_b),
    .ld_da_iid(ct_lsu_pfu_sdb_entry_1_ld_da_iid),
    .ld_da_ldfifo_pc(ct_lsu_pfu_sdb_entry_1_ld_da_ldfifo_pc),
    .ld_da_pfu_act_dp_vld(ct_lsu_pfu_sdb_entry_1_ld_da_pfu_act_dp_vld),
    .ld_da_pfu_evict_cnt_vld(ct_lsu_pfu_sdb_entry_1_ld_da_pfu_evict_cnt_vld),
    .ld_da_pfu_pf_inst_vld(ct_lsu_pfu_sdb_entry_1_ld_da_pfu_pf_inst_vld),
    .ld_da_ppfu_va(ct_lsu_pfu_sdb_entry_1_ld_da_ppfu_va),
    .lsu_special_clk(ct_lsu_pfu_sdb_entry_1_lsu_special_clk),
    .pad_yy_icg_scan_en(ct_lsu_pfu_sdb_entry_1_pad_yy_icg_scan_en),
    .pfu_pop_all_part_vld(ct_lsu_pfu_sdb_entry_1_pfu_pop_all_part_vld),
    .pfu_sdb_create_pc(ct_lsu_pfu_sdb_entry_1_pfu_sdb_create_pc),
    .pfu_sdb_create_type_ld(ct_lsu_pfu_sdb_entry_1_pfu_sdb_create_type_ld),
    .pfu_sdb_entry_create_dp_vld_x(ct_lsu_pfu_sdb_entry_1_pfu_sdb_entry_create_dp_vld_x),
    .pfu_sdb_entry_create_gateclk_en_x(ct_lsu_pfu_sdb_entry_1_pfu_sdb_entry_create_gateclk_en_x),
    .pfu_sdb_entry_create_vld_x(ct_lsu_pfu_sdb_entry_1_pfu_sdb_entry_create_vld_x),
    .pfu_sdb_entry_ready_grnt_x(ct_lsu_pfu_sdb_entry_1_pfu_sdb_entry_ready_grnt_x),
    .rtu_yy_xx_commit0(ct_lsu_pfu_sdb_entry_1_rtu_yy_xx_commit0),
    .rtu_yy_xx_commit0_iid(ct_lsu_pfu_sdb_entry_1_rtu_yy_xx_commit0_iid),
    .rtu_yy_xx_commit1(ct_lsu_pfu_sdb_entry_1_rtu_yy_xx_commit1),
    .rtu_yy_xx_commit1_iid(ct_lsu_pfu_sdb_entry_1_rtu_yy_xx_commit1_iid),
    .rtu_yy_xx_commit2(ct_lsu_pfu_sdb_entry_1_rtu_yy_xx_commit2),
    .rtu_yy_xx_commit2_iid(ct_lsu_pfu_sdb_entry_1_rtu_yy_xx_commit2_iid),
    .rtu_yy_xx_flush(ct_lsu_pfu_sdb_entry_1_rtu_yy_xx_flush),
    .sdb_timeout_cnt_val(ct_lsu_pfu_sdb_entry_1_sdb_timeout_cnt_val),
    .st_da_iid(ct_lsu_pfu_sdb_entry_1_st_da_iid),
    .st_da_pc(ct_lsu_pfu_sdb_entry_1_st_da_pc),
    .st_da_pfu_evict_cnt_vld(ct_lsu_pfu_sdb_entry_1_st_da_pfu_evict_cnt_vld),
    .st_da_pfu_pf_inst_vld(ct_lsu_pfu_sdb_entry_1_st_da_pfu_pf_inst_vld),
    .st_da_ppfu_va(ct_lsu_pfu_sdb_entry_1_st_da_ppfu_va),
    .pfu_sdb_entry_evict_x(ct_lsu_pfu_sdb_entry_1_pfu_sdb_entry_evict_x),
    .pfu_sdb_entry_hit_pc_x(ct_lsu_pfu_sdb_entry_1_pfu_sdb_entry_hit_pc_x),
    .pfu_sdb_entry_pc_v(ct_lsu_pfu_sdb_entry_1_pfu_sdb_entry_pc_v),
    .pfu_sdb_entry_ready_x(ct_lsu_pfu_sdb_entry_1_pfu_sdb_entry_ready_x),
    .pfu_sdb_entry_stride_neg_x(ct_lsu_pfu_sdb_entry_1_pfu_sdb_entry_stride_neg_x),
    .pfu_sdb_entry_stride_v(ct_lsu_pfu_sdb_entry_1_pfu_sdb_entry_stride_v),
    .pfu_sdb_entry_strideh_6to0_v(ct_lsu_pfu_sdb_entry_1_pfu_sdb_entry_strideh_6to0_v),
    .pfu_sdb_entry_type_ld_x(ct_lsu_pfu_sdb_entry_1_pfu_sdb_entry_type_ld_x),
    .pfu_sdb_entry_vld_x(ct_lsu_pfu_sdb_entry_1_pfu_sdb_entry_vld_x)
  );
  ct_lsu_pfu_pfb_entry ct_lsu_pfu_pfb_entry ( // @[pfu.scala 522:11]
    .amr_wa_cancel(ct_lsu_pfu_pfb_entry_amr_wa_cancel),
    .cp0_lsu_icg_en(ct_lsu_pfu_pfb_entry_cp0_lsu_icg_en),
    .cp0_lsu_l2_st_pref_en(ct_lsu_pfu_pfb_entry_cp0_lsu_l2_st_pref_en),
    .cp0_lsu_pfu_mmu_dis(ct_lsu_pfu_pfb_entry_cp0_lsu_pfu_mmu_dis),
    .cp0_yy_clk_en(ct_lsu_pfu_pfb_entry_cp0_yy_clk_en),
    .cp0_yy_priv_mode(ct_lsu_pfu_pfb_entry_cp0_yy_priv_mode),
    .cpurst_b(ct_lsu_pfu_pfb_entry_cpurst_b),
    .ld_da_ldfifo_pc(ct_lsu_pfu_pfb_entry_ld_da_ldfifo_pc),
    .ld_da_page_sec_ff(ct_lsu_pfu_pfb_entry_ld_da_page_sec_ff),
    .ld_da_page_share_ff(ct_lsu_pfu_pfb_entry_ld_da_page_share_ff),
    .ld_da_pfu_act_dp_vld(ct_lsu_pfu_pfb_entry_ld_da_pfu_act_dp_vld),
    .ld_da_pfu_act_vld(ct_lsu_pfu_pfb_entry_ld_da_pfu_act_vld),
    .ld_da_pfu_evict_cnt_vld(ct_lsu_pfu_pfb_entry_ld_da_pfu_evict_cnt_vld),
    .ld_da_pfu_pf_inst_vld(ct_lsu_pfu_pfb_entry_ld_da_pfu_pf_inst_vld),
    .ld_da_ppfu_va(ct_lsu_pfu_pfb_entry_ld_da_ppfu_va),
    .ld_da_ppn_ff(ct_lsu_pfu_pfb_entry_ld_da_ppn_ff),
    .lsu_pfu_l1_dist_sel(ct_lsu_pfu_pfb_entry_lsu_pfu_l1_dist_sel),
    .lsu_pfu_l2_dist_sel(ct_lsu_pfu_pfb_entry_lsu_pfu_l2_dist_sel),
    .lsu_special_clk(ct_lsu_pfu_pfb_entry_lsu_special_clk),
    .pad_yy_icg_scan_en(ct_lsu_pfu_pfb_entry_pad_yy_icg_scan_en),
    .pfb_no_req_cnt_val(ct_lsu_pfu_pfb_entry_pfb_no_req_cnt_val),
    .pfb_timeout_cnt_val(ct_lsu_pfu_pfb_entry_pfb_timeout_cnt_val),
    .pfu_biu_pe_req_sel_l1(ct_lsu_pfu_pfb_entry_pfu_biu_pe_req_sel_l1),
    .pfu_dcache_pref_en(ct_lsu_pfu_pfb_entry_pfu_dcache_pref_en),
    .pfu_get_page_sec(ct_lsu_pfu_pfb_entry_pfu_get_page_sec),
    .pfu_get_page_share(ct_lsu_pfu_pfb_entry_pfu_get_page_share),
    .pfu_get_ppn(ct_lsu_pfu_pfb_entry_pfu_get_ppn),
    .pfu_get_ppn_err(ct_lsu_pfu_pfb_entry_pfu_get_ppn_err),
    .pfu_get_ppn_vld(ct_lsu_pfu_pfb_entry_pfu_get_ppn_vld),
    .pfu_l2_pref_en(ct_lsu_pfu_pfb_entry_pfu_l2_pref_en),
    .pfu_mmu_pe_req_sel_l1(ct_lsu_pfu_pfb_entry_pfu_mmu_pe_req_sel_l1),
    .pfu_pfb_create_pc(ct_lsu_pfu_pfb_entry_pfu_pfb_create_pc),
    .pfu_pfb_create_stride(ct_lsu_pfu_pfb_entry_pfu_pfb_create_stride),
    .pfu_pfb_create_stride_neg(ct_lsu_pfu_pfb_entry_pfu_pfb_create_stride_neg),
    .pfu_pfb_create_strideh_6to0(ct_lsu_pfu_pfb_entry_pfu_pfb_create_strideh_6to0),
    .pfu_pfb_create_type_ld(ct_lsu_pfu_pfb_entry_pfu_pfb_create_type_ld),
    .pfu_pfb_entry_biu_pe_req_grnt_x(ct_lsu_pfu_pfb_entry_pfu_pfb_entry_biu_pe_req_grnt_x),
    .pfu_pfb_entry_create_dp_vld_x(ct_lsu_pfu_pfb_entry_pfu_pfb_entry_create_dp_vld_x),
    .pfu_pfb_entry_create_gateclk_en_x(ct_lsu_pfu_pfb_entry_pfu_pfb_entry_create_gateclk_en_x),
    .pfu_pfb_entry_create_vld_x(ct_lsu_pfu_pfb_entry_pfu_pfb_entry_create_vld_x),
    .pfu_pfb_entry_from_lfb_dcache_hit_x(ct_lsu_pfu_pfb_entry_pfu_pfb_entry_from_lfb_dcache_hit_x),
    .pfu_pfb_entry_from_lfb_dcache_miss_x(ct_lsu_pfu_pfb_entry_pfu_pfb_entry_from_lfb_dcache_miss_x),
    .pfu_pfb_entry_mmu_pe_req_grnt_x(ct_lsu_pfu_pfb_entry_pfu_pfb_entry_mmu_pe_req_grnt_x),
    .pfu_pop_all_part_vld(ct_lsu_pfu_pfb_entry_pfu_pop_all_part_vld),
    .st_da_page_sec_ff(ct_lsu_pfu_pfb_entry_st_da_page_sec_ff),
    .st_da_page_share_ff(ct_lsu_pfu_pfb_entry_st_da_page_share_ff),
    .st_da_pc(ct_lsu_pfu_pfb_entry_st_da_pc),
    .st_da_pfu_act_vld(ct_lsu_pfu_pfb_entry_st_da_pfu_act_vld),
    .st_da_pfu_evict_cnt_vld(ct_lsu_pfu_pfb_entry_st_da_pfu_evict_cnt_vld),
    .st_da_pfu_pf_inst_vld(ct_lsu_pfu_pfb_entry_st_da_pfu_pf_inst_vld),
    .st_da_ppfu_va(ct_lsu_pfu_pfb_entry_st_da_ppfu_va),
    .st_da_ppn_ff(ct_lsu_pfu_pfb_entry_st_da_ppn_ff),
    .pfu_pfb_entry_biu_pe_req_src_v(ct_lsu_pfu_pfb_entry_pfu_pfb_entry_biu_pe_req_src_v),
    .pfu_pfb_entry_biu_pe_req_x(ct_lsu_pfu_pfb_entry_pfu_pfb_entry_biu_pe_req_x),
    .pfu_pfb_entry_evict_x(ct_lsu_pfu_pfb_entry_pfu_pfb_entry_evict_x),
    .pfu_pfb_entry_hit_pc_x(ct_lsu_pfu_pfb_entry_pfu_pfb_entry_hit_pc_x),
    .pfu_pfb_entry_l1_page_sec_x(ct_lsu_pfu_pfb_entry_pfu_pfb_entry_l1_page_sec_x),
    .pfu_pfb_entry_l1_page_share_x(ct_lsu_pfu_pfb_entry_pfu_pfb_entry_l1_page_share_x),
    .pfu_pfb_entry_l1_pf_addr_v(ct_lsu_pfu_pfb_entry_pfu_pfb_entry_l1_pf_addr_v),
    .pfu_pfb_entry_l1_vpn_v(ct_lsu_pfu_pfb_entry_pfu_pfb_entry_l1_vpn_v),
    .pfu_pfb_entry_l2_page_sec_x(ct_lsu_pfu_pfb_entry_pfu_pfb_entry_l2_page_sec_x),
    .pfu_pfb_entry_l2_page_share_x(ct_lsu_pfu_pfb_entry_pfu_pfb_entry_l2_page_share_x),
    .pfu_pfb_entry_l2_pf_addr_v(ct_lsu_pfu_pfb_entry_pfu_pfb_entry_l2_pf_addr_v),
    .pfu_pfb_entry_l2_vpn_v(ct_lsu_pfu_pfb_entry_pfu_pfb_entry_l2_vpn_v),
    .pfu_pfb_entry_mmu_pe_req_src_v(ct_lsu_pfu_pfb_entry_pfu_pfb_entry_mmu_pe_req_src_v),
    .pfu_pfb_entry_mmu_pe_req_x(ct_lsu_pfu_pfb_entry_pfu_pfb_entry_mmu_pe_req_x),
    .pfu_pfb_entry_priv_mode_v(ct_lsu_pfu_pfb_entry_pfu_pfb_entry_priv_mode_v),
    .pfu_pfb_entry_vld_x(ct_lsu_pfu_pfb_entry_pfu_pfb_entry_vld_x)
  );
  ct_lsu_pfu_pfb_entry ct_lsu_pfu_pfb_entry_1 ( // @[pfu.scala 523:11]
    .amr_wa_cancel(ct_lsu_pfu_pfb_entry_1_amr_wa_cancel),
    .cp0_lsu_icg_en(ct_lsu_pfu_pfb_entry_1_cp0_lsu_icg_en),
    .cp0_lsu_l2_st_pref_en(ct_lsu_pfu_pfb_entry_1_cp0_lsu_l2_st_pref_en),
    .cp0_lsu_pfu_mmu_dis(ct_lsu_pfu_pfb_entry_1_cp0_lsu_pfu_mmu_dis),
    .cp0_yy_clk_en(ct_lsu_pfu_pfb_entry_1_cp0_yy_clk_en),
    .cp0_yy_priv_mode(ct_lsu_pfu_pfb_entry_1_cp0_yy_priv_mode),
    .cpurst_b(ct_lsu_pfu_pfb_entry_1_cpurst_b),
    .ld_da_ldfifo_pc(ct_lsu_pfu_pfb_entry_1_ld_da_ldfifo_pc),
    .ld_da_page_sec_ff(ct_lsu_pfu_pfb_entry_1_ld_da_page_sec_ff),
    .ld_da_page_share_ff(ct_lsu_pfu_pfb_entry_1_ld_da_page_share_ff),
    .ld_da_pfu_act_dp_vld(ct_lsu_pfu_pfb_entry_1_ld_da_pfu_act_dp_vld),
    .ld_da_pfu_act_vld(ct_lsu_pfu_pfb_entry_1_ld_da_pfu_act_vld),
    .ld_da_pfu_evict_cnt_vld(ct_lsu_pfu_pfb_entry_1_ld_da_pfu_evict_cnt_vld),
    .ld_da_pfu_pf_inst_vld(ct_lsu_pfu_pfb_entry_1_ld_da_pfu_pf_inst_vld),
    .ld_da_ppfu_va(ct_lsu_pfu_pfb_entry_1_ld_da_ppfu_va),
    .ld_da_ppn_ff(ct_lsu_pfu_pfb_entry_1_ld_da_ppn_ff),
    .lsu_pfu_l1_dist_sel(ct_lsu_pfu_pfb_entry_1_lsu_pfu_l1_dist_sel),
    .lsu_pfu_l2_dist_sel(ct_lsu_pfu_pfb_entry_1_lsu_pfu_l2_dist_sel),
    .lsu_special_clk(ct_lsu_pfu_pfb_entry_1_lsu_special_clk),
    .pad_yy_icg_scan_en(ct_lsu_pfu_pfb_entry_1_pad_yy_icg_scan_en),
    .pfb_no_req_cnt_val(ct_lsu_pfu_pfb_entry_1_pfb_no_req_cnt_val),
    .pfb_timeout_cnt_val(ct_lsu_pfu_pfb_entry_1_pfb_timeout_cnt_val),
    .pfu_biu_pe_req_sel_l1(ct_lsu_pfu_pfb_entry_1_pfu_biu_pe_req_sel_l1),
    .pfu_dcache_pref_en(ct_lsu_pfu_pfb_entry_1_pfu_dcache_pref_en),
    .pfu_get_page_sec(ct_lsu_pfu_pfb_entry_1_pfu_get_page_sec),
    .pfu_get_page_share(ct_lsu_pfu_pfb_entry_1_pfu_get_page_share),
    .pfu_get_ppn(ct_lsu_pfu_pfb_entry_1_pfu_get_ppn),
    .pfu_get_ppn_err(ct_lsu_pfu_pfb_entry_1_pfu_get_ppn_err),
    .pfu_get_ppn_vld(ct_lsu_pfu_pfb_entry_1_pfu_get_ppn_vld),
    .pfu_l2_pref_en(ct_lsu_pfu_pfb_entry_1_pfu_l2_pref_en),
    .pfu_mmu_pe_req_sel_l1(ct_lsu_pfu_pfb_entry_1_pfu_mmu_pe_req_sel_l1),
    .pfu_pfb_create_pc(ct_lsu_pfu_pfb_entry_1_pfu_pfb_create_pc),
    .pfu_pfb_create_stride(ct_lsu_pfu_pfb_entry_1_pfu_pfb_create_stride),
    .pfu_pfb_create_stride_neg(ct_lsu_pfu_pfb_entry_1_pfu_pfb_create_stride_neg),
    .pfu_pfb_create_strideh_6to0(ct_lsu_pfu_pfb_entry_1_pfu_pfb_create_strideh_6to0),
    .pfu_pfb_create_type_ld(ct_lsu_pfu_pfb_entry_1_pfu_pfb_create_type_ld),
    .pfu_pfb_entry_biu_pe_req_grnt_x(ct_lsu_pfu_pfb_entry_1_pfu_pfb_entry_biu_pe_req_grnt_x),
    .pfu_pfb_entry_create_dp_vld_x(ct_lsu_pfu_pfb_entry_1_pfu_pfb_entry_create_dp_vld_x),
    .pfu_pfb_entry_create_gateclk_en_x(ct_lsu_pfu_pfb_entry_1_pfu_pfb_entry_create_gateclk_en_x),
    .pfu_pfb_entry_create_vld_x(ct_lsu_pfu_pfb_entry_1_pfu_pfb_entry_create_vld_x),
    .pfu_pfb_entry_from_lfb_dcache_hit_x(ct_lsu_pfu_pfb_entry_1_pfu_pfb_entry_from_lfb_dcache_hit_x),
    .pfu_pfb_entry_from_lfb_dcache_miss_x(ct_lsu_pfu_pfb_entry_1_pfu_pfb_entry_from_lfb_dcache_miss_x),
    .pfu_pfb_entry_mmu_pe_req_grnt_x(ct_lsu_pfu_pfb_entry_1_pfu_pfb_entry_mmu_pe_req_grnt_x),
    .pfu_pop_all_part_vld(ct_lsu_pfu_pfb_entry_1_pfu_pop_all_part_vld),
    .st_da_page_sec_ff(ct_lsu_pfu_pfb_entry_1_st_da_page_sec_ff),
    .st_da_page_share_ff(ct_lsu_pfu_pfb_entry_1_st_da_page_share_ff),
    .st_da_pc(ct_lsu_pfu_pfb_entry_1_st_da_pc),
    .st_da_pfu_act_vld(ct_lsu_pfu_pfb_entry_1_st_da_pfu_act_vld),
    .st_da_pfu_evict_cnt_vld(ct_lsu_pfu_pfb_entry_1_st_da_pfu_evict_cnt_vld),
    .st_da_pfu_pf_inst_vld(ct_lsu_pfu_pfb_entry_1_st_da_pfu_pf_inst_vld),
    .st_da_ppfu_va(ct_lsu_pfu_pfb_entry_1_st_da_ppfu_va),
    .st_da_ppn_ff(ct_lsu_pfu_pfb_entry_1_st_da_ppn_ff),
    .pfu_pfb_entry_biu_pe_req_src_v(ct_lsu_pfu_pfb_entry_1_pfu_pfb_entry_biu_pe_req_src_v),
    .pfu_pfb_entry_biu_pe_req_x(ct_lsu_pfu_pfb_entry_1_pfu_pfb_entry_biu_pe_req_x),
    .pfu_pfb_entry_evict_x(ct_lsu_pfu_pfb_entry_1_pfu_pfb_entry_evict_x),
    .pfu_pfb_entry_hit_pc_x(ct_lsu_pfu_pfb_entry_1_pfu_pfb_entry_hit_pc_x),
    .pfu_pfb_entry_l1_page_sec_x(ct_lsu_pfu_pfb_entry_1_pfu_pfb_entry_l1_page_sec_x),
    .pfu_pfb_entry_l1_page_share_x(ct_lsu_pfu_pfb_entry_1_pfu_pfb_entry_l1_page_share_x),
    .pfu_pfb_entry_l1_pf_addr_v(ct_lsu_pfu_pfb_entry_1_pfu_pfb_entry_l1_pf_addr_v),
    .pfu_pfb_entry_l1_vpn_v(ct_lsu_pfu_pfb_entry_1_pfu_pfb_entry_l1_vpn_v),
    .pfu_pfb_entry_l2_page_sec_x(ct_lsu_pfu_pfb_entry_1_pfu_pfb_entry_l2_page_sec_x),
    .pfu_pfb_entry_l2_page_share_x(ct_lsu_pfu_pfb_entry_1_pfu_pfb_entry_l2_page_share_x),
    .pfu_pfb_entry_l2_pf_addr_v(ct_lsu_pfu_pfb_entry_1_pfu_pfb_entry_l2_pf_addr_v),
    .pfu_pfb_entry_l2_vpn_v(ct_lsu_pfu_pfb_entry_1_pfu_pfb_entry_l2_vpn_v),
    .pfu_pfb_entry_mmu_pe_req_src_v(ct_lsu_pfu_pfb_entry_1_pfu_pfb_entry_mmu_pe_req_src_v),
    .pfu_pfb_entry_mmu_pe_req_x(ct_lsu_pfu_pfb_entry_1_pfu_pfb_entry_mmu_pe_req_x),
    .pfu_pfb_entry_priv_mode_v(ct_lsu_pfu_pfb_entry_1_pfu_pfb_entry_priv_mode_v),
    .pfu_pfb_entry_vld_x(ct_lsu_pfu_pfb_entry_1_pfu_pfb_entry_vld_x)
  );
  ct_lsu_pfu_pfb_entry ct_lsu_pfu_pfb_entry_2 ( // @[pfu.scala 524:11]
    .amr_wa_cancel(ct_lsu_pfu_pfb_entry_2_amr_wa_cancel),
    .cp0_lsu_icg_en(ct_lsu_pfu_pfb_entry_2_cp0_lsu_icg_en),
    .cp0_lsu_l2_st_pref_en(ct_lsu_pfu_pfb_entry_2_cp0_lsu_l2_st_pref_en),
    .cp0_lsu_pfu_mmu_dis(ct_lsu_pfu_pfb_entry_2_cp0_lsu_pfu_mmu_dis),
    .cp0_yy_clk_en(ct_lsu_pfu_pfb_entry_2_cp0_yy_clk_en),
    .cp0_yy_priv_mode(ct_lsu_pfu_pfb_entry_2_cp0_yy_priv_mode),
    .cpurst_b(ct_lsu_pfu_pfb_entry_2_cpurst_b),
    .ld_da_ldfifo_pc(ct_lsu_pfu_pfb_entry_2_ld_da_ldfifo_pc),
    .ld_da_page_sec_ff(ct_lsu_pfu_pfb_entry_2_ld_da_page_sec_ff),
    .ld_da_page_share_ff(ct_lsu_pfu_pfb_entry_2_ld_da_page_share_ff),
    .ld_da_pfu_act_dp_vld(ct_lsu_pfu_pfb_entry_2_ld_da_pfu_act_dp_vld),
    .ld_da_pfu_act_vld(ct_lsu_pfu_pfb_entry_2_ld_da_pfu_act_vld),
    .ld_da_pfu_evict_cnt_vld(ct_lsu_pfu_pfb_entry_2_ld_da_pfu_evict_cnt_vld),
    .ld_da_pfu_pf_inst_vld(ct_lsu_pfu_pfb_entry_2_ld_da_pfu_pf_inst_vld),
    .ld_da_ppfu_va(ct_lsu_pfu_pfb_entry_2_ld_da_ppfu_va),
    .ld_da_ppn_ff(ct_lsu_pfu_pfb_entry_2_ld_da_ppn_ff),
    .lsu_pfu_l1_dist_sel(ct_lsu_pfu_pfb_entry_2_lsu_pfu_l1_dist_sel),
    .lsu_pfu_l2_dist_sel(ct_lsu_pfu_pfb_entry_2_lsu_pfu_l2_dist_sel),
    .lsu_special_clk(ct_lsu_pfu_pfb_entry_2_lsu_special_clk),
    .pad_yy_icg_scan_en(ct_lsu_pfu_pfb_entry_2_pad_yy_icg_scan_en),
    .pfb_no_req_cnt_val(ct_lsu_pfu_pfb_entry_2_pfb_no_req_cnt_val),
    .pfb_timeout_cnt_val(ct_lsu_pfu_pfb_entry_2_pfb_timeout_cnt_val),
    .pfu_biu_pe_req_sel_l1(ct_lsu_pfu_pfb_entry_2_pfu_biu_pe_req_sel_l1),
    .pfu_dcache_pref_en(ct_lsu_pfu_pfb_entry_2_pfu_dcache_pref_en),
    .pfu_get_page_sec(ct_lsu_pfu_pfb_entry_2_pfu_get_page_sec),
    .pfu_get_page_share(ct_lsu_pfu_pfb_entry_2_pfu_get_page_share),
    .pfu_get_ppn(ct_lsu_pfu_pfb_entry_2_pfu_get_ppn),
    .pfu_get_ppn_err(ct_lsu_pfu_pfb_entry_2_pfu_get_ppn_err),
    .pfu_get_ppn_vld(ct_lsu_pfu_pfb_entry_2_pfu_get_ppn_vld),
    .pfu_l2_pref_en(ct_lsu_pfu_pfb_entry_2_pfu_l2_pref_en),
    .pfu_mmu_pe_req_sel_l1(ct_lsu_pfu_pfb_entry_2_pfu_mmu_pe_req_sel_l1),
    .pfu_pfb_create_pc(ct_lsu_pfu_pfb_entry_2_pfu_pfb_create_pc),
    .pfu_pfb_create_stride(ct_lsu_pfu_pfb_entry_2_pfu_pfb_create_stride),
    .pfu_pfb_create_stride_neg(ct_lsu_pfu_pfb_entry_2_pfu_pfb_create_stride_neg),
    .pfu_pfb_create_strideh_6to0(ct_lsu_pfu_pfb_entry_2_pfu_pfb_create_strideh_6to0),
    .pfu_pfb_create_type_ld(ct_lsu_pfu_pfb_entry_2_pfu_pfb_create_type_ld),
    .pfu_pfb_entry_biu_pe_req_grnt_x(ct_lsu_pfu_pfb_entry_2_pfu_pfb_entry_biu_pe_req_grnt_x),
    .pfu_pfb_entry_create_dp_vld_x(ct_lsu_pfu_pfb_entry_2_pfu_pfb_entry_create_dp_vld_x),
    .pfu_pfb_entry_create_gateclk_en_x(ct_lsu_pfu_pfb_entry_2_pfu_pfb_entry_create_gateclk_en_x),
    .pfu_pfb_entry_create_vld_x(ct_lsu_pfu_pfb_entry_2_pfu_pfb_entry_create_vld_x),
    .pfu_pfb_entry_from_lfb_dcache_hit_x(ct_lsu_pfu_pfb_entry_2_pfu_pfb_entry_from_lfb_dcache_hit_x),
    .pfu_pfb_entry_from_lfb_dcache_miss_x(ct_lsu_pfu_pfb_entry_2_pfu_pfb_entry_from_lfb_dcache_miss_x),
    .pfu_pfb_entry_mmu_pe_req_grnt_x(ct_lsu_pfu_pfb_entry_2_pfu_pfb_entry_mmu_pe_req_grnt_x),
    .pfu_pop_all_part_vld(ct_lsu_pfu_pfb_entry_2_pfu_pop_all_part_vld),
    .st_da_page_sec_ff(ct_lsu_pfu_pfb_entry_2_st_da_page_sec_ff),
    .st_da_page_share_ff(ct_lsu_pfu_pfb_entry_2_st_da_page_share_ff),
    .st_da_pc(ct_lsu_pfu_pfb_entry_2_st_da_pc),
    .st_da_pfu_act_vld(ct_lsu_pfu_pfb_entry_2_st_da_pfu_act_vld),
    .st_da_pfu_evict_cnt_vld(ct_lsu_pfu_pfb_entry_2_st_da_pfu_evict_cnt_vld),
    .st_da_pfu_pf_inst_vld(ct_lsu_pfu_pfb_entry_2_st_da_pfu_pf_inst_vld),
    .st_da_ppfu_va(ct_lsu_pfu_pfb_entry_2_st_da_ppfu_va),
    .st_da_ppn_ff(ct_lsu_pfu_pfb_entry_2_st_da_ppn_ff),
    .pfu_pfb_entry_biu_pe_req_src_v(ct_lsu_pfu_pfb_entry_2_pfu_pfb_entry_biu_pe_req_src_v),
    .pfu_pfb_entry_biu_pe_req_x(ct_lsu_pfu_pfb_entry_2_pfu_pfb_entry_biu_pe_req_x),
    .pfu_pfb_entry_evict_x(ct_lsu_pfu_pfb_entry_2_pfu_pfb_entry_evict_x),
    .pfu_pfb_entry_hit_pc_x(ct_lsu_pfu_pfb_entry_2_pfu_pfb_entry_hit_pc_x),
    .pfu_pfb_entry_l1_page_sec_x(ct_lsu_pfu_pfb_entry_2_pfu_pfb_entry_l1_page_sec_x),
    .pfu_pfb_entry_l1_page_share_x(ct_lsu_pfu_pfb_entry_2_pfu_pfb_entry_l1_page_share_x),
    .pfu_pfb_entry_l1_pf_addr_v(ct_lsu_pfu_pfb_entry_2_pfu_pfb_entry_l1_pf_addr_v),
    .pfu_pfb_entry_l1_vpn_v(ct_lsu_pfu_pfb_entry_2_pfu_pfb_entry_l1_vpn_v),
    .pfu_pfb_entry_l2_page_sec_x(ct_lsu_pfu_pfb_entry_2_pfu_pfb_entry_l2_page_sec_x),
    .pfu_pfb_entry_l2_page_share_x(ct_lsu_pfu_pfb_entry_2_pfu_pfb_entry_l2_page_share_x),
    .pfu_pfb_entry_l2_pf_addr_v(ct_lsu_pfu_pfb_entry_2_pfu_pfb_entry_l2_pf_addr_v),
    .pfu_pfb_entry_l2_vpn_v(ct_lsu_pfu_pfb_entry_2_pfu_pfb_entry_l2_vpn_v),
    .pfu_pfb_entry_mmu_pe_req_src_v(ct_lsu_pfu_pfb_entry_2_pfu_pfb_entry_mmu_pe_req_src_v),
    .pfu_pfb_entry_mmu_pe_req_x(ct_lsu_pfu_pfb_entry_2_pfu_pfb_entry_mmu_pe_req_x),
    .pfu_pfb_entry_priv_mode_v(ct_lsu_pfu_pfb_entry_2_pfu_pfb_entry_priv_mode_v),
    .pfu_pfb_entry_vld_x(ct_lsu_pfu_pfb_entry_2_pfu_pfb_entry_vld_x)
  );
  ct_lsu_pfu_pfb_entry ct_lsu_pfu_pfb_entry_3 ( // @[pfu.scala 525:11]
    .amr_wa_cancel(ct_lsu_pfu_pfb_entry_3_amr_wa_cancel),
    .cp0_lsu_icg_en(ct_lsu_pfu_pfb_entry_3_cp0_lsu_icg_en),
    .cp0_lsu_l2_st_pref_en(ct_lsu_pfu_pfb_entry_3_cp0_lsu_l2_st_pref_en),
    .cp0_lsu_pfu_mmu_dis(ct_lsu_pfu_pfb_entry_3_cp0_lsu_pfu_mmu_dis),
    .cp0_yy_clk_en(ct_lsu_pfu_pfb_entry_3_cp0_yy_clk_en),
    .cp0_yy_priv_mode(ct_lsu_pfu_pfb_entry_3_cp0_yy_priv_mode),
    .cpurst_b(ct_lsu_pfu_pfb_entry_3_cpurst_b),
    .ld_da_ldfifo_pc(ct_lsu_pfu_pfb_entry_3_ld_da_ldfifo_pc),
    .ld_da_page_sec_ff(ct_lsu_pfu_pfb_entry_3_ld_da_page_sec_ff),
    .ld_da_page_share_ff(ct_lsu_pfu_pfb_entry_3_ld_da_page_share_ff),
    .ld_da_pfu_act_dp_vld(ct_lsu_pfu_pfb_entry_3_ld_da_pfu_act_dp_vld),
    .ld_da_pfu_act_vld(ct_lsu_pfu_pfb_entry_3_ld_da_pfu_act_vld),
    .ld_da_pfu_evict_cnt_vld(ct_lsu_pfu_pfb_entry_3_ld_da_pfu_evict_cnt_vld),
    .ld_da_pfu_pf_inst_vld(ct_lsu_pfu_pfb_entry_3_ld_da_pfu_pf_inst_vld),
    .ld_da_ppfu_va(ct_lsu_pfu_pfb_entry_3_ld_da_ppfu_va),
    .ld_da_ppn_ff(ct_lsu_pfu_pfb_entry_3_ld_da_ppn_ff),
    .lsu_pfu_l1_dist_sel(ct_lsu_pfu_pfb_entry_3_lsu_pfu_l1_dist_sel),
    .lsu_pfu_l2_dist_sel(ct_lsu_pfu_pfb_entry_3_lsu_pfu_l2_dist_sel),
    .lsu_special_clk(ct_lsu_pfu_pfb_entry_3_lsu_special_clk),
    .pad_yy_icg_scan_en(ct_lsu_pfu_pfb_entry_3_pad_yy_icg_scan_en),
    .pfb_no_req_cnt_val(ct_lsu_pfu_pfb_entry_3_pfb_no_req_cnt_val),
    .pfb_timeout_cnt_val(ct_lsu_pfu_pfb_entry_3_pfb_timeout_cnt_val),
    .pfu_biu_pe_req_sel_l1(ct_lsu_pfu_pfb_entry_3_pfu_biu_pe_req_sel_l1),
    .pfu_dcache_pref_en(ct_lsu_pfu_pfb_entry_3_pfu_dcache_pref_en),
    .pfu_get_page_sec(ct_lsu_pfu_pfb_entry_3_pfu_get_page_sec),
    .pfu_get_page_share(ct_lsu_pfu_pfb_entry_3_pfu_get_page_share),
    .pfu_get_ppn(ct_lsu_pfu_pfb_entry_3_pfu_get_ppn),
    .pfu_get_ppn_err(ct_lsu_pfu_pfb_entry_3_pfu_get_ppn_err),
    .pfu_get_ppn_vld(ct_lsu_pfu_pfb_entry_3_pfu_get_ppn_vld),
    .pfu_l2_pref_en(ct_lsu_pfu_pfb_entry_3_pfu_l2_pref_en),
    .pfu_mmu_pe_req_sel_l1(ct_lsu_pfu_pfb_entry_3_pfu_mmu_pe_req_sel_l1),
    .pfu_pfb_create_pc(ct_lsu_pfu_pfb_entry_3_pfu_pfb_create_pc),
    .pfu_pfb_create_stride(ct_lsu_pfu_pfb_entry_3_pfu_pfb_create_stride),
    .pfu_pfb_create_stride_neg(ct_lsu_pfu_pfb_entry_3_pfu_pfb_create_stride_neg),
    .pfu_pfb_create_strideh_6to0(ct_lsu_pfu_pfb_entry_3_pfu_pfb_create_strideh_6to0),
    .pfu_pfb_create_type_ld(ct_lsu_pfu_pfb_entry_3_pfu_pfb_create_type_ld),
    .pfu_pfb_entry_biu_pe_req_grnt_x(ct_lsu_pfu_pfb_entry_3_pfu_pfb_entry_biu_pe_req_grnt_x),
    .pfu_pfb_entry_create_dp_vld_x(ct_lsu_pfu_pfb_entry_3_pfu_pfb_entry_create_dp_vld_x),
    .pfu_pfb_entry_create_gateclk_en_x(ct_lsu_pfu_pfb_entry_3_pfu_pfb_entry_create_gateclk_en_x),
    .pfu_pfb_entry_create_vld_x(ct_lsu_pfu_pfb_entry_3_pfu_pfb_entry_create_vld_x),
    .pfu_pfb_entry_from_lfb_dcache_hit_x(ct_lsu_pfu_pfb_entry_3_pfu_pfb_entry_from_lfb_dcache_hit_x),
    .pfu_pfb_entry_from_lfb_dcache_miss_x(ct_lsu_pfu_pfb_entry_3_pfu_pfb_entry_from_lfb_dcache_miss_x),
    .pfu_pfb_entry_mmu_pe_req_grnt_x(ct_lsu_pfu_pfb_entry_3_pfu_pfb_entry_mmu_pe_req_grnt_x),
    .pfu_pop_all_part_vld(ct_lsu_pfu_pfb_entry_3_pfu_pop_all_part_vld),
    .st_da_page_sec_ff(ct_lsu_pfu_pfb_entry_3_st_da_page_sec_ff),
    .st_da_page_share_ff(ct_lsu_pfu_pfb_entry_3_st_da_page_share_ff),
    .st_da_pc(ct_lsu_pfu_pfb_entry_3_st_da_pc),
    .st_da_pfu_act_vld(ct_lsu_pfu_pfb_entry_3_st_da_pfu_act_vld),
    .st_da_pfu_evict_cnt_vld(ct_lsu_pfu_pfb_entry_3_st_da_pfu_evict_cnt_vld),
    .st_da_pfu_pf_inst_vld(ct_lsu_pfu_pfb_entry_3_st_da_pfu_pf_inst_vld),
    .st_da_ppfu_va(ct_lsu_pfu_pfb_entry_3_st_da_ppfu_va),
    .st_da_ppn_ff(ct_lsu_pfu_pfb_entry_3_st_da_ppn_ff),
    .pfu_pfb_entry_biu_pe_req_src_v(ct_lsu_pfu_pfb_entry_3_pfu_pfb_entry_biu_pe_req_src_v),
    .pfu_pfb_entry_biu_pe_req_x(ct_lsu_pfu_pfb_entry_3_pfu_pfb_entry_biu_pe_req_x),
    .pfu_pfb_entry_evict_x(ct_lsu_pfu_pfb_entry_3_pfu_pfb_entry_evict_x),
    .pfu_pfb_entry_hit_pc_x(ct_lsu_pfu_pfb_entry_3_pfu_pfb_entry_hit_pc_x),
    .pfu_pfb_entry_l1_page_sec_x(ct_lsu_pfu_pfb_entry_3_pfu_pfb_entry_l1_page_sec_x),
    .pfu_pfb_entry_l1_page_share_x(ct_lsu_pfu_pfb_entry_3_pfu_pfb_entry_l1_page_share_x),
    .pfu_pfb_entry_l1_pf_addr_v(ct_lsu_pfu_pfb_entry_3_pfu_pfb_entry_l1_pf_addr_v),
    .pfu_pfb_entry_l1_vpn_v(ct_lsu_pfu_pfb_entry_3_pfu_pfb_entry_l1_vpn_v),
    .pfu_pfb_entry_l2_page_sec_x(ct_lsu_pfu_pfb_entry_3_pfu_pfb_entry_l2_page_sec_x),
    .pfu_pfb_entry_l2_page_share_x(ct_lsu_pfu_pfb_entry_3_pfu_pfb_entry_l2_page_share_x),
    .pfu_pfb_entry_l2_pf_addr_v(ct_lsu_pfu_pfb_entry_3_pfu_pfb_entry_l2_pf_addr_v),
    .pfu_pfb_entry_l2_vpn_v(ct_lsu_pfu_pfb_entry_3_pfu_pfb_entry_l2_vpn_v),
    .pfu_pfb_entry_mmu_pe_req_src_v(ct_lsu_pfu_pfb_entry_3_pfu_pfb_entry_mmu_pe_req_src_v),
    .pfu_pfb_entry_mmu_pe_req_x(ct_lsu_pfu_pfb_entry_3_pfu_pfb_entry_mmu_pe_req_x),
    .pfu_pfb_entry_priv_mode_v(ct_lsu_pfu_pfb_entry_3_pfu_pfb_entry_priv_mode_v),
    .pfu_pfb_entry_vld_x(ct_lsu_pfu_pfb_entry_3_pfu_pfb_entry_vld_x)
  );
  ct_lsu_pfu_pfb_entry ct_lsu_pfu_pfb_entry_4 ( // @[pfu.scala 526:11]
    .amr_wa_cancel(ct_lsu_pfu_pfb_entry_4_amr_wa_cancel),
    .cp0_lsu_icg_en(ct_lsu_pfu_pfb_entry_4_cp0_lsu_icg_en),
    .cp0_lsu_l2_st_pref_en(ct_lsu_pfu_pfb_entry_4_cp0_lsu_l2_st_pref_en),
    .cp0_lsu_pfu_mmu_dis(ct_lsu_pfu_pfb_entry_4_cp0_lsu_pfu_mmu_dis),
    .cp0_yy_clk_en(ct_lsu_pfu_pfb_entry_4_cp0_yy_clk_en),
    .cp0_yy_priv_mode(ct_lsu_pfu_pfb_entry_4_cp0_yy_priv_mode),
    .cpurst_b(ct_lsu_pfu_pfb_entry_4_cpurst_b),
    .ld_da_ldfifo_pc(ct_lsu_pfu_pfb_entry_4_ld_da_ldfifo_pc),
    .ld_da_page_sec_ff(ct_lsu_pfu_pfb_entry_4_ld_da_page_sec_ff),
    .ld_da_page_share_ff(ct_lsu_pfu_pfb_entry_4_ld_da_page_share_ff),
    .ld_da_pfu_act_dp_vld(ct_lsu_pfu_pfb_entry_4_ld_da_pfu_act_dp_vld),
    .ld_da_pfu_act_vld(ct_lsu_pfu_pfb_entry_4_ld_da_pfu_act_vld),
    .ld_da_pfu_evict_cnt_vld(ct_lsu_pfu_pfb_entry_4_ld_da_pfu_evict_cnt_vld),
    .ld_da_pfu_pf_inst_vld(ct_lsu_pfu_pfb_entry_4_ld_da_pfu_pf_inst_vld),
    .ld_da_ppfu_va(ct_lsu_pfu_pfb_entry_4_ld_da_ppfu_va),
    .ld_da_ppn_ff(ct_lsu_pfu_pfb_entry_4_ld_da_ppn_ff),
    .lsu_pfu_l1_dist_sel(ct_lsu_pfu_pfb_entry_4_lsu_pfu_l1_dist_sel),
    .lsu_pfu_l2_dist_sel(ct_lsu_pfu_pfb_entry_4_lsu_pfu_l2_dist_sel),
    .lsu_special_clk(ct_lsu_pfu_pfb_entry_4_lsu_special_clk),
    .pad_yy_icg_scan_en(ct_lsu_pfu_pfb_entry_4_pad_yy_icg_scan_en),
    .pfb_no_req_cnt_val(ct_lsu_pfu_pfb_entry_4_pfb_no_req_cnt_val),
    .pfb_timeout_cnt_val(ct_lsu_pfu_pfb_entry_4_pfb_timeout_cnt_val),
    .pfu_biu_pe_req_sel_l1(ct_lsu_pfu_pfb_entry_4_pfu_biu_pe_req_sel_l1),
    .pfu_dcache_pref_en(ct_lsu_pfu_pfb_entry_4_pfu_dcache_pref_en),
    .pfu_get_page_sec(ct_lsu_pfu_pfb_entry_4_pfu_get_page_sec),
    .pfu_get_page_share(ct_lsu_pfu_pfb_entry_4_pfu_get_page_share),
    .pfu_get_ppn(ct_lsu_pfu_pfb_entry_4_pfu_get_ppn),
    .pfu_get_ppn_err(ct_lsu_pfu_pfb_entry_4_pfu_get_ppn_err),
    .pfu_get_ppn_vld(ct_lsu_pfu_pfb_entry_4_pfu_get_ppn_vld),
    .pfu_l2_pref_en(ct_lsu_pfu_pfb_entry_4_pfu_l2_pref_en),
    .pfu_mmu_pe_req_sel_l1(ct_lsu_pfu_pfb_entry_4_pfu_mmu_pe_req_sel_l1),
    .pfu_pfb_create_pc(ct_lsu_pfu_pfb_entry_4_pfu_pfb_create_pc),
    .pfu_pfb_create_stride(ct_lsu_pfu_pfb_entry_4_pfu_pfb_create_stride),
    .pfu_pfb_create_stride_neg(ct_lsu_pfu_pfb_entry_4_pfu_pfb_create_stride_neg),
    .pfu_pfb_create_strideh_6to0(ct_lsu_pfu_pfb_entry_4_pfu_pfb_create_strideh_6to0),
    .pfu_pfb_create_type_ld(ct_lsu_pfu_pfb_entry_4_pfu_pfb_create_type_ld),
    .pfu_pfb_entry_biu_pe_req_grnt_x(ct_lsu_pfu_pfb_entry_4_pfu_pfb_entry_biu_pe_req_grnt_x),
    .pfu_pfb_entry_create_dp_vld_x(ct_lsu_pfu_pfb_entry_4_pfu_pfb_entry_create_dp_vld_x),
    .pfu_pfb_entry_create_gateclk_en_x(ct_lsu_pfu_pfb_entry_4_pfu_pfb_entry_create_gateclk_en_x),
    .pfu_pfb_entry_create_vld_x(ct_lsu_pfu_pfb_entry_4_pfu_pfb_entry_create_vld_x),
    .pfu_pfb_entry_from_lfb_dcache_hit_x(ct_lsu_pfu_pfb_entry_4_pfu_pfb_entry_from_lfb_dcache_hit_x),
    .pfu_pfb_entry_from_lfb_dcache_miss_x(ct_lsu_pfu_pfb_entry_4_pfu_pfb_entry_from_lfb_dcache_miss_x),
    .pfu_pfb_entry_mmu_pe_req_grnt_x(ct_lsu_pfu_pfb_entry_4_pfu_pfb_entry_mmu_pe_req_grnt_x),
    .pfu_pop_all_part_vld(ct_lsu_pfu_pfb_entry_4_pfu_pop_all_part_vld),
    .st_da_page_sec_ff(ct_lsu_pfu_pfb_entry_4_st_da_page_sec_ff),
    .st_da_page_share_ff(ct_lsu_pfu_pfb_entry_4_st_da_page_share_ff),
    .st_da_pc(ct_lsu_pfu_pfb_entry_4_st_da_pc),
    .st_da_pfu_act_vld(ct_lsu_pfu_pfb_entry_4_st_da_pfu_act_vld),
    .st_da_pfu_evict_cnt_vld(ct_lsu_pfu_pfb_entry_4_st_da_pfu_evict_cnt_vld),
    .st_da_pfu_pf_inst_vld(ct_lsu_pfu_pfb_entry_4_st_da_pfu_pf_inst_vld),
    .st_da_ppfu_va(ct_lsu_pfu_pfb_entry_4_st_da_ppfu_va),
    .st_da_ppn_ff(ct_lsu_pfu_pfb_entry_4_st_da_ppn_ff),
    .pfu_pfb_entry_biu_pe_req_src_v(ct_lsu_pfu_pfb_entry_4_pfu_pfb_entry_biu_pe_req_src_v),
    .pfu_pfb_entry_biu_pe_req_x(ct_lsu_pfu_pfb_entry_4_pfu_pfb_entry_biu_pe_req_x),
    .pfu_pfb_entry_evict_x(ct_lsu_pfu_pfb_entry_4_pfu_pfb_entry_evict_x),
    .pfu_pfb_entry_hit_pc_x(ct_lsu_pfu_pfb_entry_4_pfu_pfb_entry_hit_pc_x),
    .pfu_pfb_entry_l1_page_sec_x(ct_lsu_pfu_pfb_entry_4_pfu_pfb_entry_l1_page_sec_x),
    .pfu_pfb_entry_l1_page_share_x(ct_lsu_pfu_pfb_entry_4_pfu_pfb_entry_l1_page_share_x),
    .pfu_pfb_entry_l1_pf_addr_v(ct_lsu_pfu_pfb_entry_4_pfu_pfb_entry_l1_pf_addr_v),
    .pfu_pfb_entry_l1_vpn_v(ct_lsu_pfu_pfb_entry_4_pfu_pfb_entry_l1_vpn_v),
    .pfu_pfb_entry_l2_page_sec_x(ct_lsu_pfu_pfb_entry_4_pfu_pfb_entry_l2_page_sec_x),
    .pfu_pfb_entry_l2_page_share_x(ct_lsu_pfu_pfb_entry_4_pfu_pfb_entry_l2_page_share_x),
    .pfu_pfb_entry_l2_pf_addr_v(ct_lsu_pfu_pfb_entry_4_pfu_pfb_entry_l2_pf_addr_v),
    .pfu_pfb_entry_l2_vpn_v(ct_lsu_pfu_pfb_entry_4_pfu_pfb_entry_l2_vpn_v),
    .pfu_pfb_entry_mmu_pe_req_src_v(ct_lsu_pfu_pfb_entry_4_pfu_pfb_entry_mmu_pe_req_src_v),
    .pfu_pfb_entry_mmu_pe_req_x(ct_lsu_pfu_pfb_entry_4_pfu_pfb_entry_mmu_pe_req_x),
    .pfu_pfb_entry_priv_mode_v(ct_lsu_pfu_pfb_entry_4_pfu_pfb_entry_priv_mode_v),
    .pfu_pfb_entry_vld_x(ct_lsu_pfu_pfb_entry_4_pfu_pfb_entry_vld_x)
  );
  ct_lsu_pfu_pfb_entry ct_lsu_pfu_pfb_entry_5 ( // @[pfu.scala 527:11]
    .amr_wa_cancel(ct_lsu_pfu_pfb_entry_5_amr_wa_cancel),
    .cp0_lsu_icg_en(ct_lsu_pfu_pfb_entry_5_cp0_lsu_icg_en),
    .cp0_lsu_l2_st_pref_en(ct_lsu_pfu_pfb_entry_5_cp0_lsu_l2_st_pref_en),
    .cp0_lsu_pfu_mmu_dis(ct_lsu_pfu_pfb_entry_5_cp0_lsu_pfu_mmu_dis),
    .cp0_yy_clk_en(ct_lsu_pfu_pfb_entry_5_cp0_yy_clk_en),
    .cp0_yy_priv_mode(ct_lsu_pfu_pfb_entry_5_cp0_yy_priv_mode),
    .cpurst_b(ct_lsu_pfu_pfb_entry_5_cpurst_b),
    .ld_da_ldfifo_pc(ct_lsu_pfu_pfb_entry_5_ld_da_ldfifo_pc),
    .ld_da_page_sec_ff(ct_lsu_pfu_pfb_entry_5_ld_da_page_sec_ff),
    .ld_da_page_share_ff(ct_lsu_pfu_pfb_entry_5_ld_da_page_share_ff),
    .ld_da_pfu_act_dp_vld(ct_lsu_pfu_pfb_entry_5_ld_da_pfu_act_dp_vld),
    .ld_da_pfu_act_vld(ct_lsu_pfu_pfb_entry_5_ld_da_pfu_act_vld),
    .ld_da_pfu_evict_cnt_vld(ct_lsu_pfu_pfb_entry_5_ld_da_pfu_evict_cnt_vld),
    .ld_da_pfu_pf_inst_vld(ct_lsu_pfu_pfb_entry_5_ld_da_pfu_pf_inst_vld),
    .ld_da_ppfu_va(ct_lsu_pfu_pfb_entry_5_ld_da_ppfu_va),
    .ld_da_ppn_ff(ct_lsu_pfu_pfb_entry_5_ld_da_ppn_ff),
    .lsu_pfu_l1_dist_sel(ct_lsu_pfu_pfb_entry_5_lsu_pfu_l1_dist_sel),
    .lsu_pfu_l2_dist_sel(ct_lsu_pfu_pfb_entry_5_lsu_pfu_l2_dist_sel),
    .lsu_special_clk(ct_lsu_pfu_pfb_entry_5_lsu_special_clk),
    .pad_yy_icg_scan_en(ct_lsu_pfu_pfb_entry_5_pad_yy_icg_scan_en),
    .pfb_no_req_cnt_val(ct_lsu_pfu_pfb_entry_5_pfb_no_req_cnt_val),
    .pfb_timeout_cnt_val(ct_lsu_pfu_pfb_entry_5_pfb_timeout_cnt_val),
    .pfu_biu_pe_req_sel_l1(ct_lsu_pfu_pfb_entry_5_pfu_biu_pe_req_sel_l1),
    .pfu_dcache_pref_en(ct_lsu_pfu_pfb_entry_5_pfu_dcache_pref_en),
    .pfu_get_page_sec(ct_lsu_pfu_pfb_entry_5_pfu_get_page_sec),
    .pfu_get_page_share(ct_lsu_pfu_pfb_entry_5_pfu_get_page_share),
    .pfu_get_ppn(ct_lsu_pfu_pfb_entry_5_pfu_get_ppn),
    .pfu_get_ppn_err(ct_lsu_pfu_pfb_entry_5_pfu_get_ppn_err),
    .pfu_get_ppn_vld(ct_lsu_pfu_pfb_entry_5_pfu_get_ppn_vld),
    .pfu_l2_pref_en(ct_lsu_pfu_pfb_entry_5_pfu_l2_pref_en),
    .pfu_mmu_pe_req_sel_l1(ct_lsu_pfu_pfb_entry_5_pfu_mmu_pe_req_sel_l1),
    .pfu_pfb_create_pc(ct_lsu_pfu_pfb_entry_5_pfu_pfb_create_pc),
    .pfu_pfb_create_stride(ct_lsu_pfu_pfb_entry_5_pfu_pfb_create_stride),
    .pfu_pfb_create_stride_neg(ct_lsu_pfu_pfb_entry_5_pfu_pfb_create_stride_neg),
    .pfu_pfb_create_strideh_6to0(ct_lsu_pfu_pfb_entry_5_pfu_pfb_create_strideh_6to0),
    .pfu_pfb_create_type_ld(ct_lsu_pfu_pfb_entry_5_pfu_pfb_create_type_ld),
    .pfu_pfb_entry_biu_pe_req_grnt_x(ct_lsu_pfu_pfb_entry_5_pfu_pfb_entry_biu_pe_req_grnt_x),
    .pfu_pfb_entry_create_dp_vld_x(ct_lsu_pfu_pfb_entry_5_pfu_pfb_entry_create_dp_vld_x),
    .pfu_pfb_entry_create_gateclk_en_x(ct_lsu_pfu_pfb_entry_5_pfu_pfb_entry_create_gateclk_en_x),
    .pfu_pfb_entry_create_vld_x(ct_lsu_pfu_pfb_entry_5_pfu_pfb_entry_create_vld_x),
    .pfu_pfb_entry_from_lfb_dcache_hit_x(ct_lsu_pfu_pfb_entry_5_pfu_pfb_entry_from_lfb_dcache_hit_x),
    .pfu_pfb_entry_from_lfb_dcache_miss_x(ct_lsu_pfu_pfb_entry_5_pfu_pfb_entry_from_lfb_dcache_miss_x),
    .pfu_pfb_entry_mmu_pe_req_grnt_x(ct_lsu_pfu_pfb_entry_5_pfu_pfb_entry_mmu_pe_req_grnt_x),
    .pfu_pop_all_part_vld(ct_lsu_pfu_pfb_entry_5_pfu_pop_all_part_vld),
    .st_da_page_sec_ff(ct_lsu_pfu_pfb_entry_5_st_da_page_sec_ff),
    .st_da_page_share_ff(ct_lsu_pfu_pfb_entry_5_st_da_page_share_ff),
    .st_da_pc(ct_lsu_pfu_pfb_entry_5_st_da_pc),
    .st_da_pfu_act_vld(ct_lsu_pfu_pfb_entry_5_st_da_pfu_act_vld),
    .st_da_pfu_evict_cnt_vld(ct_lsu_pfu_pfb_entry_5_st_da_pfu_evict_cnt_vld),
    .st_da_pfu_pf_inst_vld(ct_lsu_pfu_pfb_entry_5_st_da_pfu_pf_inst_vld),
    .st_da_ppfu_va(ct_lsu_pfu_pfb_entry_5_st_da_ppfu_va),
    .st_da_ppn_ff(ct_lsu_pfu_pfb_entry_5_st_da_ppn_ff),
    .pfu_pfb_entry_biu_pe_req_src_v(ct_lsu_pfu_pfb_entry_5_pfu_pfb_entry_biu_pe_req_src_v),
    .pfu_pfb_entry_biu_pe_req_x(ct_lsu_pfu_pfb_entry_5_pfu_pfb_entry_biu_pe_req_x),
    .pfu_pfb_entry_evict_x(ct_lsu_pfu_pfb_entry_5_pfu_pfb_entry_evict_x),
    .pfu_pfb_entry_hit_pc_x(ct_lsu_pfu_pfb_entry_5_pfu_pfb_entry_hit_pc_x),
    .pfu_pfb_entry_l1_page_sec_x(ct_lsu_pfu_pfb_entry_5_pfu_pfb_entry_l1_page_sec_x),
    .pfu_pfb_entry_l1_page_share_x(ct_lsu_pfu_pfb_entry_5_pfu_pfb_entry_l1_page_share_x),
    .pfu_pfb_entry_l1_pf_addr_v(ct_lsu_pfu_pfb_entry_5_pfu_pfb_entry_l1_pf_addr_v),
    .pfu_pfb_entry_l1_vpn_v(ct_lsu_pfu_pfb_entry_5_pfu_pfb_entry_l1_vpn_v),
    .pfu_pfb_entry_l2_page_sec_x(ct_lsu_pfu_pfb_entry_5_pfu_pfb_entry_l2_page_sec_x),
    .pfu_pfb_entry_l2_page_share_x(ct_lsu_pfu_pfb_entry_5_pfu_pfb_entry_l2_page_share_x),
    .pfu_pfb_entry_l2_pf_addr_v(ct_lsu_pfu_pfb_entry_5_pfu_pfb_entry_l2_pf_addr_v),
    .pfu_pfb_entry_l2_vpn_v(ct_lsu_pfu_pfb_entry_5_pfu_pfb_entry_l2_vpn_v),
    .pfu_pfb_entry_mmu_pe_req_src_v(ct_lsu_pfu_pfb_entry_5_pfu_pfb_entry_mmu_pe_req_src_v),
    .pfu_pfb_entry_mmu_pe_req_x(ct_lsu_pfu_pfb_entry_5_pfu_pfb_entry_mmu_pe_req_x),
    .pfu_pfb_entry_priv_mode_v(ct_lsu_pfu_pfb_entry_5_pfu_pfb_entry_priv_mode_v),
    .pfu_pfb_entry_vld_x(ct_lsu_pfu_pfb_entry_5_pfu_pfb_entry_vld_x)
  );
  ct_lsu_pfu_pfb_entry ct_lsu_pfu_pfb_entry_6 ( // @[pfu.scala 528:11]
    .amr_wa_cancel(ct_lsu_pfu_pfb_entry_6_amr_wa_cancel),
    .cp0_lsu_icg_en(ct_lsu_pfu_pfb_entry_6_cp0_lsu_icg_en),
    .cp0_lsu_l2_st_pref_en(ct_lsu_pfu_pfb_entry_6_cp0_lsu_l2_st_pref_en),
    .cp0_lsu_pfu_mmu_dis(ct_lsu_pfu_pfb_entry_6_cp0_lsu_pfu_mmu_dis),
    .cp0_yy_clk_en(ct_lsu_pfu_pfb_entry_6_cp0_yy_clk_en),
    .cp0_yy_priv_mode(ct_lsu_pfu_pfb_entry_6_cp0_yy_priv_mode),
    .cpurst_b(ct_lsu_pfu_pfb_entry_6_cpurst_b),
    .ld_da_ldfifo_pc(ct_lsu_pfu_pfb_entry_6_ld_da_ldfifo_pc),
    .ld_da_page_sec_ff(ct_lsu_pfu_pfb_entry_6_ld_da_page_sec_ff),
    .ld_da_page_share_ff(ct_lsu_pfu_pfb_entry_6_ld_da_page_share_ff),
    .ld_da_pfu_act_dp_vld(ct_lsu_pfu_pfb_entry_6_ld_da_pfu_act_dp_vld),
    .ld_da_pfu_act_vld(ct_lsu_pfu_pfb_entry_6_ld_da_pfu_act_vld),
    .ld_da_pfu_evict_cnt_vld(ct_lsu_pfu_pfb_entry_6_ld_da_pfu_evict_cnt_vld),
    .ld_da_pfu_pf_inst_vld(ct_lsu_pfu_pfb_entry_6_ld_da_pfu_pf_inst_vld),
    .ld_da_ppfu_va(ct_lsu_pfu_pfb_entry_6_ld_da_ppfu_va),
    .ld_da_ppn_ff(ct_lsu_pfu_pfb_entry_6_ld_da_ppn_ff),
    .lsu_pfu_l1_dist_sel(ct_lsu_pfu_pfb_entry_6_lsu_pfu_l1_dist_sel),
    .lsu_pfu_l2_dist_sel(ct_lsu_pfu_pfb_entry_6_lsu_pfu_l2_dist_sel),
    .lsu_special_clk(ct_lsu_pfu_pfb_entry_6_lsu_special_clk),
    .pad_yy_icg_scan_en(ct_lsu_pfu_pfb_entry_6_pad_yy_icg_scan_en),
    .pfb_no_req_cnt_val(ct_lsu_pfu_pfb_entry_6_pfb_no_req_cnt_val),
    .pfb_timeout_cnt_val(ct_lsu_pfu_pfb_entry_6_pfb_timeout_cnt_val),
    .pfu_biu_pe_req_sel_l1(ct_lsu_pfu_pfb_entry_6_pfu_biu_pe_req_sel_l1),
    .pfu_dcache_pref_en(ct_lsu_pfu_pfb_entry_6_pfu_dcache_pref_en),
    .pfu_get_page_sec(ct_lsu_pfu_pfb_entry_6_pfu_get_page_sec),
    .pfu_get_page_share(ct_lsu_pfu_pfb_entry_6_pfu_get_page_share),
    .pfu_get_ppn(ct_lsu_pfu_pfb_entry_6_pfu_get_ppn),
    .pfu_get_ppn_err(ct_lsu_pfu_pfb_entry_6_pfu_get_ppn_err),
    .pfu_get_ppn_vld(ct_lsu_pfu_pfb_entry_6_pfu_get_ppn_vld),
    .pfu_l2_pref_en(ct_lsu_pfu_pfb_entry_6_pfu_l2_pref_en),
    .pfu_mmu_pe_req_sel_l1(ct_lsu_pfu_pfb_entry_6_pfu_mmu_pe_req_sel_l1),
    .pfu_pfb_create_pc(ct_lsu_pfu_pfb_entry_6_pfu_pfb_create_pc),
    .pfu_pfb_create_stride(ct_lsu_pfu_pfb_entry_6_pfu_pfb_create_stride),
    .pfu_pfb_create_stride_neg(ct_lsu_pfu_pfb_entry_6_pfu_pfb_create_stride_neg),
    .pfu_pfb_create_strideh_6to0(ct_lsu_pfu_pfb_entry_6_pfu_pfb_create_strideh_6to0),
    .pfu_pfb_create_type_ld(ct_lsu_pfu_pfb_entry_6_pfu_pfb_create_type_ld),
    .pfu_pfb_entry_biu_pe_req_grnt_x(ct_lsu_pfu_pfb_entry_6_pfu_pfb_entry_biu_pe_req_grnt_x),
    .pfu_pfb_entry_create_dp_vld_x(ct_lsu_pfu_pfb_entry_6_pfu_pfb_entry_create_dp_vld_x),
    .pfu_pfb_entry_create_gateclk_en_x(ct_lsu_pfu_pfb_entry_6_pfu_pfb_entry_create_gateclk_en_x),
    .pfu_pfb_entry_create_vld_x(ct_lsu_pfu_pfb_entry_6_pfu_pfb_entry_create_vld_x),
    .pfu_pfb_entry_from_lfb_dcache_hit_x(ct_lsu_pfu_pfb_entry_6_pfu_pfb_entry_from_lfb_dcache_hit_x),
    .pfu_pfb_entry_from_lfb_dcache_miss_x(ct_lsu_pfu_pfb_entry_6_pfu_pfb_entry_from_lfb_dcache_miss_x),
    .pfu_pfb_entry_mmu_pe_req_grnt_x(ct_lsu_pfu_pfb_entry_6_pfu_pfb_entry_mmu_pe_req_grnt_x),
    .pfu_pop_all_part_vld(ct_lsu_pfu_pfb_entry_6_pfu_pop_all_part_vld),
    .st_da_page_sec_ff(ct_lsu_pfu_pfb_entry_6_st_da_page_sec_ff),
    .st_da_page_share_ff(ct_lsu_pfu_pfb_entry_6_st_da_page_share_ff),
    .st_da_pc(ct_lsu_pfu_pfb_entry_6_st_da_pc),
    .st_da_pfu_act_vld(ct_lsu_pfu_pfb_entry_6_st_da_pfu_act_vld),
    .st_da_pfu_evict_cnt_vld(ct_lsu_pfu_pfb_entry_6_st_da_pfu_evict_cnt_vld),
    .st_da_pfu_pf_inst_vld(ct_lsu_pfu_pfb_entry_6_st_da_pfu_pf_inst_vld),
    .st_da_ppfu_va(ct_lsu_pfu_pfb_entry_6_st_da_ppfu_va),
    .st_da_ppn_ff(ct_lsu_pfu_pfb_entry_6_st_da_ppn_ff),
    .pfu_pfb_entry_biu_pe_req_src_v(ct_lsu_pfu_pfb_entry_6_pfu_pfb_entry_biu_pe_req_src_v),
    .pfu_pfb_entry_biu_pe_req_x(ct_lsu_pfu_pfb_entry_6_pfu_pfb_entry_biu_pe_req_x),
    .pfu_pfb_entry_evict_x(ct_lsu_pfu_pfb_entry_6_pfu_pfb_entry_evict_x),
    .pfu_pfb_entry_hit_pc_x(ct_lsu_pfu_pfb_entry_6_pfu_pfb_entry_hit_pc_x),
    .pfu_pfb_entry_l1_page_sec_x(ct_lsu_pfu_pfb_entry_6_pfu_pfb_entry_l1_page_sec_x),
    .pfu_pfb_entry_l1_page_share_x(ct_lsu_pfu_pfb_entry_6_pfu_pfb_entry_l1_page_share_x),
    .pfu_pfb_entry_l1_pf_addr_v(ct_lsu_pfu_pfb_entry_6_pfu_pfb_entry_l1_pf_addr_v),
    .pfu_pfb_entry_l1_vpn_v(ct_lsu_pfu_pfb_entry_6_pfu_pfb_entry_l1_vpn_v),
    .pfu_pfb_entry_l2_page_sec_x(ct_lsu_pfu_pfb_entry_6_pfu_pfb_entry_l2_page_sec_x),
    .pfu_pfb_entry_l2_page_share_x(ct_lsu_pfu_pfb_entry_6_pfu_pfb_entry_l2_page_share_x),
    .pfu_pfb_entry_l2_pf_addr_v(ct_lsu_pfu_pfb_entry_6_pfu_pfb_entry_l2_pf_addr_v),
    .pfu_pfb_entry_l2_vpn_v(ct_lsu_pfu_pfb_entry_6_pfu_pfb_entry_l2_vpn_v),
    .pfu_pfb_entry_mmu_pe_req_src_v(ct_lsu_pfu_pfb_entry_6_pfu_pfb_entry_mmu_pe_req_src_v),
    .pfu_pfb_entry_mmu_pe_req_x(ct_lsu_pfu_pfb_entry_6_pfu_pfb_entry_mmu_pe_req_x),
    .pfu_pfb_entry_priv_mode_v(ct_lsu_pfu_pfb_entry_6_pfu_pfb_entry_priv_mode_v),
    .pfu_pfb_entry_vld_x(ct_lsu_pfu_pfb_entry_6_pfu_pfb_entry_vld_x)
  );
  ct_lsu_pfu_pfb_entry ct_lsu_pfu_pfb_entry_7 ( // @[pfu.scala 529:11]
    .amr_wa_cancel(ct_lsu_pfu_pfb_entry_7_amr_wa_cancel),
    .cp0_lsu_icg_en(ct_lsu_pfu_pfb_entry_7_cp0_lsu_icg_en),
    .cp0_lsu_l2_st_pref_en(ct_lsu_pfu_pfb_entry_7_cp0_lsu_l2_st_pref_en),
    .cp0_lsu_pfu_mmu_dis(ct_lsu_pfu_pfb_entry_7_cp0_lsu_pfu_mmu_dis),
    .cp0_yy_clk_en(ct_lsu_pfu_pfb_entry_7_cp0_yy_clk_en),
    .cp0_yy_priv_mode(ct_lsu_pfu_pfb_entry_7_cp0_yy_priv_mode),
    .cpurst_b(ct_lsu_pfu_pfb_entry_7_cpurst_b),
    .ld_da_ldfifo_pc(ct_lsu_pfu_pfb_entry_7_ld_da_ldfifo_pc),
    .ld_da_page_sec_ff(ct_lsu_pfu_pfb_entry_7_ld_da_page_sec_ff),
    .ld_da_page_share_ff(ct_lsu_pfu_pfb_entry_7_ld_da_page_share_ff),
    .ld_da_pfu_act_dp_vld(ct_lsu_pfu_pfb_entry_7_ld_da_pfu_act_dp_vld),
    .ld_da_pfu_act_vld(ct_lsu_pfu_pfb_entry_7_ld_da_pfu_act_vld),
    .ld_da_pfu_evict_cnt_vld(ct_lsu_pfu_pfb_entry_7_ld_da_pfu_evict_cnt_vld),
    .ld_da_pfu_pf_inst_vld(ct_lsu_pfu_pfb_entry_7_ld_da_pfu_pf_inst_vld),
    .ld_da_ppfu_va(ct_lsu_pfu_pfb_entry_7_ld_da_ppfu_va),
    .ld_da_ppn_ff(ct_lsu_pfu_pfb_entry_7_ld_da_ppn_ff),
    .lsu_pfu_l1_dist_sel(ct_lsu_pfu_pfb_entry_7_lsu_pfu_l1_dist_sel),
    .lsu_pfu_l2_dist_sel(ct_lsu_pfu_pfb_entry_7_lsu_pfu_l2_dist_sel),
    .lsu_special_clk(ct_lsu_pfu_pfb_entry_7_lsu_special_clk),
    .pad_yy_icg_scan_en(ct_lsu_pfu_pfb_entry_7_pad_yy_icg_scan_en),
    .pfb_no_req_cnt_val(ct_lsu_pfu_pfb_entry_7_pfb_no_req_cnt_val),
    .pfb_timeout_cnt_val(ct_lsu_pfu_pfb_entry_7_pfb_timeout_cnt_val),
    .pfu_biu_pe_req_sel_l1(ct_lsu_pfu_pfb_entry_7_pfu_biu_pe_req_sel_l1),
    .pfu_dcache_pref_en(ct_lsu_pfu_pfb_entry_7_pfu_dcache_pref_en),
    .pfu_get_page_sec(ct_lsu_pfu_pfb_entry_7_pfu_get_page_sec),
    .pfu_get_page_share(ct_lsu_pfu_pfb_entry_7_pfu_get_page_share),
    .pfu_get_ppn(ct_lsu_pfu_pfb_entry_7_pfu_get_ppn),
    .pfu_get_ppn_err(ct_lsu_pfu_pfb_entry_7_pfu_get_ppn_err),
    .pfu_get_ppn_vld(ct_lsu_pfu_pfb_entry_7_pfu_get_ppn_vld),
    .pfu_l2_pref_en(ct_lsu_pfu_pfb_entry_7_pfu_l2_pref_en),
    .pfu_mmu_pe_req_sel_l1(ct_lsu_pfu_pfb_entry_7_pfu_mmu_pe_req_sel_l1),
    .pfu_pfb_create_pc(ct_lsu_pfu_pfb_entry_7_pfu_pfb_create_pc),
    .pfu_pfb_create_stride(ct_lsu_pfu_pfb_entry_7_pfu_pfb_create_stride),
    .pfu_pfb_create_stride_neg(ct_lsu_pfu_pfb_entry_7_pfu_pfb_create_stride_neg),
    .pfu_pfb_create_strideh_6to0(ct_lsu_pfu_pfb_entry_7_pfu_pfb_create_strideh_6to0),
    .pfu_pfb_create_type_ld(ct_lsu_pfu_pfb_entry_7_pfu_pfb_create_type_ld),
    .pfu_pfb_entry_biu_pe_req_grnt_x(ct_lsu_pfu_pfb_entry_7_pfu_pfb_entry_biu_pe_req_grnt_x),
    .pfu_pfb_entry_create_dp_vld_x(ct_lsu_pfu_pfb_entry_7_pfu_pfb_entry_create_dp_vld_x),
    .pfu_pfb_entry_create_gateclk_en_x(ct_lsu_pfu_pfb_entry_7_pfu_pfb_entry_create_gateclk_en_x),
    .pfu_pfb_entry_create_vld_x(ct_lsu_pfu_pfb_entry_7_pfu_pfb_entry_create_vld_x),
    .pfu_pfb_entry_from_lfb_dcache_hit_x(ct_lsu_pfu_pfb_entry_7_pfu_pfb_entry_from_lfb_dcache_hit_x),
    .pfu_pfb_entry_from_lfb_dcache_miss_x(ct_lsu_pfu_pfb_entry_7_pfu_pfb_entry_from_lfb_dcache_miss_x),
    .pfu_pfb_entry_mmu_pe_req_grnt_x(ct_lsu_pfu_pfb_entry_7_pfu_pfb_entry_mmu_pe_req_grnt_x),
    .pfu_pop_all_part_vld(ct_lsu_pfu_pfb_entry_7_pfu_pop_all_part_vld),
    .st_da_page_sec_ff(ct_lsu_pfu_pfb_entry_7_st_da_page_sec_ff),
    .st_da_page_share_ff(ct_lsu_pfu_pfb_entry_7_st_da_page_share_ff),
    .st_da_pc(ct_lsu_pfu_pfb_entry_7_st_da_pc),
    .st_da_pfu_act_vld(ct_lsu_pfu_pfb_entry_7_st_da_pfu_act_vld),
    .st_da_pfu_evict_cnt_vld(ct_lsu_pfu_pfb_entry_7_st_da_pfu_evict_cnt_vld),
    .st_da_pfu_pf_inst_vld(ct_lsu_pfu_pfb_entry_7_st_da_pfu_pf_inst_vld),
    .st_da_ppfu_va(ct_lsu_pfu_pfb_entry_7_st_da_ppfu_va),
    .st_da_ppn_ff(ct_lsu_pfu_pfb_entry_7_st_da_ppn_ff),
    .pfu_pfb_entry_biu_pe_req_src_v(ct_lsu_pfu_pfb_entry_7_pfu_pfb_entry_biu_pe_req_src_v),
    .pfu_pfb_entry_biu_pe_req_x(ct_lsu_pfu_pfb_entry_7_pfu_pfb_entry_biu_pe_req_x),
    .pfu_pfb_entry_evict_x(ct_lsu_pfu_pfb_entry_7_pfu_pfb_entry_evict_x),
    .pfu_pfb_entry_hit_pc_x(ct_lsu_pfu_pfb_entry_7_pfu_pfb_entry_hit_pc_x),
    .pfu_pfb_entry_l1_page_sec_x(ct_lsu_pfu_pfb_entry_7_pfu_pfb_entry_l1_page_sec_x),
    .pfu_pfb_entry_l1_page_share_x(ct_lsu_pfu_pfb_entry_7_pfu_pfb_entry_l1_page_share_x),
    .pfu_pfb_entry_l1_pf_addr_v(ct_lsu_pfu_pfb_entry_7_pfu_pfb_entry_l1_pf_addr_v),
    .pfu_pfb_entry_l1_vpn_v(ct_lsu_pfu_pfb_entry_7_pfu_pfb_entry_l1_vpn_v),
    .pfu_pfb_entry_l2_page_sec_x(ct_lsu_pfu_pfb_entry_7_pfu_pfb_entry_l2_page_sec_x),
    .pfu_pfb_entry_l2_page_share_x(ct_lsu_pfu_pfb_entry_7_pfu_pfb_entry_l2_page_share_x),
    .pfu_pfb_entry_l2_pf_addr_v(ct_lsu_pfu_pfb_entry_7_pfu_pfb_entry_l2_pf_addr_v),
    .pfu_pfb_entry_l2_vpn_v(ct_lsu_pfu_pfb_entry_7_pfu_pfb_entry_l2_vpn_v),
    .pfu_pfb_entry_mmu_pe_req_src_v(ct_lsu_pfu_pfb_entry_7_pfu_pfb_entry_mmu_pe_req_src_v),
    .pfu_pfb_entry_mmu_pe_req_x(ct_lsu_pfu_pfb_entry_7_pfu_pfb_entry_mmu_pe_req_x),
    .pfu_pfb_entry_priv_mode_v(ct_lsu_pfu_pfb_entry_7_pfu_pfb_entry_priv_mode_v),
    .pfu_pfb_entry_vld_x(ct_lsu_pfu_pfb_entry_7_pfu_pfb_entry_vld_x)
  );
  ct_lsu_pfu_gsdb x_ct_lsu_pfu_gsdb ( // @[pfu.scala 655:33]
    .cp0_lsu_icg_en(x_ct_lsu_pfu_gsdb_cp0_lsu_icg_en),
    .cp0_yy_clk_en(x_ct_lsu_pfu_gsdb_cp0_yy_clk_en),
    .cp0_yy_dcache_pref_en(x_ct_lsu_pfu_gsdb_cp0_yy_dcache_pref_en),
    .cpurst_b(x_ct_lsu_pfu_gsdb_cpurst_b),
    .forever_cpuclk(x_ct_lsu_pfu_gsdb_forever_cpuclk),
    .ld_da_iid(x_ct_lsu_pfu_gsdb_ld_da_iid),
    .ld_da_pfu_act_vld(x_ct_lsu_pfu_gsdb_ld_da_pfu_act_vld),
    .ld_da_pfu_pf_inst_vld(x_ct_lsu_pfu_gsdb_ld_da_pfu_pf_inst_vld),
    .ld_da_pfu_va(x_ct_lsu_pfu_gsdb_ld_da_pfu_va),
    .pad_yy_icg_scan_en(x_ct_lsu_pfu_gsdb_pad_yy_icg_scan_en),
    .pfu_gpfb_vld(x_ct_lsu_pfu_gsdb_pfu_gpfb_vld),
    .pfu_pop_all_vld(x_ct_lsu_pfu_gsdb_pfu_pop_all_vld),
    .rtu_yy_xx_commit0(x_ct_lsu_pfu_gsdb_rtu_yy_xx_commit0),
    .rtu_yy_xx_commit0_iid(x_ct_lsu_pfu_gsdb_rtu_yy_xx_commit0_iid),
    .rtu_yy_xx_commit1(x_ct_lsu_pfu_gsdb_rtu_yy_xx_commit1),
    .rtu_yy_xx_commit1_iid(x_ct_lsu_pfu_gsdb_rtu_yy_xx_commit1_iid),
    .rtu_yy_xx_commit2(x_ct_lsu_pfu_gsdb_rtu_yy_xx_commit2),
    .rtu_yy_xx_commit2_iid(x_ct_lsu_pfu_gsdb_rtu_yy_xx_commit2_iid),
    .rtu_yy_xx_flush(x_ct_lsu_pfu_gsdb_rtu_yy_xx_flush),
    .pfu_gsdb_gpfb_create_vld(x_ct_lsu_pfu_gsdb_pfu_gsdb_gpfb_create_vld),
    .pfu_gsdb_gpfb_pop_req(x_ct_lsu_pfu_gsdb_pfu_gsdb_gpfb_pop_req),
    .pfu_gsdb_stride(x_ct_lsu_pfu_gsdb_pfu_gsdb_stride),
    .pfu_gsdb_stride_neg(x_ct_lsu_pfu_gsdb_pfu_gsdb_stride_neg),
    .pfu_gsdb_strideh_6to0(x_ct_lsu_pfu_gsdb_pfu_gsdb_strideh_6to0)
  );
  ct_lsu_pfu_gpfb x_ct_lsu_pfu_gpfb ( // @[pfu.scala 681:33]
    .cp0_lsu_icg_en(x_ct_lsu_pfu_gpfb_cp0_lsu_icg_en),
    .cp0_lsu_pfu_mmu_dis(x_ct_lsu_pfu_gpfb_cp0_lsu_pfu_mmu_dis),
    .cp0_yy_clk_en(x_ct_lsu_pfu_gpfb_cp0_yy_clk_en),
    .cp0_yy_priv_mode(x_ct_lsu_pfu_gpfb_cp0_yy_priv_mode),
    .cpurst_b(x_ct_lsu_pfu_gpfb_cpurst_b),
    .forever_cpuclk(x_ct_lsu_pfu_gpfb_forever_cpuclk),
    .ld_da_page_sec_ff(x_ct_lsu_pfu_gpfb_ld_da_page_sec_ff),
    .ld_da_page_share_ff(x_ct_lsu_pfu_gpfb_ld_da_page_share_ff),
    .ld_da_pfu_act_vld(x_ct_lsu_pfu_gpfb_ld_da_pfu_act_vld),
    .ld_da_pfu_pf_inst_vld(x_ct_lsu_pfu_gpfb_ld_da_pfu_pf_inst_vld),
    .ld_da_pfu_va(x_ct_lsu_pfu_gpfb_ld_da_pfu_va),
    .ld_da_ppn_ff(x_ct_lsu_pfu_gpfb_ld_da_ppn_ff),
    .lsu_pfu_l1_dist_sel(x_ct_lsu_pfu_gpfb_lsu_pfu_l1_dist_sel),
    .lsu_pfu_l2_dist_sel(x_ct_lsu_pfu_gpfb_lsu_pfu_l2_dist_sel),
    .pad_yy_icg_scan_en(x_ct_lsu_pfu_gpfb_pad_yy_icg_scan_en),
    .pfu_biu_pe_req_sel_l1(x_ct_lsu_pfu_gpfb_pfu_biu_pe_req_sel_l1),
    .pfu_dcache_pref_en(x_ct_lsu_pfu_gpfb_pfu_dcache_pref_en),
    .pfu_get_page_sec(x_ct_lsu_pfu_gpfb_pfu_get_page_sec),
    .pfu_get_page_share(x_ct_lsu_pfu_gpfb_pfu_get_page_share),
    .pfu_get_ppn(x_ct_lsu_pfu_gpfb_pfu_get_ppn),
    .pfu_get_ppn_err(x_ct_lsu_pfu_gpfb_pfu_get_ppn_err),
    .pfu_get_ppn_vld(x_ct_lsu_pfu_gpfb_pfu_get_ppn_vld),
    .pfu_gpfb_biu_pe_req_grnt(x_ct_lsu_pfu_gpfb_pfu_gpfb_biu_pe_req_grnt),
    .pfu_gpfb_from_lfb_dcache_hit(x_ct_lsu_pfu_gpfb_pfu_gpfb_from_lfb_dcache_hit),
    .pfu_gpfb_from_lfb_dcache_miss(x_ct_lsu_pfu_gpfb_pfu_gpfb_from_lfb_dcache_miss),
    .pfu_gpfb_mmu_pe_req_grnt(x_ct_lsu_pfu_gpfb_pfu_gpfb_mmu_pe_req_grnt),
    .pfu_gsdb_gpfb_create_vld(x_ct_lsu_pfu_gpfb_pfu_gsdb_gpfb_create_vld),
    .pfu_gsdb_gpfb_pop_req(x_ct_lsu_pfu_gpfb_pfu_gsdb_gpfb_pop_req),
    .pfu_gsdb_stride(x_ct_lsu_pfu_gpfb_pfu_gsdb_stride),
    .pfu_gsdb_stride_neg(x_ct_lsu_pfu_gpfb_pfu_gsdb_stride_neg),
    .pfu_gsdb_strideh_6to0(x_ct_lsu_pfu_gpfb_pfu_gsdb_strideh_6to0),
    .pfu_l2_pref_en(x_ct_lsu_pfu_gpfb_pfu_l2_pref_en),
    .pfu_mmu_pe_req_sel_l1(x_ct_lsu_pfu_gpfb_pfu_mmu_pe_req_sel_l1),
    .pfu_pop_all_vld(x_ct_lsu_pfu_gpfb_pfu_pop_all_vld),
    .pfu_gpfb_biu_pe_req(x_ct_lsu_pfu_gpfb_pfu_gpfb_biu_pe_req),
    .pfu_gpfb_biu_pe_req_src(x_ct_lsu_pfu_gpfb_pfu_gpfb_biu_pe_req_src),
    .pfu_gpfb_l1_page_sec(x_ct_lsu_pfu_gpfb_pfu_gpfb_l1_page_sec),
    .pfu_gpfb_l1_page_share(x_ct_lsu_pfu_gpfb_pfu_gpfb_l1_page_share),
    .pfu_gpfb_l1_pf_addr(x_ct_lsu_pfu_gpfb_pfu_gpfb_l1_pf_addr),
    .pfu_gpfb_l1_vpn(x_ct_lsu_pfu_gpfb_pfu_gpfb_l1_vpn),
    .pfu_gpfb_l2_page_sec(x_ct_lsu_pfu_gpfb_pfu_gpfb_l2_page_sec),
    .pfu_gpfb_l2_page_share(x_ct_lsu_pfu_gpfb_pfu_gpfb_l2_page_share),
    .pfu_gpfb_l2_pf_addr(x_ct_lsu_pfu_gpfb_pfu_gpfb_l2_pf_addr),
    .pfu_gpfb_l2_vpn(x_ct_lsu_pfu_gpfb_pfu_gpfb_l2_vpn),
    .pfu_gpfb_mmu_pe_req(x_ct_lsu_pfu_gpfb_pfu_gpfb_mmu_pe_req),
    .pfu_gpfb_mmu_pe_req_src(x_ct_lsu_pfu_gpfb_pfu_gpfb_mmu_pe_req_src),
    .pfu_gpfb_priv_mode(x_ct_lsu_pfu_gpfb_pfu_gpfb_priv_mode),
    .pfu_gpfb_vld(x_ct_lsu_pfu_gpfb_pfu_gpfb_vld)
  );
  assign lsu_mmu_va2 = pfu_mmu_req_vpn_reg; // @[pfu.scala 123:29 764:21]
  assign lsu_mmu_va2_vld = pfu_mmu_req_reg; // @[pfu.scala 120:25 743:17]
  assign pfu_biu_ar_addr = {pfu_biu_req_addr_tto6_reg,6'h0}; // @[pfu.scala 943:47]
  assign pfu_biu_ar_bar = 2'h2; // @[pfu.scala 953:21]
  assign pfu_biu_ar_burst = 2'h2; // @[pfu.scala 946:23]
  assign pfu_biu_ar_cache = 4'hf; // @[pfu.scala 948:23]
  assign pfu_biu_ar_domain = {1'h0,pfu_biu_req_page_share_reg}; // @[pfu.scala 952:31]
  assign pfu_biu_ar_dp_req = _io_pfu_biu_ar_req_T_1 & _pfu_biu_req_bus_grnt_T_4; // @[pfu.scala 937:71]
  assign pfu_biu_ar_id = pfu_biu_req_l1_reg ? lfb_pfu_create_id : 5'h19; // @[pfu.scala 941:26]
  assign pfu_biu_ar_len = 2'h3; // @[pfu.scala 944:21]
  assign pfu_biu_ar_lock = 1'h0; // @[pfu.scala 947:22]
  assign pfu_biu_ar_prot = {_io_pfu_biu_ar_prot_T,pfu_biu_req_priv_mode_reg[0]}; // @[pfu.scala 949:53]
  assign pfu_biu_ar_req = pfu_biu_req_unmask_reg & ~cp0_lsu_no_op_req & _io_pfu_biu_ar_req_T_8; // @[pfu.scala 934:68]
  assign pfu_biu_ar_req_gateclk_en = pfu_biu_req_unmask_reg; // @[pfu.scala 118:32 820:24]
  assign pfu_biu_ar_size = 3'h4; // @[pfu.scala 945:22]
  assign pfu_biu_ar_snoop = pfu_biu_req_page_share_reg ? 4'h1 : 4'h0; // @[pfu.scala 951:29]
  assign pfu_biu_ar_user = {_io_pfu_biu_ar_user_T_2,1'h0}; // @[pfu.scala 950:74]
  assign pfu_biu_req_addr = {pfu_biu_req_addr_tto6_reg,6'h0}; // @[pfu.scala 929:48]
  assign pfu_icc_ready = ~pfu_biu_req_unmask_reg; // @[pfu.scala 982:23]
  assign pfu_lfb_create_dp_vld = pfu_biu_ar_req & pfu_biu_req_l1_reg; // @[pfu.scala 962:49]
  assign pfu_lfb_create_gateclk_en = pfu_biu_req_unmask_reg & pfu_biu_req_l1_reg; // @[pfu.scala 963:54]
  assign pfu_lfb_create_req = pfu_biu_req_unmask_reg & pfu_biu_req_l1_reg; // @[pfu.scala 960:47]
  assign pfu_lfb_create_vld = pfu_biu_ar_req & pfu_biu_req_l1_reg & bus_arb_pfu_ar_ready; // @[pfu.scala 961:64]
  assign pfu_lfb_id = _io_pfu_lfb_id_T_33 | _io_pfu_lfb_id_T_26; // @[pfu.scala 957:14]
  assign pfu_part_empty = pfu_pmb_empty & pfu_sdb_empty & pfu_pfb_empty; // @[pfu.scala 983:58]
  assign pfu_pfb_empty = ~(|_pfu_pfb_full_T); // @[pfu.scala 981:23]
  assign pfu_sdb_create_gateclk_en = pfu_pmb_entry_ready_0 | pfu_pmb_entry_ready_1 | pfu_pmb_entry_ready_2 |
    pfu_pmb_entry_ready_3 | pfu_pmb_entry_ready_4 | pfu_pmb_entry_ready_5 | pfu_pmb_entry_ready_6 |
    pfu_pmb_entry_ready_7; // @[pfu.scala 509:54]
  assign pfu_sdb_empty = ~_pfu_pmb_empty_T_6; // @[pfu.scala 980:23]
  assign x_lsu_pfu_mmu_pe_gated_clk_clk_in = forever_cpuclk; // @[pfu.scala 303:40]
  assign x_lsu_pfu_mmu_pe_gated_clk_global_en = cp0_yy_clk_en; // @[pfu.scala 306:43]
  assign x_lsu_pfu_mmu_pe_gated_clk_module_en = cp0_lsu_icg_en; // @[pfu.scala 308:43]
  assign x_lsu_pfu_mmu_pe_gated_clk_local_en = 1'h0;
  assign x_lsu_pfu_mmu_pe_gated_clk_external_en = 1'h0; // @[pfu.scala 305:45]
  assign x_lsu_pfu_mmu_pe_gated_clk_pad_yy_icg_scan_en = pad_yy_icg_scan_en; // @[pfu.scala 309:52]
  assign x_lsu_pfu_biu_pe_gated_clk_clk_in = forever_cpuclk; // @[pfu.scala 315:40]
  assign x_lsu_pfu_biu_pe_gated_clk_global_en = cp0_yy_clk_en; // @[pfu.scala 318:43]
  assign x_lsu_pfu_biu_pe_gated_clk_module_en = cp0_lsu_icg_en; // @[pfu.scala 320:43]
  assign x_lsu_pfu_biu_pe_gated_clk_local_en = 1'h0;
  assign x_lsu_pfu_biu_pe_gated_clk_external_en = 1'h0; // @[pfu.scala 317:45]
  assign x_lsu_pfu_biu_pe_gated_clk_pad_yy_icg_scan_en = pad_yy_icg_scan_en; // @[pfu.scala 321:52]
  assign ct_lsu_pfu_pmb_entry_amr_wa_cancel = amr_wa_cancel; // @[pfu.scala 338:45]
  assign ct_lsu_pfu_pmb_entry_cp0_lsu_icg_en = cp0_lsu_icg_en; // @[pfu.scala 339:46]
  assign ct_lsu_pfu_pmb_entry_cp0_lsu_l2_st_pref_en = cp0_lsu_l2_st_pref_en; // @[pfu.scala 340:53]
  assign ct_lsu_pfu_pmb_entry_cp0_yy_clk_en = cp0_yy_clk_en; // @[pfu.scala 341:45]
  assign ct_lsu_pfu_pmb_entry_cpurst_b = cpurst_b; // @[pfu.scala 342:40]
  assign ct_lsu_pfu_pmb_entry_ld_da_ldfifo_pc = ld_da_ldfifo_pc; // @[pfu.scala 343:47]
  assign ct_lsu_pfu_pmb_entry_ld_da_pfu_act_dp_vld = ld_da_pfu_act_dp_vld; // @[pfu.scala 344:52]
  assign ct_lsu_pfu_pmb_entry_ld_da_pfu_evict_cnt_vld = ld_da_pfu_evict_cnt_vld; // @[pfu.scala 345:55]
  assign ct_lsu_pfu_pmb_entry_ld_da_pfu_pf_inst_vld = ld_da_pfu_pf_inst_vld; // @[pfu.scala 346:53]
  assign ct_lsu_pfu_pmb_entry_lsu_special_clk = lsu_special_clk; // @[pfu.scala 347:47]
  assign ct_lsu_pfu_pmb_entry_pad_yy_icg_scan_en = pad_yy_icg_scan_en; // @[pfu.scala 348:50]
  assign ct_lsu_pfu_pmb_entry_pfu_pmb_entry_create_dp_vld_x = pfu_pmb_entry_create_dp_vld[0]; // @[pfu.scala 349:91]
  assign ct_lsu_pfu_pmb_entry_pfu_pmb_entry_create_gateclk_en_x = pfu_pmb_entry_create_gateclk_en[0]; // @[pfu.scala 350:99]
  assign ct_lsu_pfu_pmb_entry_pfu_pmb_entry_create_vld_x = pfu_pmb_entry_create_vld[0]; // @[pfu.scala 351:85]
  assign ct_lsu_pfu_pmb_entry_pfu_pmb_entry_ready_grnt_x = pfu_pmb_entry_ready_grnt[0]; // @[pfu.scala 355:85]
  assign ct_lsu_pfu_pmb_entry_pfu_pop_all_part_vld = 1'h0;
  assign ct_lsu_pfu_pmb_entry_pipe_create_pc = 15'h0;
  assign ct_lsu_pfu_pmb_entry_pmb_timeout_cnt_val = 8'h0;
  assign ct_lsu_pfu_pmb_entry_st_da_pc = st_da_pc; // @[pfu.scala 362:40]
  assign ct_lsu_pfu_pmb_entry_st_da_pfu_evict_cnt_vld = st_da_pfu_evict_cnt_vld; // @[pfu.scala 363:55]
  assign ct_lsu_pfu_pmb_entry_st_da_pfu_pf_inst_vld = st_da_pfu_pf_inst_vld; // @[pfu.scala 364:53]
  assign ct_lsu_pfu_pmb_entry_1_amr_wa_cancel = amr_wa_cancel; // @[pfu.scala 338:45]
  assign ct_lsu_pfu_pmb_entry_1_cp0_lsu_icg_en = cp0_lsu_icg_en; // @[pfu.scala 339:46]
  assign ct_lsu_pfu_pmb_entry_1_cp0_lsu_l2_st_pref_en = cp0_lsu_l2_st_pref_en; // @[pfu.scala 340:53]
  assign ct_lsu_pfu_pmb_entry_1_cp0_yy_clk_en = cp0_yy_clk_en; // @[pfu.scala 341:45]
  assign ct_lsu_pfu_pmb_entry_1_cpurst_b = cpurst_b; // @[pfu.scala 342:40]
  assign ct_lsu_pfu_pmb_entry_1_ld_da_ldfifo_pc = ld_da_ldfifo_pc; // @[pfu.scala 343:47]
  assign ct_lsu_pfu_pmb_entry_1_ld_da_pfu_act_dp_vld = ld_da_pfu_act_dp_vld; // @[pfu.scala 344:52]
  assign ct_lsu_pfu_pmb_entry_1_ld_da_pfu_evict_cnt_vld = ld_da_pfu_evict_cnt_vld; // @[pfu.scala 345:55]
  assign ct_lsu_pfu_pmb_entry_1_ld_da_pfu_pf_inst_vld = ld_da_pfu_pf_inst_vld; // @[pfu.scala 346:53]
  assign ct_lsu_pfu_pmb_entry_1_lsu_special_clk = lsu_special_clk; // @[pfu.scala 347:47]
  assign ct_lsu_pfu_pmb_entry_1_pad_yy_icg_scan_en = pad_yy_icg_scan_en; // @[pfu.scala 348:50]
  assign ct_lsu_pfu_pmb_entry_1_pfu_pmb_entry_create_dp_vld_x = pfu_pmb_entry_create_dp_vld[1]; // @[pfu.scala 349:91]
  assign ct_lsu_pfu_pmb_entry_1_pfu_pmb_entry_create_gateclk_en_x = pfu_pmb_entry_create_gateclk_en[1]; // @[pfu.scala 350:99]
  assign ct_lsu_pfu_pmb_entry_1_pfu_pmb_entry_create_vld_x = pfu_pmb_entry_create_vld[1]; // @[pfu.scala 351:85]
  assign ct_lsu_pfu_pmb_entry_1_pfu_pmb_entry_ready_grnt_x = pfu_pmb_entry_ready_grnt[1]; // @[pfu.scala 355:85]
  assign ct_lsu_pfu_pmb_entry_1_pfu_pop_all_part_vld = 1'h0;
  assign ct_lsu_pfu_pmb_entry_1_pipe_create_pc = 15'h0;
  assign ct_lsu_pfu_pmb_entry_1_pmb_timeout_cnt_val = 8'h0;
  assign ct_lsu_pfu_pmb_entry_1_st_da_pc = st_da_pc; // @[pfu.scala 362:40]
  assign ct_lsu_pfu_pmb_entry_1_st_da_pfu_evict_cnt_vld = st_da_pfu_evict_cnt_vld; // @[pfu.scala 363:55]
  assign ct_lsu_pfu_pmb_entry_1_st_da_pfu_pf_inst_vld = st_da_pfu_pf_inst_vld; // @[pfu.scala 364:53]
  assign ct_lsu_pfu_pmb_entry_2_amr_wa_cancel = amr_wa_cancel; // @[pfu.scala 338:45]
  assign ct_lsu_pfu_pmb_entry_2_cp0_lsu_icg_en = cp0_lsu_icg_en; // @[pfu.scala 339:46]
  assign ct_lsu_pfu_pmb_entry_2_cp0_lsu_l2_st_pref_en = cp0_lsu_l2_st_pref_en; // @[pfu.scala 340:53]
  assign ct_lsu_pfu_pmb_entry_2_cp0_yy_clk_en = cp0_yy_clk_en; // @[pfu.scala 341:45]
  assign ct_lsu_pfu_pmb_entry_2_cpurst_b = cpurst_b; // @[pfu.scala 342:40]
  assign ct_lsu_pfu_pmb_entry_2_ld_da_ldfifo_pc = ld_da_ldfifo_pc; // @[pfu.scala 343:47]
  assign ct_lsu_pfu_pmb_entry_2_ld_da_pfu_act_dp_vld = ld_da_pfu_act_dp_vld; // @[pfu.scala 344:52]
  assign ct_lsu_pfu_pmb_entry_2_ld_da_pfu_evict_cnt_vld = ld_da_pfu_evict_cnt_vld; // @[pfu.scala 345:55]
  assign ct_lsu_pfu_pmb_entry_2_ld_da_pfu_pf_inst_vld = ld_da_pfu_pf_inst_vld; // @[pfu.scala 346:53]
  assign ct_lsu_pfu_pmb_entry_2_lsu_special_clk = lsu_special_clk; // @[pfu.scala 347:47]
  assign ct_lsu_pfu_pmb_entry_2_pad_yy_icg_scan_en = pad_yy_icg_scan_en; // @[pfu.scala 348:50]
  assign ct_lsu_pfu_pmb_entry_2_pfu_pmb_entry_create_dp_vld_x = pfu_pmb_entry_create_dp_vld[2]; // @[pfu.scala 349:91]
  assign ct_lsu_pfu_pmb_entry_2_pfu_pmb_entry_create_gateclk_en_x = pfu_pmb_entry_create_gateclk_en[2]; // @[pfu.scala 350:99]
  assign ct_lsu_pfu_pmb_entry_2_pfu_pmb_entry_create_vld_x = pfu_pmb_entry_create_vld[2]; // @[pfu.scala 351:85]
  assign ct_lsu_pfu_pmb_entry_2_pfu_pmb_entry_ready_grnt_x = pfu_pmb_entry_ready_grnt[2]; // @[pfu.scala 355:85]
  assign ct_lsu_pfu_pmb_entry_2_pfu_pop_all_part_vld = 1'h0;
  assign ct_lsu_pfu_pmb_entry_2_pipe_create_pc = 15'h0;
  assign ct_lsu_pfu_pmb_entry_2_pmb_timeout_cnt_val = 8'h0;
  assign ct_lsu_pfu_pmb_entry_2_st_da_pc = st_da_pc; // @[pfu.scala 362:40]
  assign ct_lsu_pfu_pmb_entry_2_st_da_pfu_evict_cnt_vld = st_da_pfu_evict_cnt_vld; // @[pfu.scala 363:55]
  assign ct_lsu_pfu_pmb_entry_2_st_da_pfu_pf_inst_vld = st_da_pfu_pf_inst_vld; // @[pfu.scala 364:53]
  assign ct_lsu_pfu_pmb_entry_3_amr_wa_cancel = amr_wa_cancel; // @[pfu.scala 338:45]
  assign ct_lsu_pfu_pmb_entry_3_cp0_lsu_icg_en = cp0_lsu_icg_en; // @[pfu.scala 339:46]
  assign ct_lsu_pfu_pmb_entry_3_cp0_lsu_l2_st_pref_en = cp0_lsu_l2_st_pref_en; // @[pfu.scala 340:53]
  assign ct_lsu_pfu_pmb_entry_3_cp0_yy_clk_en = cp0_yy_clk_en; // @[pfu.scala 341:45]
  assign ct_lsu_pfu_pmb_entry_3_cpurst_b = cpurst_b; // @[pfu.scala 342:40]
  assign ct_lsu_pfu_pmb_entry_3_ld_da_ldfifo_pc = ld_da_ldfifo_pc; // @[pfu.scala 343:47]
  assign ct_lsu_pfu_pmb_entry_3_ld_da_pfu_act_dp_vld = ld_da_pfu_act_dp_vld; // @[pfu.scala 344:52]
  assign ct_lsu_pfu_pmb_entry_3_ld_da_pfu_evict_cnt_vld = ld_da_pfu_evict_cnt_vld; // @[pfu.scala 345:55]
  assign ct_lsu_pfu_pmb_entry_3_ld_da_pfu_pf_inst_vld = ld_da_pfu_pf_inst_vld; // @[pfu.scala 346:53]
  assign ct_lsu_pfu_pmb_entry_3_lsu_special_clk = lsu_special_clk; // @[pfu.scala 347:47]
  assign ct_lsu_pfu_pmb_entry_3_pad_yy_icg_scan_en = pad_yy_icg_scan_en; // @[pfu.scala 348:50]
  assign ct_lsu_pfu_pmb_entry_3_pfu_pmb_entry_create_dp_vld_x = pfu_pmb_entry_create_dp_vld[3]; // @[pfu.scala 349:91]
  assign ct_lsu_pfu_pmb_entry_3_pfu_pmb_entry_create_gateclk_en_x = pfu_pmb_entry_create_gateclk_en[3]; // @[pfu.scala 350:99]
  assign ct_lsu_pfu_pmb_entry_3_pfu_pmb_entry_create_vld_x = pfu_pmb_entry_create_vld[3]; // @[pfu.scala 351:85]
  assign ct_lsu_pfu_pmb_entry_3_pfu_pmb_entry_ready_grnt_x = pfu_pmb_entry_ready_grnt[3]; // @[pfu.scala 355:85]
  assign ct_lsu_pfu_pmb_entry_3_pfu_pop_all_part_vld = 1'h0;
  assign ct_lsu_pfu_pmb_entry_3_pipe_create_pc = 15'h0;
  assign ct_lsu_pfu_pmb_entry_3_pmb_timeout_cnt_val = 8'h0;
  assign ct_lsu_pfu_pmb_entry_3_st_da_pc = st_da_pc; // @[pfu.scala 362:40]
  assign ct_lsu_pfu_pmb_entry_3_st_da_pfu_evict_cnt_vld = st_da_pfu_evict_cnt_vld; // @[pfu.scala 363:55]
  assign ct_lsu_pfu_pmb_entry_3_st_da_pfu_pf_inst_vld = st_da_pfu_pf_inst_vld; // @[pfu.scala 364:53]
  assign ct_lsu_pfu_pmb_entry_4_amr_wa_cancel = amr_wa_cancel; // @[pfu.scala 338:45]
  assign ct_lsu_pfu_pmb_entry_4_cp0_lsu_icg_en = cp0_lsu_icg_en; // @[pfu.scala 339:46]
  assign ct_lsu_pfu_pmb_entry_4_cp0_lsu_l2_st_pref_en = cp0_lsu_l2_st_pref_en; // @[pfu.scala 340:53]
  assign ct_lsu_pfu_pmb_entry_4_cp0_yy_clk_en = cp0_yy_clk_en; // @[pfu.scala 341:45]
  assign ct_lsu_pfu_pmb_entry_4_cpurst_b = cpurst_b; // @[pfu.scala 342:40]
  assign ct_lsu_pfu_pmb_entry_4_ld_da_ldfifo_pc = ld_da_ldfifo_pc; // @[pfu.scala 343:47]
  assign ct_lsu_pfu_pmb_entry_4_ld_da_pfu_act_dp_vld = ld_da_pfu_act_dp_vld; // @[pfu.scala 344:52]
  assign ct_lsu_pfu_pmb_entry_4_ld_da_pfu_evict_cnt_vld = ld_da_pfu_evict_cnt_vld; // @[pfu.scala 345:55]
  assign ct_lsu_pfu_pmb_entry_4_ld_da_pfu_pf_inst_vld = ld_da_pfu_pf_inst_vld; // @[pfu.scala 346:53]
  assign ct_lsu_pfu_pmb_entry_4_lsu_special_clk = lsu_special_clk; // @[pfu.scala 347:47]
  assign ct_lsu_pfu_pmb_entry_4_pad_yy_icg_scan_en = pad_yy_icg_scan_en; // @[pfu.scala 348:50]
  assign ct_lsu_pfu_pmb_entry_4_pfu_pmb_entry_create_dp_vld_x = pfu_pmb_entry_create_dp_vld[4]; // @[pfu.scala 349:91]
  assign ct_lsu_pfu_pmb_entry_4_pfu_pmb_entry_create_gateclk_en_x = pfu_pmb_entry_create_gateclk_en[4]; // @[pfu.scala 350:99]
  assign ct_lsu_pfu_pmb_entry_4_pfu_pmb_entry_create_vld_x = pfu_pmb_entry_create_vld[4]; // @[pfu.scala 351:85]
  assign ct_lsu_pfu_pmb_entry_4_pfu_pmb_entry_ready_grnt_x = pfu_pmb_entry_ready_grnt[4]; // @[pfu.scala 355:85]
  assign ct_lsu_pfu_pmb_entry_4_pfu_pop_all_part_vld = 1'h0;
  assign ct_lsu_pfu_pmb_entry_4_pipe_create_pc = 15'h0;
  assign ct_lsu_pfu_pmb_entry_4_pmb_timeout_cnt_val = 8'h0;
  assign ct_lsu_pfu_pmb_entry_4_st_da_pc = st_da_pc; // @[pfu.scala 362:40]
  assign ct_lsu_pfu_pmb_entry_4_st_da_pfu_evict_cnt_vld = st_da_pfu_evict_cnt_vld; // @[pfu.scala 363:55]
  assign ct_lsu_pfu_pmb_entry_4_st_da_pfu_pf_inst_vld = st_da_pfu_pf_inst_vld; // @[pfu.scala 364:53]
  assign ct_lsu_pfu_pmb_entry_5_amr_wa_cancel = amr_wa_cancel; // @[pfu.scala 338:45]
  assign ct_lsu_pfu_pmb_entry_5_cp0_lsu_icg_en = cp0_lsu_icg_en; // @[pfu.scala 339:46]
  assign ct_lsu_pfu_pmb_entry_5_cp0_lsu_l2_st_pref_en = cp0_lsu_l2_st_pref_en; // @[pfu.scala 340:53]
  assign ct_lsu_pfu_pmb_entry_5_cp0_yy_clk_en = cp0_yy_clk_en; // @[pfu.scala 341:45]
  assign ct_lsu_pfu_pmb_entry_5_cpurst_b = cpurst_b; // @[pfu.scala 342:40]
  assign ct_lsu_pfu_pmb_entry_5_ld_da_ldfifo_pc = ld_da_ldfifo_pc; // @[pfu.scala 343:47]
  assign ct_lsu_pfu_pmb_entry_5_ld_da_pfu_act_dp_vld = ld_da_pfu_act_dp_vld; // @[pfu.scala 344:52]
  assign ct_lsu_pfu_pmb_entry_5_ld_da_pfu_evict_cnt_vld = ld_da_pfu_evict_cnt_vld; // @[pfu.scala 345:55]
  assign ct_lsu_pfu_pmb_entry_5_ld_da_pfu_pf_inst_vld = ld_da_pfu_pf_inst_vld; // @[pfu.scala 346:53]
  assign ct_lsu_pfu_pmb_entry_5_lsu_special_clk = lsu_special_clk; // @[pfu.scala 347:47]
  assign ct_lsu_pfu_pmb_entry_5_pad_yy_icg_scan_en = pad_yy_icg_scan_en; // @[pfu.scala 348:50]
  assign ct_lsu_pfu_pmb_entry_5_pfu_pmb_entry_create_dp_vld_x = pfu_pmb_entry_create_dp_vld[5]; // @[pfu.scala 349:91]
  assign ct_lsu_pfu_pmb_entry_5_pfu_pmb_entry_create_gateclk_en_x = pfu_pmb_entry_create_gateclk_en[5]; // @[pfu.scala 350:99]
  assign ct_lsu_pfu_pmb_entry_5_pfu_pmb_entry_create_vld_x = pfu_pmb_entry_create_vld[5]; // @[pfu.scala 351:85]
  assign ct_lsu_pfu_pmb_entry_5_pfu_pmb_entry_ready_grnt_x = pfu_pmb_entry_ready_grnt[5]; // @[pfu.scala 355:85]
  assign ct_lsu_pfu_pmb_entry_5_pfu_pop_all_part_vld = 1'h0;
  assign ct_lsu_pfu_pmb_entry_5_pipe_create_pc = 15'h0;
  assign ct_lsu_pfu_pmb_entry_5_pmb_timeout_cnt_val = 8'h0;
  assign ct_lsu_pfu_pmb_entry_5_st_da_pc = st_da_pc; // @[pfu.scala 362:40]
  assign ct_lsu_pfu_pmb_entry_5_st_da_pfu_evict_cnt_vld = st_da_pfu_evict_cnt_vld; // @[pfu.scala 363:55]
  assign ct_lsu_pfu_pmb_entry_5_st_da_pfu_pf_inst_vld = st_da_pfu_pf_inst_vld; // @[pfu.scala 364:53]
  assign ct_lsu_pfu_pmb_entry_6_amr_wa_cancel = amr_wa_cancel; // @[pfu.scala 338:45]
  assign ct_lsu_pfu_pmb_entry_6_cp0_lsu_icg_en = cp0_lsu_icg_en; // @[pfu.scala 339:46]
  assign ct_lsu_pfu_pmb_entry_6_cp0_lsu_l2_st_pref_en = cp0_lsu_l2_st_pref_en; // @[pfu.scala 340:53]
  assign ct_lsu_pfu_pmb_entry_6_cp0_yy_clk_en = cp0_yy_clk_en; // @[pfu.scala 341:45]
  assign ct_lsu_pfu_pmb_entry_6_cpurst_b = cpurst_b; // @[pfu.scala 342:40]
  assign ct_lsu_pfu_pmb_entry_6_ld_da_ldfifo_pc = ld_da_ldfifo_pc; // @[pfu.scala 343:47]
  assign ct_lsu_pfu_pmb_entry_6_ld_da_pfu_act_dp_vld = ld_da_pfu_act_dp_vld; // @[pfu.scala 344:52]
  assign ct_lsu_pfu_pmb_entry_6_ld_da_pfu_evict_cnt_vld = ld_da_pfu_evict_cnt_vld; // @[pfu.scala 345:55]
  assign ct_lsu_pfu_pmb_entry_6_ld_da_pfu_pf_inst_vld = ld_da_pfu_pf_inst_vld; // @[pfu.scala 346:53]
  assign ct_lsu_pfu_pmb_entry_6_lsu_special_clk = lsu_special_clk; // @[pfu.scala 347:47]
  assign ct_lsu_pfu_pmb_entry_6_pad_yy_icg_scan_en = pad_yy_icg_scan_en; // @[pfu.scala 348:50]
  assign ct_lsu_pfu_pmb_entry_6_pfu_pmb_entry_create_dp_vld_x = pfu_pmb_entry_create_dp_vld[6]; // @[pfu.scala 349:91]
  assign ct_lsu_pfu_pmb_entry_6_pfu_pmb_entry_create_gateclk_en_x = pfu_pmb_entry_create_gateclk_en[6]; // @[pfu.scala 350:99]
  assign ct_lsu_pfu_pmb_entry_6_pfu_pmb_entry_create_vld_x = pfu_pmb_entry_create_vld[6]; // @[pfu.scala 351:85]
  assign ct_lsu_pfu_pmb_entry_6_pfu_pmb_entry_ready_grnt_x = pfu_pmb_entry_ready_grnt[6]; // @[pfu.scala 355:85]
  assign ct_lsu_pfu_pmb_entry_6_pfu_pop_all_part_vld = 1'h0;
  assign ct_lsu_pfu_pmb_entry_6_pipe_create_pc = 15'h0;
  assign ct_lsu_pfu_pmb_entry_6_pmb_timeout_cnt_val = 8'h0;
  assign ct_lsu_pfu_pmb_entry_6_st_da_pc = st_da_pc; // @[pfu.scala 362:40]
  assign ct_lsu_pfu_pmb_entry_6_st_da_pfu_evict_cnt_vld = st_da_pfu_evict_cnt_vld; // @[pfu.scala 363:55]
  assign ct_lsu_pfu_pmb_entry_6_st_da_pfu_pf_inst_vld = st_da_pfu_pf_inst_vld; // @[pfu.scala 364:53]
  assign ct_lsu_pfu_pmb_entry_7_amr_wa_cancel = amr_wa_cancel; // @[pfu.scala 338:45]
  assign ct_lsu_pfu_pmb_entry_7_cp0_lsu_icg_en = cp0_lsu_icg_en; // @[pfu.scala 339:46]
  assign ct_lsu_pfu_pmb_entry_7_cp0_lsu_l2_st_pref_en = cp0_lsu_l2_st_pref_en; // @[pfu.scala 340:53]
  assign ct_lsu_pfu_pmb_entry_7_cp0_yy_clk_en = cp0_yy_clk_en; // @[pfu.scala 341:45]
  assign ct_lsu_pfu_pmb_entry_7_cpurst_b = cpurst_b; // @[pfu.scala 342:40]
  assign ct_lsu_pfu_pmb_entry_7_ld_da_ldfifo_pc = ld_da_ldfifo_pc; // @[pfu.scala 343:47]
  assign ct_lsu_pfu_pmb_entry_7_ld_da_pfu_act_dp_vld = ld_da_pfu_act_dp_vld; // @[pfu.scala 344:52]
  assign ct_lsu_pfu_pmb_entry_7_ld_da_pfu_evict_cnt_vld = ld_da_pfu_evict_cnt_vld; // @[pfu.scala 345:55]
  assign ct_lsu_pfu_pmb_entry_7_ld_da_pfu_pf_inst_vld = ld_da_pfu_pf_inst_vld; // @[pfu.scala 346:53]
  assign ct_lsu_pfu_pmb_entry_7_lsu_special_clk = lsu_special_clk; // @[pfu.scala 347:47]
  assign ct_lsu_pfu_pmb_entry_7_pad_yy_icg_scan_en = pad_yy_icg_scan_en; // @[pfu.scala 348:50]
  assign ct_lsu_pfu_pmb_entry_7_pfu_pmb_entry_create_dp_vld_x = pfu_pmb_entry_create_dp_vld[7]; // @[pfu.scala 349:91]
  assign ct_lsu_pfu_pmb_entry_7_pfu_pmb_entry_create_gateclk_en_x = pfu_pmb_entry_create_gateclk_en[7]; // @[pfu.scala 350:99]
  assign ct_lsu_pfu_pmb_entry_7_pfu_pmb_entry_create_vld_x = pfu_pmb_entry_create_vld[7]; // @[pfu.scala 351:85]
  assign ct_lsu_pfu_pmb_entry_7_pfu_pmb_entry_ready_grnt_x = pfu_pmb_entry_ready_grnt[7]; // @[pfu.scala 355:85]
  assign ct_lsu_pfu_pmb_entry_7_pfu_pop_all_part_vld = 1'h0;
  assign ct_lsu_pfu_pmb_entry_7_pipe_create_pc = 15'h0;
  assign ct_lsu_pfu_pmb_entry_7_pmb_timeout_cnt_val = 8'h0;
  assign ct_lsu_pfu_pmb_entry_7_st_da_pc = st_da_pc; // @[pfu.scala 362:40]
  assign ct_lsu_pfu_pmb_entry_7_st_da_pfu_evict_cnt_vld = st_da_pfu_evict_cnt_vld; // @[pfu.scala 363:55]
  assign ct_lsu_pfu_pmb_entry_7_st_da_pfu_pf_inst_vld = st_da_pfu_pf_inst_vld; // @[pfu.scala 364:53]
  assign ct_lsu_pfu_sdb_entry_amr_wa_cancel = amr_wa_cancel; // @[pfu.scala 420:45]
  assign ct_lsu_pfu_sdb_entry_cp0_lsu_icg_en = cp0_lsu_icg_en; // @[pfu.scala 421:46]
  assign ct_lsu_pfu_sdb_entry_cp0_lsu_l2_st_pref_en = cp0_lsu_l2_st_pref_en; // @[pfu.scala 422:53]
  assign ct_lsu_pfu_sdb_entry_cp0_yy_clk_en = cp0_yy_clk_en; // @[pfu.scala 423:45]
  assign ct_lsu_pfu_sdb_entry_cpurst_b = cpurst_b; // @[pfu.scala 424:40]
  assign ct_lsu_pfu_sdb_entry_ld_da_iid = ld_da_iid; // @[pfu.scala 425:41]
  assign ct_lsu_pfu_sdb_entry_ld_da_ldfifo_pc = ld_da_ldfifo_pc; // @[pfu.scala 426:47]
  assign ct_lsu_pfu_sdb_entry_ld_da_pfu_act_dp_vld = ld_da_pfu_act_dp_vld; // @[pfu.scala 427:52]
  assign ct_lsu_pfu_sdb_entry_ld_da_pfu_evict_cnt_vld = ld_da_pfu_evict_cnt_vld; // @[pfu.scala 428:55]
  assign ct_lsu_pfu_sdb_entry_ld_da_pfu_pf_inst_vld = ld_da_pfu_pf_inst_vld; // @[pfu.scala 429:53]
  assign ct_lsu_pfu_sdb_entry_ld_da_ppfu_va = ld_da_ppfu_va; // @[pfu.scala 430:45]
  assign ct_lsu_pfu_sdb_entry_lsu_special_clk = lsu_special_clk; // @[pfu.scala 431:47]
  assign ct_lsu_pfu_sdb_entry_pad_yy_icg_scan_en = pad_yy_icg_scan_en; // @[pfu.scala 432:50]
  assign ct_lsu_pfu_sdb_entry_pfu_pop_all_part_vld = pfu_pop_all_vld | pfu_gpfb_vld; // @[pfu.scala 977:43]
  assign ct_lsu_pfu_sdb_entry_pfu_sdb_create_pc = _pfu_sdb_create_pc_T_29 | _pfu_sdb_create_pc_T_23; // @[pfu.scala 474:14]
  assign ct_lsu_pfu_sdb_entry_pfu_sdb_create_type_ld = |_pfu_sdb_create_type_ld_T_1; // @[pfu.scala 476:78]
  assign ct_lsu_pfu_sdb_entry_pfu_sdb_entry_create_dp_vld_x = pfu_sdb_entry_create_dp_vld[0]; // @[pfu.scala 436:91]
  assign ct_lsu_pfu_sdb_entry_pfu_sdb_entry_create_gateclk_en_x = pfu_sdb_entry_create_dp_vld[0]; // @[pfu.scala 437:99]
  assign ct_lsu_pfu_sdb_entry_pfu_sdb_entry_create_vld_x = pfu_sdb_entry_create_dp_vld[0]; // @[pfu.scala 438:85]
  assign ct_lsu_pfu_sdb_entry_pfu_sdb_entry_ready_grnt_x = pfu_sdb_entry_ready_grnt[0]; // @[pfu.scala 442:85]
  assign ct_lsu_pfu_sdb_entry_rtu_yy_xx_commit0 = rtu_yy_xx_commit0; // @[pfu.scala 449:49]
  assign ct_lsu_pfu_sdb_entry_rtu_yy_xx_commit0_iid = rtu_yy_xx_commit0_iid; // @[pfu.scala 450:53]
  assign ct_lsu_pfu_sdb_entry_rtu_yy_xx_commit1 = rtu_yy_xx_commit1; // @[pfu.scala 451:49]
  assign ct_lsu_pfu_sdb_entry_rtu_yy_xx_commit1_iid = rtu_yy_xx_commit1_iid; // @[pfu.scala 452:53]
  assign ct_lsu_pfu_sdb_entry_rtu_yy_xx_commit2 = rtu_yy_xx_commit2; // @[pfu.scala 453:49]
  assign ct_lsu_pfu_sdb_entry_rtu_yy_xx_commit2_iid = rtu_yy_xx_commit2_iid; // @[pfu.scala 454:53]
  assign ct_lsu_pfu_sdb_entry_rtu_yy_xx_flush = rtu_yy_xx_flush; // @[pfu.scala 455:47]
  assign ct_lsu_pfu_sdb_entry_sdb_timeout_cnt_val = 8'h0;
  assign ct_lsu_pfu_sdb_entry_st_da_iid = st_da_iid; // @[pfu.scala 457:41]
  assign ct_lsu_pfu_sdb_entry_st_da_pc = st_da_pc; // @[pfu.scala 458:40]
  assign ct_lsu_pfu_sdb_entry_st_da_pfu_evict_cnt_vld = st_da_pfu_evict_cnt_vld; // @[pfu.scala 459:55]
  assign ct_lsu_pfu_sdb_entry_st_da_pfu_pf_inst_vld = st_da_pfu_pf_inst_vld; // @[pfu.scala 460:53]
  assign ct_lsu_pfu_sdb_entry_st_da_ppfu_va = st_da_ppfu_va; // @[pfu.scala 461:45]
  assign ct_lsu_pfu_sdb_entry_1_amr_wa_cancel = amr_wa_cancel; // @[pfu.scala 420:45]
  assign ct_lsu_pfu_sdb_entry_1_cp0_lsu_icg_en = cp0_lsu_icg_en; // @[pfu.scala 421:46]
  assign ct_lsu_pfu_sdb_entry_1_cp0_lsu_l2_st_pref_en = cp0_lsu_l2_st_pref_en; // @[pfu.scala 422:53]
  assign ct_lsu_pfu_sdb_entry_1_cp0_yy_clk_en = cp0_yy_clk_en; // @[pfu.scala 423:45]
  assign ct_lsu_pfu_sdb_entry_1_cpurst_b = cpurst_b; // @[pfu.scala 424:40]
  assign ct_lsu_pfu_sdb_entry_1_ld_da_iid = ld_da_iid; // @[pfu.scala 425:41]
  assign ct_lsu_pfu_sdb_entry_1_ld_da_ldfifo_pc = ld_da_ldfifo_pc; // @[pfu.scala 426:47]
  assign ct_lsu_pfu_sdb_entry_1_ld_da_pfu_act_dp_vld = ld_da_pfu_act_dp_vld; // @[pfu.scala 427:52]
  assign ct_lsu_pfu_sdb_entry_1_ld_da_pfu_evict_cnt_vld = ld_da_pfu_evict_cnt_vld; // @[pfu.scala 428:55]
  assign ct_lsu_pfu_sdb_entry_1_ld_da_pfu_pf_inst_vld = ld_da_pfu_pf_inst_vld; // @[pfu.scala 429:53]
  assign ct_lsu_pfu_sdb_entry_1_ld_da_ppfu_va = ld_da_ppfu_va; // @[pfu.scala 430:45]
  assign ct_lsu_pfu_sdb_entry_1_lsu_special_clk = lsu_special_clk; // @[pfu.scala 431:47]
  assign ct_lsu_pfu_sdb_entry_1_pad_yy_icg_scan_en = pad_yy_icg_scan_en; // @[pfu.scala 432:50]
  assign ct_lsu_pfu_sdb_entry_1_pfu_pop_all_part_vld = pfu_pop_all_vld | pfu_gpfb_vld; // @[pfu.scala 977:43]
  assign ct_lsu_pfu_sdb_entry_1_pfu_sdb_create_pc = _pfu_sdb_create_pc_T_29 | _pfu_sdb_create_pc_T_23; // @[pfu.scala 474:14]
  assign ct_lsu_pfu_sdb_entry_1_pfu_sdb_create_type_ld = |_pfu_sdb_create_type_ld_T_1; // @[pfu.scala 476:78]
  assign ct_lsu_pfu_sdb_entry_1_pfu_sdb_entry_create_dp_vld_x = pfu_sdb_entry_create_dp_vld[1]; // @[pfu.scala 436:91]
  assign ct_lsu_pfu_sdb_entry_1_pfu_sdb_entry_create_gateclk_en_x = pfu_sdb_entry_create_dp_vld[1]; // @[pfu.scala 437:99]
  assign ct_lsu_pfu_sdb_entry_1_pfu_sdb_entry_create_vld_x = pfu_sdb_entry_create_dp_vld[1]; // @[pfu.scala 438:85]
  assign ct_lsu_pfu_sdb_entry_1_pfu_sdb_entry_ready_grnt_x = pfu_sdb_entry_ready_grnt[1]; // @[pfu.scala 442:85]
  assign ct_lsu_pfu_sdb_entry_1_rtu_yy_xx_commit0 = rtu_yy_xx_commit0; // @[pfu.scala 449:49]
  assign ct_lsu_pfu_sdb_entry_1_rtu_yy_xx_commit0_iid = rtu_yy_xx_commit0_iid; // @[pfu.scala 450:53]
  assign ct_lsu_pfu_sdb_entry_1_rtu_yy_xx_commit1 = rtu_yy_xx_commit1; // @[pfu.scala 451:49]
  assign ct_lsu_pfu_sdb_entry_1_rtu_yy_xx_commit1_iid = rtu_yy_xx_commit1_iid; // @[pfu.scala 452:53]
  assign ct_lsu_pfu_sdb_entry_1_rtu_yy_xx_commit2 = rtu_yy_xx_commit2; // @[pfu.scala 453:49]
  assign ct_lsu_pfu_sdb_entry_1_rtu_yy_xx_commit2_iid = rtu_yy_xx_commit2_iid; // @[pfu.scala 454:53]
  assign ct_lsu_pfu_sdb_entry_1_rtu_yy_xx_flush = rtu_yy_xx_flush; // @[pfu.scala 455:47]
  assign ct_lsu_pfu_sdb_entry_1_sdb_timeout_cnt_val = 8'h0;
  assign ct_lsu_pfu_sdb_entry_1_st_da_iid = st_da_iid; // @[pfu.scala 457:41]
  assign ct_lsu_pfu_sdb_entry_1_st_da_pc = st_da_pc; // @[pfu.scala 458:40]
  assign ct_lsu_pfu_sdb_entry_1_st_da_pfu_evict_cnt_vld = st_da_pfu_evict_cnt_vld; // @[pfu.scala 459:55]
  assign ct_lsu_pfu_sdb_entry_1_st_da_pfu_pf_inst_vld = st_da_pfu_pf_inst_vld; // @[pfu.scala 460:53]
  assign ct_lsu_pfu_sdb_entry_1_st_da_ppfu_va = st_da_ppfu_va; // @[pfu.scala 461:45]
  assign ct_lsu_pfu_pfb_entry_amr_wa_cancel = amr_wa_cancel; // @[pfu.scala 532:45]
  assign ct_lsu_pfu_pfb_entry_cp0_lsu_icg_en = cp0_lsu_icg_en; // @[pfu.scala 533:46]
  assign ct_lsu_pfu_pfb_entry_cp0_lsu_l2_st_pref_en = cp0_lsu_l2_st_pref_en; // @[pfu.scala 534:53]
  assign ct_lsu_pfu_pfb_entry_cp0_lsu_pfu_mmu_dis = cp0_lsu_pfu_mmu_dis; // @[pfu.scala 535:51]
  assign ct_lsu_pfu_pfb_entry_cp0_yy_clk_en = cp0_yy_clk_en; // @[pfu.scala 536:45]
  assign ct_lsu_pfu_pfb_entry_cp0_yy_priv_mode = cp0_yy_priv_mode; // @[pfu.scala 537:48]
  assign ct_lsu_pfu_pfb_entry_cpurst_b = cpurst_b; // @[pfu.scala 538:40]
  assign ct_lsu_pfu_pfb_entry_ld_da_ldfifo_pc = ld_da_ldfifo_pc; // @[pfu.scala 539:47]
  assign ct_lsu_pfu_pfb_entry_ld_da_page_sec_ff = ld_da_page_sec_ff; // @[pfu.scala 540:49]
  assign ct_lsu_pfu_pfb_entry_ld_da_page_share_ff = ld_da_page_share_ff; // @[pfu.scala 541:51]
  assign ct_lsu_pfu_pfb_entry_ld_da_pfu_act_dp_vld = ld_da_pfu_act_dp_vld; // @[pfu.scala 542:52]
  assign ct_lsu_pfu_pfb_entry_ld_da_pfu_act_vld = ld_da_pfu_act_vld; // @[pfu.scala 543:49]
  assign ct_lsu_pfu_pfb_entry_ld_da_pfu_evict_cnt_vld = ld_da_pfu_evict_cnt_vld; // @[pfu.scala 544:55]
  assign ct_lsu_pfu_pfb_entry_ld_da_pfu_pf_inst_vld = ld_da_pfu_pf_inst_vld; // @[pfu.scala 545:53]
  assign ct_lsu_pfu_pfb_entry_ld_da_ppfu_va = ld_da_ppfu_va; // @[pfu.scala 546:45]
  assign ct_lsu_pfu_pfb_entry_ld_da_ppn_ff = ld_da_ppn_ff; // @[pfu.scala 547:44]
  assign ct_lsu_pfu_pfb_entry_lsu_pfu_l1_dist_sel = lsu_pfu_l1_dist_sel; // @[pfu.scala 548:51]
  assign ct_lsu_pfu_pfb_entry_lsu_pfu_l2_dist_sel = lsu_pfu_l2_dist_sel; // @[pfu.scala 549:51]
  assign ct_lsu_pfu_pfb_entry_lsu_special_clk = lsu_special_clk; // @[pfu.scala 550:69]
  assign ct_lsu_pfu_pfb_entry_pad_yy_icg_scan_en = pad_yy_icg_scan_en; // @[pfu.scala 551:50]
  assign ct_lsu_pfu_pfb_entry_pfb_no_req_cnt_val = 6'h0;
  assign ct_lsu_pfu_pfb_entry_pfb_timeout_cnt_val = 8'h0;
  assign ct_lsu_pfu_pfb_entry_pfu_biu_pe_req_sel_l1 = 1'h0;
  assign ct_lsu_pfu_pfb_entry_pfu_dcache_pref_en = 1'h0;
  assign ct_lsu_pfu_pfb_entry_pfu_get_page_sec = 1'h0;
  assign ct_lsu_pfu_pfb_entry_pfu_get_page_share = 1'h0;
  assign ct_lsu_pfu_pfb_entry_pfu_get_ppn = 28'h0;
  assign ct_lsu_pfu_pfb_entry_pfu_get_ppn_err = 1'h0;
  assign ct_lsu_pfu_pfb_entry_pfu_get_ppn_vld = 1'h0;
  assign ct_lsu_pfu_pfb_entry_pfu_l2_pref_en = 1'h0;
  assign ct_lsu_pfu_pfb_entry_pfu_mmu_pe_req_sel_l1 = 1'h0;
  assign ct_lsu_pfu_pfb_entry_pfu_pfb_create_pc = 15'h0;
  assign ct_lsu_pfu_pfb_entry_pfu_pfb_create_stride = 11'h0;
  assign ct_lsu_pfu_pfb_entry_pfu_pfb_create_stride_neg = 1'h0;
  assign ct_lsu_pfu_pfb_entry_pfu_pfb_create_strideh_6to0 = 7'h0;
  assign ct_lsu_pfu_pfb_entry_pfu_pfb_create_type_ld = 1'h0;
  assign ct_lsu_pfu_pfb_entry_pfu_pfb_entry_biu_pe_req_grnt_x = pfu_pfb_entry_biu_pe_req_grnt[0]; // @[pfu.scala 568:95]
  assign ct_lsu_pfu_pfb_entry_pfu_pfb_entry_create_dp_vld_x = pfu_pfb_entry_create_dp_vld[0]; // @[pfu.scala 571:91]
  assign ct_lsu_pfu_pfb_entry_pfu_pfb_entry_create_gateclk_en_x = pfu_pfb_entry_create_dp_vld[0]; // @[pfu.scala 572:99]
  assign ct_lsu_pfu_pfb_entry_pfu_pfb_entry_create_vld_x = pfu_pfb_entry_create_dp_vld[0]; // @[pfu.scala 573:85]
  assign ct_lsu_pfu_pfb_entry_pfu_pfb_entry_from_lfb_dcache_hit_x = pfu_pfb_entry_from_lfb_dcache_hit[0]; // @[pfu.scala 575:103]
  assign ct_lsu_pfu_pfb_entry_pfu_pfb_entry_from_lfb_dcache_miss_x = pfu_pfb_entry_from_lfb_dcache_miss[0]; // @[pfu.scala 576:105]
  assign ct_lsu_pfu_pfb_entry_pfu_pfb_entry_mmu_pe_req_grnt_x = pfu_pfb_entry_mmu_pe_req_grnt[0]; // @[pfu.scala 586:95]
  assign ct_lsu_pfu_pfb_entry_pfu_pop_all_part_vld = 1'h0;
  assign ct_lsu_pfu_pfb_entry_st_da_page_sec_ff = st_da_page_sec_ff; // @[pfu.scala 592:49]
  assign ct_lsu_pfu_pfb_entry_st_da_page_share_ff = st_da_page_share_ff; // @[pfu.scala 593:51]
  assign ct_lsu_pfu_pfb_entry_st_da_pc = st_da_pc; // @[pfu.scala 594:40]
  assign ct_lsu_pfu_pfb_entry_st_da_pfu_act_vld = st_da_pfu_act_vld; // @[pfu.scala 595:49]
  assign ct_lsu_pfu_pfb_entry_st_da_pfu_evict_cnt_vld = st_da_pfu_evict_cnt_vld; // @[pfu.scala 596:55]
  assign ct_lsu_pfu_pfb_entry_st_da_pfu_pf_inst_vld = st_da_pfu_pf_inst_vld; // @[pfu.scala 597:53]
  assign ct_lsu_pfu_pfb_entry_st_da_ppfu_va = st_da_ppfu_va; // @[pfu.scala 598:45]
  assign ct_lsu_pfu_pfb_entry_st_da_ppn_ff = st_da_ppn_ff; // @[pfu.scala 599:44]
  assign ct_lsu_pfu_pfb_entry_1_amr_wa_cancel = amr_wa_cancel; // @[pfu.scala 532:45]
  assign ct_lsu_pfu_pfb_entry_1_cp0_lsu_icg_en = cp0_lsu_icg_en; // @[pfu.scala 533:46]
  assign ct_lsu_pfu_pfb_entry_1_cp0_lsu_l2_st_pref_en = cp0_lsu_l2_st_pref_en; // @[pfu.scala 534:53]
  assign ct_lsu_pfu_pfb_entry_1_cp0_lsu_pfu_mmu_dis = cp0_lsu_pfu_mmu_dis; // @[pfu.scala 535:51]
  assign ct_lsu_pfu_pfb_entry_1_cp0_yy_clk_en = cp0_yy_clk_en; // @[pfu.scala 536:45]
  assign ct_lsu_pfu_pfb_entry_1_cp0_yy_priv_mode = cp0_yy_priv_mode; // @[pfu.scala 537:48]
  assign ct_lsu_pfu_pfb_entry_1_cpurst_b = cpurst_b; // @[pfu.scala 538:40]
  assign ct_lsu_pfu_pfb_entry_1_ld_da_ldfifo_pc = ld_da_ldfifo_pc; // @[pfu.scala 539:47]
  assign ct_lsu_pfu_pfb_entry_1_ld_da_page_sec_ff = ld_da_page_sec_ff; // @[pfu.scala 540:49]
  assign ct_lsu_pfu_pfb_entry_1_ld_da_page_share_ff = ld_da_page_share_ff; // @[pfu.scala 541:51]
  assign ct_lsu_pfu_pfb_entry_1_ld_da_pfu_act_dp_vld = ld_da_pfu_act_dp_vld; // @[pfu.scala 542:52]
  assign ct_lsu_pfu_pfb_entry_1_ld_da_pfu_act_vld = ld_da_pfu_act_vld; // @[pfu.scala 543:49]
  assign ct_lsu_pfu_pfb_entry_1_ld_da_pfu_evict_cnt_vld = ld_da_pfu_evict_cnt_vld; // @[pfu.scala 544:55]
  assign ct_lsu_pfu_pfb_entry_1_ld_da_pfu_pf_inst_vld = ld_da_pfu_pf_inst_vld; // @[pfu.scala 545:53]
  assign ct_lsu_pfu_pfb_entry_1_ld_da_ppfu_va = ld_da_ppfu_va; // @[pfu.scala 546:45]
  assign ct_lsu_pfu_pfb_entry_1_ld_da_ppn_ff = ld_da_ppn_ff; // @[pfu.scala 547:44]
  assign ct_lsu_pfu_pfb_entry_1_lsu_pfu_l1_dist_sel = lsu_pfu_l1_dist_sel; // @[pfu.scala 548:51]
  assign ct_lsu_pfu_pfb_entry_1_lsu_pfu_l2_dist_sel = lsu_pfu_l2_dist_sel; // @[pfu.scala 549:51]
  assign ct_lsu_pfu_pfb_entry_1_lsu_special_clk = lsu_special_clk; // @[pfu.scala 550:69]
  assign ct_lsu_pfu_pfb_entry_1_pad_yy_icg_scan_en = pad_yy_icg_scan_en; // @[pfu.scala 551:50]
  assign ct_lsu_pfu_pfb_entry_1_pfb_no_req_cnt_val = 6'h0;
  assign ct_lsu_pfu_pfb_entry_1_pfb_timeout_cnt_val = 8'h0;
  assign ct_lsu_pfu_pfb_entry_1_pfu_biu_pe_req_sel_l1 = 1'h0;
  assign ct_lsu_pfu_pfb_entry_1_pfu_dcache_pref_en = 1'h0;
  assign ct_lsu_pfu_pfb_entry_1_pfu_get_page_sec = 1'h0;
  assign ct_lsu_pfu_pfb_entry_1_pfu_get_page_share = 1'h0;
  assign ct_lsu_pfu_pfb_entry_1_pfu_get_ppn = 28'h0;
  assign ct_lsu_pfu_pfb_entry_1_pfu_get_ppn_err = 1'h0;
  assign ct_lsu_pfu_pfb_entry_1_pfu_get_ppn_vld = 1'h0;
  assign ct_lsu_pfu_pfb_entry_1_pfu_l2_pref_en = 1'h0;
  assign ct_lsu_pfu_pfb_entry_1_pfu_mmu_pe_req_sel_l1 = 1'h0;
  assign ct_lsu_pfu_pfb_entry_1_pfu_pfb_create_pc = 15'h0;
  assign ct_lsu_pfu_pfb_entry_1_pfu_pfb_create_stride = 11'h0;
  assign ct_lsu_pfu_pfb_entry_1_pfu_pfb_create_stride_neg = 1'h0;
  assign ct_lsu_pfu_pfb_entry_1_pfu_pfb_create_strideh_6to0 = 7'h0;
  assign ct_lsu_pfu_pfb_entry_1_pfu_pfb_create_type_ld = 1'h0;
  assign ct_lsu_pfu_pfb_entry_1_pfu_pfb_entry_biu_pe_req_grnt_x = pfu_pfb_entry_biu_pe_req_grnt[1]; // @[pfu.scala 568:95]
  assign ct_lsu_pfu_pfb_entry_1_pfu_pfb_entry_create_dp_vld_x = pfu_pfb_entry_create_dp_vld[1]; // @[pfu.scala 571:91]
  assign ct_lsu_pfu_pfb_entry_1_pfu_pfb_entry_create_gateclk_en_x = pfu_pfb_entry_create_dp_vld[1]; // @[pfu.scala 572:99]
  assign ct_lsu_pfu_pfb_entry_1_pfu_pfb_entry_create_vld_x = pfu_pfb_entry_create_dp_vld[1]; // @[pfu.scala 573:85]
  assign ct_lsu_pfu_pfb_entry_1_pfu_pfb_entry_from_lfb_dcache_hit_x = pfu_pfb_entry_from_lfb_dcache_hit[1]; // @[pfu.scala 575:103]
  assign ct_lsu_pfu_pfb_entry_1_pfu_pfb_entry_from_lfb_dcache_miss_x = pfu_pfb_entry_from_lfb_dcache_miss[1]; // @[pfu.scala 576:105]
  assign ct_lsu_pfu_pfb_entry_1_pfu_pfb_entry_mmu_pe_req_grnt_x = pfu_pfb_entry_mmu_pe_req_grnt[1]; // @[pfu.scala 586:95]
  assign ct_lsu_pfu_pfb_entry_1_pfu_pop_all_part_vld = 1'h0;
  assign ct_lsu_pfu_pfb_entry_1_st_da_page_sec_ff = st_da_page_sec_ff; // @[pfu.scala 592:49]
  assign ct_lsu_pfu_pfb_entry_1_st_da_page_share_ff = st_da_page_share_ff; // @[pfu.scala 593:51]
  assign ct_lsu_pfu_pfb_entry_1_st_da_pc = st_da_pc; // @[pfu.scala 594:40]
  assign ct_lsu_pfu_pfb_entry_1_st_da_pfu_act_vld = st_da_pfu_act_vld; // @[pfu.scala 595:49]
  assign ct_lsu_pfu_pfb_entry_1_st_da_pfu_evict_cnt_vld = st_da_pfu_evict_cnt_vld; // @[pfu.scala 596:55]
  assign ct_lsu_pfu_pfb_entry_1_st_da_pfu_pf_inst_vld = st_da_pfu_pf_inst_vld; // @[pfu.scala 597:53]
  assign ct_lsu_pfu_pfb_entry_1_st_da_ppfu_va = st_da_ppfu_va; // @[pfu.scala 598:45]
  assign ct_lsu_pfu_pfb_entry_1_st_da_ppn_ff = st_da_ppn_ff; // @[pfu.scala 599:44]
  assign ct_lsu_pfu_pfb_entry_2_amr_wa_cancel = amr_wa_cancel; // @[pfu.scala 532:45]
  assign ct_lsu_pfu_pfb_entry_2_cp0_lsu_icg_en = cp0_lsu_icg_en; // @[pfu.scala 533:46]
  assign ct_lsu_pfu_pfb_entry_2_cp0_lsu_l2_st_pref_en = cp0_lsu_l2_st_pref_en; // @[pfu.scala 534:53]
  assign ct_lsu_pfu_pfb_entry_2_cp0_lsu_pfu_mmu_dis = cp0_lsu_pfu_mmu_dis; // @[pfu.scala 535:51]
  assign ct_lsu_pfu_pfb_entry_2_cp0_yy_clk_en = cp0_yy_clk_en; // @[pfu.scala 536:45]
  assign ct_lsu_pfu_pfb_entry_2_cp0_yy_priv_mode = cp0_yy_priv_mode; // @[pfu.scala 537:48]
  assign ct_lsu_pfu_pfb_entry_2_cpurst_b = cpurst_b; // @[pfu.scala 538:40]
  assign ct_lsu_pfu_pfb_entry_2_ld_da_ldfifo_pc = ld_da_ldfifo_pc; // @[pfu.scala 539:47]
  assign ct_lsu_pfu_pfb_entry_2_ld_da_page_sec_ff = ld_da_page_sec_ff; // @[pfu.scala 540:49]
  assign ct_lsu_pfu_pfb_entry_2_ld_da_page_share_ff = ld_da_page_share_ff; // @[pfu.scala 541:51]
  assign ct_lsu_pfu_pfb_entry_2_ld_da_pfu_act_dp_vld = ld_da_pfu_act_dp_vld; // @[pfu.scala 542:52]
  assign ct_lsu_pfu_pfb_entry_2_ld_da_pfu_act_vld = ld_da_pfu_act_vld; // @[pfu.scala 543:49]
  assign ct_lsu_pfu_pfb_entry_2_ld_da_pfu_evict_cnt_vld = ld_da_pfu_evict_cnt_vld; // @[pfu.scala 544:55]
  assign ct_lsu_pfu_pfb_entry_2_ld_da_pfu_pf_inst_vld = ld_da_pfu_pf_inst_vld; // @[pfu.scala 545:53]
  assign ct_lsu_pfu_pfb_entry_2_ld_da_ppfu_va = ld_da_ppfu_va; // @[pfu.scala 546:45]
  assign ct_lsu_pfu_pfb_entry_2_ld_da_ppn_ff = ld_da_ppn_ff; // @[pfu.scala 547:44]
  assign ct_lsu_pfu_pfb_entry_2_lsu_pfu_l1_dist_sel = lsu_pfu_l1_dist_sel; // @[pfu.scala 548:51]
  assign ct_lsu_pfu_pfb_entry_2_lsu_pfu_l2_dist_sel = lsu_pfu_l2_dist_sel; // @[pfu.scala 549:51]
  assign ct_lsu_pfu_pfb_entry_2_lsu_special_clk = lsu_special_clk; // @[pfu.scala 550:69]
  assign ct_lsu_pfu_pfb_entry_2_pad_yy_icg_scan_en = pad_yy_icg_scan_en; // @[pfu.scala 551:50]
  assign ct_lsu_pfu_pfb_entry_2_pfb_no_req_cnt_val = 6'h0;
  assign ct_lsu_pfu_pfb_entry_2_pfb_timeout_cnt_val = 8'h0;
  assign ct_lsu_pfu_pfb_entry_2_pfu_biu_pe_req_sel_l1 = 1'h0;
  assign ct_lsu_pfu_pfb_entry_2_pfu_dcache_pref_en = 1'h0;
  assign ct_lsu_pfu_pfb_entry_2_pfu_get_page_sec = 1'h0;
  assign ct_lsu_pfu_pfb_entry_2_pfu_get_page_share = 1'h0;
  assign ct_lsu_pfu_pfb_entry_2_pfu_get_ppn = 28'h0;
  assign ct_lsu_pfu_pfb_entry_2_pfu_get_ppn_err = 1'h0;
  assign ct_lsu_pfu_pfb_entry_2_pfu_get_ppn_vld = 1'h0;
  assign ct_lsu_pfu_pfb_entry_2_pfu_l2_pref_en = 1'h0;
  assign ct_lsu_pfu_pfb_entry_2_pfu_mmu_pe_req_sel_l1 = 1'h0;
  assign ct_lsu_pfu_pfb_entry_2_pfu_pfb_create_pc = 15'h0;
  assign ct_lsu_pfu_pfb_entry_2_pfu_pfb_create_stride = 11'h0;
  assign ct_lsu_pfu_pfb_entry_2_pfu_pfb_create_stride_neg = 1'h0;
  assign ct_lsu_pfu_pfb_entry_2_pfu_pfb_create_strideh_6to0 = 7'h0;
  assign ct_lsu_pfu_pfb_entry_2_pfu_pfb_create_type_ld = 1'h0;
  assign ct_lsu_pfu_pfb_entry_2_pfu_pfb_entry_biu_pe_req_grnt_x = pfu_pfb_entry_biu_pe_req_grnt[2]; // @[pfu.scala 568:95]
  assign ct_lsu_pfu_pfb_entry_2_pfu_pfb_entry_create_dp_vld_x = pfu_pfb_entry_create_dp_vld[2]; // @[pfu.scala 571:91]
  assign ct_lsu_pfu_pfb_entry_2_pfu_pfb_entry_create_gateclk_en_x = pfu_pfb_entry_create_dp_vld[2]; // @[pfu.scala 572:99]
  assign ct_lsu_pfu_pfb_entry_2_pfu_pfb_entry_create_vld_x = pfu_pfb_entry_create_dp_vld[2]; // @[pfu.scala 573:85]
  assign ct_lsu_pfu_pfb_entry_2_pfu_pfb_entry_from_lfb_dcache_hit_x = pfu_pfb_entry_from_lfb_dcache_hit[2]; // @[pfu.scala 575:103]
  assign ct_lsu_pfu_pfb_entry_2_pfu_pfb_entry_from_lfb_dcache_miss_x = pfu_pfb_entry_from_lfb_dcache_miss[2]; // @[pfu.scala 576:105]
  assign ct_lsu_pfu_pfb_entry_2_pfu_pfb_entry_mmu_pe_req_grnt_x = pfu_pfb_entry_mmu_pe_req_grnt[2]; // @[pfu.scala 586:95]
  assign ct_lsu_pfu_pfb_entry_2_pfu_pop_all_part_vld = 1'h0;
  assign ct_lsu_pfu_pfb_entry_2_st_da_page_sec_ff = st_da_page_sec_ff; // @[pfu.scala 592:49]
  assign ct_lsu_pfu_pfb_entry_2_st_da_page_share_ff = st_da_page_share_ff; // @[pfu.scala 593:51]
  assign ct_lsu_pfu_pfb_entry_2_st_da_pc = st_da_pc; // @[pfu.scala 594:40]
  assign ct_lsu_pfu_pfb_entry_2_st_da_pfu_act_vld = st_da_pfu_act_vld; // @[pfu.scala 595:49]
  assign ct_lsu_pfu_pfb_entry_2_st_da_pfu_evict_cnt_vld = st_da_pfu_evict_cnt_vld; // @[pfu.scala 596:55]
  assign ct_lsu_pfu_pfb_entry_2_st_da_pfu_pf_inst_vld = st_da_pfu_pf_inst_vld; // @[pfu.scala 597:53]
  assign ct_lsu_pfu_pfb_entry_2_st_da_ppfu_va = st_da_ppfu_va; // @[pfu.scala 598:45]
  assign ct_lsu_pfu_pfb_entry_2_st_da_ppn_ff = st_da_ppn_ff; // @[pfu.scala 599:44]
  assign ct_lsu_pfu_pfb_entry_3_amr_wa_cancel = amr_wa_cancel; // @[pfu.scala 532:45]
  assign ct_lsu_pfu_pfb_entry_3_cp0_lsu_icg_en = cp0_lsu_icg_en; // @[pfu.scala 533:46]
  assign ct_lsu_pfu_pfb_entry_3_cp0_lsu_l2_st_pref_en = cp0_lsu_l2_st_pref_en; // @[pfu.scala 534:53]
  assign ct_lsu_pfu_pfb_entry_3_cp0_lsu_pfu_mmu_dis = cp0_lsu_pfu_mmu_dis; // @[pfu.scala 535:51]
  assign ct_lsu_pfu_pfb_entry_3_cp0_yy_clk_en = cp0_yy_clk_en; // @[pfu.scala 536:45]
  assign ct_lsu_pfu_pfb_entry_3_cp0_yy_priv_mode = cp0_yy_priv_mode; // @[pfu.scala 537:48]
  assign ct_lsu_pfu_pfb_entry_3_cpurst_b = cpurst_b; // @[pfu.scala 538:40]
  assign ct_lsu_pfu_pfb_entry_3_ld_da_ldfifo_pc = ld_da_ldfifo_pc; // @[pfu.scala 539:47]
  assign ct_lsu_pfu_pfb_entry_3_ld_da_page_sec_ff = ld_da_page_sec_ff; // @[pfu.scala 540:49]
  assign ct_lsu_pfu_pfb_entry_3_ld_da_page_share_ff = ld_da_page_share_ff; // @[pfu.scala 541:51]
  assign ct_lsu_pfu_pfb_entry_3_ld_da_pfu_act_dp_vld = ld_da_pfu_act_dp_vld; // @[pfu.scala 542:52]
  assign ct_lsu_pfu_pfb_entry_3_ld_da_pfu_act_vld = ld_da_pfu_act_vld; // @[pfu.scala 543:49]
  assign ct_lsu_pfu_pfb_entry_3_ld_da_pfu_evict_cnt_vld = ld_da_pfu_evict_cnt_vld; // @[pfu.scala 544:55]
  assign ct_lsu_pfu_pfb_entry_3_ld_da_pfu_pf_inst_vld = ld_da_pfu_pf_inst_vld; // @[pfu.scala 545:53]
  assign ct_lsu_pfu_pfb_entry_3_ld_da_ppfu_va = ld_da_ppfu_va; // @[pfu.scala 546:45]
  assign ct_lsu_pfu_pfb_entry_3_ld_da_ppn_ff = ld_da_ppn_ff; // @[pfu.scala 547:44]
  assign ct_lsu_pfu_pfb_entry_3_lsu_pfu_l1_dist_sel = lsu_pfu_l1_dist_sel; // @[pfu.scala 548:51]
  assign ct_lsu_pfu_pfb_entry_3_lsu_pfu_l2_dist_sel = lsu_pfu_l2_dist_sel; // @[pfu.scala 549:51]
  assign ct_lsu_pfu_pfb_entry_3_lsu_special_clk = lsu_special_clk; // @[pfu.scala 550:69]
  assign ct_lsu_pfu_pfb_entry_3_pad_yy_icg_scan_en = pad_yy_icg_scan_en; // @[pfu.scala 551:50]
  assign ct_lsu_pfu_pfb_entry_3_pfb_no_req_cnt_val = 6'h0;
  assign ct_lsu_pfu_pfb_entry_3_pfb_timeout_cnt_val = 8'h0;
  assign ct_lsu_pfu_pfb_entry_3_pfu_biu_pe_req_sel_l1 = 1'h0;
  assign ct_lsu_pfu_pfb_entry_3_pfu_dcache_pref_en = 1'h0;
  assign ct_lsu_pfu_pfb_entry_3_pfu_get_page_sec = 1'h0;
  assign ct_lsu_pfu_pfb_entry_3_pfu_get_page_share = 1'h0;
  assign ct_lsu_pfu_pfb_entry_3_pfu_get_ppn = 28'h0;
  assign ct_lsu_pfu_pfb_entry_3_pfu_get_ppn_err = 1'h0;
  assign ct_lsu_pfu_pfb_entry_3_pfu_get_ppn_vld = 1'h0;
  assign ct_lsu_pfu_pfb_entry_3_pfu_l2_pref_en = 1'h0;
  assign ct_lsu_pfu_pfb_entry_3_pfu_mmu_pe_req_sel_l1 = 1'h0;
  assign ct_lsu_pfu_pfb_entry_3_pfu_pfb_create_pc = 15'h0;
  assign ct_lsu_pfu_pfb_entry_3_pfu_pfb_create_stride = 11'h0;
  assign ct_lsu_pfu_pfb_entry_3_pfu_pfb_create_stride_neg = 1'h0;
  assign ct_lsu_pfu_pfb_entry_3_pfu_pfb_create_strideh_6to0 = 7'h0;
  assign ct_lsu_pfu_pfb_entry_3_pfu_pfb_create_type_ld = 1'h0;
  assign ct_lsu_pfu_pfb_entry_3_pfu_pfb_entry_biu_pe_req_grnt_x = pfu_pfb_entry_biu_pe_req_grnt[3]; // @[pfu.scala 568:95]
  assign ct_lsu_pfu_pfb_entry_3_pfu_pfb_entry_create_dp_vld_x = pfu_pfb_entry_create_dp_vld[3]; // @[pfu.scala 571:91]
  assign ct_lsu_pfu_pfb_entry_3_pfu_pfb_entry_create_gateclk_en_x = pfu_pfb_entry_create_dp_vld[3]; // @[pfu.scala 572:99]
  assign ct_lsu_pfu_pfb_entry_3_pfu_pfb_entry_create_vld_x = pfu_pfb_entry_create_dp_vld[3]; // @[pfu.scala 573:85]
  assign ct_lsu_pfu_pfb_entry_3_pfu_pfb_entry_from_lfb_dcache_hit_x = pfu_pfb_entry_from_lfb_dcache_hit[3]; // @[pfu.scala 575:103]
  assign ct_lsu_pfu_pfb_entry_3_pfu_pfb_entry_from_lfb_dcache_miss_x = pfu_pfb_entry_from_lfb_dcache_miss[3]; // @[pfu.scala 576:105]
  assign ct_lsu_pfu_pfb_entry_3_pfu_pfb_entry_mmu_pe_req_grnt_x = pfu_pfb_entry_mmu_pe_req_grnt[3]; // @[pfu.scala 586:95]
  assign ct_lsu_pfu_pfb_entry_3_pfu_pop_all_part_vld = 1'h0;
  assign ct_lsu_pfu_pfb_entry_3_st_da_page_sec_ff = st_da_page_sec_ff; // @[pfu.scala 592:49]
  assign ct_lsu_pfu_pfb_entry_3_st_da_page_share_ff = st_da_page_share_ff; // @[pfu.scala 593:51]
  assign ct_lsu_pfu_pfb_entry_3_st_da_pc = st_da_pc; // @[pfu.scala 594:40]
  assign ct_lsu_pfu_pfb_entry_3_st_da_pfu_act_vld = st_da_pfu_act_vld; // @[pfu.scala 595:49]
  assign ct_lsu_pfu_pfb_entry_3_st_da_pfu_evict_cnt_vld = st_da_pfu_evict_cnt_vld; // @[pfu.scala 596:55]
  assign ct_lsu_pfu_pfb_entry_3_st_da_pfu_pf_inst_vld = st_da_pfu_pf_inst_vld; // @[pfu.scala 597:53]
  assign ct_lsu_pfu_pfb_entry_3_st_da_ppfu_va = st_da_ppfu_va; // @[pfu.scala 598:45]
  assign ct_lsu_pfu_pfb_entry_3_st_da_ppn_ff = st_da_ppn_ff; // @[pfu.scala 599:44]
  assign ct_lsu_pfu_pfb_entry_4_amr_wa_cancel = amr_wa_cancel; // @[pfu.scala 532:45]
  assign ct_lsu_pfu_pfb_entry_4_cp0_lsu_icg_en = cp0_lsu_icg_en; // @[pfu.scala 533:46]
  assign ct_lsu_pfu_pfb_entry_4_cp0_lsu_l2_st_pref_en = cp0_lsu_l2_st_pref_en; // @[pfu.scala 534:53]
  assign ct_lsu_pfu_pfb_entry_4_cp0_lsu_pfu_mmu_dis = cp0_lsu_pfu_mmu_dis; // @[pfu.scala 535:51]
  assign ct_lsu_pfu_pfb_entry_4_cp0_yy_clk_en = cp0_yy_clk_en; // @[pfu.scala 536:45]
  assign ct_lsu_pfu_pfb_entry_4_cp0_yy_priv_mode = cp0_yy_priv_mode; // @[pfu.scala 537:48]
  assign ct_lsu_pfu_pfb_entry_4_cpurst_b = cpurst_b; // @[pfu.scala 538:40]
  assign ct_lsu_pfu_pfb_entry_4_ld_da_ldfifo_pc = ld_da_ldfifo_pc; // @[pfu.scala 539:47]
  assign ct_lsu_pfu_pfb_entry_4_ld_da_page_sec_ff = ld_da_page_sec_ff; // @[pfu.scala 540:49]
  assign ct_lsu_pfu_pfb_entry_4_ld_da_page_share_ff = ld_da_page_share_ff; // @[pfu.scala 541:51]
  assign ct_lsu_pfu_pfb_entry_4_ld_da_pfu_act_dp_vld = ld_da_pfu_act_dp_vld; // @[pfu.scala 542:52]
  assign ct_lsu_pfu_pfb_entry_4_ld_da_pfu_act_vld = ld_da_pfu_act_vld; // @[pfu.scala 543:49]
  assign ct_lsu_pfu_pfb_entry_4_ld_da_pfu_evict_cnt_vld = ld_da_pfu_evict_cnt_vld; // @[pfu.scala 544:55]
  assign ct_lsu_pfu_pfb_entry_4_ld_da_pfu_pf_inst_vld = ld_da_pfu_pf_inst_vld; // @[pfu.scala 545:53]
  assign ct_lsu_pfu_pfb_entry_4_ld_da_ppfu_va = ld_da_ppfu_va; // @[pfu.scala 546:45]
  assign ct_lsu_pfu_pfb_entry_4_ld_da_ppn_ff = ld_da_ppn_ff; // @[pfu.scala 547:44]
  assign ct_lsu_pfu_pfb_entry_4_lsu_pfu_l1_dist_sel = lsu_pfu_l1_dist_sel; // @[pfu.scala 548:51]
  assign ct_lsu_pfu_pfb_entry_4_lsu_pfu_l2_dist_sel = lsu_pfu_l2_dist_sel; // @[pfu.scala 549:51]
  assign ct_lsu_pfu_pfb_entry_4_lsu_special_clk = lsu_special_clk; // @[pfu.scala 550:69]
  assign ct_lsu_pfu_pfb_entry_4_pad_yy_icg_scan_en = pad_yy_icg_scan_en; // @[pfu.scala 551:50]
  assign ct_lsu_pfu_pfb_entry_4_pfb_no_req_cnt_val = 6'h0;
  assign ct_lsu_pfu_pfb_entry_4_pfb_timeout_cnt_val = 8'h0;
  assign ct_lsu_pfu_pfb_entry_4_pfu_biu_pe_req_sel_l1 = 1'h0;
  assign ct_lsu_pfu_pfb_entry_4_pfu_dcache_pref_en = 1'h0;
  assign ct_lsu_pfu_pfb_entry_4_pfu_get_page_sec = 1'h0;
  assign ct_lsu_pfu_pfb_entry_4_pfu_get_page_share = 1'h0;
  assign ct_lsu_pfu_pfb_entry_4_pfu_get_ppn = 28'h0;
  assign ct_lsu_pfu_pfb_entry_4_pfu_get_ppn_err = 1'h0;
  assign ct_lsu_pfu_pfb_entry_4_pfu_get_ppn_vld = 1'h0;
  assign ct_lsu_pfu_pfb_entry_4_pfu_l2_pref_en = 1'h0;
  assign ct_lsu_pfu_pfb_entry_4_pfu_mmu_pe_req_sel_l1 = 1'h0;
  assign ct_lsu_pfu_pfb_entry_4_pfu_pfb_create_pc = 15'h0;
  assign ct_lsu_pfu_pfb_entry_4_pfu_pfb_create_stride = 11'h0;
  assign ct_lsu_pfu_pfb_entry_4_pfu_pfb_create_stride_neg = 1'h0;
  assign ct_lsu_pfu_pfb_entry_4_pfu_pfb_create_strideh_6to0 = 7'h0;
  assign ct_lsu_pfu_pfb_entry_4_pfu_pfb_create_type_ld = 1'h0;
  assign ct_lsu_pfu_pfb_entry_4_pfu_pfb_entry_biu_pe_req_grnt_x = pfu_pfb_entry_biu_pe_req_grnt[4]; // @[pfu.scala 568:95]
  assign ct_lsu_pfu_pfb_entry_4_pfu_pfb_entry_create_dp_vld_x = pfu_pfb_entry_create_dp_vld[4]; // @[pfu.scala 571:91]
  assign ct_lsu_pfu_pfb_entry_4_pfu_pfb_entry_create_gateclk_en_x = pfu_pfb_entry_create_dp_vld[4]; // @[pfu.scala 572:99]
  assign ct_lsu_pfu_pfb_entry_4_pfu_pfb_entry_create_vld_x = pfu_pfb_entry_create_dp_vld[4]; // @[pfu.scala 573:85]
  assign ct_lsu_pfu_pfb_entry_4_pfu_pfb_entry_from_lfb_dcache_hit_x = pfu_pfb_entry_from_lfb_dcache_hit[4]; // @[pfu.scala 575:103]
  assign ct_lsu_pfu_pfb_entry_4_pfu_pfb_entry_from_lfb_dcache_miss_x = pfu_pfb_entry_from_lfb_dcache_miss[4]; // @[pfu.scala 576:105]
  assign ct_lsu_pfu_pfb_entry_4_pfu_pfb_entry_mmu_pe_req_grnt_x = pfu_pfb_entry_mmu_pe_req_grnt[4]; // @[pfu.scala 586:95]
  assign ct_lsu_pfu_pfb_entry_4_pfu_pop_all_part_vld = 1'h0;
  assign ct_lsu_pfu_pfb_entry_4_st_da_page_sec_ff = st_da_page_sec_ff; // @[pfu.scala 592:49]
  assign ct_lsu_pfu_pfb_entry_4_st_da_page_share_ff = st_da_page_share_ff; // @[pfu.scala 593:51]
  assign ct_lsu_pfu_pfb_entry_4_st_da_pc = st_da_pc; // @[pfu.scala 594:40]
  assign ct_lsu_pfu_pfb_entry_4_st_da_pfu_act_vld = st_da_pfu_act_vld; // @[pfu.scala 595:49]
  assign ct_lsu_pfu_pfb_entry_4_st_da_pfu_evict_cnt_vld = st_da_pfu_evict_cnt_vld; // @[pfu.scala 596:55]
  assign ct_lsu_pfu_pfb_entry_4_st_da_pfu_pf_inst_vld = st_da_pfu_pf_inst_vld; // @[pfu.scala 597:53]
  assign ct_lsu_pfu_pfb_entry_4_st_da_ppfu_va = st_da_ppfu_va; // @[pfu.scala 598:45]
  assign ct_lsu_pfu_pfb_entry_4_st_da_ppn_ff = st_da_ppn_ff; // @[pfu.scala 599:44]
  assign ct_lsu_pfu_pfb_entry_5_amr_wa_cancel = amr_wa_cancel; // @[pfu.scala 532:45]
  assign ct_lsu_pfu_pfb_entry_5_cp0_lsu_icg_en = cp0_lsu_icg_en; // @[pfu.scala 533:46]
  assign ct_lsu_pfu_pfb_entry_5_cp0_lsu_l2_st_pref_en = cp0_lsu_l2_st_pref_en; // @[pfu.scala 534:53]
  assign ct_lsu_pfu_pfb_entry_5_cp0_lsu_pfu_mmu_dis = cp0_lsu_pfu_mmu_dis; // @[pfu.scala 535:51]
  assign ct_lsu_pfu_pfb_entry_5_cp0_yy_clk_en = cp0_yy_clk_en; // @[pfu.scala 536:45]
  assign ct_lsu_pfu_pfb_entry_5_cp0_yy_priv_mode = cp0_yy_priv_mode; // @[pfu.scala 537:48]
  assign ct_lsu_pfu_pfb_entry_5_cpurst_b = cpurst_b; // @[pfu.scala 538:40]
  assign ct_lsu_pfu_pfb_entry_5_ld_da_ldfifo_pc = ld_da_ldfifo_pc; // @[pfu.scala 539:47]
  assign ct_lsu_pfu_pfb_entry_5_ld_da_page_sec_ff = ld_da_page_sec_ff; // @[pfu.scala 540:49]
  assign ct_lsu_pfu_pfb_entry_5_ld_da_page_share_ff = ld_da_page_share_ff; // @[pfu.scala 541:51]
  assign ct_lsu_pfu_pfb_entry_5_ld_da_pfu_act_dp_vld = ld_da_pfu_act_dp_vld; // @[pfu.scala 542:52]
  assign ct_lsu_pfu_pfb_entry_5_ld_da_pfu_act_vld = ld_da_pfu_act_vld; // @[pfu.scala 543:49]
  assign ct_lsu_pfu_pfb_entry_5_ld_da_pfu_evict_cnt_vld = ld_da_pfu_evict_cnt_vld; // @[pfu.scala 544:55]
  assign ct_lsu_pfu_pfb_entry_5_ld_da_pfu_pf_inst_vld = ld_da_pfu_pf_inst_vld; // @[pfu.scala 545:53]
  assign ct_lsu_pfu_pfb_entry_5_ld_da_ppfu_va = ld_da_ppfu_va; // @[pfu.scala 546:45]
  assign ct_lsu_pfu_pfb_entry_5_ld_da_ppn_ff = ld_da_ppn_ff; // @[pfu.scala 547:44]
  assign ct_lsu_pfu_pfb_entry_5_lsu_pfu_l1_dist_sel = lsu_pfu_l1_dist_sel; // @[pfu.scala 548:51]
  assign ct_lsu_pfu_pfb_entry_5_lsu_pfu_l2_dist_sel = lsu_pfu_l2_dist_sel; // @[pfu.scala 549:51]
  assign ct_lsu_pfu_pfb_entry_5_lsu_special_clk = lsu_special_clk; // @[pfu.scala 550:69]
  assign ct_lsu_pfu_pfb_entry_5_pad_yy_icg_scan_en = pad_yy_icg_scan_en; // @[pfu.scala 551:50]
  assign ct_lsu_pfu_pfb_entry_5_pfb_no_req_cnt_val = 6'h0;
  assign ct_lsu_pfu_pfb_entry_5_pfb_timeout_cnt_val = 8'h0;
  assign ct_lsu_pfu_pfb_entry_5_pfu_biu_pe_req_sel_l1 = 1'h0;
  assign ct_lsu_pfu_pfb_entry_5_pfu_dcache_pref_en = 1'h0;
  assign ct_lsu_pfu_pfb_entry_5_pfu_get_page_sec = 1'h0;
  assign ct_lsu_pfu_pfb_entry_5_pfu_get_page_share = 1'h0;
  assign ct_lsu_pfu_pfb_entry_5_pfu_get_ppn = 28'h0;
  assign ct_lsu_pfu_pfb_entry_5_pfu_get_ppn_err = 1'h0;
  assign ct_lsu_pfu_pfb_entry_5_pfu_get_ppn_vld = 1'h0;
  assign ct_lsu_pfu_pfb_entry_5_pfu_l2_pref_en = 1'h0;
  assign ct_lsu_pfu_pfb_entry_5_pfu_mmu_pe_req_sel_l1 = 1'h0;
  assign ct_lsu_pfu_pfb_entry_5_pfu_pfb_create_pc = 15'h0;
  assign ct_lsu_pfu_pfb_entry_5_pfu_pfb_create_stride = 11'h0;
  assign ct_lsu_pfu_pfb_entry_5_pfu_pfb_create_stride_neg = 1'h0;
  assign ct_lsu_pfu_pfb_entry_5_pfu_pfb_create_strideh_6to0 = 7'h0;
  assign ct_lsu_pfu_pfb_entry_5_pfu_pfb_create_type_ld = 1'h0;
  assign ct_lsu_pfu_pfb_entry_5_pfu_pfb_entry_biu_pe_req_grnt_x = pfu_pfb_entry_biu_pe_req_grnt[5]; // @[pfu.scala 568:95]
  assign ct_lsu_pfu_pfb_entry_5_pfu_pfb_entry_create_dp_vld_x = pfu_pfb_entry_create_dp_vld[5]; // @[pfu.scala 571:91]
  assign ct_lsu_pfu_pfb_entry_5_pfu_pfb_entry_create_gateclk_en_x = pfu_pfb_entry_create_dp_vld[5]; // @[pfu.scala 572:99]
  assign ct_lsu_pfu_pfb_entry_5_pfu_pfb_entry_create_vld_x = pfu_pfb_entry_create_dp_vld[5]; // @[pfu.scala 573:85]
  assign ct_lsu_pfu_pfb_entry_5_pfu_pfb_entry_from_lfb_dcache_hit_x = pfu_pfb_entry_from_lfb_dcache_hit[5]; // @[pfu.scala 575:103]
  assign ct_lsu_pfu_pfb_entry_5_pfu_pfb_entry_from_lfb_dcache_miss_x = pfu_pfb_entry_from_lfb_dcache_miss[5]; // @[pfu.scala 576:105]
  assign ct_lsu_pfu_pfb_entry_5_pfu_pfb_entry_mmu_pe_req_grnt_x = pfu_pfb_entry_mmu_pe_req_grnt[5]; // @[pfu.scala 586:95]
  assign ct_lsu_pfu_pfb_entry_5_pfu_pop_all_part_vld = 1'h0;
  assign ct_lsu_pfu_pfb_entry_5_st_da_page_sec_ff = st_da_page_sec_ff; // @[pfu.scala 592:49]
  assign ct_lsu_pfu_pfb_entry_5_st_da_page_share_ff = st_da_page_share_ff; // @[pfu.scala 593:51]
  assign ct_lsu_pfu_pfb_entry_5_st_da_pc = st_da_pc; // @[pfu.scala 594:40]
  assign ct_lsu_pfu_pfb_entry_5_st_da_pfu_act_vld = st_da_pfu_act_vld; // @[pfu.scala 595:49]
  assign ct_lsu_pfu_pfb_entry_5_st_da_pfu_evict_cnt_vld = st_da_pfu_evict_cnt_vld; // @[pfu.scala 596:55]
  assign ct_lsu_pfu_pfb_entry_5_st_da_pfu_pf_inst_vld = st_da_pfu_pf_inst_vld; // @[pfu.scala 597:53]
  assign ct_lsu_pfu_pfb_entry_5_st_da_ppfu_va = st_da_ppfu_va; // @[pfu.scala 598:45]
  assign ct_lsu_pfu_pfb_entry_5_st_da_ppn_ff = st_da_ppn_ff; // @[pfu.scala 599:44]
  assign ct_lsu_pfu_pfb_entry_6_amr_wa_cancel = amr_wa_cancel; // @[pfu.scala 532:45]
  assign ct_lsu_pfu_pfb_entry_6_cp0_lsu_icg_en = cp0_lsu_icg_en; // @[pfu.scala 533:46]
  assign ct_lsu_pfu_pfb_entry_6_cp0_lsu_l2_st_pref_en = cp0_lsu_l2_st_pref_en; // @[pfu.scala 534:53]
  assign ct_lsu_pfu_pfb_entry_6_cp0_lsu_pfu_mmu_dis = cp0_lsu_pfu_mmu_dis; // @[pfu.scala 535:51]
  assign ct_lsu_pfu_pfb_entry_6_cp0_yy_clk_en = cp0_yy_clk_en; // @[pfu.scala 536:45]
  assign ct_lsu_pfu_pfb_entry_6_cp0_yy_priv_mode = cp0_yy_priv_mode; // @[pfu.scala 537:48]
  assign ct_lsu_pfu_pfb_entry_6_cpurst_b = cpurst_b; // @[pfu.scala 538:40]
  assign ct_lsu_pfu_pfb_entry_6_ld_da_ldfifo_pc = ld_da_ldfifo_pc; // @[pfu.scala 539:47]
  assign ct_lsu_pfu_pfb_entry_6_ld_da_page_sec_ff = ld_da_page_sec_ff; // @[pfu.scala 540:49]
  assign ct_lsu_pfu_pfb_entry_6_ld_da_page_share_ff = ld_da_page_share_ff; // @[pfu.scala 541:51]
  assign ct_lsu_pfu_pfb_entry_6_ld_da_pfu_act_dp_vld = ld_da_pfu_act_dp_vld; // @[pfu.scala 542:52]
  assign ct_lsu_pfu_pfb_entry_6_ld_da_pfu_act_vld = ld_da_pfu_act_vld; // @[pfu.scala 543:49]
  assign ct_lsu_pfu_pfb_entry_6_ld_da_pfu_evict_cnt_vld = ld_da_pfu_evict_cnt_vld; // @[pfu.scala 544:55]
  assign ct_lsu_pfu_pfb_entry_6_ld_da_pfu_pf_inst_vld = ld_da_pfu_pf_inst_vld; // @[pfu.scala 545:53]
  assign ct_lsu_pfu_pfb_entry_6_ld_da_ppfu_va = ld_da_ppfu_va; // @[pfu.scala 546:45]
  assign ct_lsu_pfu_pfb_entry_6_ld_da_ppn_ff = ld_da_ppn_ff; // @[pfu.scala 547:44]
  assign ct_lsu_pfu_pfb_entry_6_lsu_pfu_l1_dist_sel = lsu_pfu_l1_dist_sel; // @[pfu.scala 548:51]
  assign ct_lsu_pfu_pfb_entry_6_lsu_pfu_l2_dist_sel = lsu_pfu_l2_dist_sel; // @[pfu.scala 549:51]
  assign ct_lsu_pfu_pfb_entry_6_lsu_special_clk = lsu_special_clk; // @[pfu.scala 550:69]
  assign ct_lsu_pfu_pfb_entry_6_pad_yy_icg_scan_en = pad_yy_icg_scan_en; // @[pfu.scala 551:50]
  assign ct_lsu_pfu_pfb_entry_6_pfb_no_req_cnt_val = 6'h0;
  assign ct_lsu_pfu_pfb_entry_6_pfb_timeout_cnt_val = 8'h0;
  assign ct_lsu_pfu_pfb_entry_6_pfu_biu_pe_req_sel_l1 = 1'h0;
  assign ct_lsu_pfu_pfb_entry_6_pfu_dcache_pref_en = 1'h0;
  assign ct_lsu_pfu_pfb_entry_6_pfu_get_page_sec = 1'h0;
  assign ct_lsu_pfu_pfb_entry_6_pfu_get_page_share = 1'h0;
  assign ct_lsu_pfu_pfb_entry_6_pfu_get_ppn = 28'h0;
  assign ct_lsu_pfu_pfb_entry_6_pfu_get_ppn_err = 1'h0;
  assign ct_lsu_pfu_pfb_entry_6_pfu_get_ppn_vld = 1'h0;
  assign ct_lsu_pfu_pfb_entry_6_pfu_l2_pref_en = 1'h0;
  assign ct_lsu_pfu_pfb_entry_6_pfu_mmu_pe_req_sel_l1 = 1'h0;
  assign ct_lsu_pfu_pfb_entry_6_pfu_pfb_create_pc = 15'h0;
  assign ct_lsu_pfu_pfb_entry_6_pfu_pfb_create_stride = 11'h0;
  assign ct_lsu_pfu_pfb_entry_6_pfu_pfb_create_stride_neg = 1'h0;
  assign ct_lsu_pfu_pfb_entry_6_pfu_pfb_create_strideh_6to0 = 7'h0;
  assign ct_lsu_pfu_pfb_entry_6_pfu_pfb_create_type_ld = 1'h0;
  assign ct_lsu_pfu_pfb_entry_6_pfu_pfb_entry_biu_pe_req_grnt_x = pfu_pfb_entry_biu_pe_req_grnt[6]; // @[pfu.scala 568:95]
  assign ct_lsu_pfu_pfb_entry_6_pfu_pfb_entry_create_dp_vld_x = pfu_pfb_entry_create_dp_vld[6]; // @[pfu.scala 571:91]
  assign ct_lsu_pfu_pfb_entry_6_pfu_pfb_entry_create_gateclk_en_x = pfu_pfb_entry_create_dp_vld[6]; // @[pfu.scala 572:99]
  assign ct_lsu_pfu_pfb_entry_6_pfu_pfb_entry_create_vld_x = pfu_pfb_entry_create_dp_vld[6]; // @[pfu.scala 573:85]
  assign ct_lsu_pfu_pfb_entry_6_pfu_pfb_entry_from_lfb_dcache_hit_x = pfu_pfb_entry_from_lfb_dcache_hit[6]; // @[pfu.scala 575:103]
  assign ct_lsu_pfu_pfb_entry_6_pfu_pfb_entry_from_lfb_dcache_miss_x = pfu_pfb_entry_from_lfb_dcache_miss[6]; // @[pfu.scala 576:105]
  assign ct_lsu_pfu_pfb_entry_6_pfu_pfb_entry_mmu_pe_req_grnt_x = pfu_pfb_entry_mmu_pe_req_grnt[6]; // @[pfu.scala 586:95]
  assign ct_lsu_pfu_pfb_entry_6_pfu_pop_all_part_vld = 1'h0;
  assign ct_lsu_pfu_pfb_entry_6_st_da_page_sec_ff = st_da_page_sec_ff; // @[pfu.scala 592:49]
  assign ct_lsu_pfu_pfb_entry_6_st_da_page_share_ff = st_da_page_share_ff; // @[pfu.scala 593:51]
  assign ct_lsu_pfu_pfb_entry_6_st_da_pc = st_da_pc; // @[pfu.scala 594:40]
  assign ct_lsu_pfu_pfb_entry_6_st_da_pfu_act_vld = st_da_pfu_act_vld; // @[pfu.scala 595:49]
  assign ct_lsu_pfu_pfb_entry_6_st_da_pfu_evict_cnt_vld = st_da_pfu_evict_cnt_vld; // @[pfu.scala 596:55]
  assign ct_lsu_pfu_pfb_entry_6_st_da_pfu_pf_inst_vld = st_da_pfu_pf_inst_vld; // @[pfu.scala 597:53]
  assign ct_lsu_pfu_pfb_entry_6_st_da_ppfu_va = st_da_ppfu_va; // @[pfu.scala 598:45]
  assign ct_lsu_pfu_pfb_entry_6_st_da_ppn_ff = st_da_ppn_ff; // @[pfu.scala 599:44]
  assign ct_lsu_pfu_pfb_entry_7_amr_wa_cancel = amr_wa_cancel; // @[pfu.scala 532:45]
  assign ct_lsu_pfu_pfb_entry_7_cp0_lsu_icg_en = cp0_lsu_icg_en; // @[pfu.scala 533:46]
  assign ct_lsu_pfu_pfb_entry_7_cp0_lsu_l2_st_pref_en = cp0_lsu_l2_st_pref_en; // @[pfu.scala 534:53]
  assign ct_lsu_pfu_pfb_entry_7_cp0_lsu_pfu_mmu_dis = cp0_lsu_pfu_mmu_dis; // @[pfu.scala 535:51]
  assign ct_lsu_pfu_pfb_entry_7_cp0_yy_clk_en = cp0_yy_clk_en; // @[pfu.scala 536:45]
  assign ct_lsu_pfu_pfb_entry_7_cp0_yy_priv_mode = cp0_yy_priv_mode; // @[pfu.scala 537:48]
  assign ct_lsu_pfu_pfb_entry_7_cpurst_b = cpurst_b; // @[pfu.scala 538:40]
  assign ct_lsu_pfu_pfb_entry_7_ld_da_ldfifo_pc = ld_da_ldfifo_pc; // @[pfu.scala 539:47]
  assign ct_lsu_pfu_pfb_entry_7_ld_da_page_sec_ff = ld_da_page_sec_ff; // @[pfu.scala 540:49]
  assign ct_lsu_pfu_pfb_entry_7_ld_da_page_share_ff = ld_da_page_share_ff; // @[pfu.scala 541:51]
  assign ct_lsu_pfu_pfb_entry_7_ld_da_pfu_act_dp_vld = ld_da_pfu_act_dp_vld; // @[pfu.scala 542:52]
  assign ct_lsu_pfu_pfb_entry_7_ld_da_pfu_act_vld = ld_da_pfu_act_vld; // @[pfu.scala 543:49]
  assign ct_lsu_pfu_pfb_entry_7_ld_da_pfu_evict_cnt_vld = ld_da_pfu_evict_cnt_vld; // @[pfu.scala 544:55]
  assign ct_lsu_pfu_pfb_entry_7_ld_da_pfu_pf_inst_vld = ld_da_pfu_pf_inst_vld; // @[pfu.scala 545:53]
  assign ct_lsu_pfu_pfb_entry_7_ld_da_ppfu_va = ld_da_ppfu_va; // @[pfu.scala 546:45]
  assign ct_lsu_pfu_pfb_entry_7_ld_da_ppn_ff = ld_da_ppn_ff; // @[pfu.scala 547:44]
  assign ct_lsu_pfu_pfb_entry_7_lsu_pfu_l1_dist_sel = lsu_pfu_l1_dist_sel; // @[pfu.scala 548:51]
  assign ct_lsu_pfu_pfb_entry_7_lsu_pfu_l2_dist_sel = lsu_pfu_l2_dist_sel; // @[pfu.scala 549:51]
  assign ct_lsu_pfu_pfb_entry_7_lsu_special_clk = lsu_special_clk; // @[pfu.scala 550:69]
  assign ct_lsu_pfu_pfb_entry_7_pad_yy_icg_scan_en = pad_yy_icg_scan_en; // @[pfu.scala 551:50]
  assign ct_lsu_pfu_pfb_entry_7_pfb_no_req_cnt_val = 6'h0;
  assign ct_lsu_pfu_pfb_entry_7_pfb_timeout_cnt_val = 8'h0;
  assign ct_lsu_pfu_pfb_entry_7_pfu_biu_pe_req_sel_l1 = 1'h0;
  assign ct_lsu_pfu_pfb_entry_7_pfu_dcache_pref_en = 1'h0;
  assign ct_lsu_pfu_pfb_entry_7_pfu_get_page_sec = 1'h0;
  assign ct_lsu_pfu_pfb_entry_7_pfu_get_page_share = 1'h0;
  assign ct_lsu_pfu_pfb_entry_7_pfu_get_ppn = 28'h0;
  assign ct_lsu_pfu_pfb_entry_7_pfu_get_ppn_err = 1'h0;
  assign ct_lsu_pfu_pfb_entry_7_pfu_get_ppn_vld = 1'h0;
  assign ct_lsu_pfu_pfb_entry_7_pfu_l2_pref_en = 1'h0;
  assign ct_lsu_pfu_pfb_entry_7_pfu_mmu_pe_req_sel_l1 = 1'h0;
  assign ct_lsu_pfu_pfb_entry_7_pfu_pfb_create_pc = 15'h0;
  assign ct_lsu_pfu_pfb_entry_7_pfu_pfb_create_stride = 11'h0;
  assign ct_lsu_pfu_pfb_entry_7_pfu_pfb_create_stride_neg = 1'h0;
  assign ct_lsu_pfu_pfb_entry_7_pfu_pfb_create_strideh_6to0 = 7'h0;
  assign ct_lsu_pfu_pfb_entry_7_pfu_pfb_create_type_ld = 1'h0;
  assign ct_lsu_pfu_pfb_entry_7_pfu_pfb_entry_biu_pe_req_grnt_x = pfu_pfb_entry_biu_pe_req_grnt[7]; // @[pfu.scala 568:95]
  assign ct_lsu_pfu_pfb_entry_7_pfu_pfb_entry_create_dp_vld_x = pfu_pfb_entry_create_dp_vld[7]; // @[pfu.scala 571:91]
  assign ct_lsu_pfu_pfb_entry_7_pfu_pfb_entry_create_gateclk_en_x = pfu_pfb_entry_create_dp_vld[7]; // @[pfu.scala 572:99]
  assign ct_lsu_pfu_pfb_entry_7_pfu_pfb_entry_create_vld_x = pfu_pfb_entry_create_dp_vld[7]; // @[pfu.scala 573:85]
  assign ct_lsu_pfu_pfb_entry_7_pfu_pfb_entry_from_lfb_dcache_hit_x = pfu_pfb_entry_from_lfb_dcache_hit[7]; // @[pfu.scala 575:103]
  assign ct_lsu_pfu_pfb_entry_7_pfu_pfb_entry_from_lfb_dcache_miss_x = pfu_pfb_entry_from_lfb_dcache_miss[7]; // @[pfu.scala 576:105]
  assign ct_lsu_pfu_pfb_entry_7_pfu_pfb_entry_mmu_pe_req_grnt_x = pfu_pfb_entry_mmu_pe_req_grnt[7]; // @[pfu.scala 586:95]
  assign ct_lsu_pfu_pfb_entry_7_pfu_pop_all_part_vld = 1'h0;
  assign ct_lsu_pfu_pfb_entry_7_st_da_page_sec_ff = st_da_page_sec_ff; // @[pfu.scala 592:49]
  assign ct_lsu_pfu_pfb_entry_7_st_da_page_share_ff = st_da_page_share_ff; // @[pfu.scala 593:51]
  assign ct_lsu_pfu_pfb_entry_7_st_da_pc = st_da_pc; // @[pfu.scala 594:40]
  assign ct_lsu_pfu_pfb_entry_7_st_da_pfu_act_vld = st_da_pfu_act_vld; // @[pfu.scala 595:49]
  assign ct_lsu_pfu_pfb_entry_7_st_da_pfu_evict_cnt_vld = st_da_pfu_evict_cnt_vld; // @[pfu.scala 596:55]
  assign ct_lsu_pfu_pfb_entry_7_st_da_pfu_pf_inst_vld = st_da_pfu_pf_inst_vld; // @[pfu.scala 597:53]
  assign ct_lsu_pfu_pfb_entry_7_st_da_ppfu_va = st_da_ppfu_va; // @[pfu.scala 598:45]
  assign ct_lsu_pfu_pfb_entry_7_st_da_ppn_ff = st_da_ppn_ff; // @[pfu.scala 599:44]
  assign x_ct_lsu_pfu_gsdb_cp0_lsu_icg_en = cp0_lsu_icg_en; // @[pfu.scala 656:39]
  assign x_ct_lsu_pfu_gsdb_cp0_yy_clk_en = cp0_yy_clk_en; // @[pfu.scala 657:38]
  assign x_ct_lsu_pfu_gsdb_cp0_yy_dcache_pref_en = cp0_yy_dcache_pref_en; // @[pfu.scala 658:46]
  assign x_ct_lsu_pfu_gsdb_cpurst_b = cpurst_b; // @[pfu.scala 659:33]
  assign x_ct_lsu_pfu_gsdb_forever_cpuclk = forever_cpuclk; // @[pfu.scala 660:39]
  assign x_ct_lsu_pfu_gsdb_ld_da_iid = ld_da_iid; // @[pfu.scala 661:34]
  assign x_ct_lsu_pfu_gsdb_ld_da_pfu_act_vld = ld_da_pfu_act_vld; // @[pfu.scala 662:42]
  assign x_ct_lsu_pfu_gsdb_ld_da_pfu_pf_inst_vld = ld_da_pfu_pf_inst_vld; // @[pfu.scala 663:46]
  assign x_ct_lsu_pfu_gsdb_ld_da_pfu_va = ld_da_pfu_va; // @[pfu.scala 664:37]
  assign x_ct_lsu_pfu_gsdb_pad_yy_icg_scan_en = pad_yy_icg_scan_en; // @[pfu.scala 665:43]
  assign x_ct_lsu_pfu_gsdb_pfu_gpfb_vld = x_ct_lsu_pfu_gpfb_pfu_gpfb_vld; // @[pfu.scala 189:26 721:16]
  assign x_ct_lsu_pfu_gsdb_pfu_pop_all_vld = ~icc_idle | ~(pfu_dcache_pref_en | cp0_lsu_l2_pref_en) |
    cp0_lsu_no_op_req | sq_pfu_pop_synci_inst; // @[pfu.scala 975:102]
  assign x_ct_lsu_pfu_gsdb_rtu_yy_xx_commit0 = rtu_yy_xx_commit0; // @[pfu.scala 673:42]
  assign x_ct_lsu_pfu_gsdb_rtu_yy_xx_commit0_iid = rtu_yy_xx_commit0_iid; // @[pfu.scala 674:46]
  assign x_ct_lsu_pfu_gsdb_rtu_yy_xx_commit1 = rtu_yy_xx_commit1; // @[pfu.scala 675:42]
  assign x_ct_lsu_pfu_gsdb_rtu_yy_xx_commit1_iid = rtu_yy_xx_commit1_iid; // @[pfu.scala 676:46]
  assign x_ct_lsu_pfu_gsdb_rtu_yy_xx_commit2 = rtu_yy_xx_commit2; // @[pfu.scala 677:42]
  assign x_ct_lsu_pfu_gsdb_rtu_yy_xx_commit2_iid = rtu_yy_xx_commit2_iid; // @[pfu.scala 678:46]
  assign x_ct_lsu_pfu_gsdb_rtu_yy_xx_flush = rtu_yy_xx_flush; // @[pfu.scala 679:40]
  assign x_ct_lsu_pfu_gpfb_cp0_lsu_icg_en = cp0_lsu_icg_en; // @[pfu.scala 682:39]
  assign x_ct_lsu_pfu_gpfb_cp0_lsu_pfu_mmu_dis = cp0_lsu_pfu_mmu_dis; // @[pfu.scala 683:44]
  assign x_ct_lsu_pfu_gpfb_cp0_yy_clk_en = cp0_yy_clk_en; // @[pfu.scala 684:38]
  assign x_ct_lsu_pfu_gpfb_cp0_yy_priv_mode = cp0_yy_priv_mode; // @[pfu.scala 685:41]
  assign x_ct_lsu_pfu_gpfb_cpurst_b = cpurst_b; // @[pfu.scala 686:48]
  assign x_ct_lsu_pfu_gpfb_forever_cpuclk = forever_cpuclk; // @[pfu.scala 687:39]
  assign x_ct_lsu_pfu_gpfb_ld_da_page_sec_ff = ld_da_page_sec_ff; // @[pfu.scala 688:42]
  assign x_ct_lsu_pfu_gpfb_ld_da_page_share_ff = ld_da_page_share_ff; // @[pfu.scala 689:44]
  assign x_ct_lsu_pfu_gpfb_ld_da_pfu_act_vld = ld_da_pfu_act_vld; // @[pfu.scala 690:42]
  assign x_ct_lsu_pfu_gpfb_ld_da_pfu_pf_inst_vld = ld_da_pfu_pf_inst_vld; // @[pfu.scala 691:46]
  assign x_ct_lsu_pfu_gpfb_ld_da_pfu_va = ld_da_pfu_va; // @[pfu.scala 692:37]
  assign x_ct_lsu_pfu_gpfb_ld_da_ppn_ff = ld_da_ppn_ff; // @[pfu.scala 693:37]
  assign x_ct_lsu_pfu_gpfb_lsu_pfu_l1_dist_sel = lsu_pfu_l1_dist_sel; // @[pfu.scala 694:44]
  assign x_ct_lsu_pfu_gpfb_lsu_pfu_l2_dist_sel = lsu_pfu_l2_dist_sel; // @[pfu.scala 695:44]
  assign x_ct_lsu_pfu_gpfb_pad_yy_icg_scan_en = pad_yy_icg_scan_en; // @[pfu.scala 696:43]
  assign x_ct_lsu_pfu_gpfb_pfu_biu_pe_req_sel_l1 = pfu_biu_pe_req_src[0] & ~lfb_addr_less2; // @[pfu.scala 911:57]
  assign x_ct_lsu_pfu_gpfb_pfu_dcache_pref_en = cp0_lsu_dcache_en & cp0_lsu_dcache_pref_en; // @[pfu.scala 973:46]
  assign x_ct_lsu_pfu_gpfb_pfu_get_page_sec = mmu_lsu_sec2; // @[pfu.scala 166:30 807:20]
  assign x_ct_lsu_pfu_gpfb_pfu_get_page_share = mmu_lsu_share2; // @[pfu.scala 167:32 808:22]
  assign x_ct_lsu_pfu_gpfb_pfu_get_ppn = mmu_lsu_pa2; // @[pfu.scala 168:25 806:15]
  assign x_ct_lsu_pfu_gpfb_pfu_get_ppn_err = mmu_lsu_pa2_err; // @[pfu.scala 169:29 805:19]
  assign x_ct_lsu_pfu_gpfb_pfu_get_ppn_vld = mmu_lsu_pa2_vld; // @[pfu.scala 170:29 804:19]
  assign x_ct_lsu_pfu_gpfb_pfu_gpfb_biu_pe_req_grnt = pfu_biu_pe_req_grnt & pfu_biu_pe_req_ptr[8]; // @[pfu.scala 877:51]
  assign x_ct_lsu_pfu_gpfb_pfu_gpfb_from_lfb_dcache_hit = lfb_pfu_dcache_hit[8]; // @[pfu.scala 965:56]
  assign x_ct_lsu_pfu_gpfb_pfu_gpfb_from_lfb_dcache_miss = lfb_pfu_dcache_miss[8]; // @[pfu.scala 967:58]
  assign x_ct_lsu_pfu_gpfb_pfu_gpfb_mmu_pe_req_grnt = pfu_mmu_pe_update_permit & pfu_mmu_pe_req_ptr[8]; // @[pfu.scala 780:56]
  assign x_ct_lsu_pfu_gpfb_pfu_gsdb_gpfb_create_vld = x_ct_lsu_pfu_gsdb_pfu_gsdb_gpfb_create_vld; // @[pfu.scala 190:38 667:28]
  assign x_ct_lsu_pfu_gpfb_pfu_gsdb_gpfb_pop_req = x_ct_lsu_pfu_gsdb_pfu_gsdb_gpfb_pop_req; // @[pfu.scala 191:35 668:25]
  assign x_ct_lsu_pfu_gpfb_pfu_gsdb_stride = x_ct_lsu_pfu_gsdb_pfu_gsdb_stride; // @[pfu.scala 192:29 669:19]
  assign x_ct_lsu_pfu_gpfb_pfu_gsdb_stride_neg = x_ct_lsu_pfu_gsdb_pfu_gsdb_stride_neg; // @[pfu.scala 193:33 670:23]
  assign x_ct_lsu_pfu_gpfb_pfu_gsdb_strideh_6to0 = x_ct_lsu_pfu_gsdb_pfu_gsdb_strideh_6to0; // @[pfu.scala 194:35 671:25]
  assign x_ct_lsu_pfu_gpfb_pfu_l2_pref_en = cp0_lsu_l2_pref_en; // @[pfu.scala 196:28 974:18]
  assign x_ct_lsu_pfu_gpfb_pfu_mmu_pe_req_sel_l1 = pfu_mmu_pe_req_src[0]; // @[pfu.scala 798:46]
  assign x_ct_lsu_pfu_gpfb_pfu_pop_all_vld = ~icc_idle | ~(pfu_dcache_pref_en | cp0_lsu_l2_pref_en) |
    cp0_lsu_no_op_req | sq_pfu_pop_synci_inst; // @[pfu.scala 975:102]
  always @(posedge pfu_biu_pe_clk or posedge _T_125) begin
    if (_T_125) begin // @[pfu.scala 821:27]
      pfu_biu_req_unmask_reg <= 1'h0; // @[pfu.scala 822:30]
    end else if (pfu_pop_all_vld) begin
      pfu_biu_req_unmask_reg <= 1'h0;
    end else begin
      pfu_biu_req_unmask_reg <= _GEN_10;
    end
  end
  always @(posedge pfu_biu_pe_clk or posedge _T_125) begin
    if (_T_125) begin // @[pfu.scala 849:33]
      pfu_biu_req_l1_reg <= 1'h0; // @[pfu.scala 850:26]
    end else if (pfu_biu_pe_update_vld) begin // @[pfu.scala 833:37]
      pfu_biu_req_l1_reg <= pfu_biu_pe_req_sel_l1;
    end
  end
  always @(posedge pfu_biu_pe_clk or posedge _T_125) begin
    if (_T_125) begin // @[pfu.scala 849:33]
      pfu_biu_req_priority_reg <= 9'h0; // @[pfu.scala 856:32]
    end else if (pfu_biu_pe_update_vld) begin // @[pfu.scala 839:43]
      pfu_biu_req_priority_reg <= pfu_biu_req_priority_next;
    end
  end
  always @(posedge pfu_mmu_pe_clk or posedge _T_125) begin
    if (_T_125) begin // @[pfu.scala 745:27]
      pfu_mmu_req_reg <= 1'h0; // @[pfu.scala 746:23]
    end else if (pfu_pop_all_vld) begin
      pfu_mmu_req_reg <= 1'h0;
    end else begin
      pfu_mmu_req_reg <= _GEN_4;
    end
  end
  always @(posedge pfu_mmu_pe_clk or posedge _T_125) begin
    if (_T_125) begin // @[pfu.scala 766:54]
      pfu_mmu_req_vpn_reg <= 28'h0; // @[pfu.scala 800:28]
    end else if (_T_118) begin // @[pfu.scala 760:38]
      if (pfu_mmu_pe_req_sel_l1) begin
        pfu_mmu_req_vpn_reg <= pfu_mmu_l1_pe_req_vpn;
      end else begin
        pfu_mmu_req_vpn_reg <= pfu_mmu_l2_pe_req_vpn;
      end
    end
  end
  always @(posedge pfu_biu_pe_clk or posedge _T_125) begin
    if (_T_125) begin // @[pfu.scala 849:33]
      pfu_biu_req_addr_tto6_reg <= 34'h0; // @[pfu.scala 913:34]
    end else if (pfu_biu_pe_update_vld) begin // @[pfu.scala 834:44]
      if (pfu_biu_pe_req_sel_l1) begin
        pfu_biu_req_addr_tto6_reg <= pfu_biu_l1_pe_req_addr_tto6;
      end else begin
        pfu_biu_req_addr_tto6_reg <= pfu_biu_l2_pe_req_addr_tto6;
      end
    end
  end
  always @(posedge pfu_biu_pe_clk or posedge _T_125) begin
    if (_T_125) begin // @[pfu.scala 849:33]
      pfu_biu_req_page_sec_reg <= 1'h0; // @[pfu.scala 914:33]
    end else if (pfu_biu_pe_update_vld) begin // @[pfu.scala 835:43]
      if (pfu_biu_pe_req_sel_l1) begin
        pfu_biu_req_page_sec_reg <= pfu_biu_l1_pe_req_page_sec;
      end else begin
        pfu_biu_req_page_sec_reg <= pfu_biu_l2_pe_req_page_sec;
      end
    end
  end
  always @(posedge pfu_biu_pe_clk or posedge _T_125) begin
    if (_T_125) begin // @[pfu.scala 849:33]
      pfu_biu_req_page_share_reg <= 1'h0; // @[pfu.scala 915:35]
    end else if (pfu_biu_pe_update_vld) begin // @[pfu.scala 836:45]
      if (pfu_biu_pe_req_sel_l1) begin
        pfu_biu_req_page_share_reg <= pfu_biu_l1_pe_req_page_share;
      end else begin
        pfu_biu_req_page_share_reg <= pfu_biu_l2_pe_req_page_share;
      end
    end
  end
  always @(posedge pfu_biu_pe_clk or posedge _T_125) begin
    if (_T_125) begin // @[pfu.scala 849:33]
      pfu_biu_req_priv_mode_reg <= 2'h0; // @[pfu.scala 854:33]
    end else if (pfu_biu_pe_update_vld) begin // @[pfu.scala 837:44]
      pfu_biu_req_priv_mode_reg <= pfu_biu_pe_req_priv_mode;
    end
  end
  always @(posedge pfu_biu_pe_clk or posedge _T_125) begin
    if (_T_125) begin // @[pfu.scala 849:33]
      pfu_biu_req_ptr_reg <= 9'h0; // @[pfu.scala 891:28]
    end else if (pfu_biu_pe_update_vld) begin // @[pfu.scala 838:38]
      if (pfu_biu_pe_req_ptiority_0) begin
        pfu_biu_req_ptr_reg <= pfu_biu_pe_req_ptr_priority_0;
      end else begin
        pfu_biu_req_ptr_reg <= pfu_biu_pe_req_ptr_priority_1;
      end
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
  pfu_biu_req_unmask_reg = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  pfu_biu_req_l1_reg = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  pfu_biu_req_priority_reg = _RAND_2[8:0];
  _RAND_3 = {1{`RANDOM}};
  pfu_mmu_req_reg = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  pfu_mmu_req_vpn_reg = _RAND_4[27:0];
  _RAND_5 = {2{`RANDOM}};
  pfu_biu_req_addr_tto6_reg = _RAND_5[33:0];
  _RAND_6 = {1{`RANDOM}};
  pfu_biu_req_page_sec_reg = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  pfu_biu_req_page_share_reg = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  pfu_biu_req_priv_mode_reg = _RAND_8[1:0];
  _RAND_9 = {1{`RANDOM}};
  pfu_biu_req_ptr_reg = _RAND_9[8:0];
`endif // RANDOMIZE_REG_INIT
  if (_T_125) begin
    pfu_biu_req_unmask_reg = 1'h0;
  end
  if (_T_125) begin
    pfu_biu_req_l1_reg = 1'h0;
  end
  if (_T_125) begin
    pfu_biu_req_priority_reg = 9'h0;
  end
  if (_T_125) begin
    pfu_mmu_req_reg = 1'h0;
  end
  if (_T_125) begin
    pfu_mmu_req_vpn_reg = 28'h0;
  end
  if (_T_125) begin
    pfu_biu_req_addr_tto6_reg = 34'h0;
  end
  if (_T_125) begin
    pfu_biu_req_page_sec_reg = 1'h0;
  end
  if (_T_125) begin
    pfu_biu_req_page_share_reg = 1'h0;
  end
  if (_T_125) begin
    pfu_biu_req_priv_mode_reg = 2'h0;
  end
  if (_T_125) begin
    pfu_biu_req_ptr_reg = 9'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
