`timescale 1ns/10ps

module cpu(reg_out, clk, rst);
    input clk, rst;
    output [31:0][63:0] reg_out;

    wire [63:0] pc_out, seout, aluout, ReadData1, ReadData2, memout;
    wire [31:0] instr;

    // wire of muxes
    wire [4:0] muxreg2out;
    wire [63:0] muxaluout, muxmemout, muxbranchout;

    // wire from control unit
    wire Reg2Loc, UBranch, Branch, MemRead, MemtoReg, MemWrite, ALUsrc, RegWrite, ShiftDir;
    wire [2:0] ALUOp;

    // flags from alu
    wire negative, zero, overflow, carry_out;

    // Branch wires
    wire cbzandout, bltandout, xorout, ucborout;

    wire [63:0] adder0out, adder1out;
    wire [63:0] sl2out;

    pc programcounter ( .addr_out(pc_out), 
                        .addr_in(muxbranchout), 
                        .enable(1'b1), 
                        .clk, 
                        .rst
    );

    instructmem im (    .address(pc_out), 
                        .instruction(instr), 
                        .clk
    );

    mux5x2_1 reg2 (.out(muxreg2out), .w0(instr[20:16]), .w1(instr[4:0]), .sel(Reg2Loc));

    regfile rf (        .ReadData1, 
                        .ReadData2, 
                        .reg_out, 
                        .WriteData(), 
                        .ReadRegister1(instr[9:5]), 
                        .ReadRegister2(muxreg2out), 
                        .WriteRegister(instr[4:0]), 
                        .RegWrite(RegWrite), //To be
                        .clk
    );

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
                         .opcode(instr[31:21])
    );

    signextend se (.instr, .result(seout));

    mux64x2_1 alumux (.out(muxaluout), .w0(ReadData2), .w1(seout), .sel(ALUsrc));

    alu aluuu (     .A(ReadData1), 
                    .B(muxaluout), 
                    .cntrl(ALUOp), 
                    .result(aluout), 
                    .negative, 
                    .zero, 
                    .overflow, 
                    .carry_out, 
                    .shiftdir(ShiftDir)
    );

    datamem dm (    .address(aluout),
	                .write_enable(MemWrite),
	                .read_enable(MemRead),
	                .write_data(ReadData2),
	                .clk,
	                .xfer_size(4'b0),
	                .read_data(memout)
	);

    mux64x2_1 memmux (.out(muxmemout), .w0(aluout), .w1(memout), .sel(MemtoReg));

    // Branch control 
    and cbzand (cbzandout, Branch, zero);
    
    xor bltxor (xorout, negative, overflow);
    and bltand (bltandout, Branch, xorout);

    or ucdor (ucborout, cbzandout, bltandout, UBranch);


    alu adder0 (    .A(pc_out), 
                    .B(4), 
                    .cntrl(3'b010), 
                    .result(adder0out), 
                    .negative(), 
                    .zero(), 
                    .overflow(), 
                    .carry_out(), 
                    .shiftdir(1'bx)
    );

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

    parameter ClockDelay = 500000;

    logic clk, rst;
    logic [31:0][63:0] reg_out;

    cpu dut (reg_out, clk, rst);

    initial begin // Set up the clock
		clk <= 0;
		forever #(ClockDelay/2) clk <= ~clk;
	end

    initial begin
        rst = 1; @(posedge clk);

        rst = 0;
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        $stop;
    end
endmodule 
