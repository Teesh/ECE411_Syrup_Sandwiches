import lc3b_types::*;

module if_id
(
	input clk,
	input load,
	input logic [15:0] PC_reg_in,
	output logic [15:0] PC_reg_out,
	input logic [15:0] I_rdata_in,
	output logic [15:0] I_rdata_out
	/*
	input logic PC_reg_ld,
	input logic I_rdata_ld
	*/
);

register PC_reg
(
	.clk,
	.load(load),
	.in(PC_reg_in),
	.out(PC_reg_out)
);

register I_rdata
(
	.clk,
	.load(load),
	.in(I_rdata_in),
	.out(I_rdata_out)
);
endmodule: if_id
