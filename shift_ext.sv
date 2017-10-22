import lc3b_types::*;

module shift_ext
(
	input clk,
	input logic [15:0] in,
	output logic [15:0] adj6_out, adj9_out, adj11_out, offset6_out, trapvect8_out, imm5_out, imm4_out
);

assign adj6_out = $signed({in[5:0], 1'b0});
assign adj9_out = $signed({in[8:0], 1'b0});
assign adj11_out = $signed({in[10:0], 1'b0});

assign offset6_out = $unsigned({in[5:0]});

assign trapvect8_out = $unsigned({in[7:0], 1'b0});

assign imm5_out = $signed({in[4:0]});
assign imm4_out = $signed({in[3:0]});

endmodule : shift_ext