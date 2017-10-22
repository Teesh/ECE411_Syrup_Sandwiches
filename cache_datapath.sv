import lc3b_types::*;

module cache_datapath
(
	input logic clk,
	output logic lru_out,
	output logic d_out,
	input lru_in,
	input d0_in,
	input d1_in,
	input v0_in,
	input v1_in,
	output logic hit,
	output logic comp0,
	output logic comp1,
	input load_v0,
	input load_v1,
	input load_d0,
	input load_d1,
	input load_tag0,
	input load_tag1,
	input load_data0,
	input load_data1,
	input load_lru,
	input data0_mux_sel,
	input data1_mux_sel,
	input data_mux_sel,
	input tag_mux_sel,
	input addr_mux_sel,
	
	output lc3b_word mem_rdata,
	input lc3b_word mem_wdata,
	input mem_bus pmem_rdata,
	output mem_bus pmem_wdata,
	input lc3b_word mem_address,
	output lc3b_word pmem_address,
	input lc3b_mem_wmask mem_byte_enable
);

logic [8:0] tag;
logic [2:0] index;
logic [3:0] offset;
lc3b_word address_out;
mem_bus data0_out;
mem_bus data1_out;
mem_bus data0_mux_out;
mem_bus data1_mux_out;
mem_bus ryte0_out;
mem_bus ryte1_out;
lc3b_offset9 tag0_out;
lc3b_offset9 tag_mux_out;
lc3b_offset9 tag1_out;
logic valid_tag0;
logic valid_tag1;
logic v0_out;
logic v1_out;
logic d0_out;
logic d1_out;

assign tag = mem_address[15:7];
assign index = mem_address[6:4];
assign offset = mem_address[3:0];
assign comp0 = valid_tag0 & v0_out;
assign comp1 = valid_tag1 & v1_out;
assign hit = comp0 | comp1;

array #(.width(128)) data0
(
	.clk,
	.load(load_data0),
	.index(index),
	.in(data0_mux_out),
	.out(data0_out)
);

array #(.width(128)) data1
(
	.clk,
	.load(load_data1),
	.index(index),
	.in(data1_mux_out),
	.out(data1_out)
);

array #(.width(9)) tag0
(
	.clk,
	.load(load_tag0),
	.index(index),
	.in(tag),
	.out(tag0_out)
);

array #(.width(9)) tag1
(
	.clk,
	.load(load_tag1),
	.index(index),
	.in(tag),
	.out(tag1_out)
);

array #(.width(1)) valid0
(
	.clk,
	.load(load_v0),
	.index(index),
	.in(v0_in),
	.out(v0_out)
);

array #(.width(1)) valid1
(
	.clk,
	.load(load_v1),
	.index(index),
	.in(v1_in),
	.out(v1_out)
);

array #(.width(1)) dirty0
(
	.clk,
	.load(load_d0),
	.index(index),
	.in(d0_in),
	.out(d0_out)
);

array #(.width(1)) dirty1
(
	.clk,
	.load(load_d1),
	.index(index),
	.in(d1_in),
	.out(d1_out)
);

array #(.width(1)) lru
(
	.clk,
	.load(load_lru),
	.index(index),
	.in(lru_in),
	.out(lru_out)
);

mux2 #(.width(128)) data0_mux
(
	.sel(data0_mux_sel),
	.a(ryte0_out),
	.b(pmem_rdata),
	.f(data0_mux_out)
);

mux2 #(.width(128)) data1_mux
(
	.sel(data1_mux_sel),
	.a(ryte1_out),
	.b(pmem_rdata),
	.f(data1_mux_out)
);

mux2 #(.width(128)) data_mux
(
	.sel(data_mux_sel),
	.a(data0_out),
	.b(data1_out),
	.f(pmem_wdata)
);

mux2 #(.width(9)) tag_mux
(
	.sel(tag_mux_sel),
	.a(tag0_out),
	.b(tag1_out),
	.f(tag_mux_out)
);

mux2 addr_mux
(
	.sel(addr_mux_sel),
	.a(mem_address),
	.b(address_out),
	.f(pmem_address)
);

mux2 #(.width(1)) dirty_mux
(
	.sel(lru_out),
	.a(d0_out),
	.b(d1_out),
	.f(d_out)
);

ryte_byte ryte0
(
	.in(data0_out),
	.out(ryte0_out),
	.mem_wdata(mem_wdata),
	.mem_byte_enable(mem_byte_enable),
	.offset(offset)
);

ryte_byte ryte1
(
	.in(data1_out),
	.out(ryte1_out),
	.mem_wdata(mem_wdata),
	.mem_byte_enable(mem_byte_enable),
	.offset(offset)
);

add_ress address
(
	.in(tag_mux_out),
	.index(index),
	.out(address_out)
);

our_data rdata_out
(
	.in(pmem_wdata),
	.offset(offset),
	.out(mem_rdata)
);

comp_tag comp_tag0
(
	.comp_a(tag0_out),
	.comp_b(tag),
	.out(valid_tag0)
);

comp_tag comp_tag1
(
	.comp_a(tag1_out),
	.comp_b(tag),
	.out(valid_tag1)
);
endmodule : cache_datapath