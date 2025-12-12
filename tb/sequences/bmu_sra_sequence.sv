class bmu_sra_sequence extends bmu_base_sequence;
  `uvm_object_utils(bmu_sra_sequence)
  
  function new(string name = "bmu_sra_sequence");
    super.new(name);
  endfunction
  
  virtual task body();
    bmu_seq_item item;
    
    `uvm_info(get_type_name(), "Executing SRA Sequence", UVM_LOW)
    
    item = create_clean_item();
    item.ap_sra = 1;
    item.a_in = 32'h00000000; item.b_in = 0;
    item.operation_name = "SRA";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_sra = 1;
    item.a_in = 32'hFFFFFFFF; item.b_in = 3;
    item.operation_name = "SRA";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_sra = 1;
    item.a_in = 32'h7FFFFFFF; item.b_in = 8;
    item.operation_name = "SRA";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_sra = 1;
    item.a_in = 32'h80000000; item.b_in = 16;
    item.operation_name = "SRA";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_sra = 1;
    item.a_in = 32'h000000AA; item.b_in = 24;
    item.operation_name = "SRA";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_sra = 1;
    item.a_in = 32'h0000CAFE; item.b_in = 32'h00001234;
    item.operation_name = "SRA";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_sra = 1;
    item.a_in = 32'hDEADBEEF; item.b_in = 32'h12345678;
    item.operation_name = "SRA";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_sra = 1;
    item.a_in = 32'hFFFFFFFF; item.b_in = 0;
    item.operation_name = "SRA";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_sra = 1;
    item.a_in = 32'hFFFFFFFF; item.b_in = 3;
    item.operation_name = "SRA";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_sra = 1;
    item.a_in = 32'hFFFFFFFF; item.b_in = 8;
    item.operation_name = "SRA";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_sra = 1;
    item.a_in = 32'hFFFFFFFF; item.b_in = 16;
    item.operation_name = "SRA";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_sra = 1;
    item.a_in = 32'hFFFFFFFF; item.b_in = 24;
    item.operation_name = "SRA";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_sra = 1;
    item.a_in = 32'hFFFFFFFF; item.b_in = 31;
    item.operation_name = "SRA";
    start_item(item); finish_item(item);
    
    repeat(5) begin
      item = create_clean_item();
      item.ap_sra = 1;
      item.operation_name = "SRA";
      send_item(item);
    end
  endtask
endclass
