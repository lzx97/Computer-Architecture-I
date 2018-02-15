/* Top level ARM Single Cycle CPU Module */

`timescale 1ns/10ps

module cpu(reg_out, negative, zero, overflow, carry_out, clk, rst);
    input clk, rst;
    output [31:0][63:0] reg_out; // content of registers
	output negative, zero, overflow, carry_out; // flags
	
	// wires for regfile
    wire [63:0] pc_out, seout, aluout, ReadData1, ReadData2, memout;
    wire [31:0] instr;

    // wires of muxes
    wire [4:0] muxreg2out;
    wire [63:0] muxaluout, muxmemout, muxbranchout;

    // wire for control unit
    wire Reg2Loc, UBranch, Branch, MemRead, MemtoReg, MemWrite, ALUsrc, RegWrite, ShiftDir, FlagEn, Brsel;
    wire [2:0] ALUOp;

    // output wires from alu
    wire negative_o, zero_o, overflow_o, carry_out_o;

    // wires for branching
    wire cbzandout, bltandout, xorout, ucborout, muxbrsel;
    wire [63:0] adder0out, adder1out;
    wire [63:0] sl2out;

    // program counter
    pc programcounter ( .addr_out(pc_out), 
                        .addr_in(muxbranchout), 
                        .enable(1'b1),  // always enable
                        .clk, 
                        .rst
    );

    // instruction memory
    instructmem im (    .address(pc_out), 
                        .instruction(instr), 
                        .clk
    );

    // Reg2Loc mux 
    mux5x2_1 reg2 (.out(muxreg2out), .w0(instr[20:16]), .w1(instr[4:0]), .sel(Reg2Loc));

    // register file
    regfile rf (        .ReadData1, 
                        .ReadData2, 
                        .reg_out, 
                        .WriteData(muxmemout), 
                        .ReadRegister1(instr[9:5]), 
                        .ReadRegister2(muxreg2out), 
                        .WriteRegister(instr[4:0]), 
                        .RegWrite(RegWrite),
                        .clk
    );

    // CPU control
    controlunit control (.Reg2Loc, 
                         .UBranch, 
                         .Branch, 
                         .MemRead, 
                         .MemtoReg, 
                         .ALUOp, 
                         .MemWrite, 
                         .ALUsrc, 
                         .RegWrite, 
                         .ShiftDir, 
						 .FlagEn,
						 .Brsel,
                         .opcode(instr[31:21])
    );

    // sign extend unit
    signextend se (.instr, .result(seout));

    mux64x2_1 alumux (.out(muxaluout), .w0(ReadData2), .w1(seout), .sel(ALUsrc));

    // Arithmetic Logic Unit
    alu aluuu (     .A(ReadData1), 
                    .B(muxaluout), 
                    .cntrl(ALUOp), 
                    .result(aluout), 
                    .negative(negative_o), 
                    .zero(zero_o), 
                    .overflow(overflow_o), 
                    .carry_out(carry_out_o), 
                    .shiftdir(ShiftDir)
    );
	
    // Registers to save the flags from cpu
	flagReg	fr (	.flag_out({negative, zero, overflow, carry_out}), 
					.flag_in({negative_o, zero_o, overflow_o, carry_out_o}), 
					.enable(FlagEn), // set flags only on ADDS and SUBS
					.clk, 
					.rst
	); 

    // data memory 
    datamem dm (    .address(aluout),
	                .write_enable(MemWrite),
	                .read_enable(MemRead),
	                .write_data(ReadData2),
	                .clk,
	                .xfer_size(4'd8),
	                .read_data(memout)
	);

    mux64x2_1 memmux (.out(muxmemout), .w0(aluout), .w1(memout), .sel(MemtoReg));

    /* Branch control */
    // Branch control for CBZ
    and cbzand (cbzandout, Branch, zero_o);
    
    // Branch control for BLT
    xor bltxor (xorout, negative, overflow);
    and bltand (bltandout, Branch, xorout);
	
    // Branch control for CBZ, BLT, and Unconditional Branch
	mux2_1 brselmux (.out(muxbrsel), .w0(cbzandout), .w1(bltandout), .sel(Brsel));
    or ucdor (ucborout, muxbrsel, UBranch);

    // program counter increment
    alu adder0 (    .A(pc_out), 
                    .B(64'h4), 
                    .cntrl(3'b010), 
                    .result(adder0out), 
                    .negative(), 
                    .zero(), 
                    .overflow(), 
                    .carry_out(), 
                    .shiftdir(1'bx)
    );

    // Branch address calculation
    shiftleft2 sl2 (.out(sl2out), .in(seout));
    alu adder1 (    .A(pc_out), 
                    .B(sl2out), 
                    .cntrl(3'b010), 
                    .result(adder1out), 
                    .negative(), 
                    .zero(), 
                    .overflow(), 
                    .carry_out(), 
                    .shiftdir(1'bx)
    );

    mux64x2_1 branchmux (.out(muxbranchout), .w0(adder0out), .w1(adder1out), .sel(ucborout));

endmodule 

module cpu_testbench;

    parameter ClockDelay = 5000;

    logic clk, rst;
    logic [31:0][63:0] reg_out;
	logic negative, zero, overflow, carry_out;

    cpu dut (reg_out, negative, zero, overflow, carry_out, clk, rst);

    initial begin // Set up the clock
		clk <= 0;
		forever #(ClockDelay/2) clk <= ~clk;
	end

    integer i;
    initial begin
        rst = 1; @(posedge clk);

        rst = 0;
        for (i = 0; i < 2000; i++) begin
            @(posedge clk);
        end
        $stop;
    end
endmodule 
