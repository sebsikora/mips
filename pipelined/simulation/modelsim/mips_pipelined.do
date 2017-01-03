onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /mips_pipelined/rst
add wave -noupdate /mips_pipelined/clk
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
WaveRestoreZoom {0 ps} {1931156 ps}
view wave 
wave clipboard store
wave create -driver freeze -pattern constant -value 0 -starttime 0ns -endtime 200ns sim:/mips_pipelined/rst 
wave modify -driver freeze -pattern constant -value 1 -starttime 200ns -endtime 3000ns Edit:/mips_pipelined/rst 
wave create -driver freeze -pattern clock -initialvalue 0 -period 200ns -dutycycle 50 -starttime 0ns -endtime 3000ns sim:/mips_pipelined/clk 
WaveCollapseAll -1
wave clipboard restore