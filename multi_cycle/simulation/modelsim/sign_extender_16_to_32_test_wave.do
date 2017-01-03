onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /sign_extender_16_to_32/data_in
add wave -noupdate /sign_extender_16_to_32/data_out
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
wave create -driver freeze -pattern repeater -initialvalue 0000000000000001 -period 500ns -sequence { 0000000000000001 1000000000000001  } -repeat never -range 15 0 -starttime 0ns -endtime 1000ns sim:/sign_extender_16_to_32/data_in 
WaveExpandAll -1
WaveCollapseAll -1
wave clipboard restore
