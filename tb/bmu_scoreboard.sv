class bmu_scoreboard extends uvm_scoreboard;
  
  `uvm_component_utils(bmu_scoreboard)
  
  uvm_analysis_imp #(bmu_seq_item, bmu_scoreboard) actual_data;
  
  int match_count;
  int op_count;
  int mismatch_count;
  int error_detected_count;
  
  function new(string name = "bmu_scoreboard", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    actual_data = new("actual_data", this);
    match_count = 0;
    mismatch_count = 0;
    error_detected_count = 0;
  endfunction
  
  virtual function void write(bmu_seq_item item);
    bit [31:0] expected_result;
    bit expected_error;
    
    if (!item.rst_l) begin
      `uvm_info(get_type_name(), "Reset active - skipping check", UVM_HIGH)
      return;
    end
    
    compute_reference(item, expected_result, expected_error);
    
    if (item.result_ff === expected_result && item.error === expected_error) begin
      match_count++;
      `uvm_info(get_type_name(), $sformatf("MATCH: %s | a=0x%08h b=0x%08h | result=0x%08h (exp=0x%08h) | error=%0d (exp=%0d)",
                item.operation_name, item.a_in, item.b_in, item.result_ff, expected_result, item.error, expected_error), UVM_MEDIUM)
    end else begin
      mismatch_count++;
      `uvm_error(get_type_name(), $sformatf("MISMATCH: %s | a=0x%08h b=0x%08h | result=0x%08h (exp=0x%08h) | error=%0d (exp=%0d)",
                 item.operation_name, item.a_in, item.b_in, item.result_ff, expected_result, item.error, expected_error))
      `uvm_info(get_type_name(), $sformatf("  ap_sh2add=%0d ap_zba=%0d ap_sh1add=%0d ap_sh3add=%0d", 
                item.ap_sh2add, item.ap_zba, item.ap_sh1add, item.ap_sh3add), UVM_LOW)
      `uvm_info(get_type_name(), $sformatf("  ap_lor=%0d ap_lxor=%0d ap_land=%0d ap_zbb=%0d", 
                item.ap_lor, item.ap_lxor, item.ap_land, item.ap_zbb), UVM_LOW)
      `uvm_info(get_type_name(), $sformatf("  ap_sub=%0d ap_srl=%0d ap_sra=%0d ap_ror=%0d ap_binv=%0d", 
                item.ap_sub, item.ap_srl, item.ap_sra, item.ap_ror, item.ap_binv), UVM_LOW)
      `uvm_info(get_type_name(), $sformatf("  ap_cpop=%0d ap_ctz=%0d ap_slt=%0d ap_max=%0d ap_pack=%0d ap_siext_b=%0d", 
                item.ap_cpop, item.ap_ctz, item.ap_slt, item.ap_max, item.ap_pack, item.ap_siext_b), UVM_LOW)
      `uvm_info(get_type_name(), $sformatf("  csr_ren_in=%0d ap_csr_write=%0d op_count=%0d", 
                item.csr_ren_in, item.ap_csr_write, op_count), UVM_LOW)
    end
    
    if (item.error) error_detected_count++;
  endfunction
  
  virtual function void compute_reference(bmu_seq_item item, output bit [31:0] result, output bit error);
    bit [31:0] a, b;
    bit [4:0] shamt;
    int signed a_signed, b_signed;
    bit [31:0] temp;
    int count;
    
    a = item.a_in;
    b = item.b_in;
    shamt = b[4:0];
    a_signed = signed'(a);
    b_signed = signed'(b);
    
    result = 32'h0;
    error = 1'b0;
    
    op_count = $countones({item.ap_lor, item.ap_lxor, item.ap_land, item.ap_srl, item.ap_sra,
                                item.ap_ror, item.ap_binv, item.ap_sh2add,
                                item.ap_sub, item.ap_slt, item.ap_ctz,
                                item.ap_cpop, item.ap_siext_b, item.ap_max,
                                item.ap_pack, item.ap_grev, item.ap_csr_write});
    

    if (item.csr_ren_in && op_count > 0) begin
      result = 32'h0;
      error = 1'b1;
      return;
    end
    
    if (item.ap_sh2add && !item.ap_zba) begin
      result = 32'h0;
      error = 1'b1;
      return;
    end
    
    if (item.ap_sub && item.ap_zba && !item.ap_slt && !item.ap_max) begin
      result = 32'h0;
      error = 1'b1;
      return;
    end
    
    if (op_count > 1) begin
      result = 32'h0;
      error = 1'b0; 
      return;
    end
    
    // CSR Read 
    if (item.csr_ren_in) begin
      result = item.csr_rddata_in;
      error = 1'b0;
      return;
    end
    
    // CSR Write
    if (item.ap_csr_write) begin
      result = item.ap_csr_imm ? b : a;
      error = 1'b0;
      return;
    end
    
    // Logical Operations
    if (item.ap_lor) begin
      result = item.ap_zbb ? (a | ~b) : (a | b);  // ORN : OR
      error = 1'b0;
      return;
    end
    
    if (item.ap_lxor) begin
      result = item.ap_zbb ? (a ^ ~b) : (a ^ b);  // XNOR : XOR
      error = 1'b0;
      return;
    end
    
    if (item.ap_land) begin
      result = item.ap_zbb ? (a & ~b) : (a & b);  // ANDN : AND
      error = 1'b0;
      return;
    end
    
    // Shift Operations
    if (item.ap_srl) begin
      result = a >> shamt;
      error = 1'b0;
      return;
    end
    
    if (item.ap_sra) begin
      result = a_signed >>> shamt;
      error = 1'b0;
      return;
    end
    
    if (item.ap_ror) begin
      result = (a >> shamt) | (a << (32 - shamt));
      error = 1'b0;
      return;
    end
    
    // Bit Manipulation
    if (item.ap_binv) begin
      result = a ^ (1 << shamt);
      error = 1'b0;
      return;
    end
    
    // Shift-Add Operations (Zba) - Only SH2ADD
    if (item.ap_sh2add) begin
      if (item.ap_zba == 1) begin
        result = (a << 2) + b;
        error = 1'b0;
      end else begin
        result = 32'h0;
        error = 1'b1;
      end
      return;
    end
    
    // Subtraction
    if (item.ap_sub && !item.ap_slt && !item.ap_max) begin
      if (item.ap_zba == 0) begin
        result = a - b;
        error = 1'b0;
      end else begin
        result = 32'h0;
        error = 1'b1;
      end
      return;
    end
    
    // Set Less Than
    if (item.ap_slt) begin
      if (item.ap_unsign) begin
        result = (a < b) ? 32'h1 : 32'h0;
      end else begin
        result = (a_signed < b_signed) ? 32'h1 : 32'h0;
      end
      error = 1'b0;
      return;
    end
    
    // Count Trailing Zeros
    if (item.ap_ctz) begin
      count = 0;
      for (int i = 0; i < 32; i++) begin
        if (a[i] == 1'b1) break;
        count++;
      end
      result = count;
      error = 1'b0;
      return;
    end
    
    // Count Population
    if (item.ap_cpop) begin
      count = 0;
      for (int i = 0; i < 32; i++) begin
        if (a[i] == 1'b1) count++;
      end
      result = count;
      error = 1'b0;
      return;
    end
    
    // Sign Extend Byte
    if (item.ap_siext_b) begin
      result = {{24{a[7]}}, a[7:0]};
      error = 1'b0;
      return;
    end
    
    // Maximum (signed)
    if (item.ap_max) begin
      result = (a_signed > b_signed) ? a : b;
      error = 1'b0;
      return;
    end
    
    // Pack
    if (item.ap_pack) begin
      result = {b[15:0], a[15:0]}; 
      error = 1'b0;
      return;
    end
    
    // GREV
    if (item.ap_grev) begin
      if (b == 32'd24 || b[4:0] == 5'b11000) begin
        result = {a[7:0], a[15:8], a[23:16], a[31:24]};
        error = 1'b0;
      end else begin
        result = 32'h0;
        error = 1'b0;
      end
      return;
    end
    
    result = 32'h0;
    error = 1'b0;
  endfunction
  
  virtual function void report_phase(uvm_phase phase);
    `uvm_info(get_type_name(), $sformatf("========================================"), UVM_LOW)
    `uvm_info(get_type_name(), $sformatf("Scoreboard Summary:"), UVM_LOW)
    `uvm_info(get_type_name(), $sformatf("  Matches:    %0d", match_count), UVM_LOW)
    `uvm_info(get_type_name(), $sformatf("  Mismatches: %0d", mismatch_count), UVM_LOW)
    `uvm_info(get_type_name(), $sformatf("  Errors Detected: %0d", error_detected_count), UVM_LOW)
    if (mismatch_count == 0)
      `uvm_info(get_type_name(), $sformatf("TEST PASSED!"), UVM_LOW)
    else
      `uvm_error(get_type_name(), $sformatf("TEST FAILED with %0d mismatches!", mismatch_count))
    `uvm_info(get_type_name(), $sformatf("========================================"), UVM_LOW)
  endfunction
  
endclass : bmu_scoreboard
