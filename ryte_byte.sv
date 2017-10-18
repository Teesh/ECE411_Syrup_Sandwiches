import lc3b_types::*;

module ryte_byte
(
	input mem_bus in,
	input lc3b_word mem_wdata,
	input logic[3:0] offset,
	input logic[1:0] mem_byte_enable,
	output mem_bus out
);

logic [2:0] offset_word;
lc3b_word put_word, take_word;

assign offset_word = offset[3:1];

always_comb
begin
	case(mem_byte_enable)
			2'b00: put_word  = 16'h0000;
			2'b01: put_word  = 16'h00FF;
			2'b10: put_word  = 16'hFF00;
			2'b11: put_word  = 16'hFFFF;
			default: ;
	endcase
end

always_comb
begin
	out = in;
	case(offset_word)
		3'b000: out[15:0] = (out[15:0] & ~put_word) | (mem_wdata & put_word);
		3'b001: out[31:16] = (out[31:16] & ~put_word) | (mem_wdata & put_word);
		3'b010: out[47:32] = (out[47:32] & ~put_word) | (mem_wdata & put_word);
		3'b011: out[63:48] = (out[63:48] & ~put_word) | (mem_wdata & put_word);
		3'b100: out[79:64] = (out[79:64] & ~put_word) | (mem_wdata & put_word);
		3'b101: out[95:80] = (out[95:80] & ~put_word) | (mem_wdata & put_word);
		3'b110: out[111:96] = (out[111:96] & ~put_word) | (mem_wdata & put_word);
		3'b111: out[127:112] = (out[127:112] & ~put_word) | (mem_wdata & put_word);
		default: ;
	endcase
end

endmodule : ryte_byte
