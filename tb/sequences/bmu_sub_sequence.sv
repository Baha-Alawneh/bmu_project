class bmu_sub_sequence extends bmu_base_sequence;
  `uvm_object_utils(bmu_sub_sequence)
  
  function new(string name = "bmu_sub_sequence");
    super.new(name);
  endfunction
  
  virtual task body();
    bmu_seq_item item;
    
    `uvm_info(get_type_name(), "Executing SUB Sequence (Enhanced)", UVM_LOW)
    
    item = create_clean_item();
    item.ap_sub = 1; item.ap_zba = 0;
    item.a_in = 32'h00000000; item.b_in = 32'h00000001;
    item.operation_name = "SUB";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_sub = 1; item.ap_zba = 0;
    item.a_in = 32'hFFFFFFFF; item.b_in = 32'h00000001;
    item.operation_name = "SUB";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_sub = 1; item.ap_zba = 0;
    item.a_in = 32'h7FFFFFFF; item.b_in = 32'h80000000;
    item.operation_name = "SUB";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_sub = 1; item.ap_zba = 0;
    item.a_in = 32'h80000000; item.b_in = 32'h7FFFFFFF;
    item.operation_name = "SUB";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_sub = 1; item.ap_zba = 0;
    item.a_in = 32'h000000AA; item.b_in = 32'h00000055;
    item.operation_name = "SUB";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_sub = 1; item.ap_zba = 0;
    item.a_in = 32'h0000FFFF; item.b_in = 32'h00001111;
    item.operation_name = "SUB";
    start_item(item); finish_item(item);
    
    item = create_clean_item();
    item.ap_sub = 1; item.ap_zba = 0;
    item.a_in = 32'hAABBCCDD; item.b_in = 32'h11223344;
    item.operation_name = "SUB";
    start_item(item); finish_item(item);
    
    repeat(5) begin
      item = create_clean_item();
      item.ap_sub = 1; item.ap_zba = 0;
      item.operation_name = "SUB";
      send_item(item);
    end
    
    repeat(2) begin
      item = create_clean_item();
      item.ap_sub = 1; item.ap_zba = 1;
      item.operation_name = "SUB_ERROR";
      send_item(item);
    end
  endtask
endclass

