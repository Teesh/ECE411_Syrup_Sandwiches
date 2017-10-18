import lc3b_types::*;

module comp_tag
(
	input logic [8:0] comp_a,
	input logic [8:0] comp_b,
	output lc3b_word out
);

always_comb
begin
	out = 0;
	if(comp_a == comp_b)
		out = 1;
	else
		out = 0;
end

endmodule : comp_tag