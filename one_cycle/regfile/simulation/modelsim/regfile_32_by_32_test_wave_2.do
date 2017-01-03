onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /regfile_32_by_32/write_reg
add wave -noupdate /regfile_32_by_32/write_data
add wave -noupdate /regfile_32_by_32/clk
add wave -noupdate /regfile_32_by_32/read_reg_1
add wave -noupdate /regfile_32_by_32/read_reg_2
add wave -noupdate /regfile_32_by_32/read_data_1
add wave -noupdate /regfile_32_by_32/read_data_2
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 2} {0 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 121
configure wave -valuecolwidth 204
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
WaveRestoreZoom {0 ps} {6720 ns}
view wave 
wave clipboard store
wave create -driver freeze -pattern counter -startvalue 00000 -endvalue 11111 -type Range -direction Up -period 100ns -step 1 -repeat never -range 4 0 -starttime 0ns -endtime 3200ns sim:/regfile_32_by_32/write_reg 
WaveExpandAll -1
wave create -driver freeze -pattern counter -startvalue 00000000000000000000000000000000 -endvalue 11111111111111111111111111111111 -type Range -direction Up -period 100ns -step 1 -repeat never -range 31 0 -starttime 0ns -endtime 3200ns sim:/regfile_32_by_32/write_data 
WaveExpandAll -1
wave create -driver freeze -pattern clock -initialvalue 0 -period 100ns -dutycycle 50 -starttime 0ns -endtime 3200ns sim:/regfile_32_by_32/clk 
wave create -driver freeze -pattern counter -startvalue 00000 -endvalue 11111 -type Range -direction Up -period 100ns -step 1 -repeat never -range 4 0 -starttime 3200ns -endtime 6400ns sim:/regfile_32_by_32/read_reg_1 
WaveExpandAll -1
wave create -driver freeze -pattern counter -startvalue 00000 -endvalue 11111 -type Range -direction Up -period 100ns -step 1 -repeat never -range 4 0 -starttime 3200ns -endtime 6400ns sim:/regfile_32_by_32/read_reg_2 
WaveExpandAll -1
wave modify -driver freeze -pattern counter -startvalue 11111 -endvalue 00000 -type Range -direction Down -period 100ns -step 1 -repeat never -range 4 0 -starttime 3200ns -endtime 6400ns Edit:/regfile_32_by_32/read_reg_2 
wave modify -driver freeze -pattern clock -initialvalue 0 -period 100ns -dutycycle 50 -starttime 0ns -endtime 6400ns Edit:/regfile_32_by_32/clk 
WaveCollapseAll -1
wave clipboard restore
