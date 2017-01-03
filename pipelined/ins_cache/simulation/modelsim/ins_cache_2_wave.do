onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /ins_cache/wren
add wave -noupdate /ins_cache/address
add wave -noupdate /ins_cache/clock
add wave -noupdate /ins_cache/wren
add wave -noupdate /ins_cache/address
add wave -noupdate /ins_cache/clock
add wave -noupdate /ins_cache/data
add wave -noupdate /ins_cache/q
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {366721 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 215
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
WaveRestoreZoom {0 ps} {1102500 ps}
view wave 
wave clipboard store
wave create -driver freeze -pattern constant -value 0 -starttime 0ns -endtime 1000ns sim:/ins_cache/wren 
wave create -driver freeze -pattern counter -startvalue 0000000000 -endvalue 1111111111 -type Range -direction Up -period 100ns -step 1 -repeat never -range 9 0 -starttime 0 -endtime 1000 sim:/ins_cache/address 
WaveExpandAll -1
wave create -driver freeze -pattern clock -initialvalue 0 -period 100ns -dutycycle 50 -starttime 0ns -endtime 1000ns sim:/ins_cache/clock 
wave modify -driver freeze -pattern counter -startvalue 0000000000 -endvalue 1111111111 -type Range -direction Up -period 100ns -step 1 -repeat never -range 9 0 -starttime 0ns -endtime 1000ns Edit:/ins_cache/address 
WaveCollapseAll -1
wave clipboard restore
