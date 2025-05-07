class test extends uvm_test;
	`uvm_component_utils(test)
	
	
	mac_env env;
	risc_sequence risc_seq;
	
	function new (string name="sanity_test",uvm_component parent);
		super.new(name,parent);
		`uvm_info("SANITY_TEST","Constructor",UVM_HIGH)
	endfunction
	
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		env = mac_env::type_id::create("env", this);
		`uvm_info("SANITY_TEST","BUILD",UVM_HIGH)
	endfunction
	
	function void end_of_elaboration_phase(uvm_phase phase);
		super.end_of_elaboration_phase(phase);
		`uvm_info("SANITY_TEST","END OF ELABORATION",UVM_HIGH)
		uvm_top.print_topology();
	endfunction
	
	task run_phase(uvm_phase phase);
		super.run_phase(phase);
		`uvm_info("SANITY_TEST","RUN",UVM_HIGH)
		
		phase.raise_objection(this);
		
		risc_seq = risc_sequence::type_id::create("risc_seq");
		risc_seq.start(env.r_agnt.r_sqcr);
		
		phase.drop_objection(this);
	endtask
endclass