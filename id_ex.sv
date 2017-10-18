import lc3b_types::*;

module id_ex
(
	input clk
);

register PC_reg
(
	.clk
);

register SR1_reg
(
	.clk
);

register SR2_reg
(
	.clk
);

register imm4_reg
(
	.clk
);

register imm5_reg
(
	.clk
);

register adj6_reg
(
	.clk
);

register adj9_reg
(
	.clk
);

register adj11_reg
(
	.clk
);

register offset6_reg
(
	.clk
);

register dest_reg
(
	.clk
);

register trapvect8_reg
(
	.clk
);

register cword_reg
(
	.clk
);

endmodule : id_ex