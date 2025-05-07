class risc_sequence extends uvm_sequence#(risc_sequence_item);
	`uvm_object_utils(risc_sequence)
	
	risc_sequence_item r_seq_item;
	
	function new(string name="risc_sequence");
		super.new(name);
	endfunction
	
	
	task body();
		begin
			int num = 21;
			for(int i=0; i<num; i++)
			begin
				r_seq_item = risc_sequence_item::type_id::create("risc_sequence_item");
				start_item(r_seq_item);
				r_seq_item.randomize() with {r_seq_item.wb_we_i == 0; r_seq_item.wb_adr_i == i;};
				finish_item(r_seq_item);
			end
		end
	endtask
	
endclass