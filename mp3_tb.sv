module mp3_tb;

timeunit 1ns;
timeprecision 1ns;

logic clk;
logic pmem_resp;
logic pmem_read;
logic pmem_write;
logic [15:0] pmem_address;
logic [127:0] pmem_rdata;
logic [127:0] pmem_wdata;

/* Clock generator */
initial clk = 0;
always #5 clk = ~clk;

cpu dut
(
    .clk,
    .pmem_resp_a(pmem_resp_a),
    .pmem_rdata_a(pmem_rdata_a),
    .pmem_read_a(pmem_read_a),
    .pmem_write_a(pmem_write_a),
    .pmem_address_a(pmem_address_a),
    .pmem_wdata_a(pmem_wdata_a),

    .pmem_resp_b(pmem_resp_b),
    .pmem_rdata_b(pmem_rdata_b),
    .pmem_read_b(pmem_read_b),
    .pmem_write_b(pmem_write_b),
    .pmem_address_b(pmem_address_b),
    .pmem_wdata_b(pmem_wdata_b),
);

magic_memory_dp caches
(
   .clk,
	.read_a(pmem_read_a),
	.write_a(pmem_write_a),
	.wmask_a(),
	.address_a(pmem_address_a),
	.wdata_a(pmem_wdata_a),
	.resp_a(pmem_resp_a),
	.rdata_a(pmem_rdata_a),
	
	.read_b(pmem_read_b),
	.write_b(pmem_write_b),
	.wmask_b(),
	.address_b(pmem_address_b),
	.wdata_b(pmem_wdata_b),
	.resp_b(pmem_resp_b),
	.rdata_b(pmem_rdata_b)
	
);


endmodule : mp3_tb
