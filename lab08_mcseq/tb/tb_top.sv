/*-----------------------------------------------------------------
File name     : tb_top.sv
Developers    : Kathleen Meade, Brian Dickinson
Created       : 01/04/11
Description   : lab06_vif UVM top module for acceleration
              : Instantiates UVM test environment
Notes         : From the Cadence "SystemVerilog Accelerated Verification with UVM" training
-------------------------------------------------------------------
Copyright Cadence Design Systems (c)2015
-----------------------------------------------------------------*/

module tb_top;

  // import the UVM library
  import uvm_pkg::*;

  // include the UVM macros
  `include "uvm_macros.svh"

  // import the YAPP UVC package
  import yapp_pkg::*;

  // import the channel, clock and reset, hubs uvc package files
  import channel_pkg::*;
  import clock_and_reset_pkg::*;
  import hbus_pkg::*;

  // include the router testbench file
  `include "router_tb.sv"

  // include the test_lib.sv file
  `include "router_test_lib.sv"

  initial begin
    yapp_vif_config::set(null,"*.tb.yapp.tx_agent.*","vif", hw_top.in0);
    hbus_vif_config::set(null,"*.tb.hbus.*","vif", hw_top.hif);
    channel_vif_config::set(null,"*.tb.chan0.*","vif", hw_top.ch0);
    channel_vif_config::set(null,"*.tb.chan1.*","vif", hw_top.ch1);
    channel_vif_config::set(null,"*.tb.chan2.*","vif", hw_top.ch2);
    clock_and_reset_vif_config::set(null, "*.tb.clock_and_reset*", "vif", hw_top.clk_rst_if);


    run_test();
  end

endmodule
