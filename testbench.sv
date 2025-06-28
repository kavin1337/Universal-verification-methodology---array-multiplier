// Code your testbench here
// or browse Examples
`timescale 1ns/1ns

import uvm_pkg::*;
`include "uvm_macros.svh"
`include "interface.sv"
`include "sequence_item.sv"
`include "sequence.sv"
`include "sequencer.sv"
`include "driver.sv"
`include "monitor.sv"
`include "agent.sv"
`include "scoreboard.sv"
`include "env.sv"
`include "test.sv"



module top;
  
  mul_interface inf();
  
  array_multiplier_4bit dut(
    .A(inf.a),
    .B(inf.b),
    .P(inf.p)
  );
  
  initial begin
    run_test("mul_test");
  end
  
  initial begin
    uvm_config_db#(virtual mul_interface)::set(null, "*", "vif",inf);
  end
  
  
endmodule: top
  
  
