library verilog;
use verilog.vl_types.all;
entity id_ex is
    port(
        clk             : in     vl_logic;
        load            : in     vl_logic;
        PC_reg_in       : in     vl_logic_vector(15 downto 0);
        SR1_reg_in      : in     vl_logic_vector(15 downto 0);
        SR2_reg_in      : in     vl_logic_vector(15 downto 0);
        imm4_reg_in     : in     vl_logic_vector(15 downto 0);
        imm5_reg_in     : in     vl_logic_vector(15 downto 0);
        adj6_reg_in     : in     vl_logic_vector(15 downto 0);
        adj9_reg_in     : in     vl_logic_vector(15 downto 0);
        adj11_reg_in    : in     vl_logic_vector(15 downto 0);
        offset6_reg_in  : in     vl_logic_vector(15 downto 0);
        trapvect8_reg_in: in     vl_logic_vector(15 downto 0);
        cword_reg_in    : in     vl_logic_vector(15 downto 0);
        dest_reg_in     : in     vl_logic_vector(2 downto 0);
        PC_reg_out      : out    vl_logic_vector(15 downto 0);
        SR1_reg_out     : out    vl_logic_vector(15 downto 0);
        SR2_reg_out     : out    vl_logic_vector(15 downto 0);
        imm4_reg_out    : out    vl_logic_vector(15 downto 0);
        imm5_reg_out    : out    vl_logic_vector(15 downto 0);
        adj6_reg_out    : out    vl_logic_vector(15 downto 0);
        adj9_reg_out    : out    vl_logic_vector(15 downto 0);
        adj11_reg_out   : out    vl_logic_vector(15 downto 0);
        offset6_reg_out : out    vl_logic_vector(15 downto 0);
        trapvect8_reg_out: out    vl_logic_vector(15 downto 0);
        cword_reg_out   : out    vl_logic_vector(15 downto 0);
        dest_reg_out    : out    vl_logic_vector(2 downto 0)
    );
end id_ex;
