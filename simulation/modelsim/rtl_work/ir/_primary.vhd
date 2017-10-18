library verilog;
use verilog.vl_types.all;
library work;
entity ir is
    port(
        clk             : in     vl_logic;
        load            : in     vl_logic;
        \in\            : in     vl_logic_vector(15 downto 0);
        jssr_en         : in     vl_logic;
        opcode          : out    work.lc3b_types.lc3b_opcode;
        dest            : out    vl_logic_vector(2 downto 0);
        src1            : out    vl_logic_vector(2 downto 0);
        src2            : out    vl_logic_vector(2 downto 0);
        offset6         : out    vl_logic_vector(15 downto 0);
        off6            : out    vl_logic_vector(15 downto 0);
        offset9         : out    vl_logic_vector(15 downto 0);
        offset11        : out    vl_logic_vector(15 downto 0);
        imm5            : out    vl_logic_vector(15 downto 0);
        imm4            : out    vl_logic_vector(15 downto 0);
        trap8           : out    vl_logic_vector(15 downto 0);
        bit5            : out    vl_logic;
        bit4            : out    vl_logic;
        bit11           : out    vl_logic;
        bit5l           : out    vl_logic;
        bit0            : out    vl_logic
    );
end ir;
