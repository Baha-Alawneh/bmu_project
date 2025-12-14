class bmu_pack_sequence extends bmu_base_sequence;
  `uvm_object_utils(bmu_pack_sequence)
  
  function new(string name = "bmu_pack_sequence");
    super.new(name);
  endfunction
  
  virtual task body();
    bmu_seq_item item;
    
    `uvm_info(get_type_name(), "Executing PACK Sequence", UVM_LOW)
    
    item = create_clean_item();
    item.ap_pack = 1;
    item.a_in = 32'h00000000; item.b_in = 32'h00000000;
    item.operation_name = "PACK";
    send_item(item);
    
    item = create_clean_item();
    item.ap_pack = 1;
    item.a_in = 32'hFFFFFFFF; item.b_in = 32'hFFFFFFFF;
    item.operation_name = "PACK";
    send_item(item);
    
    item = create_clean_item();
    item.ap_pack = 1;
    item.a_in = 32'h00000000; item.b_in = 32'h12345678;
    item.operation_name = "PACK";
    send_item(item);
    
    item = create_clean_item();
    item.ap_pack = 1;
    item.a_in = 32'h12345678; item.b_in = 32'h00000000;
    item.operation_name = "PACK";
    send_item(item);
    
    item = create_clean_item();
    item.ap_pack = 1;
    item.a_in = 32'h7FFFFFFF; item.b_in = 32'h12345678;
    item.operation_name = "PACK";
    send_item(item);
    
    item = create_clean_item();
    item.ap_pack = 1;
    item.a_in = 32'h80000000; item.b_in = 32'h12345678;
    item.operation_name = "PACK";
    send_item(item);
    
    item = create_clean_item();
    item.ap_pack = 1;
    item.a_in = 32'h000000AA; item.b_in = 32'h000000FF;
    item.operation_name = "PACK";
    send_item(item);
    
    item = create_clean_item();
    item.ap_pack = 1;
    item.a_in = 32'h0000EEEE; item.b_in = 32'h0000DDDD;
    item.operation_name = "PACK";
    send_item(item);
    
    item = create_clean_item();
    item.ap_pack = 1;
    item.a_in = 32'hAABBCCDD; item.b_in = 32'h11223344;
    item.operation_name = "PACK";
    send_item(item);
    
    item = create_clean_item();
    item.ap_pack = 1;
    item.a_in = 32'hAAAAAAAA; item.b_in = 32'h55555555;
    item.operation_name = "PACK";
    send_item(item);
    
    repeat(5) begin
      item = create_clean_item();
      item.ap_pack = 1;
      item.operation_name = "PACK";
      send_item(item);
    end
  endtask
endclass
