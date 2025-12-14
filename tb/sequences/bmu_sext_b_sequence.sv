class bmu_sext_b_sequence extends bmu_base_sequence;
  `uvm_object_utils(bmu_sext_b_sequence)
  
  function new(string name = "bmu_sext_b_sequence");
    super.new(name);
  endfunction
  
  virtual task body();
    bmu_seq_item item;
    
    `uvm_info(get_type_name(), "Executing SEXT_B Sequence", UVM_LOW)
    
    item = create_clean_item();
    item.ap_siext_b = 1;
    item.a_in = 32'h00000000;
    item.operation_name = "SEXT_B";
    send_item(item);
    
    item = create_clean_item();
    item.ap_siext_b = 1;
    item.a_in = 32'hFFFFFFFF;
    item.operation_name = "SEXT_B";
    send_item(item);
    
    item = create_clean_item();
    item.ap_siext_b = 1;
    item.a_in = 32'h7FFFFFFF;
    item.operation_name = "SEXT_B";
    send_item(item);
    
    item = create_clean_item();
    item.ap_siext_b = 1;
    item.a_in = 32'h80000000;
    item.operation_name = "SEXT_B";
    send_item(item);
    
    item = create_clean_item();
    item.ap_siext_b = 1;
    item.a_in = 32'h000000AA;
    item.operation_name = "SEXT_B";
    send_item(item);
    
    item = create_clean_item();
    item.ap_siext_b = 1;
    item.a_in = 32'h00001234;
    item.operation_name = "SEXT_B";
    send_item(item);
    
    item = create_clean_item();
    item.ap_siext_b = 1;
    item.a_in = 32'hABCDEF12;
    item.operation_name = "SEXT_B";
    send_item(item);
    
    item = create_clean_item();
    item.ap_siext_b = 1;
    item.a_in = 32'h12345601;
    item.operation_name = "SEXT_B";
    send_item(item);
    
    item = create_clean_item();
    item.ap_siext_b = 1;
    item.a_in = 32'h123456FF;
    item.operation_name = "SEXT_B";
    send_item(item);
    
    item = create_clean_item();
    item.ap_siext_b = 1;
    item.a_in = 32'hABCDEF81;
    item.operation_name = "SEXT_B";
    send_item(item);
    
    repeat(5) begin
      item = create_clean_item();
      item.ap_siext_b = 1;
      item.operation_name = "SEXT_B";
      send_item(item);
    end
  endtask
endclass
