onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /mips_one_cycle/rst
add wave -noupdate /mips_one_cycle/clk
add wave -noupdate /mips_one_cycle/program_counter
add wave -noupdate /mips_one_cycle/ins_cache_output
add wave -noupdate /mips_one_cycle/data_cache_input
add wave -noupdate /mips_one_cycle/data_cache_output
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
wave create -driver freeze -pattern constant -value 1 -starttime 0ns -endtime 100ns sim:/mips_one_cycle/rst 
wave modify -driver freeze -pattern constant -value 0 -starttime 100ns -endtime 1000ns Edit:/mips_one_cycle/rst 
wave create -driver freeze -pattern clock -initialvalue 0 -period 100ns -dutycycle 50 -starttime 0ns -endtime 1000ns sim:/mips_one_cycle/clk 
WaveCollapseAll -1
wave clipboard restore
