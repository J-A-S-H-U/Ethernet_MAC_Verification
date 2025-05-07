module top_tb;

`include "eth_mac_rtl.svh"

import uvm_pkg::*;
`include "uvm_macros.svh"


`include "wishbone_mas_intf.sv"
`include "wishbone_slv_intf.sv"
`include "phy_intf.sv"
`include "mii_intf.sv"

`include "risc_sequence_item.sv"
`include "risc_sequence.sv"
`include "risc_sequencer.sv"
`include "risc_driver.sv"
`include "risc_monitor.sv"

`include "risc_agent.sv"
`include "mac_env.sv"
`include "test.sv"




reg wb_clk_i, wb_rst_i;

wb_proc_interface proc ();
wb_mem_interface mem ();
phy_interface phy ();
mii_interface mii ();


ethmac DUT (
  // WISHBONE common
  .wb_clk_i(wb_clk_i), 
  .wb_rst_i(wb_rst_i), 
  .wb_dat_i(proc.wb_dat_i), 
  .wb_dat_o(proc.wb_dat_o), 

  // WISHBONE slave
  .wb_adr_i(proc.wb_adr_i), 
  .wb_sel_i(proc.wb_sel_i), 
  .wb_we_i(proc.wb_we_i), 
  .wb_cyc_i(proc.wb_cyc_i), 
  .wb_stb_i(proc.wb_stb_i), 
  .wb_ack_o(proc.wb_ack_o), 
  .wb_err_o(proc.wb_err_o), 
  
  // WISHBONE master
  .m_wb_adr_o(mem.m_wb_adr_o), 
  .m_wb_sel_o(mem.m_wb_sel_o), 
  .m_wb_we_o(mem.m_wb_we_o), 
  .m_wb_dat_o(mem.m_wb_dat_o), 
  .m_wb_dat_i(mem.m_wb_dat_i), 
  .m_wb_cyc_o(mem.m_wb_cyc_o), 
  .m_wb_stb_o(mem.m_wb_stb_o), 
  .m_wb_ack_i(mem.m_wb_ack_i), 
  .m_wb_err_i(mem.m_wb_err_i),
  .m_wb_cti_o(mem.m_wb_cti_o),
  .m_wb_bte_o(mem.m_wb_bte_o),  

 //TX
  .mtx_clk_pad_i(phy.mtx_clk_pad_i), 
  .mtxd_pad_o(phy.mtxd_pad_o), 
  .mtxen_pad_o(phy.mtxen_pad_o), 
  .mtxerr_pad_o(phy.mtxerr_pad_o),

  //RX
  .mrx_clk_pad_i(phy.mrx_clk_pad_i), 
  .mrxd_pad_i(phy.mrxd_pad_i), 
  .mrxdv_pad_i(phy.mrxdv_pad_i), 
  .mrxerr_pad_i(phy.mrxerr_pad_i), 
  .mcoll_pad_i(phy.mcoll_pad_i), 
  .mcrs_pad_i(phy.mcrs_pad_i),
  
  // MIIM
  .mdc_pad_o(mii.mdc_pad_o), 
  .md_pad_i(mii.md_pad_i), 
  .md_pad_o(mii.md_pad_o), 
  .md_padoe_o(mii.md_padoe_o),

  .int_o(mii.int_o)
);
initial begin
	uvm_config_db #(virtual wb_proc_interface)::set(null,"*","proc",proc);
	uvm_config_db #(virtual wb_mem_interface)::set(null,"*","mem",mem);
	uvm_config_db #(virtual phy_interface)::set(null,"*","phy",phy);
	uvm_config_db #(virtual mii_interface)::set(null,"*","mii",mii);
	`uvm_info("TOP","INTERFACE CONFIG DB", UVM_HIGH)
end

assign proc.wb_clk_i = wb_clk_i;
assign proc.wb_rst_i = wb_rst_i;
initial begin
	wb_clk_i = '1;
	forever #5 wb_clk_i = ~wb_clk_i;
end

initial begin
	wb_rst_i = '1;
	#10 wb_rst_i = '0;
	#1000000 $finish;
end

initial begin
	run_test("test");
end

endmodule