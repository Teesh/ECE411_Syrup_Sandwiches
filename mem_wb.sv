import lc3b_types::*;

module mem_wb
(
	input clk,
	input logic [15:0] PC_reg_in, SR2_reg_in, ALU_reg_in,
				   cword_reg_in, d_rdata_reg_in,
					addr_reg_in, ldb_shift_reg_in,
	input logic [2:0] dest_reg_in,
				
	
	output logic [15:0] PC_reg_out, SR2_reg_out, ALU_reg_out,
				   cword_reg_out, d_rdata_reg_out,
					addr_reg_out, ldb_shift_reg_out,
	output logic [2:0] dest_reg_out
);

register PC_reg
(
	.clk,
	.load(),
	.in(PC_reg_in),
	.out(PC_reg_out)
);

register ALU_reg
(
	.clk,
	.load(),
	.in(ALU_reg_in),
	.out(ALU_reg_out)
);

register addr_reg
(
	.clk,
	.load(),
	.in(addr_reg_in),
	.out(addr_reg_out)
);

register #(.width(3)) dest_reg
(
	.clk,
	.load(),
	.in(dest_reg_in),
	.out(dest_reg_out)
);

register d_rdata_reg
(
	.clk,
	.load(),
	.in(d_rdata_reg_in),
	.out(d_rdata_reg_out)
);

register LDB_reg
(
	.clk,
	.load(),
	.in(ldb_shift_reg_in),
	.out(ldb_shift_reg_out)
);

register cword_reg
(
	.clk,
	.load(),
	.in(cword_reg_in),
	.out(cword_reg_out)
);

endmodule : mem_wb