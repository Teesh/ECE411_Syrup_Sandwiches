import lc3b_types::*;

module cpu
(
	input logic clk,
   input logic pmem_resp_a,
   input logic [15:0] pmem_rdata_a,
   output logic pmem_read_a, //where are reads and writes coming from?
   output logic pmem_write_a,
   output logic [15:0] pmem_address_a,
   output logic [15:0] pmem_wdata_a,

   input logic pmem_resp_b,
   input logic [15:0] pmem_rdata_b,
   output logic pmem_read_b,
   output logic pmem_write_b,
   output logic [15:0] pmem_address_b,
   output logic [15:0] pmem_wdata_b
);

logic [15:0] plus2_out;
logic [15:0] PC_mux_out;
logic [15:0] addr_reg_out;
logic [15:0] alu_reg_out;
logic [15:0] PC_reg_decode;
logic [15:0] PC_reg_execute;
logic [15:0] PC_reg_mem;
logic [15:0] PC_reg_wb;

logic [15:0] i_rdata_out;

logic [2:0] sr1_mux_out;
logic [2:0] sr2_mux_out;
logic [15:0] reg_a_out;
logic [15:0] reg_b_out;

logic [15:0] adj6_decode;
logic [15:0] adj9_decode;
logic [15:0] adj11_decode;
logic [15:0] offset6_decode;
logic [15:0] trapvect8_decode;
logic [15:0] imm5_decode;
logic [15:0] imm4_decode;

logic [15:0] adj6_execute;
logic [15:0] adj9_execute;
logic [15:0] adj11_execute;
logic [15:0] offset6_execute;
logic [15:0] trapvect8_execute;
logic [15:0] imm5_execute;
logic [15:0] imm4_execute;
logic [15:0] trapvect8_mem;

lc3b_control_word cword_decode;
lc3b_control_word cword_execute;
lc3b_control_word cword_mem;
lc3b_control_word cword_wb;

logic [15:0] sr1_execute;
logic [15:0] sr2_execute;
logic [15:0] sr2_mem;

logic [2:0] dest_execute;
logic [2:0] dest_mem;
logic [2:0] dest_wb;

logic [2:0] dest_mux_out;
logic [15:0] data_mux_out;

logic [15:0] alu_out;
logic [15:0] alu_mux_out;

logic [15:0] adder_out;
logic [15:0] offset_mux_out;

logic [15:0] alu_mem;
logic [15:0] addr_mem;

logic [15:0] stb_shift_out;

logic [15:0] ldb_shift_mem;
logic [15:0] ldb_shift_wb;

logic [15:0] addr_mux_out;

logic ldi_count_out;

logic [2:0] genCC_out;
logic [2:0] cc_reg_out;

logic [15:0] d_rdata_wb;

logic [1:0] pc_mux_sel;
logic enable;
logic load;


assign pmem_wdata_a = 16'h0000;
assign pmem_read_a = load;
assign pmem_write_a = 1'b0;
assign pmem_read_b = cword_mem.d_cache_read;
assign pmem_write_b = cword_mem.d_cache_write;

masturgate master_gater
(
	.a(cword_decode.stall),
	.b(cword_execute.stall),
	.c(cword_mem.stall),
	.d(cword_wb.stall),
	.load(load)
);
/*
 *		FETCH
 *		All modules for segment
 *		Final module is the pipe
 *
 */

register PC_reg
(
	.clk,
	.load(load),
	.in(PC_mux_out),
	.out(pmem_address_a)
	
);

plus2 PC_plus2
(
	.in(pmem_address_a),
	.out(plus2_out)
);

mux4 PC_mux
(
	.sel(pc_mux_sel),
	.a(plus2_out),
	.b(addr_reg_out),
	.c(alu_reg_out),
	.d(16'h0000),
	.f(PC_mux_out)
);

if_id if_id_pipe
(
	.clk,
	.load(load),
	.PC_reg_in(pmem_address_a),
	.PC_reg_out(PC_reg_decode),
	.I_rdata_in(pmem_rdata_a),
	.I_rdata_out(i_rdata_out)
	
);

/*
 *		DECODE
 *		All modules for segment
 *		Final module is the pipe
 *
 */

regfile regfile_reg
(
	.clk,
	.load(load & cword_wb.reg_load),
	.in(data_mux_out),
	.src_a(sr1_mux_out),
	.src_b(sr2_mux_out),
	.dest(dest_mux_out),
	.reg_a(reg_a_out),
	.reg_b(reg_b_out)
);

mux2 sr1_mux
(
	.sel(cword_decode.sr1_mux_sel),
	.a(i_rdata_out[8:6]),
	.b(i_rdata_out[11:9]),
	.f(sr1_mux_out)
);

mux2 sr2_mux
(
	.sel(cword_decode.sr2_mux_sel),
	.a(i_rdata_out[2:0]),
	.b(i_rdata_out[11:9]),
	.f(sr2_mux_out)
);

shift_ext shift_ext_blk
(
	.clk,
	.in(i_rdata_out),
	.adj6_out(adj6_decode), 
	.adj9_out(adj9_decode), 
	.adj11_out(adj11_decode), 
	.offset6_out(offset6_decode), 
	.trapvect8_out(trapvect8_decode), 
	.imm5_out(imm5_decode), 
	.imm4_out(imm4_decode)
);

control_rom control_rom_blk
(
   .opcode(lc3b_opcode'(i_rdata_out[15:12])), //cast
	.bit11(i_rdata_out[11]),
	.bit5(i_rdata_out[5]),
	.bit4(i_rdata_out[4]),
	.ctrl(cword_decode)
);


id_ex id_ex_pipe
(
	.clk,
	.load(load),
	.PC_reg_in(PC_reg_decode),
	.SR1_reg_in(reg_a_out),
	.SR2_reg_in(reg_b_out),
	.imm4_reg_in(imm4_decode),
	.imm5_reg_in(imm5_decode),
	.adj6_reg_in(adj6_decode),
	.adj9_reg_in(adj9_decode),
	.adj11_reg_in(adj11_decode),
	.offset6_reg_in(offset6_decode),
	.dest_reg_in(i_rdata_out[11:9]),
	.trapvect8_reg_in(trapvect8_decode),
	.cword_reg_in(cword_decode),
	
	.PC_reg_out(PC_reg_execute),
	.SR1_reg_out(sr1_execute),
	.SR2_reg_out(sr2_execute),
	.imm4_reg_out(imm4_execute),
	.imm5_reg_out(imm5_execute),
	.adj6_reg_out(adj6_execute),
	.adj9_reg_out(adj9_execute),
	.adj11_reg_out(adj11_execute),
	.offset6_reg_out(offset6_execute),
	.dest_reg_out(dest_execute),
	.trapvect8_reg_out(trapvect8_execute),
	.cword_reg_out(cword_execute)
);

/*
 *		EXECUTE
 *		All modules for segment
 *		Final module is the pipe
 *
 */

alu alu
(
	.aluop(cword_execute.aluop),
   .a(sr1_execute), 
	.b(alu_mux_out),
   .f(alu_out)
);

mux8 alu_mux
(
	.sel(cword_execute.alu_mux_sel),
	.a(sr2_execute),
	.b(imm4_execute),
	.c(imm5_execute),
	.d(adj6_execute),
	.e(offset6_execute),
	.f(16'h0000),
	.g(16'h0000),
	.h(16'h0000),
	.z(alu_mux_out)
);

adder addr_adder
(
	.a(PC_reg_execute),
	.b(offset_mux_out),
	.out(adder_out)
);

mux2 offset_mux
(
	.sel(cword_execute.offset_mux_sel),
	.a(adj9_execute),
	.b(adj11_execute),
	.f(offset_mux_out)
);

ex_mem ex_mem_pipe
(
	.clk,
	.load(load),
	.PC_reg_in(PC_reg_execute),
	.SR2_reg_in(sr2_execute),
	.ALU_reg_in(alu_out),
	.dest_reg_in(dest_execute),
	.trapvect8_reg_in(trapvect8_execute),
	.cword_reg_in(cword_execute),
	.addr_reg_in(adder_out),
	
	.PC_reg_out(PC_reg_mem),
	.SR2_reg_out(sr2_mem),
	.ALU_reg_out(alu_mem),
	.dest_reg_out(dest_mem),
	.trapvect8_reg_out(trapvect8_mem),
	.cword_reg_out(cword_mem),
	.addr_reg_out(addr_mem)
);

/*
 *		MEM
 *		All modules for segment
 *		Final module is the pipe
 *
 */

stb_shift stb_shift_blk
(
	.clk,
	.in(sr2_mem),
	.out(stb_shift_out)
);

mux4 wdata_mux
(
	.sel(cword_mem.wdata_mux_sel),
	.a(stb_shift_out),
	.b(sr2_mem),
	.c(alu_mem),
	.d(16'h0000),
	.f(pmem_wdata_b)
	
);

mux4 addr_mux
(
	.sel(cword_mem.addr_mux_sel),
	.a(alu_mem),
	.b(addr_mem),
	.c(trapvect8_mem),
	.d(16'h0000),
	.f(addr_mux_out)
);

ldb_shift ldb_shift_blk
(
	.clk,
	.in(pmem_rdata_b),
	.out(ldb_shift_mem)
);

mux2 ldi_mux
(
	.sel(cword_mem.ldi_mux_sel),
	.a(addr_mux_out),
	.b(pmem_rdata_b),
	.f(pmem_address_b)
);

register #(.width(1)) ldi_count
(
	.clk,
	.load(load),
	.in(pmem_resp_b),
	.out(ldi_count_out)
);

mem_wb mem_wb_pipe
(
	.clk,
	.load(load),
	.PC_reg_in(PC_reg_mem),
	.ALU_reg_in(alu_mem),
	.dest_reg_in(dest_mem),
	.cword_reg_in(cword_mem),
	.addr_reg_in(addr_mem),
	.d_rdata_reg_in(pmem_rdata_b),
	.ldb_shift_reg_in(ldb_shift_mem),
	
	.PC_reg_out(PC_reg_wb),
	.ALU_reg_out(alu_reg_out),
	.dest_reg_out(dest_wb),
	.cword_reg_out(cword_wb),
	.addr_reg_out(addr_reg_out),
	.d_rdata_reg_out(d_rdata_wb),
	.ldb_shift_reg_out(ldb_shift_wb)
);

/*
 *		WB
 *		All modules for segment
 *		No final pipe for this segment
 *
 */

mux8 data_mux
(
	.sel(cword_wb.data_mux_sel),
	.a(PC_reg_wb),
	.b(alu_reg_out),
	.c(ldb_shift_wb),
	.d(d_rdata_wb),
	.e(addr_reg_out),
	.f(16'h0000),
	.g(16'h0000),
	.h(16'h0000),
	.z(data_mux_out)
);

mux2 #(.width(3)) dest_mux
(
	.sel(cword_wb.dest_mux_sel),
	.a(dest_wb),
	.b({3'b111}),
	.f(dest_mux_out)
);

gencc GenCC
(
	.in(data_mux_out),
	.out(genCC_out)
);

register #(.width(3)) CC
(
	.clk,
	.load(load),
	.in(genCC_out),
	.out(cc_reg_out)
	
);

nzp_comp cccomp
(
	.a(cc_reg_out),
	.b(dest_wb),
	.en(enable)
	
);

branch_enable ben
(
	.br_taken(enable),
	.br_sel(cword_wb.pc_mux_sel),
	.br_code(cword_wb.br_code),
	.pc_mux_sel(pc_mux_sel)
);

endmodule : cpu