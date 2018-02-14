module controlunit(Reg2Loc, UBranch, Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUsrc, RegWrite, ShiftDir, opcode);
    input [10:0] opcode;
    output logic Reg2Loc, UBranch, Branch, MemRead, MemtoReg, MemWrite, ALUsrc, RegWrite, ShiftDir;
    output logic [2:0] ALUOp;

    parameter   ADDI = 11'b1001000100x,
                ADDS = 11'b10101011000,
                B    = 11'b000101xxxxx,
                BLT  = 11'b01010100xxx,
                CBZ  = 11'b10110100xxx,
                LDUR = 11'b11111000010,
                LSL  = 11'b11010011011,
                LSR  = 11'b11010011010,
                MUL  = 11'b10011011000,
                STUR = 11'b11111000000,
                SUBS = 11'b11101011000;


    always_comb begin
        casex (opcode)
            ADDI: begin
                Reg2Loc  =  1'b0;
                UBranch  =  1'b0;
                Branch   =  1'b0;
                MemRead  =  1'b0;
                MemtoReg =  1'b0;
                ALUOp    =  3'b010;
                MemWrite =  1'b0;
                ALUsrc   =  1'b1;
                RegWrite =  1'b1;
                ShiftDir =  1'bx;
            end

            ADDS: begin
                Reg2Loc  =  1'b0;
                UBranch  =  1'b0;
                Branch   =  1'b0;
                MemRead  =  1'b0;
                MemtoReg =  1'b0;
                ALUOp    =  3'b010;
                MemWrite =  1'b0;
                ALUsrc   =  1'b0;
                RegWrite =  1'b1;
                ShiftDir =  1'bx;
            end

            B: begin
                Reg2Loc  =  1'bx;
                UBranch  =  1'b1;
                Branch   =  1'b0;
                MemRead  =  1'b0;
                MemtoReg =  1'bx;
                ALUOp    =  3'bx;
                MemWrite =  1'b0;
                ALUsrc   =  1'bx;
                RegWrite =  1'b0;
                ShiftDir =  1'bx;
            end

            BLT: begin
                Reg2Loc  =  1'bx;
                UBranch  =  1'b0;
                Branch   =  1'b1;
                MemRead  =  1'b0;
                MemtoReg =  1'bx;
                ALUOp    =  3'bx;
                MemWrite =  1'b0;
                ALUsrc   =  1'bx;
                RegWrite =  1'b0;
                ShiftDir =  1'bx;
            end

            CBZ: begin
                Reg2Loc  =  1'b1;
                UBranch  =  1'b0;
                Branch   =  1'b1;
                MemRead  =  1'b0;
                MemtoReg =  1'bx;
                ALUOp    =  3'b000;
                MemWrite =  1'b0;
                ALUsrc   =  1'b0;
                RegWrite =  1'b0;
                ShiftDir =  1'bx;
            end

            LDUR: begin
                Reg2Loc  =  1'bx;
                UBranch  =  1'b0;
                Branch   =  1'b0;
                MemRead  =  1'b1;
                MemtoReg =  1'b1;
                ALUOp    =  3'b010;
                MemWrite =  1'b0;
                ALUsrc   =  1'b1;
                RegWrite =  1'b1;
                ShiftDir =  1'bx;
            end

            LSL: begin
                Reg2Loc  =  1'bx;
                UBranch  =  1'b0;
                Branch   =  1'b0;
                MemRead  =  1'b0;
                MemtoReg =  1'b0;
                ALUOp    =  3'b001;
                MemWrite =  1'b0;
                ALUsrc   =  1'b1;
                RegWrite =  1'b1;
                ShiftDir =  1'b0;
            end

            LSR: begin
                Reg2Loc  =  1'bx;
                UBranch  =  1'b0;
                Branch   =  1'b0;
                MemRead  =  1'b0;
                MemtoReg =  1'b0;
                ALUOp    =  3'b001;
                MemWrite =  1'b0;
                ALUsrc   =  1'b1;
                RegWrite =  1'b1;
                ShiftDir =  1'b1;
            end

            MUL: begin
                Reg2Loc  =  1'b0;
                UBranch  =  1'b0;
                Branch   =  1'b0;
                MemRead  =  1'b0;
                MemtoReg =  1'b0;
                ALUOp    =  3'b111;
                MemWrite =  1'b0;
                ALUsrc   =  1'b0;
                RegWrite =  1'b1;
                ShiftDir =  1'bx;
            end

            STUR: begin
                Reg2Loc  =  1'bx;
                UBranch  =  1'b0;
                Branch   =  1'b0;
                MemRead  =  1'b0;
                MemtoReg =  1'bx;
                ALUOp    =  3'b010;
                MemWrite =  1'b1;
                ALUsrc   =  1'b1;
                RegWrite =  1'b0;
                ShiftDir =  1'bx;
            end

            SUBS: begin
                Reg2Loc  =  1'b0;
                UBranch  =  1'b0;
                Branch   =  1'b0;
                MemRead  =  1'b0;
                MemtoReg =  1'b0;
                ALUOp    =  3'b011;
                MemWrite =  1'b0;
                ALUsrc   =  1'b0;
                RegWrite =  1'b1;
                ShiftDir =  1'bx;
            end

            default: begin
                Reg2Loc  =  1'bx;
                UBranch  =  1'bx;
                Branch   =  1'bx;
                MemRead  =  1'bx;
                MemtoReg =  1'bx;
                ALUOp    =  3'bx;
                MemWrite =  1'bx;
                ALUsrc   =  1'bx;
                RegWrite =  1'bx;
                ShiftDir =  1'bx;
            end
        endcase
    end
    
endmodule 

module controlunit_testbench;
    logic [10:0] opcode;
    logic Reg2Loc, UBranch, Branch, MemRead, MemtoReg, MemWrite, ALUsrc, RegWrite, ShiftDir;
    logic [2:0] ALUOp;

    controlunit dut (Reg2Loc, UBranch, Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUsrc, RegWrite, ShiftDir, opcode);

    initial begin
        
        opcode = 11'b10010001000; #10; // ADDI
        opcode = 11'b10010001001; #10; // ADDI
        opcode = 11'b10101011000; #10; // ADDS
        opcode = 11'b10101011000; #10; // ADDS
    end
endmodule