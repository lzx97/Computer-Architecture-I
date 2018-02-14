onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /controlunit_testbench/opcode
add wave -noupdate /controlunit_testbench/Reg2Loc
add wave -noupdate /controlunit_testbench/UBranch
add wave -noupdate /controlunit_testbench/Branch
add wave -noupdate /controlunit_testbench/MemRead
add wave -noupdate /controlunit_testbench/MemtoReg
add wave -noupdate /controlunit_testbench/ALUOp
add wave -noupdate /controlunit_testbench/MemWrite
add wave -noupdate /controlunit_testbench/ALUsrc
add wave -noupdate /controlunit_testbench/RegWrite
add wave -noupdate /controlunit_testbench/ShiftDir
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {5 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 214
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
WaveRestoreZoom {0 ps} {38 ps}
