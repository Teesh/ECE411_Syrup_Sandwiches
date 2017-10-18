import lc3b_types::*;

module nzp_comp
(
	input lc3b_nzp a,
	input lc3b_nzp b,
	output logic en
);

always_comb
begin
	if((a[0] & b[0]) || (a[1] & b[1]) || (a[2] & b[2]))
		en = 1;
	else
		en = 0;
end

endmodule : nzp_comp