import lc3b_types::*;

module ex_mem
(
	input clk
);

register PC_reg
(
	.clk
);

register ALU_reg
(
	.clk
);

register SR2_reg
(
	.clk
);

register addr_reg
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

endmodule : ex_mem