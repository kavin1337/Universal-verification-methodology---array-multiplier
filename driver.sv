class mul_driver extends uvm_driver #(mul_sequence_item);
  `uvm_component_utils(mul_driver)
  
  virtual mul_interface vif;
  mul_sequence_item item;
  
  function new(string name ="mul_driver", uvm_component parent);
    super.new(name, parent);
    `uvm_info("DRIVER CLASS", "inside constructor", UVM_HIGH)
    
  endfunction: new
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("DRIVER CLASS", "inside build_phase", UVM_HIGH)
    
    if(!(uvm_config_db #(virtual mul_interface)::get(this, "*", "vif", vif))) begin
      `uvm_error("DRIVER_CLASS", "Failed to get VIF from config DB!")
    end
    
  endfunction: build_phase
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("DRIVER CLASS", "inside connect_phase", UVM_HIGH)
    
  endfunction: connect_phase
  
  task run_phase(uvm_phase phase);
    forever begin
      mul_sequence_item item;
      seq_item_port.get_next_item(item);
      vif.a = item.a;
      vif.b = item.b;
      #1; // delay for output to settle
      seq_item_port.item_done();
    end
  endtask
    
  
endclass: mul_driver


