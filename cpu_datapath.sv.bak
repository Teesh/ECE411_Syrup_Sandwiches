import lc3b_types::*;

module cpu_datapath
(
	input clk,
	input lc3b_word mem_rdata,
   /* control signals */
	input load_pc,
	input load_ir,
	input load_regfile,
	input load_mar,
	input load_mdr,
	input jssr_sel,
	input load_cc,
	input [1:0] pcmux_sel,
	input storemux_sel,
	input [1:0] alumux_sel,
	input [1:0] regfilemux_sel,
	input marmux_sel,
	input mdrmux_sel,
	input jmpmux_sel,
	input lea2mux_sel,
	input leamux_sel,
	input ldi_sel,
	input lc3b_aluop aluop,
	input jssr_en,
	input trap_en,
	input logic stb_en,
   /* declare more ports here */
	output lc3b_word mem_address,
	output lc3b_word mem_wdata,
	output logic branch_enable,
	output logic bit5,bit11,bit0,
	output lc3b_opcode opcode
);

/* declare internal signals */
lc3b_reg sr1;
lc3b_reg sr2;
lc3b_reg dest;
lc3b_reg storemux_out;
lc3b_word sr1_out;
lc3b_word sr2_out;
lc3b_word offset6;
lc3b_word offset9;
lc3b_word offset11;
lc3b_word imm4;
lc3b_word imm5;
lc3b_word trap8;
lc3b_word off6;

lc3b_word pcmux_out;
lc3b_word alumux_out;
lc3b_word regfilemux_out;
lc3b_word marmux_out;
lc3b_word mdrmux_out;
lc3b_word alu_out;
lc3b_word pc_out;
lc3b_word br_add_out;
lc3b_word pc_plus2_out;
lc3b_nzp gencc_out;
lc3b_nzp cc_out;
lc3b_word jsr_add_out;
lc3b_word mem_wdata_masked;
lc3b_word mask_mux_out;
lc3b_word ldimux_out;
lc3b_word maskit_out;
lc3b_word trap_mux_out;
lc3b_word trapout_mux_out;

lc3b_word jmpmux_out;
lc3b_word leamux_out;
lc3b_word lea2mux_out;
lc3b_word shift_out;
logic bit5l, bit4;
/*
 * PC
 */
register PC
(
    .clk,
    .load(load_pc),
    .in(pcmux_out),
    .out(pc_out)
);

register MAR
(
	.clk,
	.load(load_mar),
	.in(marmux_out),
	.out(mem_address)
);

register MDR
(
	.clk,
	.load(load_mdr),
	.in(maskit_out),
	.out(mem_wdata)
);

register #(.width(3)) CC
(
	.clk,
	.load(load_cc),
	.in(gencc_out),
	.out(cc_out)
);

nzp_comp cccomp
(
	.a(dest),
	.b(cc_out),
	.en(branch_enable)
);

gencc GENCC
(
	.in(regfilemux_out),
	.out(gencc_out)
);

plus2 plus2reg
(
	.in(pc_out),
	.out(pc_plus2_out)
);

adder br_add
(
	.a(offset9),
	.b(pc_out),
	.out(br_add_out)
);

adder jsr_add
(
	.a(offset11),
	.b(pc_out),
	.out(jsr_add_out)
);

shift shifter
(
	.in(sr1_out),
	.imm4(imm4),
	.bit5(bit5l),
	.bit4(bit4),
	.out(shift_out)
);

alu ALU
(
	.aluop(aluop),
	.a(lea2mux_out),
	.b(leamux_out),
	.f(alu_out)
);

ir IR
(
	.clk,
	.load(load_ir),
	.in(mem_wdata),
	.jssr_en(jssr_en),
	.opcode(opcode),
	.dest(dest), 
	.src1(sr1),
	.src2(sr2),
	.offset6(offset6),
	.offset9(offset9),
	.offset11(offset11),
	.off6(off6),
	.imm5(imm5),
	.imm4(imm4),
	.trap8(trap8),
	.bit5(bit5),
	.bit5l(bit5l),
	.bit4(bit4),
	.bit11(bit11),
	.bit0(bit0)
);

regfile regfile_reg
(
	.clk,
	.load(load_regfile),
	.in(regfilemux_out),
	.src_a(storemux_out),
	.src_b(sr2),
	.dest(dest),
	.reg_a(sr1_out), 
	.reg_b(sr2_out)
);

mux2 leamux
(
	 .sel(leamux_sel),
	 .a(alumux_out),
	 .b(offset9),
	 .f(leamux_out)
);

mux2 lea2mux
(
    .sel(lea2mux_sel),
    .a(trap_mux_out),
    .b(pc_out),
    .f(lea2mux_out)
);

mux4 pcmux
(
    .sel(pcmux_sel),
    .a(pc_plus2_out),
    .b(sr1_out),
	 .c(br_add_out),
	 .d(trapout_mux_out),
    .f(pcmux_out)
);

mux2 trapout_mux
(
	 .sel(trap_en),
    .a(jsr_add_out),
    .b(mem_wdata),
    .f(trapout_mux_out)
);

mux2 #(.width(3)) storemux
(
	.sel(storemux_sel),
	.a(sr1),
	.b(dest),
	.f(storemux_out)
);

mux4 alumux
(
	.sel(alumux_sel),
	.a(sr2_out),
	.b(imm5),
	.c(offset6),
	.d(off6),
	.f(alumux_out)
);

mux2 marmux
(
	.sel(marmux_sel),
	.a(ldimux_out),
	.b(pc_out),
	.f(marmux_out)
);

mux2 ldi_mux
(
	.sel(ldi_sel),
	.a(alu_out),
	.b(mem_wdata),
	.f(ldimux_out)
);

mux2 mdrmux
(
	.sel(mdrmux_sel),
	.a(alu_out),
	.b(mem_rdata),
	.f(mdrmux_out)
);

mux4 regfilemux
(
	.sel(regfilemux_sel),
	.a(alu_out),
	.b(mem_wdata),
	.c(mask_mux_out),
	.d(shift_out),
	.f(regfilemux_out)
);

mux2 mask_mux
(
	.sel(jssr_sel),
	.a(mem_wdata_masked),
	.b(pc_out),
	.f(mask_mux_out)
);

mask masker
(
	 .en(bit0),
	 .in(mem_wdata),
	 .out(mem_wdata_masked)
);

mask2 maskit
(
	 .en(stb_en),
	 .in(mdrmux_out),
	 .out(maskit_out)
);

mux2 trap_mux
(
	.sel(trap_en),
	.a(sr1_out),
	.b(trap8),
	.f(trap_mux_out)
);

endmodule : cpu_datapath
