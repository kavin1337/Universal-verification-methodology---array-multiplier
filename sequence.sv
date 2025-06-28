class base_sequence extends uvm_sequence;
  `uvm_object_utils(base_sequence);
  mul_sequence_item req;
  
  function new(string name="base_sequence");
    super.new(name);
    `uvm_info("BASE SEQUENCE", "inside constructor", UVM_HIGH)
    
  endfunction: new
  
  /*task body();
    
    `uvm_info("BASE_SEQ", "Inside body task!", UVM_HIGH)
    
    reset_pkt = mul_sequence_item::type_id::create("reset_pkt");
    start_item(reset_pkt);
    reset_pkt.randomize() ;//with {reset==1;};
    finish_item(reset_pkt);*/
    
  task body();
    repeat(100)begin
      req = mul_sequence_item::type_id::create("req");
      start_item(req);
      assert(req.randomize());
      finish_item(req);
    end
  endtask: body
        
  
endclass: base_sequence


class test_sequence extends base_sequence;
  `uvm_object_utils(test_sequence);
  
  function new(string name="test_sequence");
    super.new(name);
    `uvm_info("TEST SEQUENCE", "inside constructor", UVM_HIGH)
    
  endfunction: new
  
  task body();
    
  endtask: body
  
endclass: test_sequence

