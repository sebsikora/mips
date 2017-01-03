onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /signed_32bit_add_subtract/ctrl_line
add wave -noupdate /signed_32bit_add_subtract/input_A
add wave -noupdate /signed_32bit_add_subtract/input_B
add wave -noupdate /signed_32bit_add_subtract/output
add wave -noupdate /signed_32bit_add_subtract/signed_overflow
add wave -noupdate /signed_32bit_add_subtract/unsigned_overflow
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
wave create -driver freeze -pattern repeater -initialvalue 00000000000000000000000000000000 -period 100ns -sequence { 00000000000000000000000000000000 00000000000000000000000010001000 11000000000000000000000000000000 00000000000000000111111111111111  } -repeat never -range 31 0 -starttime 0ns -endtime 1000ns sim:/signed_32bit_add_subtract/input_A 
WaveExpandAll -1
wave create -driver freeze -pattern repeater -initialvalue 00000000000000000000000000000000 -period 100ns -sequence { 00000000000000000000000000000001 00000000000000000000000010001000 10000000000000000000000000000000 00000000000000000000000000000001  } -repeat never -range 31 0 -starttime 0ns -endtime 1000ns sim:/signed_32bit_add_subtract/input_B 
WaveExpandAll -1
wave create -driver freeze -pattern constant -value 0 -starttime 0ns -endtime 1000ns sim:/signed_32bit_add_subtract/ctrl_line 
wave modify -driver freeze -pattern constant -value 0 -starttime 0ns -endtime 1000ns Edit:/signed_32bit_add_subtract/ctrl_line 
WaveCollapseAll -1
wave clipboard restore
