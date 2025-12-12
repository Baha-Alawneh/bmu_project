


interface bmu_if(input clk);
  
  logic        rst_l;
  logic [31:0] a_in;
  logic [31:0] b_in;
  logic        scan_mode;
  logic        valid_in;
  logic        csr_ren_in;
  logic [31:0] csr_rddata_in;
  logic        ap_lor;
  logic        ap_lxor;
  logic        ap_land;
  logic        ap_zbb;
  logic        ap_srl;
  logic        ap_sra;
  logic        ap_ror;
  logic        ap_rol;
  logic        ap_binv;
  logic        ap_sh1add;
  logic        ap_sh2add;
  logic        ap_sh3add;
  logic        ap_zba;
  logic        ap_sub;
  logic        ap_slt;
  logic        ap_unsign;
  logic        ap_ctz;
  logic        ap_clz;
  logic        ap_cpop;
  logic        ap_siext_b;
  logic        ap_siext_h;
  logic        ap_max;
  logic        ap_min;
  logic        ap_pack;
  logic        ap_grev;
  logic        ap_csr_write;
  logic        ap_csr_imm;
  
  logic [31:0] result_ff;
  logic        error;
  
  clocking driver_cb @(posedge clk);
    default input #1 output #0;
    output rst_l;
    output a_in;
    output b_in;
    output scan_mode;
    output valid_in;
    output csr_ren_in;
    output csr_rddata_in;
    output ap_lor;
    output ap_lxor;
    output ap_land;
    output ap_zbb;
    output ap_srl;
    output ap_sra;
    output ap_ror;
    output ap_rol;
    output ap_binv;
    output ap_sh1add;
    output ap_sh2add;
    output ap_sh3add;
    output ap_zba;
    output ap_sub;
    output ap_slt;
    output ap_unsign;
    output ap_ctz;
    output ap_clz;
    output ap_cpop;
    output ap_siext_b;
    output ap_siext_h;
    output ap_max;
    output ap_min;
    output ap_pack;
    output ap_grev;
    output ap_csr_write;
    output ap_csr_imm;
    input  result_ff;
    input  error;
  endclocking
  
  clocking monitor_cb @(posedge clk);
    default input #1 output #1;
    input rst_l;
    input a_in;
    input b_in;
    input scan_mode;
    input valid_in;
    input csr_ren_in;
    input csr_rddata_in;
    input ap_lor;
    input ap_lxor;
    input ap_land;
    input ap_zbb;
    input ap_srl;
    input ap_sra;
    input ap_ror;
    input ap_rol;
    input ap_binv;
    input ap_sh1add;
    input ap_sh2add;
    input ap_sh3add;
    input ap_zba;
    input ap_sub;
    input ap_slt;
    input ap_unsign;
    input ap_ctz;
    input ap_clz;
    input ap_cpop;
    input ap_siext_b;
    input ap_siext_h;
    input ap_max;
    input ap_min;
    input ap_pack;
    input ap_grev;
    input ap_csr_write;
    input ap_csr_imm;
    input result_ff;
    input error;
  endclocking
  
  modport DRIVER (clocking driver_cb, input clk, output rst_l);
  
  modport MONITOR (clocking monitor_cb, input clk);
  
endinterface : bmu_if
