transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+/home/bdamisc2/ece411/mp3 {/home/bdamisc2/ece411/mp3/lc3b_types.sv}
vlog -sv -work work +incdir+/home/bdamisc2/ece411/mp3 {/home/bdamisc2/ece411/mp3/plus2.sv}
vlog -sv -work work +incdir+/home/bdamisc2/ece411/mp3 {/home/bdamisc2/ece411/mp3/register.sv}
vlog -sv -work work +incdir+/home/bdamisc2/ece411/mp3 {/home/bdamisc2/ece411/mp3/adder.sv}
vlog -sv -work work +incdir+/home/bdamisc2/ece411/mp3 {/home/bdamisc2/ece411/mp3/mux2.sv}
vlog -sv -work work +incdir+/home/bdamisc2/ece411/mp3 {/home/bdamisc2/ece411/mp3/mux4.sv}
vlog -sv -work work +incdir+/home/bdamisc2/ece411/mp3 {/home/bdamisc2/ece411/mp3/shift_ext.sv}
vlog -sv -work work +incdir+/home/bdamisc2/ece411/mp3 {/home/bdamisc2/ece411/mp3/mux8.sv}
vlog -sv -work work +incdir+/home/bdamisc2/ece411/mp3 {/home/bdamisc2/ece411/mp3/ldb_shift.sv}
vlog -sv -work work +incdir+/home/bdamisc2/ece411/mp3 {/home/bdamisc2/ece411/mp3/stb_shift.sv}
vlog -sv -work work +incdir+/home/bdamisc2/ece411/mp3 {/home/bdamisc2/ece411/mp3/br_enable.sv}
vlog -sv -work work +incdir+/home/bdamisc2/ece411/mp3 {/home/bdamisc2/ece411/mp3/masturgate.sv}
vlog -sv -work work +incdir+/home/bdamisc2/ece411/mp3 {/home/bdamisc2/ece411/mp3/alu.sv}
vlog -sv -work work +incdir+/home/bdamisc2/ece411/mp3 {/home/bdamisc2/ece411/mp3/gencc.sv}
vlog -sv -work work +incdir+/home/bdamisc2/ece411/mp3 {/home/bdamisc2/ece411/mp3/regfile.sv}
vlog -sv -work work +incdir+/home/bdamisc2/ece411/mp3 {/home/bdamisc2/ece411/mp3/nzp_comp.sv}
vlog -sv -work work +incdir+/home/bdamisc2/ece411/mp3 {/home/bdamisc2/ece411/mp3/if_id.sv}
vlog -sv -work work +incdir+/home/bdamisc2/ece411/mp3 {/home/bdamisc2/ece411/mp3/id_ex.sv}
vlog -sv -work work +incdir+/home/bdamisc2/ece411/mp3 {/home/bdamisc2/ece411/mp3/ex_mem.sv}
vlog -sv -work work +incdir+/home/bdamisc2/ece411/mp3 {/home/bdamisc2/ece411/mp3/mem_wb.sv}
vlog -sv -work work +incdir+/home/bdamisc2/ece411/mp3 {/home/bdamisc2/ece411/mp3/control_rom.sv}
vlog -sv -work work +incdir+/home/bdamisc2/ece411/mp3 {/home/bdamisc2/ece411/mp3/cpu.sv}

vlog -sv -work work +incdir+/home/bdamisc2/ece411/mp3 {/home/bdamisc2/ece411/mp3/mp3_tb.sv}
vlog -sv -work work +incdir+/home/bdamisc2/ece411/mp3 {/home/bdamisc2/ece411/mp3/magic_dual_port.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L stratixiii_ver -L rtl_work -L work -voptargs="+acc"  mp3_tb

add wave *
view structure
view signals
run 200 ns
