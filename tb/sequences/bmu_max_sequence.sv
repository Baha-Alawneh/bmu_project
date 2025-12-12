class bmu_max_sequence extends bmu_base_sequence;
  `uvm_object_utils(bmu_max_sequence)
  
  function new(string name = "bmu_max_sequence");
    super.new(name);
  endfunction
  
  virtual task body();
    bmu_seq_item item;
    
    `uvm_info(get_type_name(), "Executing MAX Sequence", UVM_LOW)
    
    item = create_clean_item();
    item.ap_max = 1;
    item.a_in = 32'h00000000; item.b_in = 32'h00000001;
    item.operation_name = "MAX";
    send_item(item);
    
    item = create_clean_item();
    item.ap_max = 1;
    item.a_in = 32'hFFFFFFFF; item.b_in = 32'h00000001;
    item.operation_name = "MAX";
    send_item(item);
    
    item = create_clean_item();
    item.ap_max = 1;
    item.a_in = 32'h7FFFFFFF; item.b_in = 32'h80000000;
    item.operation_name = "MAX";
    send_item(item);
    
    item = create_clean_item();
    item.ap_max = 1;
    item.a_in = 32'h80000000; item.b_in = 32'h7FFFFFFF;
    item.operation_name = "MAX";
    send_item(item);
    
    item = create_clean_item();
    item.ap_max = 1;
    item.a_in = 32'h000000AA; item.b_in = 32'h000000FF;
    item.operation_name = "MAX";
    send_item(item);
    
    item = create_clean_item();
    item.ap_max = 1;
    item.a_in = 32'h00006666; item.b_in = 32'h00008888;
    item.operation_name = "MAX";
    send_item(item);
    
    item = create_clean_item();
    item.ap_max = 1;
    item.a_in = 32'h22334455; item.b_in = 32'h66778899;
    item.operation_name = "MAX";
    send_item(item);
    
    repeat(5) begin
      item = create_clean_item();
      item.ap_max = 1;
      item.operation_name = "MAX";
      send_item(item);
    end
  endtask
endclass
