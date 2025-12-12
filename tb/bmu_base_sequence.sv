
class bmu_base_sequence extends uvm_sequence #(bmu_seq_item);
  
  `uvm_object_utils(bmu_base_sequence)
  
  function new(string name = "bmu_base_sequence");
    super.new(name);
  endfunction
  
  task send_item(bmu_seq_item item);
    start_item(item);
    if (!item.randomize(a_in, b_in) with {valid_in == 1; scan_mode == 0;}) begin
      `uvm_error(get_type_name(), "Randomization of a_in/b_in failed")
    end
    finish_item(item);
  endtask
  
  task send_item_random(bmu_seq_item item);
    start_item(item);
    if (!item.randomize(a_in, b_in) with {valid_in == 1; scan_mode == 0;}) begin
      `uvm_error(get_type_name(), "Randomization of a_in/b_in failed")
    end
    finish_item(item);
  endtask
  
  function bmu_seq_item create_clean_item(string name = "item");
    bmu_seq_item item = bmu_seq_item::type_id::create(name);
    item.reset_ap_fields();
    item.rst_l = 1;
    item.valid_in = 1;
    item.scan_mode = 0;
    item.csr_ren_in = 0;
    return item;
  endfunctionىخ
  
endclass : bmu_base_sequence

class bmu_reset_sequence extends bmu_base_sequence;
  
  `uvm_object_utils(bmu_reset_sequence)
  
  function new(string name = "bmu_reset_sequence");
    super.new(name);
  endfunction
  
  virtual task body();
    bmu_seq_item item;
    
    `uvm_info(get_type_name(), "Executing Reset Sequence", UVM_LOW)
    
    item = create_clean_item("reset_item");
    item.rst_l = 0;
    start_item(item);
    finish_item(item);
    
    item = create_clean_item("reset_deassert");
    item.rst_l = 1;
    start_item(item);
    finish_item(item);
  endtask
  
endclass : bmu_reset_sequence
