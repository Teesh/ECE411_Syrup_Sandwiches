import lc3b_types::*;

/*
 * SEXT[offset-n << 1]
 */
module ext
(
    input lc3b_offset6 offset6,
	 input lc3b_offset9 offset9,
	 input lc3b_imm5 imm5,
	 input lc3b_imm4 imm4,
	 input lc3b_offset11 offset11,
	 input lc3b_byte trap8,
    output lc3b_word offset6_out,
	 output lc3b_word offset9_out,
	 output lc3b_word imm5_out,
	 output lc3b_word imm4_out,
	 output lc3b_word off6_out,
	 output lc3b_word trap8_out,
	 output lc3b_word offset11_out
);

assign offset6_out = $signed({offset6,1'b0});
assign offset9_out = $signed({offset9,1'b0});
assign offset11_out = $signed({offset11,1'b0});
assign imm5_out = $signed(imm5);
assign imm4_out = $signed(imm4);
assign trap8_out = {trap8,1'b0};
assign off6_out = $signed(offset6);

endmodule : ext