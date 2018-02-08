onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /ALU1bit_testbench/a
add wave -noupdate /ALU1bit_testbench/b
add wave -noupdate /ALU1bit_testbench/carryin0
add wave -noupdate /ALU1bit_testbench/carryin1
add wave -noupdate /ALU1bit_testbench/carryout0
add wave -noupdate /ALU1bit_testbench/carryout1
add wave -noupdate /ALU1bit_testbench/andout
add wave -noupdate /ALU1bit_testbench/orout
add wave -noupdate /ALU1bit_testbench/xorout
add wave -noupdate /ALU1bit_testbench/addout
add wave -noupdate /ALU1bit_testbench/subout
add wave -noupdate /ALU1bit_testbench/passbout
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {135 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 357
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
WaveRestoreZoom {0 ps} {452 ps}
