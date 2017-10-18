library verilog;
use verilog.vl_types.all;
entity nzp_comp is
    port(
        a               : in     vl_logic_vector(2 downto 0);
        b               : in     vl_logic_vector(2 downto 0);
        en              : out    vl_logic
    );
end nzp_comp;
