onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /cpu_testbench/clk
add wave -noupdate /cpu_testbench/rst
add wave -noupdate -radix decimal -childformat {{{/cpu_testbench/reg_out[31]} -radix decimal} {{/cpu_testbench/reg_out[30]} -radix decimal} {{/cpu_testbench/reg_out[29]} -radix decimal} {{/cpu_testbench/reg_out[28]} -radix decimal} {{/cpu_testbench/reg_out[27]} -radix decimal} {{/cpu_testbench/reg_out[26]} -radix decimal} {{/cpu_testbench/reg_out[25]} -radix decimal} {{/cpu_testbench/reg_out[24]} -radix decimal} {{/cpu_testbench/reg_out[23]} -radix decimal} {{/cpu_testbench/reg_out[22]} -radix decimal} {{/cpu_testbench/reg_out[21]} -radix decimal} {{/cpu_testbench/reg_out[20]} -radix decimal} {{/cpu_testbench/reg_out[19]} -radix decimal} {{/cpu_testbench/reg_out[18]} -radix decimal} {{/cpu_testbench/reg_out[17]} -radix decimal} {{/cpu_testbench/reg_out[16]} -radix decimal} {{/cpu_testbench/reg_out[15]} -radix decimal} {{/cpu_testbench/reg_out[14]} -radix decimal} {{/cpu_testbench/reg_out[13]} -radix decimal} {{/cpu_testbench/reg_out[12]} -radix decimal} {{/cpu_testbench/reg_out[11]} -radix decimal} {{/cpu_testbench/reg_out[10]} -radix decimal} {{/cpu_testbench/reg_out[9]} -radix decimal} {{/cpu_testbench/reg_out[8]} -radix decimal} {{/cpu_testbench/reg_out[7]} -radix decimal} {{/cpu_testbench/reg_out[6]} -radix decimal} {{/cpu_testbench/reg_out[5]} -radix decimal} {{/cpu_testbench/reg_out[4]} -radix decimal} {{/cpu_testbench/reg_out[3]} -radix decimal} {{/cpu_testbench/reg_out[2]} -radix decimal} {{/cpu_testbench/reg_out[1]} -radix decimal} {{/cpu_testbench/reg_out[0]} -radix decimal}} -expand -subitemconfig {{/cpu_testbench/reg_out[31]} {-radix decimal} {/cpu_testbench/reg_out[30]} {-radix decimal} {/cpu_testbench/reg_out[29]} {-radix decimal} {/cpu_testbench/reg_out[28]} {-radix decimal} {/cpu_testbench/reg_out[27]} {-radix decimal} {/cpu_testbench/reg_out[26]} {-radix decimal} {/cpu_testbench/reg_out[25]} {-radix decimal} {/cpu_testbench/reg_out[24]} {-radix decimal} {/cpu_testbench/reg_out[23]} {-radix decimal} {/cpu_testbench/reg_out[22]} {-radix decimal} {/cpu_testbench/reg_out[21]} {-radix decimal} {/cpu_testbench/reg_out[20]} {-radix decimal} {/cpu_testbench/reg_out[19]} {-radix decimal} {/cpu_testbench/reg_out[18]} {-radix decimal} {/cpu_testbench/reg_out[17]} {-radix decimal} {/cpu_testbench/reg_out[16]} {-radix decimal} {/cpu_testbench/reg_out[15]} {-radix decimal} {/cpu_testbench/reg_out[14]} {-radix decimal} {/cpu_testbench/reg_out[13]} {-radix decimal} {/cpu_testbench/reg_out[12]} {-radix decimal} {/cpu_testbench/reg_out[11]} {-radix decimal} {/cpu_testbench/reg_out[10]} {-radix decimal} {/cpu_testbench/reg_out[9]} {-radix decimal} {/cpu_testbench/reg_out[8]} {-radix decimal} {/cpu_testbench/reg_out[7]} {-radix decimal} {/cpu_testbench/reg_out[6]} {-radix decimal} {/cpu_testbench/reg_out[5]} {-radix decimal} {/cpu_testbench/reg_out[4]} {-radix decimal} {/cpu_testbench/reg_out[3]} {-radix decimal} {/cpu_testbench/reg_out[2]} {-radix decimal} {/cpu_testbench/reg_out[1]} {-radix decimal} {/cpu_testbench/reg_out[0]} {-radix decimal}} /cpu_testbench/reg_out
add wave -noupdate /cpu_testbench/negative
add wave -noupdate /cpu_testbench/zero
add wave -noupdate /cpu_testbench/overflow
add wave -noupdate /cpu_testbench/carry_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {86750000000 ps} 0}
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
WaveRestoreZoom {0 ps} {1050262500 ns}
