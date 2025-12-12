class bmu_csr_write_sequence extends bmu_base_sequence;
  `uvm_object_utils(bmu_csr_write_sequence)
  
  function new(string name = "bmu_csr_write_sequence");
    super.new(name);
  endfunction
  
  virtual task body();
    bmu_seq_item item;
    
    `uvm_info(get_type_name(), "Executing CSR Write Sequence", UVM_LOW)
    
    
    item = create_clean_item();
    item.ap_csr_write = 1; item.ap_csr_imm = 1;
    item.a_in = 32'hAAAAAAAA; item.b_in = 32'h12345678;
    item.operation_name = "CSR_WRITE_IMM";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_csr_write = 1; item.ap_csr_imm = 1;
    item.a_in = 32'hFFFFFFFF; item.b_in = 32'h00000000;
    item.operation_name = "CSR_WRITE_IMM";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_csr_write = 1; item.ap_csr_imm = 1;
    item.a_in = 32'h00000000; item.b_in = 32'hFFFFFFFF;
    item.operation_name = "CSR_WRITE_IMM";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_csr_write = 1; item.ap_csr_imm = 1;
    item.a_in = 32'h55555555; item.b_in = 32'hAAAAAAAA;
    item.operation_name = "CSR_WRITE_IMM";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_csr_write = 1; item.ap_csr_imm = 1;
    item.a_in = 32'hDEADBEEF; item.b_in = 32'h80000001;
    item.operation_name = "CSR_WRITE_IMM";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_csr_write = 1; item.ap_csr_imm = 1;
    item.a_in = 32'h11111111; item.b_in = 32'h22222222;
    item.operation_name = "CSR_WRITE_IMM";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_csr_write = 1; item.ap_csr_imm = 1;
    item.a_in = 32'hF0F0F0F0; item.b_in = 32'h0F0F0F0F;
    item.operation_name = "CSR_WRITE_IMM";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_csr_write = 1; item.ap_csr_imm = 1;
    item.a_in = 32'hFF00FF00; item.b_in = 32'h00FF00FF;
    item.operation_name = "CSR_WRITE_IMM";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_csr_write = 1; item.ap_csr_imm = 1;
    item.a_in = 32'h13579BDF; item.b_in = 32'hCAFEBABE;
    item.operation_name = "CSR_WRITE_IMM";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_csr_write = 1; item.ap_csr_imm = 1;
    item.a_in = 32'h2468ACE0; item.b_in = 32'h13579BDF;
    item.operation_name = "CSR_WRITE_IMM";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_csr_write = 1; item.ap_csr_imm = 1;
    item.a_in = 32'h10000000; item.b_in = 32'h00000100;
    item.operation_name = "CSR_WRITE_IMM";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_csr_write = 1; item.ap_csr_imm = 1;
    item.a_in = 32'h7FFFFFFF; item.b_in = 32'h80000001;
    item.operation_name = "CSR_WRITE_IMM";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_csr_write = 1; item.ap_csr_imm = 1;
    item.a_in = 32'hA5A5A5A5; item.b_in = 32'h5A5A5A5A;
    item.operation_name = "CSR_WRITE_IMM";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_csr_write = 1; item.ap_csr_imm = 1;
    item.a_in = 32'h33333333; item.b_in = 32'h44444444;
    item.operation_name = "CSR_WRITE_IMM";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_csr_write = 1; item.ap_csr_imm = 1;
    item.a_in = 32'h99999999; item.b_in = 32'h99999999;
    item.operation_name = "CSR_WRITE_IMM";
    start_item(item); finish_item(item);
    
    
    item = create_clean_item();
    item.ap_csr_write = 1; item.ap_csr_imm = 0;
    item.a_in = 32'h87654321; item.b_in = 32'hBBBBBBBB;
    item.operation_name = "CSR_WRITE_REG";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_csr_write = 1; item.ap_csr_imm = 0;
    item.a_in = 32'h00000000; item.b_in = 32'hFFFFFFFF;
    item.operation_name = "CSR_WRITE_REG";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_csr_write = 1; item.ap_csr_imm = 0;
    item.a_in = 32'hFFFFFFFF; item.b_in = 32'h00000000;
    item.operation_name = "CSR_WRITE_REG";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_csr_write = 1; item.ap_csr_imm = 0;
    item.a_in = 32'h55555555; item.b_in = 32'hAAAAAAAA;
    item.operation_name = "CSR_WRITE_REG";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_csr_write = 1; item.ap_csr_imm = 0;
    item.a_in = 32'h7FFFFFFE; item.b_in = 32'hCAFEBABE;
    item.operation_name = "CSR_WRITE_REG";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_csr_write = 1; item.ap_csr_imm = 0;
    item.a_in = 32'h33333333; item.b_in = 32'h44444444;
    item.operation_name = "CSR_WRITE_REG";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_csr_write = 1; item.ap_csr_imm = 0;
    item.a_in = 32'h0F0F0F0F; item.b_in = 32'hF0F0F0F0;
    item.operation_name = "CSR_WRITE_REG";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_csr_write = 1; item.ap_csr_imm = 0;
    item.a_in = 32'h00FF00FF; item.b_in = 32'hFF00FF00;
    item.operation_name = "CSR_WRITE_REG";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_csr_write = 1; item.ap_csr_imm = 0;
    item.a_in = 32'h13579BDF; item.b_in = 32'h2468ACE0;
    item.operation_name = "CSR_WRITE_REG";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_csr_write = 1; item.ap_csr_imm = 0;
    item.a_in = 32'hFEDCBA98; item.b_in = 32'h89ABCDEF;
    item.operation_name = "CSR_WRITE_REG";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_csr_write = 1; item.ap_csr_imm = 0;
    item.a_in = 32'h00000400; item.b_in = 32'h20000000;
    item.operation_name = "CSR_WRITE_REG";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_csr_write = 1; item.ap_csr_imm = 0;
    item.a_in = 32'h80000001; item.b_in = 32'h7FFFFFFF;
    item.operation_name = "CSR_WRITE_REG";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_csr_write = 1; item.ap_csr_imm = 0;
    item.a_in = 32'h5A5A5A5A; item.b_in = 32'hA5A5A5A5;
    item.operation_name = "CSR_WRITE_REG";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_csr_write = 1; item.ap_csr_imm = 0;
    item.a_in = 32'h66666666; item.b_in = 32'h77777777;
    item.operation_name = "CSR_WRITE_REG";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_csr_write = 1; item.ap_csr_imm = 0;
    item.a_in = 32'h88888888; item.b_in = 32'h88888888;
    item.operation_name = "CSR_WRITE_REG";
    start_item(item); finish_item(item);
    
  endtask
endclass
