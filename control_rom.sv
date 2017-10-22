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
	ctrl.aluop = alu_pass;
	ctrl.alu_mux_sel = 3'b000;
	ctrl.offset_mux_sel = 1'b0;
	ctrl.pc_mux_sel = 2'b00;
	ctrl.sr1_mux_sel = 1'b0;
	ctrl.sr2_mux_sel = 1'b0;
	ctrl.data_mux_sel = 3'b000;
	ctrl.dest_mux_sel = 1'b0;
	ctrl.addr_mux_sel = 2'b00;
	ctrl.wdata_mux_sel = 2'b00;
	ctrl.d_cache_read = 1'b0;
	ctrl.d_cache_write = 1'b0;
	ctrl.ldi_mux_sel = 1'b0;
	ctrl.br_code = 1'b0;
	ctrl.reg_load = 1'b0;
	ctrl.stall = 1'b0;
	
	/* Assign control signals based on opcode */
	case(opcode)
		op_add: begin
			ctrl.aluop = alu_add;
			ctrl.load_cc = 1'b1;
			ctrl.reg_load = 1'b1;
				if(bit5 == 1'b1) begin
					ctrl.alu_mux_sel = 3'b010;
				end
		end
		op_and: begin
			ctrl.aluop = alu_and;
			ctrl.load_cc = 1'b1;
			ctrl.reg_load = 1'b1;
				if(bit5 == 1'b1) begin
					ctrl.alu_mux_sel = 3'b010;
				end
		end
		op_br: begin
			ctrl.pc_mux_sel = 2'b01;
			ctrl.br_code = 1'b1;
		end
		op_jmp: begin
			ctrl.pc_mux_sel = 2'b10;
		end
		op_jsr: begin
			ctrl.offset_mux_sel = 1'b1;
			ctrl.dest_mux_sel = 1'b1;
			ctrl.offset_mux_sel = 1'b1;
				if(bit11 == 1'b1) begin
					ctrl.pc_mux_sel = 2'b01;
				end
				else begin
					ctrl.pc_mux_sel = 2'b10;
				end
		end
		op_ldb: begin
			ctrl.load_cc = 1'b1;
		end
		op_ldi: begin
		end
		op_ldr: begin
			ctrl.load_cc = 1'b1;
			ctrl.alu_mux_sel = 3'b011;
			ctrl.aluop = alu_add;
			ctrl.data_mux_sel = 3'b100;
			ctrl.d_cache_read = 1'b1;
			ctrl.reg_load = 1'b1;
		end
		op_lea: begin
		end
		op_not: begin
			ctrl.aluop = alu_not;
			ctrl.load_cc = 1'b1;
			ctrl.reg_load = 1'b1;
		end
		op_shf: begin
		end
		op_stb: begin
		end
		op_sti: begin
		end
		op_str: begin
			ctrl.aluop = alu_add;
			ctrl.sr2_mux_sel = 1'b1;
			ctrl.alu_mux_sel = 3'b011;
			ctrl.wdata_mux_sel = 2'b01;
			ctrl.d_cache_write = 1'b1;
		end
		op_trap: begin
		end
		default: begin
			ctrl = 0;   /* Unknown opcode, set control word to zero */
		end
	endcase
end

endmodule : control_rom