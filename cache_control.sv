import lc3b_types::*;

module cache_control
(
	input clk,
	input pmem_resp,
	output logic mem_resp,
	input mem_read,
	input mem_write,
	output logic pmem_read,
	output logic pmem_write,
	
	input lru_out,
	input d_out,
	output logic lru_in,
	output logic d0_in,
	output logic d1_in,
	output logic v0_in,
	output logic v1_in,
	input hit,
	input comp0,
	input comp1,
	output logic load_v0,
	output logic load_v1,
	output logic load_d0,
	output logic load_d1,
	output logic load_tag0,
	output logic load_tag1,
	output logic load_data0,
	output logic load_data1,
	output logic load_lru,
	output logic data0_mux_sel,
	output logic data1_mux_sel,
	output logic data_mux_sel,
	output logic tag_mux_sel,
	output logic addr_mux_sel
);

enum int unsigned {
	start,
	write_back,
	read_new
} state, next_state;

always_comb
begin : state_actions
	lru_in = 0;
	d0_in = 0;
	d1_in = 0;
	v0_in = 1;
	v1_in = 1;
	load_v0 = 0;
	load_v1 = 0;
	load_d0 = 0;
	load_d1 = 0;
	load_tag0 = 0;
	load_tag1 = 0;
	load_data0 = 0;
	load_data1 = 0;
	load_lru = 0;
	data0_mux_sel = 0;
	data1_mux_sel = 0;
	data_mux_sel = 0;
	tag_mux_sel = 0;
	addr_mux_sel = 0;
	mem_resp = 0;
	pmem_read = 0;
	pmem_write = 0;
	
	case(state)
		start: begin
			if(mem_read == 1 && hit == 1)
			begin
				mem_resp = 1;
				load_lru = 1;
				lru_in = comp0 & ~comp1;
				data_mux_sel = ~comp0 & comp1;
			end
			else if(mem_write == 1 && hit == 1)
			begin
				mem_resp = 1;
				load_data0 = comp0;
				load_data1 = comp1;
				load_d0 = comp0;
				load_d1 = comp1;
				d0_in = 1;
				d1_in = 1;
				lru_in = comp0 & ~comp1;
			end
		end
		
		write_back: begin
			addr_mux_sel = 1;
			tag_mux_sel = lru_out;
			data_mux_sel = lru_out;
			pmem_write = 1;
		end
		
		read_new: begin
			data0_mux_sel = 1;
			data1_mux_sel = 1;
			pmem_read = 1;
			load_d0 = ~lru_out;
			load_d1 = lru_out;
			v0_in = ~lru_out;
			v1_in = lru_out;
			load_v0 = ~lru_out;
			load_v1 = lru_out;
			if(pmem_resp == 1) begin
				load_tag0 = ~lru_out;
				load_tag1 = lru_out;
				load_data0 = ~lru_out;
				load_data1 = lru_out;
			end
			d0_in = 0;
			d1_in = 0;
		end
	endcase
end

always_comb
begin : next_state_logic
	next_state = state;
	case(state)
		start: begin
			if((mem_read == 1 || mem_write == 1) & hit == 0) begin
				if(d_out == 1)
					next_state <= write_back;
				else
					next_state <= read_new;
			end
		end
		
		write_back: begin
			if(pmem_resp == 0)
				next_state <= write_back;
			else
				next_state <= read_new;
		end
		
		read_new: begin
			if(pmem_resp == 0)
				next_state <= read_new;
			else
				next_state <= start;
		end
		
		default: next_state <= start;
	endcase
end

always_ff @(posedge clk)
begin: next_state_assignment
    /* Assignment of next state on clock edge */
	 state <= next_state;
end

endmodule : cache_control