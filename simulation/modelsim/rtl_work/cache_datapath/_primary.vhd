library verilog;
use verilog.vl_types.all;
entity cache_datapath is
    port(
        clk             : in     vl_logic;
        lru_out         : out    vl_logic;
        d_out           : out    vl_logic;
        lru_in          : in     vl_logic;
        d0_in           : in     vl_logic;
        d1_in           : in     vl_logic;
        v0_in           : in     vl_logic;
        v1_in           : in     vl_logic;
        hit             : out    vl_logic;
        comp0           : out    vl_logic;
        comp1           : out    vl_logic;
        load_v0         : in     vl_logic;
        load_v1         : in     vl_logic;
        load_d0         : in     vl_logic;
        load_d1         : in     vl_logic;
        load_tag0       : in     vl_logic;
        load_tag1       : in     vl_logic;
        load_data0      : in     vl_logic;
        load_data1      : in     vl_logic;
        load_lru        : in     vl_logic;
        data0_mux_sel   : in     vl_logic;
        data1_mux_sel   : in     vl_logic;
        data_mux_sel    : in     vl_logic;
        tag_mux_sel     : in     vl_logic;
        addr_mux_sel    : in     vl_logic;
        mem_rdata       : out    vl_logic_vector(15 downto 0);
        mem_wdata       : in     vl_logic_vector(15 downto 0);
        pmem_rdata      : in     vl_logic_vector(127 downto 0);
        pmem_wdata      : out    vl_logic_vector(127 downto 0);
        mem_address     : in     vl_logic_vector(15 downto 0);
        pmem_address    : out    vl_logic_vector(15 downto 0);
        mem_byte_enable : in     vl_logic_vector(1 downto 0)
    );
end cache_datapath;
