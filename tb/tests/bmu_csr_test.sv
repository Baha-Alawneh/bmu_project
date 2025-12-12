class bmu_csr_test extends bmu_base_test;

  `uvm_component_utils(bmu_csr_test)

  function new(string name = "bmu_csr_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  bmu_csr_write_sequence csr_write_seq;
  bmu_csr_read_sequence  csr_read_seq;

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    csr_write_seq = bmu_csr_write_sequence::type_id::create("csr_write_seq");
    csr_read_seq  = bmu_csr_read_sequence::type_id::create("csr_read_seq");
  endfunction

  virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);

    `uvm_info(get_type_name(), "CSR Operations Test", UVM_LOW)

    csr_write_seq.start(env.agent.sequencer);
    csr_read_seq.start(env.agent.sequencer);

    #100;
    `uvm_info(get_type_name(), "CSR Operations Test Completed", UVM_LOW)

    phase.drop_objection(this);
  endtask

endclass : bmu_csr_test
