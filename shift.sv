import lc3b_types::*;

/*
 * SEXT[offset-n << 1]
 */
module shift
(
    input lc3b_word in,
	 input lc3b_word imm4,
	 input logic bit5,
	 input logic bit4,
	 output lc3b_word out
);

always_comb
begin
	out = 16'h0000;
	if(bit4 == 0)
		out = in << imm4;
	else if(bit5 == 0)
		out = in >> imm4;
	else
		out = $signed(in) >>> imm4;
end

endmodule : shift