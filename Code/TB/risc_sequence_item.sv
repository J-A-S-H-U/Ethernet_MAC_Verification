class risc_sequence_item extends uvm_sequence_item;
	`uvm_object_utils(risc_sequence_item)
	
	rand bit   [31:0]  wb_dat_i;     // WISHBONE data bit	bit          
	rand bit   [11:2]  wb_adr_i;     // WISHBONE address bit
	rand bit    [3:0]  wb_sel_i;     // WISHBONE byte select bit
	rand bit           wb_we_i;      // WISHBONE write enable bit
	rand bit           wb_cyc_i;     // WISHBONE cycle bit
	rand bit           wb_stb_i;     // WISHBONE strobe bit
	
	
	function new(string name = "risc_sequence_item");
		super.new(name);
	endfunction
	
	constraint read_reg {
			soft wb_sel_i == 4'b1111;
			soft wb_cyc_i == 1'b1;
			soft wb_stb_i == 1'b1;};
	
endclass