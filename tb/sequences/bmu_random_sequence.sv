// Random Stimulus Sequence
class bmu_random_sequence extends bmu_base_sequence;
  `uvm_object_utils(bmu_random_sequence)
  
  rand int num_transactions;
  
  constraint num_trans_c {
    num_transactions inside {[100:1000]};
  }
  
  function new(string name = "bmu_random_sequence");
    super.new(name);
  endfunction
  
  virtual task body();
    bmu_seq_item item;
    
    `uvm_info(get_type_name(), $sformatf("Executing Random Sequence with %0d transactions", num_transactions), UVM_LOW)
    
    repeat(num_transactions) begin
      item = bmu_seq_item::type_id::create("random_item");
      start_item(item);
      if (!item.randomize()) begin
        `uvm_error(get_type_name(), "Randomization failed")
      end
      finish_item(item);
    end
  endtask
endclass
