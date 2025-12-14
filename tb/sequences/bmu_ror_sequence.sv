class bmu_ror_sequence extends bmu_base_sequence;
  `uvm_object_utils(bmu_ror_sequence)
  
  function new(string name = "bmu_ror_sequence");
    super.new(name);
  endfunction
  
  virtual task body();
    bmu_seq_item item;
    
    `uvm_info(get_type_name(), "Executing ROR Sequence", UVM_LOW)
    
    item = create_clean_item();
    item.ap_ror = 1;
    item.a_in = 32'h12345678; item.b_in = 0;
    item.operation_name = "ROR";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_ror = 1;
    item.a_in = 32'h87654321; item.b_in = 3;
    item.operation_name = "ROR";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_ror = 1;
    item.a_in = 32'hF0F0F0F0; item.b_in = 8;
    item.operation_name = "ROR";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_ror = 1;
    item.a_in = 32'hABCD1234; item.b_in = 12;
    item.operation_name = "ROR";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_ror = 1;
    item.a_in = 32'h98765432; item.b_in = 16;
    item.operation_name = "ROR";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_ror = 1;
    item.a_in = 32'hDEADBEEF; item.b_in = 20;
    item.operation_name = "ROR";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_ror = 1;
    item.a_in = 32'hCAFEBABE; item.b_in = 24;
    item.operation_name = "ROR";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_ror = 1;
    item.a_in = 32'hFFFFFFFF; item.b_in = 31;
    item.operation_name = "ROR";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_ror = 1;
    item.a_in = 32'h87654321; item.b_in = 32'hFFFFFFE3;
    item.operation_name = "ROR";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_ror = 1;
    item.a_in = 32'h12345678; item.b_in = 32;
    item.operation_name = "ROR";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_ror = 1;
    item.a_in = 32'h00000000; item.b_in = 8;
    item.operation_name = "ROR";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_ror = 1;
    item.a_in = 32'hFFFFFFFF; item.b_in = 4;
    item.operation_name = "ROR";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_ror = 1;
    item.a_in = 32'h7FFFFFFF; item.b_in = 8;
    item.operation_name = "ROR";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_ror = 1;
    item.a_in = 32'h80000000; item.b_in = 8;
    item.operation_name = "ROR";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_ror = 1;
    item.a_in = 32'hAAAAAAAA; item.b_in = 4;
    item.operation_name = "ROR";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_ror = 1;
    item.a_in = 32'h55555555; item.b_in = 4;
    item.operation_name = "ROR";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_ror = 1;
    item.a_in = 32'h00000001; item.b_in = 1;
    item.operation_name = "ROR";
    start_item(item); finish_item(item);
    
    repeat(5) begin
      item = create_clean_item();
      item.ap_ror = 1;
      item.operation_name = "ROR";
      send_item(item);
    end
  endtask
endclass
