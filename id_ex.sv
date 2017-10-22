import lc3b_types::*;

module id_ex
(
	input clk,
	input load,
	/*
	input logic PC_reg_ld, SR1_reg_ld, SR2_reg_ld, 
					imm4_reg_ld, imm5_reg_ld, adj6_reg_ld, 
					adj9_reg_ld, adj11_reg_ld, offset6_reg_ld, 
					dest_reg_ld, trapvect8_reg_ld, cword_reg_ld,
	*/
	input logic [15:0] PC_reg_in, SR1_reg_in, SR2_reg_in, 
					imm4_reg_in, imm5_reg_in, adj6_reg_in, 
					adj9_reg_in, adj11_reg_in, offset6_reg_in, 
					trapvect8_reg_in, cword_reg_in,
	input logic [2:0] dest_reg_in,
	
	output logic [15:0] PC_reg_out, SR1_reg_out, SR2_reg_out, 
					imm4_reg_out, imm5_reg_out, adj6_reg_out, 
					adj9_reg_out, adj11_reg_out, offset6_reg_out, 
					trapvect8_reg_out, cword_reg_out,
	output logic [2:0] dest_reg_out
	
	
);

register PC_reg
(
	.clk,
	.load(load),
	.in(PC_reg_in),
	.out(PC_reg_out)
);

register SR1_reg
(
	.clk,
	.load(load),
	.in(SR1_reg_in),
	.out(SR1_reg_out)
);

register SR2_reg
(
	.clk,
	.load(load),
	.in(SR2_reg_in),
	.out(SR2_reg_out)
);

register imm4_reg
(
	.clk,
	.load(load),
	.in(imm4_reg_in),
	.out(imm4_reg_out)
);

register imm5_reg
(
	.clk,
	.load(load),
	.in(imm5_reg_in),
	.out(imm5_reg_out)
);

register adj6_reg
(
	.clk,
	.load(load),
	.in(adj6_reg_in),
	.out(adj6_reg_out)
);

register adj9_reg
(
	.clk,
	.load(load),
	.in(adj9_reg_in),
	.out(adj9_reg_out)
);

register adj11_reg
(
	.clk,
	.load(load),
	.in(adj11_reg_in),
	.out(adj11_reg_out)
);

register offset6_reg
(
	.clk,
	.load(load),
	.in(offset6_reg_in),
	.out(offset6_reg_out)
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

endmodule : id_ex