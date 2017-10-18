onerror {resume}
add list -hex -notrig -width 19 /mp3_tb/mem_wdata
add list -hex -notrig -width 19 /mp3_tb/mem_address
add list /mp3_tb/mem_write
add list -hex -notrig -width 19 /mp3_tb/mem_byte_enable
configure list -usestrobe 0
configure list -strobestart {0 ps} -strobeperiod {0 ps}
configure list -usesignaltrigger 1
configure list -delta all
configure list -signalnamewidth 0
configure list -datasetprefix 0
configure list -namelimit 5
