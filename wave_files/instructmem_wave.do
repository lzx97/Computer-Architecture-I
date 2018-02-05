onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label addr /instructmem_testbench/address
add wave -noupdate -label clk /instructmem_testbench/clk
add wave -noupdate -label instruction /instructmem_testbench/instruction
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {435672794 ps} 0}
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
configure wave -timelineunits ns
update
WaveRestoreZoom {336656250 ps} {1009968750 ps}
