class bmu_shift_test extends bmu_base_test;

  `uvm_component_utils(bmu_shift_test)

  function new(string name = "bmu_shift_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  bmu_srl_sequence    srl_seq;
  bmu_sra_sequence    sra_seq;
  bmu_ror_sequence    ror_seq;
  bmu_binv_sequence   binv_seq;
  bmu_sh2add_sequence sh2add_seq;

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    srl_seq    = bmu_srl_sequence::type_id::create("srl_seq");
    sra_seq    = bmu_sra_sequence::type_id::create("sra_seq");
    ror_seq    = bmu_ror_sequence::type_id::create("ror_seq");
    binv_seq   = bmu_binv_sequence::type_id::create("binv_seq");
    sh2add_seq = bmu_sh2add_sequence::type_id::create("sh2add_seq");
  endfunction

  virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);

    `uvm_info(get_type_name(), "Shift Test", UVM_LOW)

    srl_seq.start(env.agent.sequencer);
    sra_seq.start(env.agent.sequencer);
    ror_seq.start(env.agent.sequencer);
    binv_seq.start(env.agent.sequencer);
    sh2add_seq.start(env.agent.sequencer);

    #100;
    `uvm_info(get_type_name(), "Shift Test Completed", UVM_LOW)

    phase.drop_objection(this);
  endtask

endclass : bmu_shift_test
