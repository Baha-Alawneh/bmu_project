
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

  function bmu_seq_item create_clean_item(string name = "item");
    bmu_seq_item item = bmu_seq_item::type_id::create(name);
    item.reset_ap_fields();
    item.rst_l = 1;
    item.valid_in = 1;
    item.scan_mode = 0;
    item.csr_ren_in = 0;
    return item;
  endfunction
  
endclass : bmu_base_sequence



