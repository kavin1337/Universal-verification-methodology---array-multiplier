class mul_sequence_item extends uvm_sequence_item;
  `uvm_object_utils(mul_sequence_item)
  
  rand logic [3:0] a,b;
  logic [7:0] p;
  
  constraint input1_c {a inside {[0:3]};}
  constraint input2_c {b inside {[0:3]};}
  
  function new(string name = "mul_sequence_item");
    super.new(name);

  endfunction: new
  
endclass: mul_sequence_item
