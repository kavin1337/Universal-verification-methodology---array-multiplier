class mul_agent extends uvm_agent;
  `uvm_component_utils(mul_agent)
  
  mul_driver drv;
  mul_monitor mon;
  mul_sequencer seqr;
  
  
  function new(string name ="mul_agent", uvm_component parent);
    super.new(name, parent);
    `uvm_info("AGENT CLASS", "inside constructor", UVM_HIGH)
    
  endfunction: new
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("AGENT CLASS", "inside build_phase", UVM_HIGH)
    drv=mul_driver::type_id::create("drv", this);
    mon=mul_monitor::type_id::create("mon", this);
    seqr=mul_sequencer::type_id::create("seqr", this);
    
  endfunction: build_phase
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("AGENT CLASS", "inside connect_phase", UVM_HIGH)
    drv.seq_item_port.connect(seqr.seq_item_export);
    
  endfunction: connect_phase
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    `uvm_info("AGENT CLASS", "inside connect_phase", UVM_HIGH)
    
  endtask: run_phase
  
endclass: mul_agent
