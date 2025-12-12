class bmu_bitmanip_test extends bmu_base_test;

  `uvm_component_utils(bmu_bitmanip_test)

  function new(string name = "bmu_bitmanip_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  bmu_sltu_sequence   sltu_seq;
  bmu_slt_sequence    slt_seq;
  bmu_ctz_sequence    ctz_seq;
  bmu_cpop_sequence   cpop_seq;
  bmu_sext_b_sequence sext_b_seq;
  bmu_max_sequence    max_seq;
  bmu_pack_sequence   pack_seq;
  bmu_grev_sequence   grev_seq;

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    sltu_seq   = bmu_sltu_sequence::type_id::create("sltu_seq");
    slt_seq    = bmu_slt_sequence::type_id::create("slt_seq");
    ctz_seq    = bmu_ctz_sequence::type_id::create("ctz_seq");
    cpop_seq   = bmu_cpop_sequence::type_id::create("cpop_seq");
    sext_b_seq = bmu_sext_b_sequence::type_id::create("sext_b_seq");
    max_seq    = bmu_max_sequence::type_id::create("max_seq");
    pack_seq   = bmu_pack_sequence::type_id::create("pack_seq");
    grev_seq   = bmu_grev_sequence::type_id::create("grev_seq");
  endfunction

  virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);

    `uvm_info(get_type_name(), "Bit Manipulation Test", UVM_LOW)

    sltu_seq.start(env.agent.sequencer);
    slt_seq.start(env.agent.sequencer);
    ctz_seq.start(env.agent.sequencer);
    cpop_seq.start(env.agent.sequencer);
    sext_b_seq.start(env.agent.sequencer);
    max_seq.start(env.agent.sequencer);
    pack_seq.start(env.agent.sequencer);
    grev_seq.start(env.agent.sequencer);

    #100;
    `uvm_info(get_type_name(), "Bit Manipulation Test Completed", UVM_LOW)

    phase.drop_objection(this);
  endtask

endclass : bmu_bitmanip_test
