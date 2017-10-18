import lc3b_types::*;

module cache
(
	input clk,
	input pmem_resp,
	output logic pmem_read,
	output logic pmem_write,
	output lc3b_word pmem_address,
	input mem_bus pmem_rdata,
	output mem_bus pmem_wdata,
	output logic mem_resp,
	output lc3b_word mem_rdata,
	input logic mem_read,
	input logic mem_write,
	input lc3b_mem_wmask mem_byte_enable,
	input lc3b_word mem_address,
	input lc3b_word mem_wdata
);

logic lru_out;
logic d_out;
logic lru_in;
logic d0_in;
logic d1_in;
logic v0_in;
logic v1_in;
logic hit;
logic comp0;
logic comp1;
logic load_v0;
logic load_v1;
logic load_d0;
logic load_d1;
logic load_tag0;
logic load_tag1;
logic load_data0;
logic load_data1;
logic load_lru;
logic data0_mux_sel;
logic data1_mux_sel;
logic data_mux_sel;
logic tag_mux_sel;
logic addr_mux_sel;

cache_control control
(
	.clk,
	.pmem_resp(pmem_resp),
	.mem_resp(mem_resp),
	.mem_read(mem_read),
	.mem_write(mem_write),
	.pmem_read(pmem_read),
	.pmem_write(pmem_write),
	
	.lru_out(lru_out),
	.d_out(d_out),
	.lru_in(lru_in),
	.d0_in(d0_in),
	.d1_in(d1_in),
	.v0_in(v0_in),
	.v1_in(v1_in),
	.hit(hit),
	.comp0(comp0),
	.comp1(comp1),
	.load_v0(load_v0),
	.load_v1(load_v1),
	.load_d0(load_d0),
	.load_d1(load_d1),
	.load_tag0(load_tag0),
	.load_tag1(load_tag1),
	.load_data0(load_data0),
	.load_data1(load_data1),
	.load_lru(load_lru),
	.data0_mux_sel(data0_mux_sel),
	.data1_mux_sel(data1_mux_sel),
	.data_mux_sel(data_mux_sel),
	.tag_mux_sel(tag_mux_sel),
	.addr_mux_sel(addr_mux_sel)
);

cache_datapath datapath
(
	.clk,
	.lru_out(lru_out),
	.d_out(d_out),
	.lru_in(lru_in),
	.d0_in(d0_in),
	.d1_in(d1_in),
	.v0_in(v0_in),
	.v1_in(v1_in),
	.hit(hit),
	.comp0(comp0),
	.comp1(comp1),
	.load_v0(load_v0),
	.load_v1(load_v1),
	.load_d0(load_d0),
	.load_d1(load_d1),
	.load_tag0(load_tag0),
	.load_tag1(load_tag1),
	.load_data0(load_data0),
	.load_data1(load_data1),
	.load_lru(load_lru),
	.data0_mux_sel(data0_mux_sel),
	.data1_mux_sel(data1_mux_sel),
	.data_mux_sel(data_mux_sel),
	.tag_mux_sel(tag_mux_sel),
	.addr_mux_sel(addr_mux_sel),
	
	.mem_rdata(mem_rdata),
	.mem_wdata(mem_wdata),
	.pmem_rdata(pmem_rdata),
	.pmem_wdata(pmem_wdata),
	.mem_address(mem_address),
	.pmem_address(pmem_address),
	.mem_byte_enable(mem_byte_enable)
);

endmodule : cache