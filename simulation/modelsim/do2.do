onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -height 15 /mp3_tb/dut/pmem_resp
add wave -noupdate -height 15 /mp3_tb/dut/pmem_rdata
add wave -noupdate -height 15 /mp3_tb/dut/pmem_address
add wave -noupdate -height 15 /mp3_tb/dut/pmem_wdata
add wave -noupdate -height 15 /mp3_tb/dut/mp3_cpu/mem_resp
add wave -noupdate -height 15 /mp3_tb/dut/mp3_cpu/mem_rdata
add wave -noupdate -height 15 /mp3_tb/dut/mp3_cache/mem_rdata
add wave -noupdate -height 15 /mp3_tb/dut/mp3_cpu/mem_wdata
add wave -noupdate -height 15 /mp3_tb/dut/mp3_cache/mem_wdata
add wave -noupdate -height 15 /mp3_tb/dut/mp3_cache/mem_read
add wave -noupdate -height 15 /mp3_tb/dut/mp3_cache/mem_write
add wave -noupdate -height 15 -label MAR /mp3_tb/dut/mp3_cpu/datapath/MAR/data
add wave -noupdate -height 15 -label MDR /mp3_tb/dut/mp3_cpu/datapath/MDR/data
add wave -noupdate -height 15 -label IR /mp3_tb/dut/mp3_cpu/datapath/IR/data
add wave -noupdate -height 15 /mp3_tb/dut/mp3_cpu/control/state
add wave -noupdate -height 15 /mp3_tb/dut/mp3_cache/control/state
add wave -noupdate -height 15 /mp3_tb/dut/mp3_cache/mem_address
add wave -noupdate -height 15 -expand -subitemconfig {{/mp3_tb/dut/mp3_cpu/datapath/regfile_reg/data[7]} {-height 15} {/mp3_tb/dut/mp3_cpu/datapath/regfile_reg/data[6]} {-height 15} {/mp3_tb/dut/mp3_cpu/datapath/regfile_reg/data[5]} {-height 15} {/mp3_tb/dut/mp3_cpu/datapath/regfile_reg/data[4]} {-height 15} {/mp3_tb/dut/mp3_cpu/datapath/regfile_reg/data[3]} {-height 15} {/mp3_tb/dut/mp3_cpu/datapath/regfile_reg/data[2]} {-height 15} {/mp3_tb/dut/mp3_cpu/datapath/regfile_reg/data[1]} {-height 15} {/mp3_tb/dut/mp3_cpu/datapath/regfile_reg/data[0]} {-height 15}} /mp3_tb/dut/mp3_cpu/datapath/regfile_reg/data
add wave -noupdate -height 15 /mp3_tb/dut/mp3_cache/datapath/data0/load
add wave -noupdate -height 15 -expand -subitemconfig {{/mp3_tb/dut/mp3_cache/datapath/data0/data[7]} {-height 15} {/mp3_tb/dut/mp3_cache/datapath/data0/data[6]} {-height 15} {/mp3_tb/dut/mp3_cache/datapath/data0/data[5]} {-height 15} {/mp3_tb/dut/mp3_cache/datapath/data0/data[4]} {-height 15} {/mp3_tb/dut/mp3_cache/datapath/data0/data[3]} {-height 15} {/mp3_tb/dut/mp3_cache/datapath/data0/data[2]} {-height 15} {/mp3_tb/dut/mp3_cache/datapath/data0/data[1]} {-height 15} {/mp3_tb/dut/mp3_cache/datapath/data0/data[0]} {-height 15}} /mp3_tb/dut/mp3_cache/datapath/data0/data
add wave -noupdate -height 15 /mp3_tb/dut/mp3_cache/datapath/data1/load
add wave -noupdate -height 15 -expand -subitemconfig {{/mp3_tb/dut/mp3_cache/datapath/data1/data[7]} {-height 15} {/mp3_tb/dut/mp3_cache/datapath/data1/data[6]} {-height 15} {/mp3_tb/dut/mp3_cache/datapath/data1/data[5]} {-height 15} {/mp3_tb/dut/mp3_cache/datapath/data1/data[4]} {-height 15} {/mp3_tb/dut/mp3_cache/datapath/data1/data[3]} {-height 15} {/mp3_tb/dut/mp3_cache/datapath/data1/data[2]} {-height 15} {/mp3_tb/dut/mp3_cache/datapath/data1/data[1]} {-height 15} {/mp3_tb/dut/mp3_cache/datapath/data1/data[0]} {-height 15}} /mp3_tb/dut/mp3_cache/datapath/data1/data
add wave -noupdate -height 15 /mp3_tb/dut/mp3_cache/datapath/data_mux/f
add wave -noupdate -height 15 /mp3_tb/dut/mp3_cache/datapath/rdata_out/in
add wave -noupdate -height 15 /mp3_tb/dut/mp3_cache/datapath/rdata_out/offset
add wave -noupdate -height 15 /mp3_tb/dut/mp3_cache/datapath/rdata_out/out
add wave -noupdate -height 15 /mp3_tb/dut/mp3_cache/datapath/rdata_out/offset_word
add wave -noupdate -height 15 /mp3_tb/dut/mp3_cache/datapath/lru/data
add wave -noupdate -height 15 /mp3_tb/dut/mp3_cache/datapath/lru/load
add wave -noupdate -height 15 /mp3_tb/dut/mp3_cache/control/comp0
add wave -noupdate -height 15 /mp3_tb/dut/mp3_cache/control/comp1
add wave -noupdate -height 15 /mp3_tb/dut/mp3_cache/control/hit
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {251268 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 103
configure wave -valuecolwidth 198
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {141466 ps} {621382 ps}
