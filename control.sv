import lc3b_types::*; /* Import types defined in lc3b_types.sv */

module control
(
   /* Input and output port declarations */
	input clk,
	/* Datapath controls */
	input lc3b_opcode opcode,
	input logic bit5, bit11, bit0,
	input logic branch_enable,
	output logic load_pc,
	output logic load_ir,
	output logic load_regfile,
	output lc3b_aluop aluop,
	output logic load_mar,
	output logic load_mdr,
	output logic load_cc,
	output logic [1:0] pcmux_sel,
	output logic storemux_sel,
	output logic [1:0] alumux_sel,
	output logic [1:0] regfilemux_sel,
	output logic marmux_sel,
	output logic mdrmux_sel,
	output logic jmpmux_sel,
	output logic lea2mux_sel,
	output logic ldi_sel,
	output logic leamux_sel,
	output logic stb_en,
	output logic jssr_en,
	output logic trap_en,
	/* Memory signals */
	input mem_resp,
	output logic mem_read,
	output logic mem_write,
	output logic jssr_sel,
	output lc3b_mem_wmask mem_byte_enable
);

enum int unsigned {
   /* List of states */
	fetch1,
	fetch2,
	fetch3,
	decode,
	s_add,
	s_and,
	s_not,
	br,
	br_taken,
	calc_addr,
	ldr1,
	ldr2,
	str1,
	str2,
	jmp,
	lea,
	jsr,
	shf,
	ldi1,
	ldi2,
	stb1,
	sti1,
	sti2,
	sti3,
	sti4,
	trap1,
	trap2,
	trap3
} state, next_state;

always_comb
begin : state_actions
	/* Default output assignments */
	/* Actions for each state */
	load_pc = 1'b0;
	load_ir = 1'b0;
	load_regfile = 1'b0;
	load_mar = 1'b0;
	load_mdr = 1'b0;
	load_cc = 1'b0;
	pcmux_sel = 2'b00;
	storemux_sel = 1'b0;
	alumux_sel = 2'b00;
	regfilemux_sel = 1'b00;
	marmux_sel = 1'b0;
	mdrmux_sel = 1'b0;
	jmpmux_sel = 1'b0;
	aluop = alu_add;
	mem_read = 1'b0;
	mem_write = 1'b0;
	mem_byte_enable = 2'b11;
	lea2mux_sel = 1'b0;
	leamux_sel = 1'b0;
	jssr_en = 1'b0;
	jssr_sel = 1'b0;
	ldi_sel = 1'b0;
	stb_en = 1'b0;
	trap_en = 1'b0;
	
	case(state)
		fetch1: begin
			/* MAR <= PC */
			marmux_sel = 1;
			load_mar = 1;
			/* PC <= PC + 2 */
			load_pc = 1;
		end
		
		fetch2: begin
			/* Read memory */
			mem_read = 1;
			mdrmux_sel = 1;
			load_mdr = 1;
		end
		
		fetch3: begin
			/* Load IR */
			load_ir = 1;
		end
		
		decode: /* Do nothing */;
		
		s_add: begin
			/* DR <= SRA + SRB */
			aluop = alu_add;
			if(bit5) alumux_sel = 2'b01;
			load_regfile = 1;
			load_cc = 1;
		end
		
		s_and: begin
			/* DR <= SRA & SRB */
			aluop = alu_and;
			if(bit5) alumux_sel = 2'b01;
			load_regfile = 1;
			load_cc = 1;
		end
		
		s_not: begin
			/* DR <= NOT(A) */
			aluop = alu_not;
			load_regfile = 1;
			load_cc = 1;
		end
		
		br: ;// NONE
		
		br_taken: begin
			/* PC <= PC + SEXT(IR[8:0] << 1) */
			pcmux_sel = 2'b10;
			load_pc = 1;
		end
		
		calc_addr: begin
			/* MAR <= A + SEXT(IR[5:0] << 1) */
			if(opcode == op_stb || opcode == op_ldb)
				alumux_sel = 2'b11;
			else
				alumux_sel = 2'b10;
			aluop = alu_add;
			load_mar = 1;
		end
		
		ldr1: begin
			/* MDR <= M[MAR] */
			alumux_sel = 2'b10;
			mdrmux_sel = 1;
			load_mdr = 1;
			mem_read = 1;
		end
		
		ldr2: begin
			/* DR <= MDR */
			if(opcode == op_ldb)
				regfilemux_sel = 2'b10;
			else
				regfilemux_sel = 2'b01;
			load_regfile = 1;
			load_cc = 1;
		end
		
		ldi1: begin
			ldi_sel = 1;
			load_mar = 1;
		end
		
		ldi2: begin
			mdrmux_sel = 1;
			load_mdr = 1;
			mem_read = 1;
		end
		
		str1: begin
			/* MDR <= SR */
			alumux_sel = 2'b10;
			storemux_sel = 1;
			if(opcode == op_stb && bit0 == 1)
					stb_en = 1;
			aluop = alu_pass;
			load_mdr = 1;
		end
		
		str2: begin
			/* M[MAR] <= MDR */
			mem_write = 1;
		end
		
		stb1: begin
			mem_write = 1; 
			if(bit0 == 1)
				mem_byte_enable = 2'b10;
			else
				mem_byte_enable = 2'b01;
		end
		
		sti1: begin
			alumux_sel = 2'b10;
			mdrmux_sel = 1;
			load_mdr = 1;
			mem_read = 1;
		end
		
		sti2: begin
			ldi_sel = 1;
			load_mar = 1;
			alumux_sel = 2'b10;
			storemux_sel = 1;
			aluop = alu_pass;
			load_mdr = 1;
		end
		
		sti3: begin
			mem_write = 1;
		end
		
		jmp: begin
			pcmux_sel = 2'b01;
			load_pc = 1;
		end
		
		lea: begin
			lea2mux_sel = 1;
			leamux_sel = 1;
			load_cc = 1;
			load_regfile = 1;
		end
		
		jsr: begin
			if(bit11 == 0)
				pcmux_sel = 2'b01;
			else
				pcmux_sel = 2'b11;
			jssr_sel = 1;
			jssr_en = 1;
			load_pc = 1;
			load_regfile = 1;
			regfilemux_sel = 2'b10;
		end
		
		shf: begin
			load_cc = 1;
			load_regfile = 1;
			regfilemux_sel = 2'b11;
		end
		
		trap1: begin
			jssr_en = 1;
			jssr_sel = 1;
			trap_en = 1;
			load_regfile = 1;
			regfilemux_sel = 2'b10;
			aluop = alu_pass;
			load_mar = 1;
		end
		
		trap2: begin
			load_mdr = 1;
			mdrmux_sel = 1;
			mem_read = 1;
			trap_en = 1;
		end
		
		trap3: begin
			trap_en = 1;
			load_pc = 1;
			pcmux_sel = 2'b11;
		end
		
		default: /* Do nothing */;
	endcase
end

always_comb
begin : next_state_logic
	/* Next state information and conditions (if any)
	 * for transitioning between states */
	next_state = state;
	
	case(state)
		fetch1: next_state <= fetch2;
		
		fetch2: begin
			if(mem_resp == 0)
				next_state <= fetch2;
			else
				next_state <= fetch3;
		end
		
		fetch3: next_state <= decode;
		
		decode: begin
			case(opcode)
				op_add: next_state <= s_add;
				op_and: next_state <= s_and;
				op_not: next_state <= s_not;
				op_ldr: next_state <= calc_addr;
				op_str: next_state <= calc_addr;
				op_br: next_state <= br;
				op_jmp: next_state <= jmp;
				op_lea: next_state <= lea;
				op_jsr: next_state <= jsr;
				op_ldb: next_state <= calc_addr;
				op_ldi: next_state <= calc_addr;
				op_shf: next_state <= shf;
				op_stb: next_state <= calc_addr;
				op_sti: next_state <= calc_addr;
				op_trap: next_state <= trap1;
				default: next_state <= fetch1;
			endcase
		end
		
		s_add: next_state <= fetch1;
		
		s_and: next_state <= fetch1;
		
		s_not: next_state <= fetch1;
		
		br: begin
			if(branch_enable == 1)
				next_state <= br_taken;
			else
				next_state <= fetch1;
		end
		
		br_taken: next_state <= fetch1;
		
		calc_addr: begin
			case(opcode)
				op_ldr: next_state <= ldr1;
				op_str: next_state <= str1;
				op_stb: next_state <= str1;
				op_ldb: next_state <= ldr1;
				op_sti: next_state <= sti1;
				op_ldi: next_state <= ldr1;
				default: next_state <= fetch1;
			endcase
		end
		
		ldr1: begin
			if(mem_resp == 0)
				next_state <= ldr1;
			else if(opcode == op_ldi)
				next_state <= ldi1;
			else
				next_state <= ldr2;
		end
		
		ldr2: next_state <= fetch1;
		
		ldi1: next_state <= ldi2;
		
		ldi2: begin
			if(mem_resp == 0)
				next_state <= ldi2;
			else
				next_state <= ldr2;
		end
		
		str1: begin
			if(opcode == op_str)
				next_state <= str2;
			else
				next_state <= stb1;
		end
		
		str2: begin
			if(mem_resp == 0)
				next_state <= str2;
			else
				next_state <= fetch1;
		end
		
		stb1: begin
			if(mem_resp == 0)
				next_state <= stb1;
			else
				next_state <= fetch1;
		end
		
		jmp: next_state <= fetch1;
		
		lea: next_state <= fetch1;
		
		jsr: next_state <= fetch1;
		
		shf: next_state <= fetch1;
		
		sti1: begin
			if(mem_resp == 0)
				next_state <= sti1;
			else
				next_state <= sti2;
		end
		
		sti2: next_state <= sti3;
		
		sti3: begin
			if(mem_resp == 0)
				next_state <= sti3;
			else
				next_state <= fetch1;
		end
		
		trap1: next_state <= trap2;
		
		trap2: begin
			if(mem_resp == 0)
				next_state <= trap2;
			else
				next_state <= trap3;
		end
		
		trap3: next_state <= fetch1;
		
		default: next_state <= fetch1;
	endcase 
end

always_ff @(posedge clk)
begin: next_state_assignment
    /* Assignment of next state on clock edge */
	 state <= next_state;
end

endmodule : control
