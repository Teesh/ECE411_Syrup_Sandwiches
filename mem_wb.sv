import lc3b_types::*;

module mem_wb
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

register addr_reg
(
	.clk
);

register dest_reg
(
	.clk
);

register d_rdata_reg
(
	.clk
);

register LDB_reg
(
	.clk
);

register cword_reg
(
	.clk
);

endmodule : mem_wb