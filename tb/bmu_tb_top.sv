module bmu_tb_top;

  import uvm_pkg::*;
  import bmu_pkg::*;
  import rtl_pkg::*;

  logic clk;
  logic rst_l;

  bmu_if vif (clk);

  always #5 clk = ~clk;

  rtl_alu_pkt_t ap;
  
  always_comb begin
    ap.clz = vif.ap_clz;
    ap.ctz = vif.ap_ctz;
    ap.cpop = vif.ap_cpop;
    ap.siext_b = vif.ap_siext_b;
    ap.siext_h = vif.ap_siext_h;
    ap.min = vif.ap_min;
    ap.max = vif.ap_max;
    ap.pack = vif.ap_pack;
    ap.packu = 1'b0;
    ap.packh = 1'b0;
    ap.rol = vif.ap_rol;
    ap.ror = vif.ap_ror;
    ap.grev = vif.ap_grev;
    ap.gorc = 1'b0;
    ap.zbb = vif.ap_zbb;
    ap.bset = 1'b0;
    ap.bclr = 1'b0;
    ap.binv = vif.ap_binv;
    ap.bext = 1'b0;
    ap.sh1add = vif.ap_sh1add;
    ap.sh2add = vif.ap_sh2add;
    ap.sh3add = vif.ap_sh3add;
    ap.zba = vif.ap_zba;
    ap.land = vif.ap_land;
    ap.lor = vif.ap_lor;
    ap.lxor = vif.ap_lxor;
    ap.sll = 1'b0;
    ap.srl = vif.ap_srl;
    ap.sra = vif.ap_sra;
    ap.beq = 1'b0;
    ap.bne = 1'b0;
    ap.blt = 1'b0;
    ap.bge = 1'b0;
    ap.add = 1'b0;
    ap.sub = vif.ap_sub;
    ap.slt = vif.ap_slt;
    ap.unsign = vif.ap_unsign;
    ap.jal = 1'b0;
    ap.predict_t = 1'b0;
    ap.predict_nt = 1'b0;
    ap.csr_write = vif.ap_csr_write;
    ap.csr_imm = vif.ap_csr_imm;
  end

  
  Bit_Manipulation_Unit #(
    .pt('{
      BITMANIP_ZBB: 5'd1,
      BITMANIP_ZBA: 5'd1,
      BITMANIP_ZBS: 5'd1,
      BITMANIP_ZBP: 5'd1,
      default: '0
    })
  ) dut (
      .clk(clk),
      .rst_l(vif.rst_l),
      .scan_mode(vif.scan_mode),
      .valid_in(vif.valid_in),
      .ap(ap),
      .csr_ren_in(vif.csr_ren_in),
      .csr_rddata_in(vif.csr_rddata_in),
      .a_in(vif.a_in),
      .b_in(vif.b_in),
      .result_ff(vif.result_ff),
      .error(vif.error)
  );

  initial begin
    clk = 0;
    uvm_config_db#(virtual bmu_if)::set(null, "*", "vif", vif);
    run_test();
  end

  initial begin
    $dumpfile("bmu_tb.vcd");
    $dumpvars(0, bmu_tb_top);
  end

endmodule

