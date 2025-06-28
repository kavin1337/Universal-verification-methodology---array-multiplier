class mul_monitor extends uvm_monitor;
  `uvm_component_utils(mul_monitor)
  //mul_sequence_item item;
  
  virtual mul_interface vif;
  uvm_analysis_port #(mul_sequence_item) monitor_port;
  
  function new(string name ="mul_monitor", uvm_component parent);
    super.new(name, parent);
    `uvm_info("MONITOR CLASS", "inside constructor", UVM_HIGH)
    
  endfunction: new
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("MONITOR CLASS", "inside build_phase", UVM_HIGH)
    monitor_port=new("monitor_port", this);
    
    if(!(uvm_config_db #(virtual mul_interface)::get(this, "*", "vif", vif))) begin
       `uvm_error("MONITOR CLASS", "Failed to get VIF from config DB!")
    end
    
  endfunction: build_phase
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("MONITOR CLASS", "inside connect_phase", UVM_HIGH)
    
    
  endfunction: connect_phase
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    `uvm_info("MONITOR CLASS", "inside connect_phase", UVM_HIGH)
     //item=mul_sequence_item::type_id::create("item");
    forever begin
       mul_sequence_item item;
       #1;
      item=mul_sequence_item::type_id::create("item");
      item.a=vif.a;
      item.b=vif.b;
      //#1;
      item.p=vif.p;
      
      monitor_port.write(item);
      
    end
    
  endtask: run_phase
  
endclass: mul_monitor
