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
    item.a_in = 32'h00000000; item.b_in = 0;
    item.operation_name = "ROR";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_ror = 1;
    item.a_in = 32'hFFFFFFFF; item.b_in = 3;
    item.operation_name = "ROR";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_ror = 1;
    item.a_in = 32'h7FFFFFFF; item.b_in = 8;
    item.operation_name = "ROR";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_ror = 1;
    item.a_in = 32'h80000000; item.b_in = 16;
    item.operation_name = "ROR";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_ror = 1;
    item.a_in = 32'h000000AA; item.b_in = 24;
    item.operation_name = "ROR";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_ror = 1;
    item.a_in = 32'hFFFFFFFF; item.b_in = 0;
    item.operation_name = "ROR";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_ror = 1;
    item.a_in = 32'hFFFFFFFF; item.b_in = 3;
    item.operation_name = "ROR";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_ror = 1;
    item.a_in = 32'hFFFFFFFF; item.b_in = 8;
    item.operation_name = "ROR";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_ror = 1;
    item.a_in = 32'hFFFFFFFF; item.b_in = 16;
    item.operation_name = "ROR";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_ror = 1;
    item.a_in = 32'hFFFFFFFF; item.b_in = 24;
    item.operation_name = "ROR";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_ror = 1;
    item.a_in = 32'hFFFFFFFF; item.b_in = 31;
    item.operation_name = "ROR";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_ror = 1;
    item.a_in = 32'h0000DEAD; item.b_in = 32'h00001111;
    item.operation_name = "ROR";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_ror = 1;
    item.a_in = 32'hFEEDFACE; item.b_in = 32'h98765432;
    item.operation_name = "ROR";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_ror = 1;
    item.a_in = 32'h55555555; item.b_in = 32'h00000000;
    item.operation_name = "ROR";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_ror = 1;
    item.a_in = 32'h55555555; item.b_in = 32'hFFFFFFFF;
    item.operation_name = "ROR";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_ror = 1;
    item.a_in = 32'h55555555; item.b_in = 32'h7FFFFFFF;
    item.operation_name = "ROR";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_ror = 1;
    item.a_in = 32'h55555555; item.b_in = 32'h80000000;
    item.operation_name = "ROR";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_ror = 1;
    item.a_in = 32'h55555555; item.b_in = 32'h000000C3;
    item.operation_name = "ROR";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_ror = 1;
    item.a_in = 32'h55555555; item.b_in = 32'h0000CDEF;
    item.operation_name = "ROR";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_ror = 1;
    item.a_in = 32'h55555555; item.b_in = 32'hABCDEF12;
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
