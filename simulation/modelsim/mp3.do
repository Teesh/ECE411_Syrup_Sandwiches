onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -height 15 -radix hexadecimal /mp3_tb/clk
add wave -noupdate -height 15 -radix hexadecimal -childformat {{{/mp3_tb/dut/regfile_reg/data[7]} -radix hexadecimal} {{/mp3_tb/dut/regfile_reg/data[6]} -radix hexadecimal} {{/mp3_tb/dut/regfile_reg/data[5]} -radix hexadecimal} {{/mp3_tb/dut/regfile_reg/data[4]} -radix hexadecimal} {{/mp3_tb/dut/regfile_reg/data[3]} -radix hexadecimal} {{/mp3_tb/dut/regfile_reg/data[2]} -radix hexadecimal} {{/mp3_tb/dut/regfile_reg/data[1]} -radix hexadecimal} {{/mp3_tb/dut/regfile_reg/data[0]} -radix hexadecimal}} -expand -subitemconfig {{/mp3_tb/dut/regfile_reg/data[7]} {-height 15 -radix hexadecimal} {/mp3_tb/dut/regfile_reg/data[6]} {-height 15 -radix hexadecimal} {/mp3_tb/dut/regfile_reg/data[5]} {-height 15 -radix hexadecimal} {/mp3_tb/dut/regfile_reg/data[4]} {-height 15 -radix hexadecimal} {/mp3_tb/dut/regfile_reg/data[3]} {-height 15 -radix hexadecimal} {/mp3_tb/dut/regfile_reg/data[2]} {-height 15 -radix hexadecimal} {/mp3_tb/dut/regfile_reg/data[1]} {-height 15 -radix hexadecimal} {/mp3_tb/dut/regfile_reg/data[0]} {-height 15 -radix hexadecimal}} /mp3_tb/dut/regfile_reg/data
add wave -noupdate -height 15 -radix hexadecimal -childformat {{{/mp3_tb/dut/if_id_pipe/PC_reg_out[15]} -radix hexadecimal} {{/mp3_tb/dut/if_id_pipe/PC_reg_out[14]} -radix hexadecimal} {{/mp3_tb/dut/if_id_pipe/PC_reg_out[13]} -radix hexadecimal} {{/mp3_tb/dut/if_id_pipe/PC_reg_out[12]} -radix hexadecimal} {{/mp3_tb/dut/if_id_pipe/PC_reg_out[11]} -radix hexadecimal} {{/mp3_tb/dut/if_id_pipe/PC_reg_out[10]} -radix hexadecimal} {{/mp3_tb/dut/if_id_pipe/PC_reg_out[9]} -radix hexadecimal} {{/mp3_tb/dut/if_id_pipe/PC_reg_out[8]} -radix hexadecimal} {{/mp3_tb/dut/if_id_pipe/PC_reg_out[7]} -radix hexadecimal} {{/mp3_tb/dut/if_id_pipe/PC_reg_out[6]} -radix hexadecimal} {{/mp3_tb/dut/if_id_pipe/PC_reg_out[5]} -radix hexadecimal} {{/mp3_tb/dut/if_id_pipe/PC_reg_out[4]} -radix hexadecimal} {{/mp3_tb/dut/if_id_pipe/PC_reg_out[3]} -radix hexadecimal} {{/mp3_tb/dut/if_id_pipe/PC_reg_out[2]} -radix hexadecimal} {{/mp3_tb/dut/if_id_pipe/PC_reg_out[1]} -radix hexadecimal} {{/mp3_tb/dut/if_id_pipe/PC_reg_out[0]} -radix hexadecimal}} -subitemconfig {{/mp3_tb/dut/if_id_pipe/PC_reg_out[15]} {-height 15 -radix hexadecimal} {/mp3_tb/dut/if_id_pipe/PC_reg_out[14]} {-height 15 -radix hexadecimal} {/mp3_tb/dut/if_id_pipe/PC_reg_out[13]} {-height 15 -radix hexadecimal} {/mp3_tb/dut/if_id_pipe/PC_reg_out[12]} {-height 15 -radix hexadecimal} {/mp3_tb/dut/if_id_pipe/PC_reg_out[11]} {-height 15 -radix hexadecimal} {/mp3_tb/dut/if_id_pipe/PC_reg_out[10]} {-height 15 -radix hexadecimal} {/mp3_tb/dut/if_id_pipe/PC_reg_out[9]} {-height 15 -radix hexadecimal} {/mp3_tb/dut/if_id_pipe/PC_reg_out[8]} {-height 15 -radix hexadecimal} {/mp3_tb/dut/if_id_pipe/PC_reg_out[7]} {-height 15 -radix hexadecimal} {/mp3_tb/dut/if_id_pipe/PC_reg_out[6]} {-height 15 -radix hexadecimal} {/mp3_tb/dut/if_id_pipe/PC_reg_out[5]} {-height 15 -radix hexadecimal} {/mp3_tb/dut/if_id_pipe/PC_reg_out[4]} {-height 15 -radix hexadecimal} {/mp3_tb/dut/if_id_pipe/PC_reg_out[3]} {-height 15 -radix hexadecimal} {/mp3_tb/dut/if_id_pipe/PC_reg_out[2]} {-height 15 -radix hexadecimal} {/mp3_tb/dut/if_id_pipe/PC_reg_out[1]} {-height 15 -radix hexadecimal} {/mp3_tb/dut/if_id_pipe/PC_reg_out[0]} {-height 15 -radix hexadecimal}} /mp3_tb/dut/if_id_pipe/PC_reg_out
add wave -noupdate -height 15 -radix hexadecimal /mp3_tb/dut/id_ex_pipe/PC_reg_out
add wave -noupdate -height 15 -radix hexadecimal /mp3_tb/dut/ex_mem_pipe/PC_reg_out
add wave -noupdate -height 15 -radix hexadecimal /mp3_tb/dut/mem_wb_pipe/PC_reg_out
add wave -noupdate -height 15 -radix hexadecimal /mp3_tb/dut/id_ex_pipe/cword_reg_out
add wave -noupdate -height 15 -radix hexadecimal /mp3_tb/dut/ex_mem_pipe/cword_reg_out
add wave -noupdate -height 15 -radix hexadecimal /mp3_tb/dut/mem_wb_pipe/cword_reg_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 302
configure wave -valuecolwidth 100
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
WaveRestoreZoom {199050 ps} {199924 ps}
