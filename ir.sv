import lc3b_types::*;

module ir
(
    input clk,
    input load,
    input lc3b_word in,
	 input logic jssr_en,
    output lc3b_opcode opcode,
    output lc3b_reg dest, src1, src2,
    output lc3b_word offset6,
    output lc3b_word off6,
	 output lc3b_word offset9,
	 output lc3b_word offset11,
	 output lc3b_word imm5,
	 output lc3b_word imm4,
	 output lc3b_word trap8,
	 output logic bit5, bit4, bit11, bit5l, bit0
);

lc3b_word data;

assign offset6 = $signed({data[5:0],1'b0});
assign off6 = $signed(data[5:0]);
assign offset9 = $signed({data[8:0],1'b0});
assign offset11 = $signed({data[10:0],1'b0});
assign imm5 = $signed(data[4:0]);
assign imm4 = $signed(data[3:0]);
assign trap8 = {data[7:0],1'b0};

always_ff @(posedge clk)
begin
    if (load == 1)
    begin
        data = in;
    end
end

always_comb
begin
    opcode = lc3b_opcode'(data[15:12]);
	 bit0 = data[0];
	 if(jssr_en == 1)
		dest = 3'b111;
	 else
		dest = data[11:9];
    src1 = data[8:6];
    src2 = data[2:0];

	 bit5 = data[5];
	 bit5l = data[5];
	 bit4 = data[4];
	 bit11 = data[11];
end

endmodule : ir
