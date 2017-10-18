library verilog;
use verilog.vl_types.all;
library work;
entity cpu_datapath is
    port(
        clk             : in     vl_logic;
        mem_rdata       : in     vl_logic_vector(15 downto 0);
        load_pc         : in     vl_logic;
        load_ir         : in     vl_logic;
        load_regfile    : in     vl_logic;
        load_mar        : in     vl_logic;
        load_mdr        : in     vl_logic;
        jssr_sel        : in     vl_logic;
        load_cc         : in     vl_logic;
        pcmux_sel       : in     vl_logic_vector(1 downto 0);
        storemux_sel    : in     vl_logic;
        alumux_sel      : in     vl_logic_vector(1 downto 0);
        regfilemux_sel  : in     vl_logic_vector(1 downto 0);
        marmux_sel      : in     vl_logic;
        mdrmux_sel      : in     vl_logic;
        jmpmux_sel      : in     vl_logic;
        lea2mux_sel     : in     vl_logic;
        leamux_sel      : in     vl_logic;
        ldi_sel         : in     vl_logic;
        aluop           : in     work.lc3b_types.lc3b_aluop;
        jssr_en         : in     vl_logic;
        trap_en         : in     vl_logic;
        stb_en          : in     vl_logic;
        mem_address     : out    vl_logic_vector(15 downto 0);
        mem_wdata       : out    vl_logic_vector(15 downto 0);
        branch_enable   : out    vl_logic;
        bit5            : out    vl_logic;
        bit11           : out    vl_logic;
        bit0            : out    vl_logic;
        opcode          : out    work.lc3b_types.lc3b_opcode
    );
end cpu_datapath;
