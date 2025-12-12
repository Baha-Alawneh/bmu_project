class bmu_error_test extends bmu_base_test;

  `uvm_component_utils(bmu_error_test)

  function new(string name = "bmu_error_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  bmu_conflict_sequence conflict_seq;

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    conflict_seq = bmu_conflict_sequence::type_id::create("conflict_seq");
  endfunction

  virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);

    `uvm_info(get_type_name(), "Error Test", UVM_LOW)

    conflict_seq.start(env.agent.sequencer);

    #100;
    `uvm_info(get_type_name(), "Error Test Completed", UVM_LOW)

    phase.drop_objection(this);
  endtask

endclass : bmu_error_test
