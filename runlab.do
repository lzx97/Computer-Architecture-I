# Create work library
vlib work

# Compile Verilog
#     All Verilog files that are part of this design should have
#     their own "vlog" line below.
vlog "./src/common/D_FF.sv"
vlog "./src/common/decoder2_4.sv"
vlog "./src/common/decoder3_8.sv"
vlog "./src/common/decoder5_32.sv"
vlog "./src/common/mux2_1.sv"
vlog "./src/common/mux4_1.sv"
vlog "./src/common/mux8_1.sv"
vlog "./src/common/mux16_1.sv"
vlog "./src/common/mux32_1.sv"
vlog "./src/regfile/mux64x32_1.sv"
vlog "./src/regfile/regfile.sv"
vlog "./src/regfile/register.sv"
vlog "./src/regfile/regstim.sv"
vlog "./src/alu/adder.sv"
vlog "./src/alu/adder_carryout.sv"
vlog "./src/alu/alu.sv"
vlog "./src/alu/ALU1bit.sv"
vlog "./src/alu/ALUtopbit.sv"
vlog "./src/alu/alustim.sv"
vlog "./src/alu/overflow_detection.sv"
vlog "./src/alu/zero_detection.sv"
vlog "./src/cpu_single/datamem.sv"
vlog "./src/cpu_single/instructmem.sv"
vlog "./src/cpu_single/math.sv"

# Call vsim to invoke simulator
#     Make sure the last item on the line is the name of the
#     testbench module you want to execute.
vsim -voptargs="+acc" -t 1ps -lib work instructmem_testbench;

# Source the wave do file
#     This should be the file that sets up the signal window for
#     the module you are testing.
do "./wave_files/instructmem_wave.do"

# Set the window types
view wave
view structure
view signals

# Run the simulation
run -all

# End
