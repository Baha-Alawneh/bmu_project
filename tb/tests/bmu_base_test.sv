class bmu_base_test extends uvm_test;

  `uvm_component_utils(bmu_base_test)

  bmu_env env;

  function new(string name = "bmu_base_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = bmu_env::type_id::create("env", this);
    uvm_config_db#(uvm_active_passive_enum)::set(this, "env.agent", "is_active", UVM_ACTIVE);
  endfunction : build_phase

  virtual function void end_of_elaboration_phase(uvm_phase phase);
    uvm_top.print_topology();
  endfunction

  function void report_phase(uvm_phase phase);
    uvm_report_server server;
    super.report_phase(phase);
    server = uvm_report_server::get_server();
    if (server.get_severity_count(UVM_ERROR) + server.get_severity_count(UVM_FATAL) == 0)
      `uvm_info(get_type_name(), "TEST PASSED: No errors detected during simulation.", UVM_LOW)
    else
      `uvm_info(get_type_name(), $sformatf(
                "TEST FAILED: %0d errors detected during simulation.",
                server.get_severity_count(
                    UVM_ERROR
                )
                ), UVM_LOW)
  endfunction
endclass : bmu_base_test






