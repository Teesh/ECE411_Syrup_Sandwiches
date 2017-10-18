library verilog;
use verilog.vl_types.all;
entity shift is
    port(
        \in\            : in     vl_logic_vector(15 downto 0);
        imm4            : in     vl_logic_vector(15 downto 0);
        bit5            : in     vl_logic;
        bit4            : in     vl_logic;
        \out\           : out    vl_logic_vector(15 downto 0)
    );
end shift;
