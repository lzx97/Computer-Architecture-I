`timescale 1ns/10ps

module cpu_pipelined(clk, rst, reg_out, pc_out, instr, instr_out, muxbranchout, adder0out, addr_EX_MEM,
            RD1_ID_EX, RD2_ID_EX, se_ID_EX, ReadData1, ReadData2, muxreg2out, ForwardA, ForwardB, aluout,
            ALUresult_EX_MEM, ALUresult_MEM_WB, muxmemout, muxaluout);
    input clk, rst;
    output [31:0][63:0] reg_out;
    output [63:0] pc_out, muxbranchout, adder0out, addr_EX_MEM, ALUresult_EX_MEM, ALUresult_MEM_WB, muxmemout;
    output [63:0] RD1_ID_EX, RD2_ID_EX, se_ID_EX, ReadData1, ReadData2, aluout, muxaluout;
    output [31:0] instr, instr_out;
    output [4:0] muxreg2out;
    output [1:0] ForwardA, ForwardB;

    // IF stage variables
    wire [63:0] pcaddr_IF_ID;
    wire [63:0] pc_out, adder0out, adder1out;
    // 32 bit instruction
    wire [31:0] instr, instr_out;
    // output of each muxs
    wire [63:0] muxbranchout;
    

    // ID stage variables
    wire [63:0] RD1_ID_EX, RD2_ID_EX, PCaddr_ID_EX, se_ID_EX;
    wire [4:0] Rn_ID_EX, Rm_ID_EX, Rd_ID_EX;
    wire [5:0] EX_ID_EX;
    wire [4:0] M_ID_EX;
    wire [1:0] WB_ID_EX;

    wire [63:0] ReadData1, ReadData2, se_out;
    
    wire [13:0] control;
    

    wire [4:0] muxreg2out;


    // EX stage variables
    wire zero_alu, negative_alu, overflow_alu, carryout_alu;
    wire zero_flag, negative_flag, overflow_flag, carryout_flag;
    wire cbzandout, xorout, bltandout, muxbrsel, ucborout;

    wire [63:0] aluout, sl2out;

    wire [63:0] forward1out, forward2out, muxaluout;
    wire [1:0] ForwardA, ForwardB;

    
    // MEM stage variables
    wire [63:0] ALUresult_EX_MEM, WriteData_EX_MEM, addr_EX_MEM;
    wire [4:0] Rd_EX_MEM;
    wire [4:0] M_EX_MEM;
    wire [1:0] WB_EX_MEM;

    wire [63:0] memout;

    wire zero_alu_EX_MEM, negative_alu_EX_MEM, overflow_alu_EX_MEM, carryout_alu_EX_MEM;
    wire zero_flag_EX_MEM, negative_flag_EX_MEM, overflow_flag_EX_MEM, carryout_flag_EX_MEM;


    // WB stage variables
    wire [63:0] memout_MEM_WB, ALUresult_MEM_WB; 
    wire [4:0] Rd_MEM_WB;
    wire [1:0] WB_MEM_WB;
    wire [63:0] muxmemout;
    

    


    /* ---- IF stage ---- */
    

    pc programcounter ( .addr_out(pc_out), 
                        .addr_in(muxbranchout), 
                        .enable(1'b1),  // always enable
                        .clk, 
                        .rst
    );

    // program counter increment
    alu adder0 (        .A(pc_out), 
                        .B(64'h4), 
                        .cntrl(3'b010), 
                        .result(adder0out), 
                        .negative(), 
                        .zero(), 
                        .overflow(), 
                        .carry_out(), 
                        .shiftdir(1'bx)
    );

    instructmem im (    .address(pc_out), 
                        .instruction(instr), 
                        .clk
    );

    /* ---- IF stage ---- */

    

    IF_ID ifid (        .instr_out, 
                        .pcaddr_out(pcaddr_IF_ID),
                        .instr, 
                        .pcaddr(pc_out),
                        .enable(1'b1), 
                        .clk, 
                        .rst
    );

    /* ---- ID stage ---- */

    
    // Reg2Loc mux 
    mux5x2_1 reg2 (     .out(muxreg2out), 
                        .w0(instr_out[20:16]), 
                        .w1(instr_out[4:0]), 
                        .sel(control[0]) // Reg2Loc
    );

    regfile rf (        .ReadData1, 
                        .ReadData2, 
                        .reg_out, 
                        .WriteData(muxmemout), 
                        .ReadRegister1(instr_out[9:5]), 
                        .ReadRegister2(muxreg2out), 
                        .WriteRegister(Rd_MEM_WB), 
                        .RegWrite(WB_MEM_WB[1]), // RegWrite
                        .clk
    );

    wire [63:0] readwritemux1, readwritemux2;
    wire readwrite1, readwrite2;

    mux64x2_1 muxmux1 (.out(readwritemux1), .w0(ReadData1), .w1(muxmemout), .sel(readwrite1));
    mux64x2_1 muxmux2 (.out(readwritemux2), .w0(ReadData2), .w1(muxmemout), .sel(readwrite2));

    readwrite wr (      .readwrite1, 
                        .readwrite2, 
                        .Rd_MEM_WB, 
                        .Rn(instr_out[9:5]), 
                        .Rm(instr_out[20:16])
    );

    signextend se (.instr(instr_out), .result(se_out));

    // control [1:6]   --> EX
    // control [7:11]  --> M
    // control [12:13] --> WB
    controlunit ctrl (.Reg2Loc       (control[0]), 
                         .UBranch       (control[9]), 
                         .Branch        (control[10]), 
                         .MemRead       (control[7]), 
                         .MemtoReg      (control[12]), 
                         .ALUOp         (control[3:1]), 
                         .MemWrite      (control[8]), 
                         .ALUsrc        (control[4]), 
                         .RegWrite      (control[13]), 
                         .ShiftDir      (control[5]), 
						 .FlagEn        (control[6]),
						 .Brsel         (control[11]),
                         .opcode        (instr_out[31:21])
    );

    /* ---- ID stage ---- */

    

    ID_EX idex (        .RD1_out(RD1_ID_EX), 
                        .RD2_out(RD2_ID_EX), 
                        .PCaddr_out(PCaddr_ID_EX),
                        .se_o(se_ID_EX),
                        .Rn_out(Rn_ID_EX), 
                        .Rm_out(Rm_ID_EX), 
                        .Rd_out(Rd_ID_EX), 
                        .cntrl_EX_out(EX_ID_EX), 
                        .cntrl_M_out(M_ID_EX), 
                        .cntrl_WB_out(WB_ID_EX), 
				        .ReadData1(readwritemux1), 
                        .ReadData2(readwritemux2), 
                        .PCaddr(pcaddr_IF_ID), 
                        .se(se_out), 
                        .Rn(instr_out[9:5]), 
                        .Rm(instr_out[20:16]), 
                        .Rd(instr_out[4:0]), 
                        .cntrl_EX(control[6:1]), 
                        .cntrl_M(control[11:7]), 
                        .cntrl_WB(control[13:12]),
                        .enable(1'b1),
                        .clk,
                        .rst
    );

    /* ---- EX stage ---- */

    
    mux64x4_1 forwardmux1 (.out(forward1out), .w0(RD1_ID_EX), .w1(muxmemout), .w2(ALUresult_EX_MEM), .w3(64'bx), .sel(ForwardA)); 
    mux64x4_1 forwardmux2 (.out(forward2out), .w0(RD2_ID_EX), .w1(muxmemout), .w2(ALUresult_EX_MEM), .w3(64'bx), .sel(ForwardB)); 

    mux64x2_1 alumux (.out(muxaluout), .w0(forward2out), .w1(se_ID_EX), .sel(EX_ID_EX[3]));
    alu thealu (    .A(forward1out), 
                    .B(muxaluout), 
                    .cntrl(EX_ID_EX[2:0]), // ALUOp
                    .result(aluout), 
                    .negative(negative_alu), 
                    .zero(zero_alu), 
                    .overflow(overflow_alu), 
                    .carry_out(carry_alu), 
                    .shiftdir(EX_ID_EX[4]) // ShiftDir
    );

    flagReg	fr (	.flag_out({negative_flag, zero_flag, overflow_flag, carry__flag}), 
					.flag_in({negative_alu, zero_alu, overflow_alu, carry_out_alu}), 
					.enable(FlagEn), // set flags only on ADDS and SUBS
					.clk, 
					.rst
	); 

    // Branch addr calculation
    shiftleft2 sl2 (.out(sl2out), .in(se_ID_EX));
    alu adder1 (    .A(PCaddr_ID_EX), 
                    .B(sl2out), 
                    .cntrl(3'b010), 
                    .result(adder1out), 
                    .negative(), 
                    .zero(), 
                    .overflow(), 
                    .carry_out(), 
                    .shiftdir(1'bx)
    );

    /* ---- EX stage ---- */

    

    EX_MEM exmem (  .ALUresult_out(ALUresult_EX_MEM), 
                    .WriteData_out(WriteData_EX_MEM), 
                    .addr_out(addr_EX_MEM),
                    .Rd_out(Rd_EX_MEM), 
                    .WB_out(WB_EX_MEM), 
                    .M_out(M_EX_MEM),
                    .zero_alu_out(zero_alu_EX_MEM), 
                    .negative_alu_out(negative_alu_EX_MEM), 
                    .overflow_alu_out(overflow_flag_EX_MEM), 
                    .carryout_alu_out(carryout_alu_EX_MEM), 
                    .zero_flag_out(zero_flag_EX_MEM), 
                    .negative_flag_out(negative_flag_EX_MEM), 
                    .overflow_flag_out(overflow_flag_EX_MEM), 
                    .carryout_flag_out(carryout_flag_EX_MEM),
                    .ALUresult(aluout), 
                    .WriteData(forward2out), 
                    .addr(adder1out), 
                    .Rd(Rd_ID_EX), 
                    .WB(WB_ID_EX),
                    .M(M_ID_EX),
                    .zero_alu, 
                    .negative_alu, 
                    .overflow_alu, 
                    .carryout_alu, 
                    .zero_flag, 
                    .negative_flag, 
                    .overflow_flag, 
                    .carryout_flag,
                    .enable(1'b1),
                    .clk,
                    .rst
    );

    /* ---- MEM stage ---- */ 
    
    

    datamem dm (    .address(ALUresult_EX_MEM),
	                .write_enable(M_EX_MEM[1]), // MemWrite
	                .read_enable(M_EX_MEM[0]), //  MemRead
	                .write_data(WriteData_EX_MEM),
	                .clk,
	                .xfer_size(4'd8),
	                .read_data(memout)
	);

    
    /* Branch control */
    // Branch control for CBZ
    and cbzand (cbzandout, M_EX_MEM[3], zero_alu_EX_MEM); // M_EX_MEM[3] == Branch
    
    // Branch control for BLT
    xor bltxor (xorout, negative_flag_EX_MEM, overflow_flag_EX_MEM);
    and bltand (bltandout, M_EX_MEM[3], xorout); // 
	
    // Branch control for CBZ, BLT, and Unconditional Branch
	mux2_1 brselmux (.out(muxbrsel), .w0(cbzandout), .w1(bltandout), .sel(M_EX_MEM[4])); // M_EX_MEM[4] == brsel
    or ucdor (ucborout, muxbrsel, M_EX_MEM[2]); // M_EX_MEM[2] == UBranch



    /* ---- MEM stage ---- */ 

    

     MEM_WB memwb (     .Mem_out(memout_MEM_WB), 
                        .ALUresult_out(ALUresult_MEM_WB), 
                        .Rd_out(Rd_MEM_WB), 
                        .WB_out(WB_MEM_WB), 
                        .Mem(memout), 
                        .ALUresult(ALUresult_EX_MEM), 
                        .Rd(Rd_EX_MEM), 
                        .WB(WB_EX_MEM),
                        .enable(1'b1),
                        .clk,
                        .rst
    );

    /* ---- WB stage ---- */ 

    
    mux64x2_1 memmux (.out(muxmemout), .w0(ALUresult_MEM_WB), .w1(memout_MEM_WB), .sel(WB_MEM_WB[0])); // WB_MEM_WB[0] == MemtoReg

    /* ---- WB stage ---- */ 

    mux64x2_1 branchmux (
                        .out(muxbranchout), 
                        .w0(adder0out), 
                        .w1(addr_EX_MEM),
                        .sel(1'b0)
    );

    forwarding fwd (.ForwardA, 
                    .ForwardB, 
                    .Rn(Rn_ID_EX), 
                    .Rm(Rm_ID_EX), 
                    .Rd_EX_MEM(Rd_EX_MEM), 
                    .Rd_MEM_WB(Rd_MEM_WB), 
                    .EX_MEM_RegWrite(WB_EX_MEM[1]), 
                    .MEM_WB_RegWrite(WB_MEM_WB[1])
    );


endmodule 


module cpu_pipelined_testbench;

    parameter ClockDelay = 5000;

    logic clk, rst;
    logic [31:0][63:0] reg_out;
    logic [63:0] pc_out, muxbranchout, adder0out, addr_EX_MEM, ALUresult_EX_MEM, ALUresult_MEM_WB, muxmemout;
    logic [63:0] RD1_ID_EX, RD2_ID_EX, se_ID_EX, ReadData1, ReadData2, aluout, muxaluout;
    logic [31:0] instr, instr_out; 
    logic [4:0] muxreg2out;
    logic [1:0] ForwardA, ForwardB;
	// logic negative, zero, overflow, carry_out;

    cpu_pipelined dut (clk, rst, reg_out, pc_out, instr, instr_out, muxbranchout, adder0out, addr_EX_MEM, RD1_ID_EX, RD2_ID_EX, se_ID_EX, ReadData1, ReadData2, muxreg2out,
        ForwardA, ForwardB, aluout, ALUresult_EX_MEM, ALUresult_MEM_WB, muxmemout, muxaluout);

    initial begin // Set up the clock
		clk <= 0;
		forever #(ClockDelay/2) clk <= ~clk;
	end

    integer i;
    initial begin
        rst = 1; @(posedge clk);

        rst = 0;
        for (i = 0; i < 30; i++) begin
            @(posedge clk);
        end
        $stop;
    end
endmodule 
