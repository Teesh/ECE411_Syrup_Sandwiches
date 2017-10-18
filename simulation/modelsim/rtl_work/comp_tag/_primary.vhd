library verilog;
use verilog.vl_types.all;
entity comp_tag is
    port(
        comp_a          : in     vl_logic_vector(8 downto 0);
        comp_b          : in     vl_logic_vector(8 downto 0);
        \out\           : out    vl_logic_vector(15 downto 0)
    );
end comp_tag;
