onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /comparator_5_2/inputA
add wave -noupdate /comparator_5_2/inputB
add wave -noupdate /comparator_5_2/output
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
wave create -driver freeze -pattern counter -startvalue 00000 -endvalue 11111 -type Range -direction Up -period 250ns -step 1 -repeat never -range 4 0 -starttime 0ns -endtime 1000ns sim:/comparator_5_2/inputA 
WaveExpandAll -1
wave create -driver freeze -pattern constant -value 00010 -range 4 0 -starttime 0ns -endtime 1000ns sim:/comparator_5_2/inputB 
WaveExpandAll -1
WaveCollapseAll -1
wave clipboard restore
