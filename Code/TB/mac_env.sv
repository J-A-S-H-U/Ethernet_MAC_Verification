class mac_env extends uvm_env;
	`uvm_component_utils(mac_env)
	
	risc_agent r_agnt;
	//mii_agent mii_agnt;
	//phy_tx_agent phy_tx_agnt;
	//phy rx_agent phy_Rx_agnt;
	
	
	function new(string name="mac_env",uvm_component parent);
		super.new(name,parent);
		`uvm_info("ENVIRONMENT","CONSTRUCTOR",UVM_HIGH)
	endfunction
	
	
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info("ENVIRONMENT","BUILD",UVM_HIGH)
		r_agnt = risc_agent::type_id::create("r_agnt", this);
	endfunction
	
	
	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		`uvm_info("ENVIRONMENT","CONECT",UVM_HIGH)
	endfunction
	
	
	task run_phase(uvm_phase phase);
		super.run_phase(phase);
		`uvm_info("ENVIRONMENT","RUN",UVM_HIGH)
	endtask
	
	
endclass