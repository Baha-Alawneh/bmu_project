
class bmu_driver extends uvm_driver #(bmu_seq_item);
  
  `uvm_component_utils(bmu_driver)
  
  virtual bmu_if vif;
  
  function new(string name = "bmu_driver", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual bmu_if)::get(this, "", "vif", vif))
      `uvm_fatal("NO_VIF", {"Virtual interface must be set for: ", get_full_name(), ".vif"});
  endfunction
  
  virtual task run_phase(uvm_phase phase);
    forever begin
      seq_item_port.get_next_item(req);
      drive_item(req);
      seq_item_port.item_done();
    end
  endtask
  
  virtual task drive_item(bmu_seq_item item);
    @(posedge vif.clk);
    #1;  
    
    vif.rst_l = item.rst_l;
    vif.a_in = item.a_in;
    vif.b_in = item.b_in;
    vif.scan_mode = item.scan_mode;
    vif.valid_in = item.valid_in;
    vif.csr_ren_in = item.csr_ren_in;
    vif.csr_rddata_in = item.csr_rddata_in;
    
    vif.ap_lor = item.ap_lor;
    vif.ap_lxor = item.ap_lxor;
    vif.ap_land = item.ap_land;
    vif.ap_zbb = item.ap_zbb;
    vif.ap_srl = item.ap_srl;
    vif.ap_sra = item.ap_sra;
    vif.ap_ror = item.ap_ror;
    vif.ap_rol = item.ap_rol;
    vif.ap_binv = item.ap_binv;
    vif.ap_sh1add = item.ap_sh1add;
    vif.ap_sh2add = item.ap_sh2add;
    vif.ap_sh3add = item.ap_sh3add;
    vif.ap_zba = item.ap_zba;
    vif.ap_sub = item.ap_sub;
    vif.ap_slt = item.ap_slt;
    vif.ap_unsign = item.ap_unsign;
    vif.ap_ctz = item.ap_ctz;
    vif.ap_clz = item.ap_clz;
    vif.ap_cpop = item.ap_cpop;
    vif.ap_siext_b = item.ap_siext_b;
    vif.ap_siext_h = item.ap_siext_h;
    vif.ap_max = item.ap_max;
    vif.ap_min = item.ap_min;
    vif.ap_pack = item.ap_pack;
    vif.ap_grev = item.ap_grev;
    vif.ap_csr_write = item.ap_csr_write;
    vif.ap_csr_imm = item.ap_csr_imm;
  endtask
  
endclass : bmu_driver
