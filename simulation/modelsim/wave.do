onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -height 15 /mp3_tb/clk
add wave -noupdate -height 15 -subitemconfig {{/mp3_tb/dut/datapath_block/PC/data[15]} {-height 15} {/mp3_tb/dut/datapath_block/PC/data[14]} {-height 15} {/mp3_tb/dut/datapath_block/PC/data[13]} {-height 15} {/mp3_tb/dut/datapath_block/PC/data[12]} {-height 15} {/mp3_tb/dut/datapath_block/PC/data[11]} {-height 15} {/mp3_tb/dut/datapath_block/PC/data[10]} {-height 15} {/mp3_tb/dut/datapath_block/PC/data[9]} {-height 15} {/mp3_tb/dut/datapath_block/PC/data[8]} {-height 15} {/mp3_tb/dut/datapath_block/PC/data[7]} {-height 15} {/mp3_tb/dut/datapath_block/PC/data[6]} {-height 15} {/mp3_tb/dut/datapath_block/PC/data[5]} {-height 15} {/mp3_tb/dut/datapath_block/PC/data[4]} {-height 15} {/mp3_tb/dut/datapath_block/PC/data[3]} {-height 15} {/mp3_tb/dut/datapath_block/PC/data[2]} {-height 15} {/mp3_tb/dut/datapath_block/PC/data[1]} {-height 15} {/mp3_tb/dut/datapath_block/PC/data[0]} {-height 15}} /mp3_tb/dut/datapath_block/PC/data
add wave -noupdate -height 15 /mp3_tb/dut/control_block/opcode
add wave -noupdate -height 15 /mp3_tb/mem_resp
add wave -noupdate -height 15 /mp3_tb/mem_read
add wave -noupdate -height 15 /mp3_tb/mem_write
add wave -noupdate -height 15 /mp3_tb/mem_byte_enable
add wave -noupdate -height 15 /mp3_tb/mem_address
add wave -noupdate -height 15 /mp3_tb/mem_rdata
add wave -noupdate -height 15 /mp3_tb/mem_wdata
add wave -noupdate -height 15 /mp3_tb/dut/control_block/state
add wave -noupdate -height 15 /mp3_tb/dut/control_block/next_state
add wave -noupdate -height 15 -expand -subitemconfig {{/mp3_tb/dut/datapath_block/regfile_reg/data[7]} {-height 15} {/mp3_tb/dut/datapath_block/regfile_reg/data[6]} {-height 15} {/mp3_tb/dut/datapath_block/regfile_reg/data[5]} {-height 15} {/mp3_tb/dut/datapath_block/regfile_reg/data[4]} {-height 15} {/mp3_tb/dut/datapath_block/regfile_reg/data[3]} {-height 15} {/mp3_tb/dut/datapath_block/regfile_reg/data[2]} {-height 15} {/mp3_tb/dut/datapath_block/regfile_reg/data[1]} {-height 15} {/mp3_tb/dut/datapath_block/regfile_reg/data[0]} {-height 15}} /mp3_tb/dut/datapath_block/regfile_reg/data
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {463212 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 208
configure wave -valuecolwidth 46
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
WaveRestoreZoom {0 ps} {16399779 ps}
