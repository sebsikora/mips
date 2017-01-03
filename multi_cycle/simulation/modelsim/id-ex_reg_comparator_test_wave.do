onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /register_id_ex_buffer/ni_reg_read_addr_1
add wave -noupdate /register_id_ex_buffer/ni_reg_read_addr_2
add wave -noupdate /register_id_ex_buffer/reg_haz_ind_in
add wave -noupdate /register_id_ex_buffer/reg_write_dest_1_in
add wave -noupdate /register_id_ex_buffer/reg_write_dest_2_in
add wave -noupdate /register_id_ex_buffer/load
add wave -noupdate /register_id_ex_buffer/clk
add wave -noupdate /register_id_ex_buffer/reg_haz_ind_out
add wave -noupdate /register_id_ex_buffer/reg_write_dest_1_out
add wave -noupdate /register_id_ex_buffer/reg_write_dest_2_out
TreeUpdate [SetDefaultTree]
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
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
WaveRestoreZoom {0 ps} {1050 ns}
view wave 
wave clipboard store
wave create -driver freeze -pattern repeater -initialvalue 00000 -period 250ns -sequence { 00000  } -repeat never -range 4 0 -starttime 0ns -endtime 1000ns sim:/register_id_ex_buffer/ni_reg_read_addr_1 
WaveExpandAll -1
wave create -driver freeze -pattern repeater -initialvalue 00000 -period 250ns -sequence { 00000  } -repeat never -range 4 0 -starttime 0ns -endtime 1000ns sim:/register_id_ex_buffer/ni_reg_read_addr_2 
WaveExpandAll -1
wave create -driver freeze -pattern constant -value 00 -range 1 0 -starttime 0ns -endtime 1000ns sim:/register_id_ex_buffer/reg_haz_ind_in 
WaveExpandAll -1
wave create -driver freeze -pattern counter -startvalue 00000 -endvalue 11111 -type Range -direction Up -period 250ns -step 1 -repeat never -range 4 0 -starttime 0ns -endtime 1000ns sim:/register_id_ex_buffer/reg_write_dest_1_in 
WaveExpandAll -1
wave create -driver freeze -pattern counter -startvalue 00000 -endvalue 11111 -type Range -direction Up -period 250ns -step 1 -repeat never -range 4 0 -starttime 0ns -endtime 1000ns sim:/register_id_ex_buffer/reg_write_dest_2_in 
WaveExpandAll -1
wave modify -driver freeze -pattern repeater -initialvalue 00000 -period 250ns -sequence { 00000 00000 00000 00010  } -repeat never -range 4 0 -starttime 0ns -endtime 1000ns Edit:/register_id_ex_buffer/ni_reg_read_addr_1 
wave modify -driver freeze -pattern repeater -initialvalue 00000 -period 250ns -sequence { 00000 00000 00001  } -repeat never -range 4 0 -starttime 0ns -endtime 1000ns Edit:/register_id_ex_buffer/ni_reg_read_addr_2 
wave modify -driver freeze -pattern repeater -initialvalue 00000 -period 250ns -sequence { 00000 00000 00001 00000  } -repeat never -range 4 0 -starttime 0ns -endtime 1000ns Edit:/register_id_ex_buffer/ni_reg_read_addr_2 
wave create -driver freeze -pattern constant -value 1 -starttime 0ns -endtime 1000ns sim:/register_id_ex_buffer/load 
wave create -driver freeze -pattern clock -initialvalue 0 -period 250ns -dutycycle 50 -starttime 0ns -endtime 1000ns sim:/register_id_ex_buffer/clk 
WaveCollapseAll -1
wave clipboard restore
