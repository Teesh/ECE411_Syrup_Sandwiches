import lc3b_types::*;

module mp3
(
    input clk,
	 
	 input pmem_resp,
    input mem_bus pmem_rdata,
    output pmem_read,
    output pmem_write,
    output lc3b_word pmem_address,
    output mem_bus pmem_wdata
);

logic mem_resp;
lc3b_word mem_rdata;
logic mem_read;
logic mem_write;
lc3b_mem_wmask mem_byte_enable;
lc3b_word mem_address;
lc3b_word mem_wdata;

cpu mp3_cpu
(
	.clk,
	.mem_resp(mem_resp),
	.mem_rdata(mem_rdata),
	.mem_read(mem_read),
	.mem_write(mem_write),
	.mem_byte_enable(mem_byte_enable),
	.mem_address(mem_address),
	.mem_wdata(mem_wdata)
);

cache mp3_cache
(
	.clk,
	.pmem_resp(pmem_resp),
	.pmem_read(pmem_read),
	.pmem_write(pmem_write),
	.pmem_address(pmem_address),
	.pmem_rdata(pmem_rdata),
	.pmem_wdata(pmem_wdata),
	.mem_resp(mem_resp),
	.mem_rdata(mem_rdata),
	.mem_read(mem_read),
	.mem_write(mem_write),
	.mem_byte_enable(mem_byte_enable),
	.mem_address(mem_address),
	.mem_wdata(mem_wdata)
);

endmodule : mp3