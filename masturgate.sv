import lc3b_types::*;
module masturgate
(
	input logic a, b, c, d, e,
	output logic load
);
always_comb
begin
	load = 1'b1;
	if(a | b | c | d | e)
		load = 1'b0;
end
endmodule : masturgate