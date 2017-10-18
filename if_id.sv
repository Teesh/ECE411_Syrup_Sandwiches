import lc3b_types::*;

module if_id
(
	input clk
);

register PC_reg
(
	.clk
);

register i_rdata_reg
(
	.clk
);

endmodule : if_id