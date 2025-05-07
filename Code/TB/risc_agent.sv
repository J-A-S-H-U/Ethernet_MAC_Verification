class risc_agent extends uvm_agent;
	`uvm_component_utils(risc_agent)
	
	risc_driver r_driver;
	risc_monitor r_monitor;
	risc_sequencer r_sqcr;
	
	
	function new(string name="risc_agent", uvm_component parent);
		super.new(name, parent);
	endfunction
	
	
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		r_driver = risc_driver::type_id::create("r_driver", this);
		r_monitor = risc_monitor::type_id::create("r_monitor", this);
		r_sqcr = risc_sequencer::type_id::create("r_sqcr", this);
	endfunction
	
	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		r_driver.seq_item_port.connect(r_sqcr.seq_item_export);
	endfunction
	
	task run_phase(uvm_phase phase);
		super.run_phase(phase);
	endtask
	
endclass