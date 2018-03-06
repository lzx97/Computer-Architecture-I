onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix decimal -childformat {{{/cpu_pipelined_testbench/reg_out[31]} -radix decimal} {{/cpu_pipelined_testbench/reg_out[30]} -radix decimal} {{/cpu_pipelined_testbench/reg_out[29]} -radix decimal} {{/cpu_pipelined_testbench/reg_out[28]} -radix decimal} {{/cpu_pipelined_testbench/reg_out[27]} -radix decimal} {{/cpu_pipelined_testbench/reg_out[26]} -radix decimal} {{/cpu_pipelined_testbench/reg_out[25]} -radix decimal} {{/cpu_pipelined_testbench/reg_out[24]} -radix decimal} {{/cpu_pipelined_testbench/reg_out[23]} -radix decimal} {{/cpu_pipelined_testbench/reg_out[22]} -radix decimal} {{/cpu_pipelined_testbench/reg_out[21]} -radix decimal} {{/cpu_pipelined_testbench/reg_out[20]} -radix decimal} {{/cpu_pipelined_testbench/reg_out[19]} -radix decimal} {{/cpu_pipelined_testbench/reg_out[18]} -radix decimal} {{/cpu_pipelined_testbench/reg_out[17]} -radix decimal} {{/cpu_pipelined_testbench/reg_out[16]} -radix decimal} {{/cpu_pipelined_testbench/reg_out[15]} -radix decimal} {{/cpu_pipelined_testbench/reg_out[14]} -radix decimal} {{/cpu_pipelined_testbench/reg_out[13]} -radix decimal} {{/cpu_pipelined_testbench/reg_out[12]} -radix decimal} {{/cpu_pipelined_testbench/reg_out[11]} -radix decimal} {{/cpu_pipelined_testbench/reg_out[10]} -radix decimal} {{/cpu_pipelined_testbench/reg_out[9]} -radix decimal} {{/cpu_pipelined_testbench/reg_out[8]} -radix decimal} {{/cpu_pipelined_testbench/reg_out[7]} -radix decimal} {{/cpu_pipelined_testbench/reg_out[6]} -radix decimal} {{/cpu_pipelined_testbench/reg_out[5]} -radix decimal} {{/cpu_pipelined_testbench/reg_out[4]} -radix decimal} {{/cpu_pipelined_testbench/reg_out[3]} -radix decimal} {{/cpu_pipelined_testbench/reg_out[2]} -radix decimal} {{/cpu_pipelined_testbench/reg_out[1]} -radix decimal} {{/cpu_pipelined_testbench/reg_out[0]} -radix decimal}} -subitemconfig {{/cpu_pipelined_testbench/reg_out[31]} {-height 15 -radix decimal} {/cpu_pipelined_testbench/reg_out[30]} {-height 15 -radix decimal} {/cpu_pipelined_testbench/reg_out[29]} {-height 15 -radix decimal} {/cpu_pipelined_testbench/reg_out[28]} {-height 15 -radix decimal} {/cpu_pipelined_testbench/reg_out[27]} {-height 15 -radix decimal} {/cpu_pipelined_testbench/reg_out[26]} {-height 15 -radix decimal} {/cpu_pipelined_testbench/reg_out[25]} {-height 15 -radix decimal} {/cpu_pipelined_testbench/reg_out[24]} {-height 15 -radix decimal} {/cpu_pipelined_testbench/reg_out[23]} {-height 15 -radix decimal} {/cpu_pipelined_testbench/reg_out[22]} {-height 15 -radix decimal} {/cpu_pipelined_testbench/reg_out[21]} {-height 15 -radix decimal} {/cpu_pipelined_testbench/reg_out[20]} {-height 15 -radix decimal} {/cpu_pipelined_testbench/reg_out[19]} {-height 15 -radix decimal} {/cpu_pipelined_testbench/reg_out[18]} {-height 15 -radix decimal} {/cpu_pipelined_testbench/reg_out[17]} {-height 15 -radix decimal} {/cpu_pipelined_testbench/reg_out[16]} {-height 15 -radix decimal} {/cpu_pipelined_testbench/reg_out[15]} {-height 15 -radix decimal} {/cpu_pipelined_testbench/reg_out[14]} {-height 15 -radix decimal} {/cpu_pipelined_testbench/reg_out[13]} {-height 15 -radix decimal} {/cpu_pipelined_testbench/reg_out[12]} {-height 15 -radix decimal} {/cpu_pipelined_testbench/reg_out[11]} {-height 15 -radix decimal} {/cpu_pipelined_testbench/reg_out[10]} {-height 15 -radix decimal} {/cpu_pipelined_testbench/reg_out[9]} {-height 15 -radix decimal} {/cpu_pipelined_testbench/reg_out[8]} {-height 15 -radix decimal} {/cpu_pipelined_testbench/reg_out[7]} {-height 15 -radix decimal} {/cpu_pipelined_testbench/reg_out[6]} {-height 15 -radix decimal} {/cpu_pipelined_testbench/reg_out[5]} {-height 15 -radix decimal} {/cpu_pipelined_testbench/reg_out[4]} {-height 15 -radix decimal} {/cpu_pipelined_testbench/reg_out[3]} {-height 15 -radix decimal} {/cpu_pipelined_testbench/reg_out[2]} {-height 15 -radix decimal} {/cpu_pipelined_testbench/reg_out[1]} {-height 15 -radix decimal} {/cpu_pipelined_testbench/reg_out[0]} {-height 15 -radix decimal}} /cpu_pipelined_testbench/reg_out
add wave -noupdate -radix decimal /cpu_pipelined_testbench/pc_out
add wave -noupdate -radix decimal /cpu_pipelined_testbench/muxbranchout
add wave -noupdate -radix decimal /cpu_pipelined_testbench/adder0out
add wave -noupdate -radix decimal /cpu_pipelined_testbench/addr_EX_MEM
add wave -noupdate -radix binary /cpu_pipelined_testbench/instr
add wave -noupdate /cpu_pipelined_testbench/instr_out
add wave -noupdate -radix decimal /cpu_pipelined_testbench/RD1_ID_EX
add wave -noupdate -radix decimal /cpu_pipelined_testbench/RD2_ID_EX
add wave -noupdate -radix decimal /cpu_pipelined_testbench/se_out
add wave -noupdate /cpu_pipelined_testbench/Rd_MEM_WB
add wave -noupdate -radix decimal /cpu_pipelined_testbench/forward1out
add wave -noupdate -radix decimal /cpu_pipelined_testbench/forward2out
add wave -noupdate -radix decimal /cpu_pipelined_testbench/adder1out
add wave -noupdate /cpu_pipelined_testbench/readwrite1
add wave -noupdate /cpu_pipelined_testbench/readwrite2
add wave -noupdate -radix decimal /cpu_pipelined_testbench/readwritemux1
add wave -noupdate -radix decimal /cpu_pipelined_testbench/readwritemux2
add wave -noupdate -radix decimal /cpu_pipelined_testbench/ReadData1
add wave -noupdate -radix decimal /cpu_pipelined_testbench/ReadData2
add wave -noupdate -radix decimal /cpu_pipelined_testbench/se_ID_EX
add wave -noupdate /cpu_pipelined_testbench/muxreg2out
add wave -noupdate /cpu_pipelined_testbench/ForwardA
add wave -noupdate /cpu_pipelined_testbench/ForwardB
add wave -noupdate -radix decimal /cpu_pipelined_testbench/aluout
add wave -noupdate -radix decimal /cpu_pipelined_testbench/ALUresult_EX_MEM
add wave -noupdate -radix decimal /cpu_pipelined_testbench/ALUresult_MEM_WB
add wave -noupdate -radix decimal /cpu_pipelined_testbench/muxmemout
add wave -noupdate -radix decimal /cpu_pipelined_testbench/muxaluout
add wave -noupdate -radix decimal /cpu_pipelined_testbench/memory
add wave -noupdate -radix decimal /cpu_pipelined_testbench/memout
add wave -noupdate -radix decimal /cpu_pipelined_testbench/memout_MEM_WB
add wave -noupdate /cpu_pipelined_testbench/ucborout
add wave -noupdate -radix decimal /cpu_pipelined_testbench/PCaddr_ID_EX
add wave -noupdate /cpu_pipelined_testbench/cbzandout
add wave -noupdate /cpu_pipelined_testbench/xorout
add wave -noupdate /cpu_pipelined_testbench/bltandout
add wave -noupdate /cpu_pipelined_testbench/muxbrsel
add wave -noupdate /cpu_pipelined_testbench/M_EX_MEM
add wave -noupdate /cpu_pipelined_testbench/M_ID_EX
add wave -noupdate /cpu_pipelined_testbench/EX_ID_EX
add wave -noupdate -radix decimal /cpu_pipelined_testbench/pcaddr_IF_ID
add wave -noupdate /cpu_pipelined_testbench/zero_alu
add wave -noupdate /cpu_pipelined_testbench/zero_alu_EX_MEM
add wave -noupdate /cpu_pipelined_testbench/zero_alu
add wave -noupdate /cpu_pipelined_testbench/negative_alu
add wave -noupdate /cpu_pipelined_testbench/overflow_alu
add wave -noupdate /cpu_pipelined_testbench/carry_alu
add wave -noupdate /cpu_pipelined_testbench/overflow_alu
add wave -noupdate /cpu_pipelined_testbench/zero_flag
add wave -noupdate /cpu_pipelined_testbench/negative_flag
add wave -noupdate /cpu_pipelined_testbench/overflow_flag
add wave -noupdate /cpu_pipelined_testbench/carry_flag
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {35401528 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 266
configure wave -valuecolwidth 201
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
WaveRestoreZoom {0 ps} {77149371 ps}
