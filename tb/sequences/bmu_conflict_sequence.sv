class bmu_conflict_sequence extends bmu_base_sequence;
  `uvm_object_utils(bmu_conflict_sequence)
  
  function new(string name = "bmu_conflict_sequence");
    super.new(name);
  endfunction
  
  virtual task body();
    bmu_seq_item item;
    
    `uvm_info(get_type_name(), "Executing Conflict Error Sequence (Enhanced)", UVM_LOW)
    
    
    item = create_clean_item();
    item.ap_lor = 1; item.ap_lxor = 1;
    item.a_in = 32'hAAAAAAAA; item.b_in = 32'h55555555;
    item.operation_name = "CONFLICT_LOR_LXOR";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_lor = 1; item.ap_land = 1;
    item.a_in = 32'hF0F0F0F0; item.b_in = 32'h0F0F0F0F;
    item.operation_name = "CONFLICT_LOR_LAND";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_lxor = 1; item.ap_land = 1;
    item.a_in = 32'hFFFF0000; item.b_in = 32'h0000FFFF;
    item.operation_name = "CONFLICT_LXOR_LAND";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_lor = 1; item.ap_lxor = 1; item.ap_land = 1;
    item.a_in = 32'h12345678; item.b_in = 32'h87654321;
    item.operation_name = "CONFLICT_LOR_LXOR_LAND";
    start_item(item); finish_item(item);
    
    
    item = create_clean_item();
    item.ap_srl = 1; item.ap_sra = 1;
    item.a_in = 32'hF0000000; item.b_in = 4;
    item.operation_name = "CONFLICT_SRL_SRA";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_srl = 1; item.ap_ror = 1;
    item.a_in = 32'h80000001; item.b_in = 8;
    item.operation_name = "CONFLICT_SRL_ROR";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_sra = 1; item.ap_ror = 1;
    item.a_in = 32'hC0000003; item.b_in = 16;
    item.operation_name = "CONFLICT_SRA_ROR";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_binv = 1; item.ap_srl = 1;
    item.a_in = 32'hAAAAAAAA; item.b_in = 5;
    item.operation_name = "CONFLICT_BINV_SRL";
    start_item(item); finish_item(item);
    
    
    item = create_clean_item();
    item.csr_ren_in = 1; item.ap_lxor = 1;
    item.csr_rddata_in = 32'h12345678;
    item.a_in = 32'hAAAAAAAA; item.b_in = 32'h55555555;
    item.operation_name = "CONFLICT_CSR_LXOR";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.csr_ren_in = 1; item.ap_lor = 1;
    item.csr_rddata_in = 32'hDEADBEEF;
    item.a_in = 32'hFFFF0000; item.b_in = 32'h0000FFFF;
    item.operation_name = "CONFLICT_CSR_LOR";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.csr_ren_in = 1; item.ap_srl = 1;
    item.csr_rddata_in = 32'hCAFEBABE;
    item.a_in = 32'hF0000000; item.b_in = 4;
    item.operation_name = "CONFLICT_CSR_SRL";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.csr_ren_in = 1; item.ap_sh2add = 1; item.ap_zba = 1;
    item.csr_rddata_in = 32'h13579BDF;
    item.a_in = 32'h12345678; item.b_in = 32'h87654321;
    item.operation_name = "CONFLICT_CSR_SH2ADD";
    start_item(item); finish_item(item);
    
    
    item = create_clean_item();
    item.ap_lor = 1; item.ap_sra = 1;
    item.a_in = 32'h80000000; item.b_in = 1;
    item.operation_name = "CONFLICT_LOR_SRA";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_slt = 1; item.ap_lxor = 1;
    item.a_in = 32'h00000005; item.b_in = 32'h0000000A;
    item.operation_name = "CONFLICT_SLT_LXOR";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_max = 1; item.ap_ror = 1;
    item.a_in = 32'h12345678; item.b_in = 32'h87654321;
    item.operation_name = "CONFLICT_MAX_ROR";
    start_item(item); finish_item(item);
    
    
    item = create_clean_item();
    item.ap_csr_write = 1; item.ap_csr_imm = 1; item.ap_lor = 1;
    item.a_in = 32'h11111111; item.b_in = 32'h22222222;
    item.operation_name = "CONFLICT_CSRW_LOR";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_csr_write = 1; item.ap_csr_imm = 0; item.ap_srl = 1;
    item.a_in = 32'hF0000000; item.b_in = 4;
    item.operation_name = "CONFLICT_CSRW_SRL";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.csr_ren_in = 1; item.ap_csr_write = 1; item.ap_csr_imm = 1;
    item.csr_rddata_in = 32'hAAAAAAAA;
    item.a_in = 32'h55555555; item.b_in = 32'hFFFFFFFF;
    item.operation_name = "CONFLICT_CSRR_CSRW";
    start_item(item); finish_item(item);
    
    
    item = create_clean_item();
    item.ap_lor = 1; item.ap_lxor = 1; item.ap_srl = 1; item.ap_sra = 1;
    item.a_in = 32'hDEADBEEF; item.b_in = 32'hCAFEBABE;
    item.operation_name = "CONFLICT_QUAD";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_lor = 1; item.ap_lxor = 1; item.ap_land = 1;
    item.ap_srl = 1; item.ap_sra = 1;
    item.a_in = 32'h12345678; item.b_in = 32'h87654321;
    item.operation_name = "CONFLICT_PENTA";
    start_item(item); finish_item(item);
    
  endtask
endclass
