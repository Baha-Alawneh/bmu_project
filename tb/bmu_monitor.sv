
class bmu_monitor extends uvm_monitor;
  
  `uvm_component_utils(bmu_monitor)
  
  virtual bmu_if vif;
  uvm_analysis_port #(bmu_seq_item) item_collected_port;
  
  bmu_seq_item trans_collected;
  
  function new(string name = "bmu_monitor", uvm_component parent = null);
    super.new(name, parent);
    item_collected_port = new("item_collected_port", this);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual bmu_if)::get(this, "", "vif", vif))
      `uvm_fatal("NO_VIF", {"Virtual interface must be set for: ", get_full_name(), ".vif"});
  endfunction
  
  virtual task run_phase(uvm_phase phase);
    forever begin
      collect_one_item();
    end
  endtask
  
  virtual task collect_one_item();
    trans_collected = bmu_seq_item::type_id::create("trans_collected");
    
    @(vif.monitor_cb);
    
    trans_collected.rst_l = vif.monitor_cb.rst_l;
    trans_collected.a_in = vif.monitor_cb.a_in;
    trans_collected.b_in = vif.monitor_cb.b_in;
    trans_collected.scan_mode = vif.monitor_cb.scan_mode;
    trans_collected.valid_in = vif.monitor_cb.valid_in;
    trans_collected.csr_ren_in = vif.monitor_cb.csr_ren_in;
    trans_collected.csr_rddata_in = vif.monitor_cb.csr_rddata_in;
    
    trans_collected.ap_lor = vif.monitor_cb.ap_lor;
    trans_collected.ap_lxor = vif.monitor_cb.ap_lxor;
    trans_collected.ap_land = vif.monitor_cb.ap_land;
    trans_collected.ap_zbb = vif.monitor_cb.ap_zbb;
    trans_collected.ap_srl = vif.monitor_cb.ap_srl;
    trans_collected.ap_sra = vif.monitor_cb.ap_sra;
    trans_collected.ap_ror = vif.monitor_cb.ap_ror;
    trans_collected.ap_rol = vif.monitor_cb.ap_rol;
    trans_collected.ap_binv = vif.monitor_cb.ap_binv;
    trans_collected.ap_sh2add = vif.monitor_cb.ap_sh2add;
    trans_collected.ap_zba = vif.monitor_cb.ap_zba;
    trans_collected.ap_sub = vif.monitor_cb.ap_sub;
    trans_collected.ap_slt = vif.monitor_cb.ap_slt;
    trans_collected.ap_unsign = vif.monitor_cb.ap_unsign;
    trans_collected.ap_ctz = vif.monitor_cb.ap_ctz;
    trans_collected.ap_clz = vif.monitor_cb.ap_clz;
    trans_collected.ap_cpop = vif.monitor_cb.ap_cpop;
    trans_collected.ap_siext_b = vif.monitor_cb.ap_siext_b;
    trans_collected.ap_siext_h = vif.monitor_cb.ap_siext_h;
    trans_collected.ap_max = vif.monitor_cb.ap_max;
    trans_collected.ap_pack = vif.monitor_cb.ap_pack;
    trans_collected.ap_grev = vif.monitor_cb.ap_grev;
    trans_collected.ap_csr_write = vif.monitor_cb.ap_csr_write;
    trans_collected.ap_csr_imm = vif.monitor_cb.ap_csr_imm;
    
    @(vif.monitor_cb);
    
    trans_collected.result_ff = vif.monitor_cb.result_ff;
    trans_collected.error = vif.monitor_cb.error;
    
    trans_collected.operation_name = get_operation_name(trans_collected);
    
    item_collected_port.write(trans_collected);
  endtask
  
  function string get_operation_name(bmu_seq_item item);
    if (item.csr_ren_in) return "CSR_READ";
    if (item.ap_csr_write) return item.ap_csr_imm ? "CSR_WRITE_IMM" : "CSR_WRITE_REG";
    if (item.ap_lor && !item.ap_zbb) return "OR";
    if (item.ap_lor && item.ap_zbb) return "ORN";
    if (item.ap_lxor && !item.ap_zbb) return "XOR";
    if (item.ap_lxor && item.ap_zbb) return "XNOR";
    if (item.ap_land && !item.ap_zbb) return "AND";
    if (item.ap_land && item.ap_zbb) return "ANDN";
    if (item.ap_srl) return "SRL";
    if (item.ap_sra) return "SRA";
    if (item.ap_ror) return "ROR";
    if (item.ap_rol) return "ROL";
    if (item.ap_binv) return "BINV";
    if (item.ap_sh2add) return "SH2ADD";
    if (item.ap_sub && !item.ap_slt && !item.ap_max) return "SUB";
    if (item.ap_slt && item.ap_unsign) return "SLTU";
    if (item.ap_slt && !item.ap_unsign) return "SLT";
    if (item.ap_ctz) return "CTZ";
    if (item.ap_clz) return "CLZ";
    if (item.ap_cpop) return "CPOP";
    if (item.ap_siext_b) return "SEXT_B";
    if (item.ap_siext_h) return "SEXT_H";
    if (item.ap_max) return "MAX";
    if (item.ap_pack) return "PACK";
    if (item.ap_grev) return "GREV";
    return "UNKNOWN";
  endfunction
  
endclass : bmu_monitor
