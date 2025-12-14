class bmu_sh2add_sequence extends bmu_base_sequence;
  `uvm_object_utils(bmu_sh2add_sequence)
  
  function new(string name = "bmu_sh2add_sequence");
    super.new(name);
  endfunction
  
  virtual task body();
    bmu_seq_item item;
    
    `uvm_info(get_type_name(), "Executing SH2ADD Sequence", UVM_LOW)
    
    item = create_clean_item();
    item.ap_sh2add = 1; item.ap_zba = 1;
    item.a_in = 32'h00000000; item.b_in = 32'h100;
    item.operation_name = "SH2ADD";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_sh2add = 1; item.ap_zba = 1;
    item.a_in = 32'h00000001; item.b_in = 32'h100;
    item.operation_name = "SH2ADD";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_sh2add = 1; item.ap_zba = 1;
    item.a_in = 32'h000000AA; item.b_in = 32'h100;
    item.operation_name = "SH2ADD";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_sh2add = 1; item.ap_zba = 1;
    item.a_in = 32'h00008888; item.b_in = 32'h00002222;
    item.operation_name = "SH2ADD";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_sh2add = 1; item.ap_zba = 1;
    item.a_in = 32'h11223344; item.b_in = 32'h55667788;
    item.operation_name = "SH2ADD";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_sh2add = 1; item.ap_zba = 1;
    item.a_in = 32'hFFFFFFFF; item.b_in = 32'h100;
    item.operation_name = "SH2ADD";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_sh2add = 1; item.ap_zba = 1;
    item.a_in = 32'h7FFFFFFF; item.b_in = 32'h100;
    item.operation_name = "SH2ADD";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_sh2add = 1; item.ap_zba = 1;
    item.a_in = 32'h80000000; item.b_in = 32'h100;
    item.operation_name = "SH2ADD";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_sh2add = 1; item.ap_zba = 1;
    item.a_in = 32'h40000000; item.b_in = 32'hFFFFFFFF;
    item.operation_name = "SH2ADD";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_sh2add = 1; item.ap_zba = 1;
    item.a_in = 32'hAAAAAAAA; item.b_in = 32'h55555555;
    item.operation_name = "SH2ADD";
    start_item(item); finish_item(item);
    
    repeat(5) begin
      item = create_clean_item();
      item.ap_sh2add = 1; item.ap_zba = 1;
      item.operation_name = "SH2ADD";
      send_item(item);
    end
  endtask
endclass
