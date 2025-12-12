class bmu_env extends uvm_env;
  
  `uvm_component_utils(bmu_env)
  
  bmu_agent      agent;
  bmu_scoreboard scoreboard;
  bmu_subscriber subscriber;
  
  function new(string name = "bmu_env", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agent = bmu_agent::type_id::create("agent", this);
    scoreboard = bmu_scoreboard::type_id::create("scoreboard", this);
    subscriber = bmu_subscriber::type_id::create("subscriber", this);
  endfunction
  
  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    
    agent.item_collected_port.connect(scoreboard.actual_data);
    
    agent.item_collected_port.connect(subscriber.analysis_export);
  endfunction
  
endclass : bmu_env
