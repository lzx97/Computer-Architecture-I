onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /regstim/ClockDelay
add wave -noupdate -radix hexadecimal /regstim/ReadData1
add wave -noupdate -radix hexadecimal /regstim/ReadData2
add wave -noupdate /regstim/ReadRegister1
add wave -noupdate /regstim/ReadRegister2
add wave -noupdate /regstim/RegWrite
add wave -noupdate /regstim/WriteData
add wave -noupdate /regstim/WriteRegister
add wave -noupdate /regstim/clk
add wave -noupdate /regstim/reg_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2055888689 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 143
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
WaveRestoreZoom {0 ps} {28628250 ns}
