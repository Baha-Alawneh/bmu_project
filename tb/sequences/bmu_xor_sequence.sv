class bmu_xor_sequence extends bmu_base_sequence;
  `uvm_object_utils(bmu_xor_sequence)
  
  function new(string name = "bmu_xor_sequence");
    super.new(name);
  endfunction
  
  virtual task body();
    bmu_seq_item item;
    
    `uvm_info(get_type_name(), "Executing XOR Sequence", UVM_LOW)
    
    item = create_clean_item();
    item.ap_lxor = 1; item.ap_zbb = 0;
    item.a_in = 32'h00000000; item.b_in = 32'h0;
    item.operation_name = "XOR";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_lxor = 1; item.ap_zbb = 0;
    item.a_in = 32'hFFFFFFFF; item.b_in = 32'hFFFFFFFF;
    item.operation_name = "XOR";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_lxor = 1; item.ap_zbb = 0;
    item.a_in = 32'h7FFFFFFF; item.b_in = 32'h7FFFFFFF;
    item.operation_name = "XOR";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_lxor = 1; item.ap_zbb = 0;
    item.a_in = 32'h80000000; item.b_in = 32'h80000000;
    item.operation_name = "XOR";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_lxor = 1; item.ap_zbb = 0;
    item.a_in = 32'h000000AA; item.b_in = 32'h000000CC;
    item.operation_name = "XOR";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_lxor = 1; item.ap_zbb = 0;
    item.a_in = 32'h00001234; item.b_in = 32'h00009ABC;
    item.operation_name = "XOR";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_lxor = 1; item.ap_zbb = 0;
    item.a_in = 32'hABCDEF01; item.b_in = 32'h23456789;
    item.operation_name = "XOR";
    start_item(item); finish_item(item);
    
    repeat(5) begin
      item = create_clean_item();
      item.ap_lxor = 1; item.ap_zbb = 0;
      item.operation_name = "XOR";
      send_item(item);
    end
  endtask
endclass
