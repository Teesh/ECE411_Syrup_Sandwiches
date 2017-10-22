library verilog;
use verilog.vl_types.all;
entity branch_enable is
    port(
        br_taken        : in     vl_logic;
        br_sel          : in     vl_logic_vector(1 downto 0);
        br_code         : in     vl_logic;
        pc_mux_sel      : out    vl_logic_vector(1 downto 0)
    );
end branch_enable;
