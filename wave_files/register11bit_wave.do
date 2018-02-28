onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /cpu_pipelined_testbench/clk
add wave -noupdate /cpu_pipelined_testbench/rst
add wave -noupdate /cpu_pipelined_testbench/reg_out
add wave -noupdate -radix decimal /cpu_pipelined_testbench/pc_out
add wave -noupdate /cpu_pipelined_testbench/instr
add wave -noupdate /cpu_pipelined_testbench/instr_out
add wave -noupdate -radix decimal /cpu_pipelined_testbench/muxbranchout
add wave -noupdate -radix decimal /cpu_pipelined_testbench/adder0out
add wave -noupdate -radix decimal /cpu_pipelined_testbench/addr_EX_MEM
add wave -noupdate /cpu_pipelined_testbench/RD1_ID_EX
add wave -noupdate /cpu_pipelined_testbench/RD2_ID_EX
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {17500000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 228
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
WaveRestoreZoom {0 ps} {160125 ns}
