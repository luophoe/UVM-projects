class base_test extends uvm_test;
   `uvm_component_utils(base_test)

   router_tb router;

   function new (string name, uvm_component parent);
      super.new(name, parent);
   endfunction

   function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      router = new("router", this);
      `uvm_info("MSG","Testbench build phase",UVM_HIGH)
   endfunction

   function void end_of_elaboration_phase(uvm_phase phase);
      uvm_top.print_topology();
   endfunction
endclass

