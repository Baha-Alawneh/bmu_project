class bmu_arithmetic_test extends bmu_base_test;

  `uvm_component_utils(bmu_arithmetic_test)

  function new(string name = "bmu_arithmetic_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  bmu_sub_sequence sub_seq;

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    sub_seq = bmu_sub_sequence::type_id::create("sub_seq");
  endfunction

  virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    
    `uvm_info(get_type_name(), "Arithmetic Operations Test", UVM_LOW)
    
    sub_seq.start(env.agent.sequencer);
    
    #100;
    `uvm_info(get_type_name(), "Arithmetic Operations Test Completed", UVM_LOW)
    
    phase.drop_objection(this);
  endtask

endclass : bmu_arithmetic_test
