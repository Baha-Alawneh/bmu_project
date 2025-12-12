class bmu_logical_test extends bmu_base_test;

  `uvm_component_utils(bmu_logical_test)

  function new(string name = "bmu_logical_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  bmu_or_sequence   or_seq;
  bmu_orn_sequence  orn_seq;
  bmu_xor_sequence  xor_seq;
  bmu_xnor_sequence xnor_seq;

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    or_seq   = bmu_or_sequence::type_id::create("or_seq");
    orn_seq  = bmu_orn_sequence::type_id::create("orn_seq");
    xor_seq  = bmu_xor_sequence::type_id::create("xor_seq");
    xnor_seq = bmu_xnor_sequence::type_id::create("xnor_seq");
  endfunction

  virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    
    `uvm_info(get_type_name(), "Logical Test", UVM_LOW)
    
    or_seq.start(env.agent.sequencer);
    orn_seq.start(env.agent.sequencer);
    xor_seq.start(env.agent.sequencer);
    xnor_seq.start(env.agent.sequencer);

    #100;
    `uvm_info(get_type_name(), "Logical Test Completed", UVM_LOW)

    phase.drop_objection(this);
  endtask

endclass : bmu_logical_test
