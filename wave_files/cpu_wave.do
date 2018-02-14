onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /cpu_testbench/ClockDelay
add wave -noupdate /cpu_testbench/clk
add wave -noupdate /cpu_testbench/rst
add wave -noupdate -radix decimal /cpu_testbench/reg_out
add wave -noupdate -radix decimal /cpu_testbench/pc_out
add wave -noupdate -radix decimal /cpu_testbench/adder0out
add wave -noupdate /cpu_testbench/instr
add wave -noupdate -radix decimal /cpu_testbench/seout
add wave -noupdate -radix decimal /cpu_testbench/aluout
add wave -noupdate -radix decimal /cpu_testbench/ReadData1
add wave -noupdate -radix decimal /cpu_testbench/ReadData2
add wave -noupdate -radix decimal /cpu_testbench/memout
add wave -noupdate -radix decimal /cpu_testbench/muxaluout
add wave -noupdate -radix decimal /cpu_testbench/muxmemout
add wave -noupdate -radix decimal /cpu_testbench/muxbranchout
add wave -noupdate /cpu_testbench/muxreg2out
add wave -noupdate /cpu_testbench/negative
add wave -noupdate /cpu_testbench/zero
add wave -noupdate /cpu_testbench/overflow
add wave -noupdate /cpu_testbench/carry_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {827205882 ps} 0}
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
WaveRestoreZoom {0 ps} {3937500 ns}
