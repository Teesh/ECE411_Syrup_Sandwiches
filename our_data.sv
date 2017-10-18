import lc3b_types::*;

module our_data
(
	input mem_bus in,
	input logic [3:0] offset,
	output lc3b_word out
);

logic [2:0] offset_word;

assign offset_word = offset[3:1];

always_comb
begin
	case(offset_word)
		3'b000: out = in[15:0];
		3'b001: out = in[31:16];
		3'b010: out = in[47:32];
		3'b011: out = in[63:48];
		3'b100: out = in[79:64];
		3'b101: out = in[95:80];
		3'b110: out = in[111:96];
		3'b111: out = in[127:112];
	endcase
end

endmodule : our_data