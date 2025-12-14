class bmu_binv_sequence extends bmu_base_sequence;
  `uvm_object_utils(bmu_binv_sequence)
  
  function new(string name = "bmu_binv_sequence");
    super.new(name);
  endfunction
  
  virtual task body();
    bmu_seq_item item;
    
    `uvm_info(get_type_name(), "Executing BINV Sequence", UVM_LOW)
    
    item = create_clean_item();
    item.ap_binv = 1;
    item.a_in = 32'h12345678; item.b_in = 0;
    item.operation_name = "BINV";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_binv = 1;
    item.a_in = 32'h12345678; item.b_in = 1;
    item.operation_name = "BINV";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_binv = 1;
    item.a_in = 32'hF0F0F0F0; item.b_in = 8;
    item.operation_name = "BINV";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_binv = 1;
    item.a_in = 32'hABCD1234; item.b_in = 15;
    item.operation_name = "BINV";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_binv = 1;
    item.a_in = 32'h98765432; item.b_in = 16;
    item.operation_name = "BINV";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_binv = 1;
    item.a_in = 32'hDEADBEEF; item.b_in = 24;
    item.operation_name = "BINV";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_binv = 1;
    item.a_in = 32'h7FFFFFFF; item.b_in = 31;
    item.operation_name = "BINV";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_binv = 1;
    item.a_in = 32'h12345678; item.b_in = 32'hFFFFFFE3;
    item.operation_name = "BINV";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_binv = 1;
    item.a_in = 32'h00000000; item.b_in = 0;
    item.operation_name = "BINV";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_binv = 1;
    item.a_in = 32'hFFFFFFFF; item.b_in = 0;
    item.operation_name = "BINV";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_binv = 1;
    item.a_in = 32'h7FFFFFFF; item.b_in = 15;
    item.operation_name = "BINV";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_binv = 1;
    item.a_in = 32'h80000000; item.b_in = 31;
    item.operation_name = "BINV";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_binv = 1;
    item.a_in = 32'hAAAAAAAA; item.b_in = 7;
    item.operation_name = "BINV";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_binv = 1;
    item.a_in = 32'h55555555; item.b_in = 7;
    item.operation_name = "BINV";
    start_item(item); finish_item(item);
    
    repeat(5) begin
      item = create_clean_item();
      item.ap_binv = 1;
      item.operation_name = "BINV";
      send_item(item);
    end
  endtask
endclass
