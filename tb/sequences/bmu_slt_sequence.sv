class bmu_slt_sequence extends bmu_base_sequence;
  `uvm_object_utils(bmu_slt_sequence)
  
  function new(string name = "bmu_slt_sequence");
    super.new(name);
  endfunction
  
  virtual task body();
    bmu_seq_item item;
    
    `uvm_info(get_type_name(), "Executing SLT Sequence", UVM_LOW)
    
    item = create_clean_item();
    item.ap_slt = 1; item.ap_sub = 1; item.ap_unsign = 0;
    item.a_in = 32'h00000000; item.b_in = 32'h00000001;
    item.operation_name = "SLT";
    send_item(item);
    
    item = create_clean_item();
    item.ap_slt = 1; item.ap_sub = 1; item.ap_unsign = 0;
    item.a_in = 32'hFFFFFFFF; item.b_in = 32'h00000001;
    item.operation_name = "SLT";
    send_item(item);
    
    item = create_clean_item();
    item.ap_slt = 1; item.ap_sub = 1; item.ap_unsign = 0;
    item.a_in = 32'h7FFFFFFF; item.b_in = 32'h80000000;
    item.operation_name = "SLT";
    send_item(item);
    
    item = create_clean_item();
    item.ap_slt = 1; item.ap_sub = 1; item.ap_unsign = 0;
    item.a_in = 32'h80000000; item.b_in = 32'h7FFFFFFF;
    item.operation_name = "SLT";
    send_item(item);
    
    item = create_clean_item();
    item.ap_slt = 1; item.ap_sub = 1; item.ap_unsign = 0;
    item.a_in = 32'h000000AA; item.b_in = 32'h000000FF;
    item.operation_name = "SLT";
    send_item(item);
    
    item = create_clean_item();
    item.ap_slt = 1; item.ap_sub = 1; item.ap_unsign = 0;
    item.a_in = 32'h00007777; item.b_in = 32'h0000BBBB;
    item.operation_name = "SLT";
    send_item(item);
    
    item = create_clean_item();
    item.ap_slt = 1; item.ap_sub = 1; item.ap_unsign = 0;
    item.a_in = 32'h33333333; item.b_in = 32'h66666666;
    item.operation_name = "SLT";
    send_item(item);
    
    repeat(5) begin
      item = create_clean_item();
      item.ap_slt = 1; item.ap_sub = 1; item.ap_unsign = 0;
      item.operation_name = "SLT";
      send_item(item);
    end
  endtask
endclass
