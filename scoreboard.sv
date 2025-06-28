class mul_scoreboard extends uvm_scoreboard;
  `uvm_component_utils(mul_scoreboard)

  uvm_analysis_imp#(mul_sequence_item, mul_scoreboard) scoreboard_port;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
     scoreboard_port = new(" scoreboard_port", this);
  endfunction

  function void write(mul_sequence_item item);
    logic [7:0] expected = item.a * item.b;
    if (item.p !== expected)
      `uvm_error("SCOREBOARD", $sformatf("Mismatch: a=%0d b=%0d Expected=%0d Actual=%0d", item.a, item.b, expected, item.p))
    else
      `uvm_info("SCOREBOARD", $sformatf("Match: a=%0d b=%0d Product=%0d", item.a, item.b, item.p), UVM_LOW)
  endfunction
endclass
