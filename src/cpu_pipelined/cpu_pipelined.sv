module cpu_pipelined(clk, rst, reg_out);
    input clk, rst;
    output reg_out;

    

    

    


    /* ---- IF stage ---- */
    wire [63:0] pc_out, adder0out, adder1out
    // 32 bit instruction
    wire [31:0] instr, instr_out;
    // output of each muxs
    wire [63:0] muxbranchout
    
    mux64x2_1 branchmux (
                        .out(muxbranchout), 
                        .w0(adder0out), 
                        .w1(), // fix later 
                        .sel() // fix
    );

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

    wire [63:0] pcaddr_IF_ID;

    IF_ID ifid (        .instr_out, 
                        .pcaddr_out(pcaddr_IF_ID);
                        .instr, 
                        .pcaddr(pc_out);
                        .enable(), 
                        .clk, 
                        .rst
    );

    /* ---- ID stage ---- */

    wire [63:0] ReadData1, ReadData2, se_out
    
    wire [14:0] control, control_out;
    

    wire [63:0] muxreg2out, muxmemout

    // Reg2Loc mux 
    mux5x2_1 reg2 (     .out(muxreg2out), 
                        .w0(instr_out[20:16]), 
                        .w1(instr_out[4:0]), 
                        .sel() // fix
    );

    regfile rf (        .ReadData1, 
                        .ReadData2, 
                        .reg_out, 
                        .WriteData(muxmemout), 
                        .ReadRegister1(instr_out[9:5]), 
                        .ReadRegister2(muxreg2out), 
                        .WriteRegister(instr_out[4:0]), 
                        .RegWrite(), // fix
                        .clk
    );

    signextend se (.instr_out, .result(se_out));

    controlunit control (.Reg2Loc       (control[0]), 
                         .UBranch       (control[11]), 
                         .Branch        (control[12]), 
                         .MemRead       (control[9]), 
                         .MemtoReg      (control[14]), 
                         .ALUOp         (control[3:5]), 
                         .MemWrite      (control[10]), 
                         .ALUsrc        (control[6]), 
                         .RegWrite      (control[1]), 
                         .ShiftDir      (control[7]), 
						 .FlagEn        (control[8]),
						 .Brsel         (control[13]),
                         .IFFlush       (control[2])
                         .opcode        (instr_out[31:21])
    );

    mux15x2_1 contromux (
                        .out(control_out), 
                        .w0(14'b0), 
                        .w1(control), 
                        .sel // fix
    );

    /* ---- ID stage ---- */

    wire [63:0] RD1_ID_EX, RD2_ID_EX, PCaddr_ID_EX, se_ID_EX;
    wire [4:0] Rn_ID_EX, Rm_ID_EX, Rd_ID_EX;
    wire [5:0] EX_ID_EX;
    wire [4:0] M_ID_EX;
    wire WB_ID_EX;

    ID_EX idex (        .RD1_out(RD1_ID_EX), 
                        .RD2_out(RD2_ID_EX), 
                        .PCaddr_out(PCaddr_ID_EX),
                        .se_o(se_ID_EX),
                        .Rn_out(Rn_ID_EX), 
                        .Rm_out(Rm_ID_EX), 
                        .Rd_out(Rd_ID_EX), 
                        .cntrl_EX_out(EX_ID_EX), 
                        .cntrl_M_out(M_ID_EX), 
                        .cntrl_WB_out(M_ID_EX) 
				        .ReadData1, 
                        .ReadData2, 
                        .PCaddr(pcaddr_IF_ID), 
                        .se(se_out), 
                        .Rn(instr_out[9:5]), 
                        .Rm(instr_out[20:16]), 
                        .Rd(instr_out[4:0]), 
                        .cntrl_EX(control[3:8]), 
                        .cntrl_M(control[9:13]), 
                        .cntrl_WB(control[14])
    );

    /* ---- EX stage ---- */

    wire [63:0] aluout, sl2out;

    alu aluuu (     .A(), 
                    .B(), 
                    .cntrl(), // fix - from control
                    .result(aluout), 
                    .negative(negative_alu), 
                    .zero(zero_alu), 
                    .overflow(overflow_alu), 
                    .carry_out(carry_alu), 
                    .shiftdir() // fix - from control
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

    wire [63:0] ALUresult_EX_MEM, WriteData_EX_MEM, addr_EX_MEM
    wire [4:0] Rd_EX_MEM;
    wire [4:0] M_EX_MEM;
    wire WB_EX_MEM;

    wire zero_alu_EX_MEM, negative_alu_EX_MEM, overflow_alu_EX_MEM, carryout_alu_EX_MEM;
    wire zero_flag_EX_MEM, negative_flag_EX_MEM, overflow_flag_EX_MEM, carryout_flag_EX_MEM;

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
                    .WriteData(), //fix 
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
                    .carryout_flag 
    );

    /* ---- MEM stage ---- */ 
    
    wire [63:0] memout;

    datamem dm (    .address(ALUresult_EX_MEM),
	                .write_enable(), // fix - from control
	                .read_enable(), // fix -- from control
	                .write_data(WriteData_EX_MEM),
	                .clk,
	                .xfer_size(4'd8),
	                .read_data(memout)
	);

    wire cbzandout, xorout, bltandout, muxbrsel, ucborout;
    /* Branch control */
    // Branch control for CBZ
    and cbzand (cbzandout, Branch, zero_alu_EX_MEM); // fix Branch
    
    // Branch control for BLT
    xor bltxor (xorout, negative_flag_EX_MEM, overflow_flag_EX_MEM);
    and bltand (bltandout, Branch, xorout); // fix Branch
	
    // Branch control for CBZ, BLT, and Unconditional Branch
	mux2_1 brselmux (.out(muxbrsel), .w0(cbzandout), .w1(bltandout), .sel(Brsel)); // fix brsel
    or ucdor (ucborout, muxbrsel, UBranch); // fix UBranch



    /* ---- MEM stage ---- */ 

    wire [63:0] memout_MEM_WB, ALUresult_MEM_WB; 
    wire [4:0] Rd_MEM_WB;
    wire [1:0] WB_MEM_WB;

     MEM_WB memwb (     .Mem_out(memout_MEM_WB), 
                        .ALUresult_out(ALUresult_MEM_WB), 
                        .Rd_out(Rd_MEM_WB), 
                        .WB_out(WB_MEM_WB), 
                        .Mem(memout), 
                        .ALUresult(ALUresult_EX_MEM), 
                        .Rd(Rd_EX_MEM), 
                        .WB(WB_EX_MEM)
    );

    /* ---- WB stage ---- */ 

    wire [63:0] muxmemout;
    mux64x2_1 memmux (.out(muxmemout), .w0(ALUresult_MEM_WB), .w1(memout_MEM_WB), .sel(MemtoReg)); // fix sel

    /* ---- WB stage ---- */ 
