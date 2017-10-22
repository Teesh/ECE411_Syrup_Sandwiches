library verilog;
use verilog.vl_types.all;
entity if_id is
    port(
        clk             : in     vl_logic;
        load            : in     vl_logic;
        PC_reg_in       : in     vl_logic_vector(15 downto 0);
        PC_reg_out      : out    vl_logic_vector(15 downto 0);
        I_rdata_in      : in     vl_logic_vector(15 downto 0);
        I_rdata_out     : out    vl_logic_vector(15 downto 0)
    );
end if_id;
