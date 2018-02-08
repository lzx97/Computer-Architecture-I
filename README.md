This is the repository for lab codes for Computer Architecture course taken in University of Washington.

# __Lab 1 - ARM 64-bit Register File__

In this lab a 32 by 64 register file is constructed using Verilog. Within the 32 by 64 register file is an array of 32 different 64-bit registers. 
These registers are constructed from D flip-flops (positive edge-triggered). Register 31 is hardwired to always output the value zero, regardless of what may or may not be written to it.

# __Lab 2 - ARM 64-bit Arithmetic Logic Unit (ALU)__

In this lab a simple 64-bit ARM Arithmetic Logic Unit (ALU) is designed and implemented in Verilog. 
The ALU has 8 ports which are the two input ports A and B, the output port, ALU control, zero detect flag, overflow detect flag, negative detect flag, and the carryout flag.

The control for the ALU is shown in the table below

| ALU Control | Operation |
| ----------- | --------- |
| 000 | result = B |
| 010 | result = A + B |
| 011 | result = A - B |
| 100 | result = bitwise A & B |
| 101 | result = bitwise A | B |
| 110 | result = bitwise A XOR B |

# __Lab 3 - ARM 64-bit Single Cycle CPU__