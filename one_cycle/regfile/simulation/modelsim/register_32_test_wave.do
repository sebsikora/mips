onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /register_32/data_in
add wave -noupdate /register_32/load
add wave -noupdate /register_32/clk
add wave -noupdate /register_32/data_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
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
wave create -driver freeze -pattern counter -startvalue 00000000000000000000000000000000 -endvalue 11111111111111111111111111111111 -type Range -direction Up -period 100ns -step 1 -repeat never -range 31 0 -starttime 0ns -endtime 1000ns sim:/register_32/data_in 
WaveExpandAll -1
wave create -driver freeze -pattern constant -value 0 -starttime 0ns -endtime 1000ns sim:/register_32/load 
wave create -driver freeze -pattern clock -initialvalue 0 -period 100ns -dutycycle 50 -starttime 0ns -endtime 1000ns sim:/register_32/clk 
WaveCollapseAll -1
wave clipboard restore
