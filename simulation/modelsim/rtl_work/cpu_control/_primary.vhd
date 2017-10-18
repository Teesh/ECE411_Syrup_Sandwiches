library verilog;
use verilog.vl_types.all;
library work;
entity cpu_control is
    port(
        clk             : in     vl_logic;
        opcode          : in     work.lc3b_types.lc3b_opcode;
        bit5            : in     vl_logic;
        bit11           : in     vl_logic;
        bit0            : in     vl_logic;
        branch_enable   : in     vl_logic;
        load_pc         : out    vl_logic;
        load_ir         : out    vl_logic;
        load_regfile    : out    vl_logic;
        aluop           : out    work.lc3b_types.lc3b_aluop;
        load_mar        : out    vl_logic;
        load_mdr        : out    vl_logic;
        load_cc         : out    vl_logic;
        pcmux_sel       : out    vl_logic_vector(1 downto 0);
        storemux_sel    : out    vl_logic;
        alumux_sel      : out    vl_logic_vector(1 downto 0);
        regfilemux_sel  : out    vl_logic_vector(1 downto 0);
        marmux_sel      : out    vl_logic;
        mdrmux_sel      : out    vl_logic;
        jmpmux_sel      : out    vl_logic;
        lea2mux_sel     : out    vl_logic;
        ldi_sel         : out    vl_logic;
        leamux_sel      : out    vl_logic;
        stb_en          : out    vl_logic;
        jssr_en         : out    vl_logic;
        trap_en         : out    vl_logic;
        mem_resp        : in     vl_logic;
        mem_read        : out    vl_logic;
        mem_write       : out    vl_logic;
        jssr_sel        : out    vl_logic;
        mem_byte_enable : out    vl_logic_vector(1 downto 0)
    );
end cpu_control;
