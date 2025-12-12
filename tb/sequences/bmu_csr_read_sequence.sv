class bmu_csr_read_sequence extends bmu_base_sequence;
  `uvm_object_utils(bmu_csr_read_sequence)
  
  function new(string name = "bmu_csr_read_sequence");
    super.new(name);
  endfunction
  
  virtual task body();
    bmu_seq_item item;
    
    `uvm_info(get_type_name(), "Executing CSR Read Sequence (Enhanced)", UVM_LOW)
    
    
    item = create_clean_item();
    item.csr_ren_in = 1;
    item.csr_rddata_in = 32'hDEADBEEF;
    item.a_in = 32'h11111111; item.b_in = 32'h22222222;
    item.operation_name = "CSR_READ";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.csr_ren_in = 1;
    item.csr_rddata_in = 32'h00000000;
    item.a_in = 32'hFFFFFFFF; item.b_in = 32'hFFFFFFFF;
    item.operation_name = "CSR_READ";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.csr_ren_in = 1;
    item.csr_rddata_in = 32'hFFFFFFFF;
    item.a_in = 32'h00000000; item.b_in = 32'h00000000;
    item.operation_name = "CSR_READ";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.csr_ren_in = 1;
    item.csr_rddata_in = 32'hAAAAAAAA;
    item.a_in = 32'h55555555; item.b_in = 32'h33333333;
    item.operation_name = "CSR_READ";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.csr_ren_in = 1;
    item.csr_rddata_in = 32'h55555555;
    item.a_in = 32'hAAAAAAAA; item.b_in = 32'h44444444;
    item.operation_name = "CSR_READ";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.csr_ren_in = 1;
    item.csr_rddata_in = 32'h80000001;
    item.a_in = 32'h12345678; item.b_in = 32'h87654321;
    item.operation_name = "CSR_READ";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.csr_ren_in = 1;
    item.csr_rddata_in = 32'h7FFFFFFE;
    item.a_in = 32'hFEDCBA98; item.b_in = 32'h89ABCDEF;
    item.operation_name = "CSR_READ";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.csr_ren_in = 1;
    item.csr_rddata_in = 32'hCAFEBABE;
    item.a_in = 32'h99999999; item.b_in = 32'h66666666;
    item.operation_name = "CSR_READ";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.csr_ren_in = 1;
    item.csr_rddata_in = 32'h13579BDF;
    item.a_in = 32'hECA86420; item.b_in = 32'h2468ACE0;
    item.operation_name = "CSR_READ";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.csr_ren_in = 1;
    item.csr_rddata_in = 32'h0F0F0F0F;
    item.a_in = 32'hF0F0F0F0; item.b_in = 32'hF0F0F0F0;
    item.operation_name = "CSR_READ";
    start_item(item); finish_item(item);
    
  endtask
endclass
