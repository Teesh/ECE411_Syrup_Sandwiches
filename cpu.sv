import lc3b_types::*;

module cpu
(
	input clk
);

/*
 *		FETCH
 *		All modules for segment
 *		Final module is the pipe
 *
 */

register PC_reg
(
	.clk
);

plus2 PC_plus2
(
	.clk
);

mux4 PC_mux
(
	.clk
);

if_id if_id_pipe
(
	.clk
);

/*
 *		DECODE
 *		All modules for segment
 *		Final module is the pipe
 *
 */

regfile regfile_reg
(
	.clk
);

mux2 sr1_mux
(
	.clk
);

mux2 sr2_mux
(
	.clk
);

shift_ext shift_ext_blk
(
	.clk
);

control_rom control_rom_blk
(
	.clk
);


id_ex id_ex_pipe
(
	.clk
);

/*
 *		EXECUTE
 *		All modules for segment
 *		Final module is the pipe
 *
 */

alu alu
(
	.clk
);

mux8 alu_mux
(
	.clk
);

adder addr_adder
(
	.clk
);

mux2 offset_mux
(
	.clk
);

ex_mem ex_mem_pipe
(
	.clk
);

/*
 *		MEM
 *		All modules for segment
 *		Final module is the pipe
 *
 */

stb_shift stb_shift_blk
(
	.clk
);

mux4 wdata_mux
(
	.clk
);

mux4 addr_mux
(
	.clk
);

ldb_shift ldb_shift_blk
(
	.clk
);

mem_wb mem_wb_pipe
(
	.clk
);

mux2 ldi_mux
(
	.clk
);

register ldi_count
(
	.clk
);

/*
 *		WB
 *		All modules for segment
 *		No final pipe for this segment
 *
 */

mux8 data_mux
(
	.clk
);

mux2 dest_mux
(
	.clk
);

gencc GenCC
(
	.clk
);

register CC
(
	.clk
);

nzp_comp cccomp
(
	.clk
);

endmodule : cpu