library verilog;
use verilog.vl_types.all;
entity shift_ext is
    port(
        clk             : in     vl_logic;
        \in\            : in     vl_logic_vector(15 downto 0);
        adj6_out        : out    vl_logic_vector(15 downto 0);
        adj9_out        : out    vl_logic_vector(15 downto 0);
        adj11_out       : out    vl_logic_vector(15 downto 0);
        offset6_out     : out    vl_logic_vector(15 downto 0);
        trapvect8_out   : out    vl_logic_vector(15 downto 0);
        imm5_out        : out    vl_logic_vector(15 downto 0);
        imm4_out        : out    vl_logic_vector(15 downto 0)
    );
end shift_ext;
