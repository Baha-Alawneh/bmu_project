class bmu_ctz_sequence extends bmu_base_sequence;
  `uvm_object_utils(bmu_ctz_sequence)
  
  function new(string name = "bmu_ctz_sequence");
    super.new(name);
  endfunction
  
  virtual task body();
    bmu_seq_item item;
    
    `uvm_info(get_type_name(), "Executing CTZ Sequence", UVM_LOW)
    
    item = create_clean_item();
    item.ap_ctz = 1;
    item.a_in = 32'h00000000;
    item.operation_name = "CTZ";
    send_item(item);
    
    item = create_clean_item();
    item.ap_ctz = 1;
    item.a_in = 32'hFFFFFFFF;
    item.operation_name = "CTZ";
    send_item(item);
    
    item = create_clean_item();
    item.ap_ctz = 1;
    item.a_in = 32'h7FFFFFFF;
    item.operation_name = "CTZ";
    send_item(item);
    
    item = create_clean_item();
    item.ap_ctz = 1;
    item.a_in = 32'h80000000;
    item.operation_name = "CTZ";
    send_item(item);
    
    item = create_clean_item();
    item.ap_ctz = 1;
    item.a_in = 32'h000000AA;
    item.operation_name = "CTZ";
    send_item(item);
    
    item = create_clean_item();
    item.ap_ctz = 1;
    item.a_in = 32'h0000FF00;
    item.operation_name = "CTZ";
    send_item(item);
    
    item = create_clean_item();
    item.ap_ctz = 1;
    item.a_in = 32'hABCD0000;
    item.operation_name = "CTZ";
    send_item(item);
    
    repeat(5) begin
      item = create_clean_item();
      item.ap_ctz = 1;
      item.operation_name = "CTZ";
      send_item(item);
    end
  endtask
endclass
