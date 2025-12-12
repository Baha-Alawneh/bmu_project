
class bmu_subscriber extends uvm_subscriber #(bmu_seq_item);
  
  `uvm_component_utils(bmu_subscriber)
  
  bmu_seq_item item;
  
  covergroup bmu_cg;
    
    cp_a_in: coverpoint item.a_in {
      bins zero = {32'h0};
      bins all_ones = {32'hFFFFFFFF};
      bins max_positive = {32'h7FFFFFFF};
      bins min_negative = {32'h80000000};
      bins small_values = {[1:255]};
      bins medium_values = {[256:65535]};
      bins large_values = {[65536:$]};
    }
    
    cp_b_in: coverpoint item.b_in {
      bins zero = {32'h0};
      bins all_ones = {32'hFFFFFFFF};
      bins max_positive = {32'h7FFFFFFF};
      bins min_negative = {32'h80000000};
      bins small_values = {[1:255]};
      bins medium_values = {[256:65535]};
      bins large_values = {[65536:$]};
    }
    
    cp_shift_amount: coverpoint item.b_in[4:0] {
      bins zero = {0};
      bins shift_small = {[1:7]};
      bins shift_medium = {[9:15]}; 
      bins shift_large = {[17:23]};  
      bins boundaries = {8, 16, 24}; 
      bins max = {31};
    }
    
    cp_operation: coverpoint get_operation_code() {
      bins OR = {0};
      bins ORN = {1};
      bins XOR = {2};
      bins XNOR = {3};
      bins SRL = {6};
      bins SRA = {7};
      bins ROR = {8};
      bins BINV = {10};
      bins SH2ADD = {11};
      bins SUB = {12};
      bins SLTU = {13};
      bins SLT = {14};
      bins CTZ = {15};
      bins CPOP = {16};
      bins SEXT_B = {17};
      bins MAX = {18};
      bins PACK = {19};
      bins GREV = {20};
      bins CSR_READ = {21};
      bins CSR_WRITE_IMM = {22};
      bins CSR_WRITE_REG = {23};
      illegal_bins UNKNOWN = {99};
    }
    
    cp_zbb_mode: coverpoint item.ap_zbb {
      bins normal = {0};
      bins inverted = {1};
    }
    
    cp_zba_constraint: coverpoint item.ap_zba {
      bins disabled = {0};
      bins enabled = {1};
    }
    
    cp_sign_mode: coverpoint item.ap_unsign {
      bins signed_mode = {0};
      bins unsigned_mode = {1};
    }
    
    cp_error: coverpoint item.error {
      bins no_error = {0};
      bins error_occurred = {1};
    }
    
  endgroup : bmu_cg
  
  covergroup bit_ops_cg;
    
    cp_trailing_zeros: coverpoint count_trailing_zeros() {
      bins no_trailing = {0};
      bins few = {[1:7]};
      bins many = {[8:30]};
      bins all_zeros = {32};
    }
    
    cp_pop_count: coverpoint count_population() {
      bins none = {0};
      bins sparse = {[1:8]};
      bins bin_medium = {[9:23]};
      bins dense = {[24:31]};
      bins all_set = {32};
    }
    
    cp_bit_position: coverpoint item.b_in[4:0] {
      bins lsb = {0};
      bins low_byte = {[1:7]};
      bins second_byte = {[8:15]};
      bins third_byte = {[16:23]};
      bins high_byte = {[24:30]};
      bins msb = {31};
    }
    
  endgroup : bit_ops_cg
  
  covergroup grev_cg;
    cp_grev_b_value: coverpoint item.b_in {
      bins valid_grev = {24, 32'b11000};
      bins invalid_grev = {[0:23], [25:31], [32:$]};
    }
  endgroup : grev_cg
  
  covergroup error_cg;
    
    cp_op_count: coverpoint get_operation_count() {
      bins single_op = {0, 1};
      bins conflict = {[2:$]};
    }
    
    cp_sub_zba_violation: coverpoint (item.ap_sub && item.ap_zba) {
      bins no_violation = {0};
      bins violation = {1};
    }
    
    cp_sh2add_zba_violation: coverpoint (item.ap_sh2add && !item.ap_zba) {
      bins no_violation = {0};
      bins violation = {1};
    }
    
    cp_grev_b_violation: coverpoint (item.ap_grev && (item.b_in != 24)) {
      bins no_violation = {0};
      bins violation = {1};
    }
    
  endgroup : error_cg
  
  function new(string name = "bmu_coverage", uvm_component parent = null);
    super.new(name, parent);
    bmu_cg = new();
    bit_ops_cg = new();
    grev_cg = new();
    error_cg = new();
  endfunction
  
  virtual function void write(bmu_seq_item t);
    item = t;
    
    if (!item.rst_l) return;
    
    bmu_cg.sample();
    bit_ops_cg.sample();
    grev_cg.sample();
    error_cg.sample();
  endfunction
  
  function int get_operation_code();
    if (item.ap_lor && !item.ap_zbb) return 0;  // OR
    if (item.ap_lor && item.ap_zbb) return 1;   // ORN
    if (item.ap_lxor && !item.ap_zbb) return 2; // XOR
    if (item.ap_lxor && item.ap_zbb) return 3;  // XNOR
    if (item.ap_srl) return 6;                  // SRL
    if (item.ap_sra) return 7;                  // SRA
    if (item.ap_ror) return 8;                  // ROR
    if (item.ap_binv) return 10;                // BINV
    if (item.ap_sh2add) return 11;              // SH2ADD
    if (item.ap_sub) return 12;                 // SUB
    if (item.ap_slt && item.ap_unsign) return 13;  // SLTU
    if (item.ap_slt && !item.ap_unsign) return 14; // SLT
    if (item.ap_ctz) return 15;                 // CTZ
    if (item.ap_cpop) return 16;                // CPOP
    if (item.ap_siext_b) return 17;             // SEXT_B
    if (item.ap_max) return 18;                 // MAX
    if (item.ap_pack) return 19;                // PACK
    if (item.ap_grev) return 20;                // GREV
    if (item.csr_ren_in) return 21;             // CSR_READ
    if (item.ap_csr_write && item.ap_csr_imm) return 22;  // CSR_WRITE_IMM
    if (item.ap_csr_write && !item.ap_csr_imm) return 23; // CSR_WRITE_REG
    return 99; // UNKNOWN
  endfunction
  
  function int count_trailing_zeros();
    int count = 0;
    for (int i = 0; i < 32; i++) begin
      if (item.a_in[i] == 1'b1) break;
      count++;
    end
    return count;
  endfunction
  
  function int count_population();
    int count = 0;
    for (int i = 0; i < 32; i++) begin
      if (item.a_in[i] == 1'b1) count++;
    end
    return count;
  endfunction
  
  function int get_operation_count();
    return $countones({item.ap_lor, item.ap_lxor, item.ap_land, item.ap_srl, item.ap_sra,
                       item.ap_ror, item.ap_rol, item.ap_binv, item.ap_sh2add,
                       item.ap_sub, item.ap_slt, item.ap_ctz,
                       item.ap_cpop, item.ap_siext_b, item.ap_max,
                       item.ap_pack, item.ap_grev, item.ap_csr_write, item.csr_ren_in});
  endfunction
  
  virtual function void report_phase(uvm_phase phase);
    `uvm_info(get_type_name(), $sformatf("========================================"), UVM_LOW)
    `uvm_info(get_type_name(), $sformatf("Coverage Report:"), UVM_LOW)
    `uvm_info(get_type_name(), $sformatf("  BMU Coverage: %.2f%%", bmu_cg.get_coverage()), UVM_LOW)
    `uvm_info(get_type_name(), $sformatf("  Bit Ops Coverage: %.2f%%", bit_ops_cg.get_coverage()), UVM_LOW)
    `uvm_info(get_type_name(), $sformatf("  GREV Coverage: %.2f%%", grev_cg.get_coverage()), UVM_LOW)
    `uvm_info(get_type_name(), $sformatf("  Error Coverage: %.2f%%", error_cg.get_coverage()), UVM_LOW)
    `uvm_info(get_type_name(), $sformatf("========================================"), UVM_LOW)
  endfunction
  
endclass : bmu_subscriber
