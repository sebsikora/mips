onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /traverse_latch/clr
add wave -noupdate /traverse_latch/data_in
add wave -noupdate /traverse_latch/clk
add wave -noupdate /traverse_latch/load
add wave -noupdate /traverse_latch/data_out
TreeUpdate [SetDefaultTree]
configure wave -namecolwidth 203
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
WaveRestoreZoom {78242 ps} {1048514 ps}
view wave 
wave clipboard store
wave create -driver freeze -pattern constant -value 0 -starttime 0ns -endtime 1000ns sim:/traverse_latch/clr 
wave create -driver freeze -pattern constant -value 1 -starttime 0ns -endtime 1000ns sim:/traverse_latch/data_in 
wave create -driver freeze -pattern clock -initialvalue 0 -period 200ns -dutycycle 50 -starttime 0ns -endtime 1000ns sim:/traverse_latch/clk 
wave create -driver freeze -pattern repeater -initialvalue 0 -period 200ns -sequence { 0 1 0 1  } -repeat forever -starttime 0ns -endtime 1000ns sim:/traverse_latch/load 
wave modify -driver freeze -pattern repeater -initialvalue 0 -period 200ns -sequence { 0 0 1 0 1  } -repeat never -starttime 0ns -endtime 1000ns Edit:/traverse_latch/clr 
wave modify -driver freeze -pattern constant -value 1 -starttime 0ns -endtime 1000ns Edit:/traverse_latch/load 
WaveCollapseAll -1
wave clipboard restore
