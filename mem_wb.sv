import lc3b_types::*;

module mem_wb
(
	input clk
);

register #(.width(lc3b_word)) PC_reg
(
	.clk
);

register #(.width(lc3b_word)) ALU_reg
(
	.clk
);

register #(.width(lc3b_word)) addr_reg
(
	.clk
);

register #(.width(lc3b_reg)) dest_reg
(
	.clk
);

register #(.width(lc3b_word)) d_rdata_reg
(
	.clk
);

register #(.width(lc3b_word)) LDB_reg
(
	.clk
);

register cword_reg
(
	.clk
);

endmodule : mem_wb