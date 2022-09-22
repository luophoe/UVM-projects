class router_mcseqs_lib extends uvm_sequencer;
   `uvm_component_utils(router_mcseqs_lib)
   `uvm_declare_p_sequencer(router_mcsequencer)

   function new(string name="router_mcseqs_lib");
    super.new(name);
  endfunction

  virtual task pre_body();
     if(starting_phase != null)
        starting_phase.raise_objection(this, get_type_name());
  endtask

  virtual task post_body();
     if(starting_phase != null)
        starting_phase.drop_objection(this, get_type_name());
   endtask

   virtual task body();
      `uvm_info("router_simple_mcseq", "Executing router_simple_mcseq", UVM_LOW )
      `uvm_do_on(hbus_small_pkt, p_sequencer.hbus_seqr)
      `uvm_do_on(hbus_rd_maxpkt, p_sequencer.hbus_seqr)
      `uvm_info(get_type_name(), $sformatf("router MAXPKTSIZE register read: %0h", hbus_rd_maxpkt.max_pkt_reg), UVM_LOW)
      `uvm_do_on(yapp_012, p_sequencer.yapp_seqr)
      `uvm_do_on(yapp_012, p_sequencer.yapp_seqr)
      `uvm_do_on(hbus_large_pkt, p_sequencer.hbus_seqr)
      `uvm_do_on(hbus_rd_maxpkt, p_sequencer.hbus_seqr)  
