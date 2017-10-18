import lc3b_types::*;

module array #(parameter width = 128)
(
    input clk,
    input load,
	 input lc3b_reg index,
    input [width-1:0] in,
    output logic [width-1:0] out
);

logic [width-1:0] data [7:0]; 

initial
begin
    for (int i = 0; i < $size(data); i++)
    begin
        data[i] = 1'b0;
    end
end

always_ff @(posedge clk)
begin
    if (load == 1)
    begin
        data[index] = in;
    end
end

assign out = data[index];

endmodule : array
