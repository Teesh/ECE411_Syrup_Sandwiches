import lc3b_types::*;

module id_ex
(
	input clk
);

register #(.width(lc3b_word)) PC_reg
(
	.clk
);

register #(.width(lc3b_word)) SR1_reg
(
	.clk
);

register #(.width(lc3b_word)) SR2_reg
(
	.clk
);

register #(.width(lc3b_imm4)) imm4_reg
(
	.clk
);

register #(.width(lc3b_imm5)) imm5_reg
(
	.clk
);

register #(.width(6)) adj6_reg
(
	.clk
);

register #(.width(9)) adj9_reg
(
	.clk
);

register #(.width(11)) adj11_reg
(
	.clk
);

register #(.width(6)) offset6_reg
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

endmodule : id_ex