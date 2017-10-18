import lc3b_types::*;

/*
 * SEXT[offset-n << 1]
 */
module mask2
(
	 input logic en,
	 input lc3b_word in,
	 output lc3b_word out
);

always_comb
begin
	if(en == 1)
		out = in << 8;
	else
		out = in;
end

endmodule : mask2