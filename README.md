This is the repository for lab codes for Computer Architecture course taken in University of Washington.

# __Lab 1 - ARM 64-bit Register File__

In this lab a 32 by 64 register file is constructed using Verilog. Within the 32 by 64 register file is an array of 32 different 64-bit registers. 
These registers are constructed from D flip-flops (positive edge-triggered). Register 31 is hardwired to always output the value zero, regardless of what may or may not be written to it.

# __Lab 2 - ARM 64-bit Arithmetic Logic Unit (ALU)__

A simple 64-bit ARM Arithmetic Logic Unit (ALU) is designed and implemented in Verilog. 
The ALU has 8 ports which are the two input ports A and B, the output port, ALU control, zero detect flag, overflow detect flag, negative detect flag, and the carryout flag.

The control for the ALU is shown in the table below (shift and multiply functions were added for lab3).

| ALU Control | Operation |
| ----------- | --------- |
| 000 | result = B |
| 001 | result = A >> B[5:0] or A << B[5:0]|
| 010 | result = A + B |
| 011 | result = A - B |
| 100 | result = bitwise A & B |
| 101 | result = bitwise A \| B |
| 110 | result = bitwise A XOR B |
| 111 | result = A * B |

# __Lab 3 - ARM 64-bit Single Cycle CPU__

In this lab, a simple 64-bit ARM Single-Cycle CPU is designed and implemented. 
The CPU instruction set to be implemented are listed below:
* ADDI Rd, Rn, Imm12: Reg[Rd] = Reg[Rn] + ZeroExtend(Imm12).
* ADDS Rd, Rn, Rm: Reg[Rd] = Reg[Rn] + Reg[Rm]. Set flags.
* B Imm26: PC = PC + SignExtend(Imm26 << 2).
* B\.LT Imm19: If (flags.negative != flags.overflow) PC = PC + SignExtend(Imm19<<2).
* CBZ Rt, Imm19: If (Reg[Rt] == 0) PC = PC + SignExtend(Imm19<<2).
* LDUR Rt, [Rn, #Imm9]: Reg[Rt] = Mem[Reg[Rn] + SignExtend(Imm9)].
* LSL Rd, Rn, Shamt: Reg[Rd] = Reg[Rn] << Shamt
* LSR Rd, Rn, Shamt: Reg[Rd] = Reg[Rn] >> Shamt
* MUL Rd, Rn, Rm: Reg[Rd] = (Reg[Rn]*Reg[Rm])[63:0]
* STUR Rt, [Rn, #Imm9]: Mem[Reg[Rn] + SignExtend(Imm9)] = Reg[Rt].
* SUBS Rd, Rn, Rm: Reg[Rd] = Reg[Rn] - Reg[Rm]. Set flags.
