library verilog;
use verilog.vl_types.all;
entity mem_wb is
    port(
        clk             : in     vl_logic;
        load            : in     vl_logic;
        PC_reg_in       : in     vl_logic_vector(15 downto 0);
        ALU_reg_in      : in     vl_logic_vector(15 downto 0);
        cword_reg_in    : in     vl_logic_vector(15 downto 0);
        d_rdata_reg_in  : in     vl_logic_vector(15 downto 0);
        addr_reg_in     : in     vl_logic_vector(15 downto 0);
        ldb_shift_reg_in: in     vl_logic_vector(15 downto 0);
        dest_reg_in     : in     vl_logic_vector(2 downto 0);
        PC_reg_out      : out    vl_logic_vector(15 downto 0);
        ALU_reg_out     : out    vl_logic_vector(15 downto 0);
        cword_reg_out   : out    vl_logic_vector(15 downto 0);
        d_rdata_reg_out : out    vl_logic_vector(15 downto 0);
        addr_reg_out    : out    vl_logic_vector(15 downto 0);
        ldb_shift_reg_out: out    vl_logic_vector(15 downto 0);
        dest_reg_out    : out    vl_logic_vector(2 downto 0)
    );
end mem_wb;
