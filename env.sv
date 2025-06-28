class mul_env extends uvm_env;
  `uvm_component_utils(mul_env)
  
  mul_agent agnt;
  mul_scoreboard scr;
  
  function new(string name ="env_test", uvm_component parent);
    super.new(name, parent);
    `uvm_info("ENV CLASS", "inside constructor", UVM_HIGH)
    
  endfunction: new
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("ENV CLASS", "inside build_phase", UVM_HIGH)
    agnt=mul_agent::type_id::create("agnt", this);
    scr=mul_scoreboard::type_id::create("scr", this);
    
  endfunction: build_phase
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("ENV CLASS", "inside connect_phase", UVM_HIGH)
    agnt.mon.monitor_port.connect(scr.scoreboard_port);
    
  endfunction: connect_phase
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    `uvm_info("ENV CLASS", "inside connect_phase", UVM_HIGH)
    
  endtask: run_phase
  
endclass: mul_env
