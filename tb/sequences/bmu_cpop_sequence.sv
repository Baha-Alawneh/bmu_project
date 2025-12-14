class bmu_cpop_sequence extends bmu_base_sequence;
  `uvm_object_utils(bmu_cpop_sequence)
  
  function new(string name = "bmu_cpop_sequence");
    super.new(name);
  endfunction
  
  virtual task body();
    bmu_seq_item item;
    
    `uvm_info(get_type_name(), "Executing CPOP Sequence", UVM_LOW)
    
    item = create_clean_item();
    item.ap_cpop = 1;
    item.a_in = 32'h00000000;
    item.operation_name = "CPOP";
    send_item(item);
    
    item = create_clean_item();
    item.ap_cpop = 1;
    item.a_in = 32'hFFFFFFFF;
    item.operation_name = "CPOP";
    send_item(item);
    
    item = create_clean_item();
    item.ap_cpop = 1;
    item.a_in = 32'h7FFFFFFF;
    item.operation_name = "CPOP";
    send_item(item);
    
    item = create_clean_item();
    item.ap_cpop = 1;
    item.a_in = 32'h80000000;
    item.operation_name = "CPOP";
    send_item(item);
    
    item = create_clean_item();
    item.ap_cpop = 1;
    item.a_in = 32'h00000001;
    item.operation_name = "CPOP";
    send_item(item);
    
    item = create_clean_item();
    item.ap_cpop = 1;
    item.a_in = 32'h00000003;
    item.operation_name = "CPOP";
    send_item(item);
    
    item = create_clean_item();
    item.ap_cpop = 1;
    item.a_in = 32'hAAAAAAAA;
    item.operation_name = "CPOP";
    send_item(item);
    
    item = create_clean_item();
    item.ap_cpop = 1;
    item.a_in = 32'h55555555;
    item.operation_name = "CPOP";
    send_item(item);
    
    item = create_clean_item();
    item.ap_cpop = 1;
    item.a_in = 32'h000000AA;
    item.operation_name = "CPOP";
    send_item(item);
    
    item = create_clean_item();
    item.ap_cpop = 1;
    item.a_in = 32'h0000CCCC;
    item.operation_name = "CPOP";
    send_item(item);
    
    item = create_clean_item();
    item.ap_cpop = 1;
    item.a_in = 32'h55AA55AA;
    item.operation_name = "CPOP";
    send_item(item);
    
    item = create_clean_item();
    item.ap_cpop = 1;
    item.a_in = 32'h01010101;
    item.operation_name = "CPOP";
    send_item(item);
    
    repeat(5) begin
      item = create_clean_item();
      item.ap_cpop = 1;
      item.operation_name = "CPOP";
      send_item(item);
    end
  endtask
endclass
