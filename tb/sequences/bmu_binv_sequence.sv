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
    item.a_in = 32'h000000AA; item.b_in = 7;
    item.operation_name = "BINV";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_binv = 1;
    item.a_in = 32'h0000ABCD; item.b_in = 32'h00004321;
    item.operation_name = "BINV";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_binv = 1;
    item.a_in = 32'hFEEDC0DE; item.b_in = 32'h87654321;
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
