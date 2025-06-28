class mul_sequencer extends uvm_sequencer  #(mul_sequence_item);
  `uvm_component_utils(mul_sequencer)
  
  function new(string name ="mul_sequencer", uvm_component parent);
    super.new(name, parent);
    `uvm_info("SEQUENCER CLASS", "inside constructor", UVM_HIGH)
    
  endfunction: new
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("SEQUENCER CLASS", "inside build_phase", UVM_HIGH)
    
  endfunction: build_phase
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("SEQUENCER CLASS", "inside connect_phase", UVM_HIGH)
    
  endfunction: connect_phase
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    `uvm_info("SEQUENCER CLASS", "inside connect_phase", UVM_HIGH)
    
  endtask: run_phase
  
endclass: mul_sequencer
