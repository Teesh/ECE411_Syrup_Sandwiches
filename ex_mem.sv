import lc3b_types::*;

module ex_mem
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

register #(.width(lc3b_word)) SR2_reg
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

register #(.width(8)) trapvect8_reg
(
	.clk
);

register cword_reg
(
	.clk
);

endmodule : ex_mem