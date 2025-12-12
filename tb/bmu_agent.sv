
class bmu_agent extends uvm_agent;
  
  `uvm_component_utils(bmu_agent)
  
  bmu_sequencer sequencer;
  bmu_driver    driver;
  bmu_monitor   monitor;
  
  uvm_analysis_port #(bmu_seq_item) item_collected_port;
  
  function new(string name = "bmu_agent", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    monitor = bmu_monitor::type_id::create("monitor", this);
    
    if(get_is_active() == UVM_ACTIVE) begin
      sequencer = bmu_sequencer::type_id::create("sequencer", this);
      driver = bmu_driver::type_id::create("driver", this);
    end
  endfunction
  
  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    
    if(get_is_active() == UVM_ACTIVE) begin
      driver.seq_item_port.connect(sequencer.seq_item_export);
    end
    
    item_collected_port = monitor.item_collected_port;
  endfunction
  
endclass : bmu_agent
