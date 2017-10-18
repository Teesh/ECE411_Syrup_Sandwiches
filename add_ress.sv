import lc3b_types::*;

module add_ress
(
	input logic [8:0] in,
	input logic [2:0] index,
	output lc3b_word out
);

always_comb
begin
	out = 16'h0000;
	out[15:7] = in;
	out[6:4] = index;
end

endmodule : add_ress