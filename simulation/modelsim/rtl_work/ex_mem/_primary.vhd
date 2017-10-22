library verilog;
use verilog.vl_types.all;
entity ex_mem is
    port(
        clk             : in     vl_logic;
        load            : in     vl_logic;
        PC_reg_in       : in     vl_logic_vector(15 downto 0);
        SR2_reg_in      : in     vl_logic_vector(15 downto 0);
        ALU_reg_in      : in     vl_logic_vector(15 downto 0);
        trapvect8_reg_in: in     vl_logic_vector(15 downto 0);
        cword_reg_in    : in     vl_logic_vector(15 downto 0);
        addr_reg_in     : in     vl_logic_vector(15 downto 0);
        dest_reg_in     : in     vl_logic_vector(2 downto 0);
        PC_reg_out      : out    vl_logic_vector(15 downto 0);
        SR2_reg_out     : out    vl_logic_vector(15 downto 0);
        ALU_reg_out     : out    vl_logic_vector(15 downto 0);
        trapvect8_reg_out: out    vl_logic_vector(15 downto 0);
        cword_reg_out   : out    vl_logic_vector(15 downto 0);
        addr_reg_out    : out    vl_logic_vector(15 downto 0);
        dest_reg_out    : out    vl_logic_vector(2 downto 0)
    );
end ex_mem;
