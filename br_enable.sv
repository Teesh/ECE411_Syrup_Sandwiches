import lc3b_types::*;
module branch_enable
(
	input logic br_taken,
	input logic [1:0] br_sel,
	input logic br_code,
	output logic [1:0] pc_mux_sel 
);
always_comb
begin
	pc_mux_sel = br_sel;
	
	if(br_taken & br_code)
		pc_mux_sel = 2'b01;
end
endmodule : branch_enable