class bmu_random_test extends bmu_base_test;
  
  `uvm_component_utils(bmu_random_test)
  
  function new(string name = "bmu_random_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  bmu_random_sequence random_seq;

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    random_seq = bmu_random_sequence::type_id::create("random_seq");
  endfunction

  virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    
    `uvm_info(get_type_name(), "Random Test", UVM_LOW)
    
    assert(random_seq.randomize() with {num_transactions == 10000;});
    random_seq.start(env.agent.sequencer);
    
    #1000;
    `uvm_info(get_type_name(), "Random Test Completed", UVM_LOW)
    
    phase.drop_objection(this);
  endtask
  
endclass : bmu_random_test
