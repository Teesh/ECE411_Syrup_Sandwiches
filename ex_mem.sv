import lc3b_types::*;

module ex_mem
(
	input clk,
	input load,
	input logic [15:0] PC_reg_in, SR2_reg_in, ALU_reg_in,
					trapvect8_reg_in, cword_reg_in,
					addr_reg_in,
	input logic [2:0] dest_reg_in,
					
	
	output logic [15:0] PC_reg_out, SR2_reg_out, ALU_reg_out,
				   trapvect8_reg_out, cword_reg_out,
					addr_reg_out,
	output logic [2:0] dest_reg_out
);

register PC_reg
(
	.clk,
	.load(load),
	.in(PC_reg_in),
	.out(PC_reg_out)
);

register ALU_reg
(
	.clk,
	.load(load),
	.in(ALU_reg_in),
	.out(ALU_reg_out)
);

register SR2_reg
(
	.clk,
	.load(load),
	.in(SR2_reg_in),
	.out(SR2_reg_out)
);

register addr_reg
(
	.clk,
	.load(load),
	.in(addr_reg_in),
	.out(addr_reg_out)
);

register #(.width(3)) dest_reg
(
	.clk,
	.load(load),
	.in(dest_reg_in),
	.out(dest_reg_out)
);

register trapvect8_reg
(
	.clk,
	.load(load),
	.in(trapvect8_reg_in),
	.out(trapvect8_reg_out)
);

register #(.width(31)) cword_reg
(
	.clk,
	.load(load),
	.in(cword_reg_in),
	.out(cword_reg_out)
);

endmodule : ex_mem