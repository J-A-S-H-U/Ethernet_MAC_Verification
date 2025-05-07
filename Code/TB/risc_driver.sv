class risc_driver extends uvm_driver#(risc_sequence_item);
	`uvm_component_utils(risc_driver)
	risc_sequence_item risc_seq_item;
	virtual wb_proc_interface vif_risc_intf;
	
	
	function new(string name="risc_driver", uvm_component parent);
		super.new(name, parent);
	endfunction
	
	
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		uvm_config_db #(virtual wb_proc_interface) ::get(null,"*","proc",vif_risc_intf);
			`uvm_info("DRIVER","INTERFACE CONFIG DB", UVM_LOW)
	endfunction
	
	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
	endfunction
	
	task run_phase(uvm_phase phase);
		super.run_phase(phase);
		forever 
		begin
			//risc_seq_item = risc_sequence_item::type_id::create("risc_seq_item");
			seq_item_port.get_next_item(risc_seq_item);
			drive(risc_seq_item);
			seq_item_port.item_done();
		end
	endtask
	
	
	task drive(risc_sequence_item drv_pkt);
	@(posedge vif_risc_intf.wb_clk_i)
		if (drv_pkt.wb_we_i) vif_risc_intf.wb_dat_i = drv_pkt.wb_dat_i;     // WISHBONE data bit
		vif_risc_intf.wb_adr_i = drv_pkt.wb_adr_i;     // WISHBONE address bit
		vif_risc_intf.wb_sel_i = drv_pkt.wb_sel_i;     // WISHBONE byte select bit
		vif_risc_intf.wb_we_i = drv_pkt.wb_we_i;      // WISHBONE write enable bit
		vif_risc_intf.wb_cyc_i = drv_pkt.wb_cyc_i;     // WISHBONE cycle bit
		vif_risc_intf.wb_stb_i = drv_pkt.wb_stb_i;     // WISHBONE strobe bit
		//wait(vif_risc_intf.wb_ack_o);
		
	endtask
endclass