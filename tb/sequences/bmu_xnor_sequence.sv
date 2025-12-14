class bmu_xnor_sequence extends bmu_base_sequence;
  `uvm_object_utils(bmu_xnor_sequence)
  
  function new(string name = "bmu_xnor_sequence");
    super.new(name);
  endfunction
  
  virtual task body();
    bmu_seq_item item;
    
    `uvm_info(get_type_name(), "Executing XNOR Sequence", UVM_LOW)
    
    item = create_clean_item();
    item.ap_lxor = 1; item.ap_zbb = 1;
    item.a_in = 32'h00000000; item.b_in = 32'h00000000;
    item.operation_name = "XNOR";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_lxor = 1; item.ap_zbb = 1;
    item.a_in = 32'hFFFFFFFF; item.b_in = 32'hFFFFFFFF;
    item.operation_name = "XNOR";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_lxor = 1; item.ap_zbb = 1;
    item.a_in = 32'h12345678; item.b_in = 32'h12345678;
    item.operation_name = "XNOR";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_lxor = 1; item.ap_zbb = 1;
    item.a_in = 32'hAAAAAAAA; item.b_in = 32'h55555555;
    item.operation_name = "XNOR";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_lxor = 1; item.ap_zbb = 1;
    item.a_in = 32'h12345678; item.b_in = 32'hEDCBA987;
    item.operation_name = "XNOR";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_lxor = 1; item.ap_zbb = 1;
    item.a_in = 32'h7FFFFFFF; item.b_in = 32'h7FFFFFFF;
    item.operation_name = "XNOR";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_lxor = 1; item.ap_zbb = 1;
    item.a_in = 32'h80000000; item.b_in = 32'h80000000;
    item.operation_name = "XNOR";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_lxor = 1; item.ap_zbb = 1;
    item.a_in = 32'h000000AA; item.b_in = 32'h000000EE;
    item.operation_name = "XNOR";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_lxor = 1; item.ap_zbb = 1;
    item.a_in = 32'h0000BEEF; item.b_in = 32'h0000FACE;
    item.operation_name = "XNOR";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_lxor = 1; item.ap_zbb = 1;
    item.a_in = 32'h87654321; item.b_in = 32'hABCDEF01;
    item.operation_name = "XNOR";
    start_item(item); finish_item(item);
    
    repeat(5) begin
      item = create_clean_item();
      item.ap_lxor = 1; item.ap_zbb = 1;
      item.operation_name = "XNOR";
      send_item(item);
    end
  endtask
endclass
