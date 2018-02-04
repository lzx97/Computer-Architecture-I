onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /decoder3_8_testbench/w0
add wave -noupdate /decoder3_8_testbench/w1
add wave -noupdate /decoder3_8_testbench/w2
add wave -noupdate /decoder3_8_testbench/y0
add wave -noupdate /decoder3_8_testbench/y1
add wave -noupdate /decoder3_8_testbench/y2
add wave -noupdate /decoder3_8_testbench/y3
add wave -noupdate /decoder3_8_testbench/y4
add wave -noupdate /decoder3_8_testbench/y5
add wave -noupdate /decoder3_8_testbench/y6
add wave -noupdate /decoder3_8_testbench/y7
add wave -noupdate /decoder3_8_testbench/enable
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {66 ps} 0}
quietly wave cursor active 1
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
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {173 ps}
