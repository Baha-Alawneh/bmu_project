class bmu_regression_test extends bmu_base_test;
  
  `uvm_component_utils(bmu_regression_test)
  
  function new(string name = "bmu_regression_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  bmu_reset_sequence reset_seq;
  
  bmu_or_sequence   or_seq;
  bmu_orn_sequence  orn_seq;
  bmu_xor_sequence  xor_seq;
  bmu_xnor_sequence xnor_seq;
  
  bmu_srl_sequence    srl_seq;
  bmu_sra_sequence    sra_seq;
  bmu_ror_sequence    ror_seq;
  bmu_binv_sequence   binv_seq;
  bmu_sh2add_sequence sh2add_seq;
  
  bmu_sub_sequence sub_seq;
  
  bmu_sltu_sequence   sltu_seq;
  bmu_slt_sequence    slt_seq;
  bmu_ctz_sequence    ctz_seq;
  bmu_cpop_sequence   cpop_seq;
  bmu_sext_b_sequence sext_b_seq;
  bmu_max_sequence    max_seq;
  bmu_pack_sequence   pack_seq;
  bmu_grev_sequence   grev_seq;
  
  bmu_csr_write_sequence csr_write_seq;
  bmu_csr_read_sequence  csr_read_seq;
  
  bmu_conflict_sequence conflict_seq;
  
  bmu_random_sequence random_seq;

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    
    reset_seq = bmu_reset_sequence::type_id::create("reset_seq");
    
    or_seq   = bmu_or_sequence::type_id::create("or_seq");
    orn_seq  = bmu_orn_sequence::type_id::create("orn_seq");
    xor_seq  = bmu_xor_sequence::type_id::create("xor_seq");
    xnor_seq = bmu_xnor_sequence::type_id::create("xnor_seq");
    
    srl_seq    = bmu_srl_sequence::type_id::create("srl_seq");
    sra_seq    = bmu_sra_sequence::type_id::create("sra_seq");
    ror_seq    = bmu_ror_sequence::type_id::create("ror_seq");
    binv_seq   = bmu_binv_sequence::type_id::create("binv_seq");
    sh2add_seq = bmu_sh2add_sequence::type_id::create("sh2add_seq");
    
    sub_seq = bmu_sub_sequence::type_id::create("sub_seq");
    
    sltu_seq   = bmu_sltu_sequence::type_id::create("sltu_seq");
    slt_seq    = bmu_slt_sequence::type_id::create("slt_seq");
    ctz_seq    = bmu_ctz_sequence::type_id::create("ctz_seq");
    cpop_seq   = bmu_cpop_sequence::type_id::create("cpop_seq");
    sext_b_seq = bmu_sext_b_sequence::type_id::create("sext_b_seq");
    max_seq    = bmu_max_sequence::type_id::create("max_seq");
    pack_seq   = bmu_pack_sequence::type_id::create("pack_seq");
    grev_seq   = bmu_grev_sequence::type_id::create("grev_seq");
    
    csr_write_seq = bmu_csr_write_sequence::type_id::create("csr_write_seq");
    csr_read_seq  = bmu_csr_read_sequence::type_id::create("csr_read_seq");
    
    conflict_seq = bmu_conflict_sequence::type_id::create("conflict_seq");
    
    random_seq = bmu_random_sequence::type_id::create("random_seq");
  endfunction
  
  virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    
    `uvm_info(get_type_name(), "REGRESSION TEST STARTED", UVM_LOW)
    
    reset_seq.start(env.agent.sequencer);
    
    `uvm_info(get_type_name(), "Testing Logical Operations", UVM_LOW)
    or_seq.start(env.agent.sequencer);
    orn_seq.start(env.agent.sequencer);
    xor_seq.start(env.agent.sequencer);
    xnor_seq.start(env.agent.sequencer);
    
    `uvm_info(get_type_name(), "Testing Shift/Mask Operations", UVM_LOW)
    srl_seq.start(env.agent.sequencer);
    sra_seq.start(env.agent.sequencer);
    ror_seq.start(env.agent.sequencer);
    binv_seq.start(env.agent.sequencer);
    sh2add_seq.start(env.agent.sequencer);
    
    `uvm_info(get_type_name(), "Testing Arithmetic Operations", UVM_LOW)
    sub_seq.start(env.agent.sequencer);
    
    `uvm_info(get_type_name(), "Testing Bit Manipulation Operations", UVM_LOW)
    sltu_seq.start(env.agent.sequencer);
    slt_seq.start(env.agent.sequencer);
    ctz_seq.start(env.agent.sequencer);
    cpop_seq.start(env.agent.sequencer);
    sext_b_seq.start(env.agent.sequencer);
    max_seq.start(env.agent.sequencer);
    pack_seq.start(env.agent.sequencer);
    grev_seq.start(env.agent.sequencer);
    
    `uvm_info(get_type_name(), "Testing CSR Operations", UVM_LOW)
    csr_write_seq.start(env.agent.sequencer);
    csr_read_seq.start(env.agent.sequencer);
    
    `uvm_info(get_type_name(), "Testing Error Detection", UVM_LOW)
    `uvm_info(get_type_name(), "--- Testing Error Detection ---", UVM_LOW)
    conflict_seq.start(env.agent.sequencer);
    
    `uvm_info(get_type_name(), "Testing Random Stimulus (10,000 transactions)", UVM_LOW)
    assert(random_seq.randomize() with {num_transactions == 10000;});
    random_seq.start(env.agent.sequencer);
    
    #1000;
    
    `uvm_info(get_type_name(), "REGRESSION TEST COMPLETED", UVM_LOW)
    
    phase.drop_objection(this);
  endtask
  
endclass : bmu_regression_test
