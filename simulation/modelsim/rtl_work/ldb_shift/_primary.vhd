library verilog;
use verilog.vl_types.all;
entity ldb_shift is
    port(
        clk             : in     vl_logic;
        \in\            : in     vl_logic_vector(15 downto 0);
        \out\           : out    vl_logic_vector(15 downto 0)
    );
end ldb_shift;
