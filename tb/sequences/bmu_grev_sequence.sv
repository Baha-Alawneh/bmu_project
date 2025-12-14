class bmu_grev_sequence extends bmu_base_sequence;
  `uvm_object_utils(bmu_grev_sequence)
  
  function new(string name = "bmu_grev_sequence");
    super.new(name);
  endfunction
  
  virtual task body();
    bmu_seq_item item;
    
    `uvm_info(get_type_name(), "Executing GREV Sequence", UVM_LOW)
    
    item = create_clean_item();
    item.ap_grev = 1;
    item.a_in = 32'h00000000; item.b_in = 24;
    item.operation_name = "GREV";
    start_item(item);
    finish_item(item);

    item = create_clean_item();
    item.ap_grev = 1;
    item.a_in = 32'hFFFFFFFF; item.b_in = 24;
    item.operation_name = "GREV";
    start_item(item);
    finish_item(item);

    item = create_clean_item();
    item.ap_grev = 1;
    item.a_in = 32'h7FFFFFFF; item.b_in = 24;
    item.operation_name = "GREV";
    start_item(item);
    finish_item(item);

    item = create_clean_item();
    item.ap_grev = 1;
    item.a_in = 32'h80000000; item.b_in = 24;
    item.operation_name = "GREV";
    start_item(item);
    finish_item(item);

    item = create_clean_item();
    item.ap_grev = 1;
    item.a_in = 32'h12345678; item.b_in = 24;
    item.operation_name = "GREV";
    start_item(item);
    finish_item(item);

    item = create_clean_item();
    item.ap_grev = 1;
    item.a_in = 32'h000000AA; item.b_in = 24;
    item.operation_name = "GREV";
    start_item(item);
    finish_item(item);

    item = create_clean_item();
    item.ap_grev = 1;
    item.a_in = 32'h0000ABCD; item.b_in = 24;
    item.operation_name = "GREV";
    start_item(item);
    finish_item(item);

    item = create_clean_item();
    item.ap_grev = 1;
    item.a_in = 32'hFEDCBA98; item.b_in = 24;
    item.operation_name = "GREV";
    start_item(item);
    finish_item(item);

    item = create_clean_item();
    item.ap_grev = 1;
    item.a_in = 32'hAAAAAAAA; item.b_in = 24;
    item.operation_name = "GREV";
    start_item(item);
    finish_item(item);

    item = create_clean_item();
    item.ap_grev = 1;
    item.a_in = 32'h55555555; item.b_in = 24;
    item.operation_name = "GREV";
    start_item(item);
    finish_item(item);

    repeat(5) begin
      item = create_clean_item();
      item.ap_grev = 1;
      item.b_in = 24;
      item.operation_name = "GREV";
      start_item(item);
      assert(item.randomize(a_in));
      finish_item(item);
    end
  endtask
endclass
