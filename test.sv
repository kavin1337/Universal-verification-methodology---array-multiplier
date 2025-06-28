class mul_test extends uvm_test;
  `uvm_component_utils(mul_test)
  
  mul_env env;
  base_sequence base_seq;
  test_sequence test_seq;
  
  function new(string name ="mul_test", uvm_component parent);
    super.new(name, parent);
    `uvm_info("TEST CLASS", "inside constructor", UVM_HIGH)
    
  endfunction: new
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("TEST CLASS", "inside build_phase", UVM_HIGH)
    env=mul_env::type_id::create("env", this);
    
  endfunction: build_phase
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("TEST CLASS", "inside connect_phase", UVM_HIGH)
    
  endfunction: connect_phase
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    `uvm_info("TEST CLASS", "inside connect_phase", UVM_HIGH)
    
    phase.raise_objection(this);
    
    repeat(10) begin
      base_seq=base_sequence::type_id::create("base_seq");
      base_seq.start(env.agnt.seqr);


      test_seq=test_sequence::type_id::create("test_seq");
      test_seq.start(env.agnt.seqr);
    end
      
    phase.drop_objection(this);
    
  endtask: run_phase
  
endclass: mul_test
