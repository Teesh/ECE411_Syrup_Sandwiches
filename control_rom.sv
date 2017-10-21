import lc3b_types::*;

module control_rom
(
	input lc3b_opcode opcode,
	input logic bit11,
	input logic bit5,
	input logic bit4,
	output lc3b_control_word ctrl
);

always_comb
begin
	ctrl.opcode = opcode;
	ctrl.load_cc = 1'b0;
	
	/* Assign control signals based on opcode */
	case(opcode)
		op_add: begin
			ctrl.aluop = alu_add;
		end

		op_and: begin
			ctrl.aluop = alu_and;
		end
		
		/* ... other opcodes ... */
		
		default: begin
			ctrl = 0;   /* Unknown opcode, set control word to zero */
		end
	endcase
end

endmodule : control_rom