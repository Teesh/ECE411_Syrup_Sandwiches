library verilog;
use verilog.vl_types.all;
entity masturgate is
    port(
        a               : in     vl_logic;
        b               : in     vl_logic;
        c               : in     vl_logic;
        d               : in     vl_logic;
        e               : in     vl_logic;
        load            : out    vl_logic
    );
end masturgate;
