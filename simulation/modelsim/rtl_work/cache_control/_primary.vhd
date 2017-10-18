library verilog;
use verilog.vl_types.all;
entity cache_control is
    port(
        clk             : in     vl_logic;
        pmem_resp       : in     vl_logic;
        mem_resp        : out    vl_logic;
        mem_read        : in     vl_logic;
        mem_write       : in     vl_logic;
        pmem_read       : out    vl_logic;
        pmem_write      : out    vl_logic;
        lru_out         : in     vl_logic;
        d_out           : in     vl_logic;
        lru_in          : out    vl_logic;
        d0_in           : out    vl_logic;
        d1_in           : out    vl_logic;
        v0_in           : out    vl_logic;
        v1_in           : out    vl_logic;
        hit             : in     vl_logic;
        comp0           : in     vl_logic;
        comp1           : in     vl_logic;
        load_v0         : out    vl_logic;
        load_v1         : out    vl_logic;
        load_d0         : out    vl_logic;
        load_d1         : out    vl_logic;
        load_tag0       : out    vl_logic;
        load_tag1       : out    vl_logic;
        load_data0      : out    vl_logic;
        load_data1      : out    vl_logic;
        load_lru        : out    vl_logic;
        data0_mux_sel   : out    vl_logic;
        data1_mux_sel   : out    vl_logic;
        data_mux_sel    : out    vl_logic;
        tag_mux_sel     : out    vl_logic;
        addr_mux_sel    : out    vl_logic
    );
end cache_control;
