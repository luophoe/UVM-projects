/*-----------------------------------------------------------------
File name     : lab06run.f
Developers    : Kathleen Meade, Brian Dickinson
Created       : 01/04/11
Description   : lab06_vif simulator run file
Notes         : From the Cadence "SystemVerilog Accelerated Verification with UVM" training
-------------------------------------------------------------------
Copyright Cadence Design Systems (c)2019
-----------------------------------------------------------------*/
// 64 bit option required for AWS labs
-64

-uvmhome $UVMHOME

// include directories, starting with UVM src directory
-incdir ../../yapp/sv
-incdir ../../channel/sv
-incdir  ../../hbus/sv
-incdir ../../clock_and_reset/sv


// options
//+UVM_VERBOSITY=UVM_HIGH 
//+UVM_TESTNAME=base_test
//+UVM_TESTNAME=short_yapp_012
//+UVM_TESTNAME=incr_payload_test
//+UVM_TESTNAME=short_packet_test
+UVM_TESTNAME=exhaustive_seq_test
//+SVSEED=random 

// uncomment for gui
//-gui
//+access+rwc

// default timescale
-timescale 1ns/1ns

// compile files

// clock generator module
clkgen.sv
// top module for UVM test environment
tb_top.sv
// accelerated top module for interface instance
//hw_top_no_dut.sv
hw_top.sv
// router RTL
../../router_rtl/yapp_router.sv

// YAPP UVC package and interface
../../yapp/sv/yapp_pkg.sv
../../yapp/sv/yapp_if.sv

// Channel UVC package and interface
../../channel/sv/channel_pkg.sv
../../channel/sv/channel_if.sv

// HBUS UVC package and interface
../../hbus/sv/hbus_pkg.sv
../../hbus/sv/hbus_if.sv

// clock and reset UVC package
../../clock_and_reset/sv/clock_and_reset_pkg.sv
../../clock_and_reset/sv/clock_and_reset_if.sv

