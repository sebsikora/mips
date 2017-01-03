onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /traverse_latch_test/IF_ID_in
add wave -noupdate /traverse_latch_test/ID_EX_in
add wave -noupdate /traverse_latch_test/clk
add wave -noupdate /traverse_latch_test/IF_ID_output
add wave -noupdate /traverse_latch_test/ID_EX_output
add wave -noupdate /traverse_latch_test/EX_MEM_out
add wave -noupdate /traverse_latch_test/MEM_WB_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
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
WaveRestoreZoom {0 ps} {1260 ns}
view wave 
wave clipboard store
wave create -driver freeze -pattern repeater -initialvalue 1 -period 200ns -sequence { 1 1 1 1 1  } -repeat never -starttime 0ns -endtime 1000ns sim:/traverse_latch_test/IF_ID_in 
wave create -driver freeze -pattern constant -value 0 -starttime 0ns -endtime 1000ns sim:/traverse_latch_test/ID_EX_in 
wave create -driver freeze -pattern clock -initialvalue 0 -period 200ns -dutycycle 50 -starttime 0ns -endtime 1000ns sim:/traverse_latch_test/clk 
wave modify -driver freeze -pattern repeater -initialvalue 1 -period 200ns -sequence { 1 1 1 1 1 1  } -repeat never -starttime 0ns -endtime 1200ns Edit:/traverse_latch_test/IF_ID_in 
wave modify -driver freeze -pattern constant -value 0 -starttime 0ns -endtime 1200ns Edit:/traverse_latch_test/ID_EX_in 
wave modify -driver freeze -pattern clock -initialvalue 0 -period 200ns -dutycycle 50 -starttime 0ns -endtime 1200ns Edit:/traverse_latch_test/clk 
WaveCollapseAll -1
wave clipboard restore
