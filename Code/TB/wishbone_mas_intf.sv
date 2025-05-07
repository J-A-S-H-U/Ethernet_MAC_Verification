interface wb_proc_interface ();

logic wb_clk_i; 
logic wb_rst_i;
logic   [31:0]  wb_dat_i;     // WISHBONE data logic
logic  [31:0]  wb_dat_o;     // WISHBONE data logic
logic          wb_err_o;     // WISHBONE error logic
logic   [11:2]  wb_adr_i;     // WISHBONE address logic
logic    [3:0]  wb_sel_i;     // WISHBONE byte select logic
logic           wb_we_i;      // WISHBONE write enable logic
logic           wb_cyc_i;     // WISHBONE cycle logic
logic           wb_stb_i;     // WISHBONE strobe logic
logic          wb_ack_o;     // WISHBONE acknowledge logic

endinterface