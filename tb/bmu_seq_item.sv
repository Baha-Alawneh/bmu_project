
class bmu_seq_item extends uvm_sequence_item;

  rand bit        rst_l;
  rand bit [31:0] a_in;
  rand bit [31:0] b_in;
  rand bit        scan_mode;
  rand bit        valid_in;
  rand bit        csr_ren_in;
  rand bit [31:0] csr_rddata_in;

  rand bit        ap_lor;
  rand bit        ap_lxor;
  rand bit        ap_land;
  rand bit        ap_zbb;
  rand bit        ap_srl;
  rand bit        ap_sra;
  rand bit        ap_ror;
  rand bit        ap_rol;
  rand bit        ap_binv;
  rand bit        ap_sh1add;
  rand bit        ap_sh2add;
  rand bit        ap_sh3add;
  rand bit        ap_zba;
  rand bit        ap_sub;
  rand bit        ap_slt;
  rand bit        ap_unsign;
  rand bit        ap_ctz;
  rand bit        ap_clz;
  rand bit        ap_cpop;
  rand bit        ap_siext_b;
  rand bit        ap_siext_h;
  rand bit        ap_max;
  rand bit        ap_min;
  rand bit        ap_pack;
  rand bit        ap_grev;
  rand bit        ap_csr_write;
  rand bit        ap_csr_imm;

  bit      [31:0] result_ff;
  bit             error;

  bit      [31:0] expected_result;
  bit             expected_error;

  string          operation_name;

  `uvm_object_utils_begin(bmu_seq_item)
    `uvm_field_int(rst_l, UVM_ALL_ON)
    `uvm_field_int(a_in, UVM_ALL_ON | UVM_HEX)
    `uvm_field_int(b_in, UVM_ALL_ON | UVM_HEX)
    `uvm_field_int(scan_mode, UVM_ALL_ON)
    `uvm_field_int(valid_in, UVM_ALL_ON)
    `uvm_field_int(csr_ren_in, UVM_ALL_ON)
    `uvm_field_int(csr_rddata_in, UVM_ALL_ON | UVM_HEX)
    `uvm_field_int(ap_lor, UVM_ALL_ON)
    `uvm_field_int(ap_lxor, UVM_ALL_ON)
    `uvm_field_int(ap_land, UVM_ALL_ON)
    `uvm_field_int(ap_zbb, UVM_ALL_ON)
    `uvm_field_int(ap_srl, UVM_ALL_ON)
    `uvm_field_int(ap_sra, UVM_ALL_ON)
    `uvm_field_int(ap_ror, UVM_ALL_ON)
    `uvm_field_int(ap_rol, UVM_ALL_ON)
    `uvm_field_int(ap_binv, UVM_ALL_ON)
    `uvm_field_int(ap_sh1add, UVM_ALL_ON)
    `uvm_field_int(ap_sh2add, UVM_ALL_ON)
    `uvm_field_int(ap_sh3add, UVM_ALL_ON)
    `uvm_field_int(ap_zba, UVM_ALL_ON)
    `uvm_field_int(ap_sub, UVM_ALL_ON)
    `uvm_field_int(ap_slt, UVM_ALL_ON)
    `uvm_field_int(ap_unsign, UVM_ALL_ON)
    `uvm_field_int(ap_ctz, UVM_ALL_ON)
    `uvm_field_int(ap_clz, UVM_ALL_ON)
    `uvm_field_int(ap_cpop, UVM_ALL_ON)
    `uvm_field_int(ap_siext_b, UVM_ALL_ON)
    `uvm_field_int(ap_siext_h, UVM_ALL_ON)
    `uvm_field_int(ap_max, UVM_ALL_ON)
    `uvm_field_int(ap_min, UVM_ALL_ON)
    `uvm_field_int(ap_pack, UVM_ALL_ON)
    `uvm_field_int(ap_grev, UVM_ALL_ON)
    `uvm_field_int(ap_csr_write, UVM_ALL_ON)
    `uvm_field_int(ap_csr_imm, UVM_ALL_ON)
    `uvm_field_int(result_ff, UVM_ALL_ON | UVM_HEX)
    `uvm_field_int(error, UVM_ALL_ON)
    `uvm_field_string(operation_name, UVM_ALL_ON)
  `uvm_object_utils_end

  function new(string name = "bmu_seq_item");
    super.new(name);
  endfunction


  constraint valid_operation_c {
    $countones(
        {ap_lor, ap_lxor, ap_land, ap_srl, ap_sra, ap_ror, ap_rol, 
                ap_binv,
                ap_ctz, ap_clz, ap_cpop, ap_siext_b, ap_siext_h, 
                ap_pack, ap_grev, ap_csr_write, csr_ren_in}
    ) <= 1;

    (ap_slt == 1) -> (ap_sub == 1);

    (ap_max == 1) -> (ap_sub == 1);

    (ap_sh2add == 1) -> (ap_zba == 1);

    (ap_sub == 1 && ap_slt == 0 && ap_max == 0) ->
    ($countones(
        {ap_lor, ap_lxor, ap_land, ap_srl, ap_sra, ap_ror, ap_rol, 
                   ap_binv, ap_sh2add, ap_slt,
                   ap_ctz, ap_clz, ap_cpop, ap_siext_b, ap_siext_h, 
                   ap_max, ap_pack, ap_grev, ap_csr_write, csr_ren_in}
    ) == 0);
  }

  constraint reset_c {
    rst_l == 1;  
  }

  constraint valid_in_c {
    valid_in == 1; 
  }

  constraint scan_mode_c {
    scan_mode == 0;
  }

  function void reset_ap_fields();
    ap_lor = 0;
    ap_lxor = 0;
    ap_land = 0;
    ap_zbb = 0;
    ap_srl = 0;
    ap_sra = 0;
    ap_ror = 0;
    ap_rol = 0;
    ap_binv = 0;
    ap_sh1add = 0;
    ap_sh2add = 0;
    ap_sh3add = 0;
    ap_zba = 0;
    ap_sub = 0;
    ap_slt = 0;
    ap_unsign = 0;
    ap_ctz = 0;
    ap_clz = 0;
    ap_cpop = 0;
    ap_siext_b = 0;
    ap_siext_h = 0;
    ap_max = 0;
    ap_min = 0;
    ap_pack = 0;
    ap_grev = 0;
    ap_csr_write = 0;
    ap_csr_imm = 0;
    csr_ren_in = 0;
  endfunction

  virtual function void do_print(uvm_printer printer);
    super.do_print(printer);
    printer.print_string("operation", operation_name);
    printer.print_field("a_in", a_in, 32, UVM_HEX);
    printer.print_field("b_in", b_in, 32, UVM_HEX);
    printer.print_field("result_ff", result_ff, 32, UVM_HEX);
    printer.print_field("expected", expected_result, 32, UVM_HEX);
    printer.print_field("error", error, 1);
  endfunction

endclass : bmu_seq_item
