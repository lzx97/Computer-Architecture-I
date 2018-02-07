module controlunit(Reg2Loc, UBranch, Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUsrc, RegWrite, opcode);
    input [10:0] opcode;
    output Reg2Loc, UBranch, Branch, MemRead, MemtoReg, MemWrite, ALUsrc, RegWrite;
    output [2:0] ALUOp;

    
    always_comb begin

        /* ADDI I-type */
        if (opcode[10:1] == 10'b1001000100) begin
            Reg2Loc =   1'bx;
            UBranch =   1'b0;
            Branch =    1'b0;
            MemRead =   1'b0;
            MemtoReg =  1'b0;
            ALUOp =     3'b010;
            MemWrite =  1'b0;
            ALUsrc =    1'b1;
            RegWrite =  1'b1;
        end

        /* ADDS R-type*/
        else if (opcode == 11'b10101011000) begin
            Reg2Loc =   1'b0;
            UBranch =   1'b0;
            Branch =    1'b0;
            MemRead =   1'b0;
            MemtoReg =  1'b0;
            ALUOp =     3'b010;
            MemWrite =  1'b0;
            ALUsrc =    1'b0;
            RegWrite =  1'b1;
        end

        /* B B-type*/
        else if (opcode[10:5] == 6'b000101) begin
            Reg2Loc =   1'bx;
            UBranch =   1'b1;
            Branch =    1'b0;
            MemRead =   1'b0;
            MemtoReg =  1'bx;
            ALUOp =     3'bx;
            MemWrite =  1'b0;
            ALUsrc =    1'bx;
            RegWrite =  1'b0;
        end

        /* B.LT */
        else if (opcode[10:3] == 8'b01010100) begin
            Reg2Loc =   1'bx;
            UBranch =   1'b0;
            Branch =    1'b1;
            MemRead =   1'b0;
            MemtoReg =  1'bx;
            ALUOp =     3'bx;
            MemWrite =  1'b0;
            ALUsrc =    1'bx;
            RegWrite =  1'b0;
        end

        /* CBZ CB-type*/
        else if (opcode[10:3] == 8'b10110100) begin
            Reg2Loc =   1'b1;
            UBranch =   1'b0;
            Branch =    1'b1;
            MemRead =   1'b0;
            MemtoReg =  1'bx;
            ALUOp =     3'bx;
            MemWrite =  1'b0;
            ALUsrc =    1'b0;
            RegWrite =  1'b0;
        end

        /* LDUR D-type*/
        else if (opcode == 11'b11111000010) begin
            Reg2Loc =   1'bx;
            UBranch =   1'b0;
            Branch =    1'b0;
            MemRead =   1'b1;
            MemtoReg =  1'b1;
            ALUOp =     3'b010;
            MemWrite =  1'b0;
            ALUsrc =    1'b1;
            RegWrite =  1'b1;
        end

        /* LSL R-type */
        else if (opcode == 11'b11010011011) begin
            /* TODO: implement shift */
            Reg2Loc =   1'bx;
            UBranch =   1'b0;
            Branch =    1'b0;
            MemRead =   1'b0;
            MemtoReg =  1'b0;
            ALUOp =     3'b010;
            MemWrite =  1'b0;
            ALUsrc =    1'b1;
            RegWrite =  1'b1;
        end

        /* LSR R-type */
        else if (opcode == 11'b11010011010) begin
            /* TODO: implement shift */
            Reg2Loc =   1'bx;
            UBranch =   1'b0;
            Branch =    1'b0;
            MemRead =   1'b0;
            MemtoReg =  1'b0;
            ALUOp =     3'b010;
            MemWrite =  1'b0;
            ALUsrc =    1'b1;
            RegWrite =  1'b1;
        end

        /* MUL R-type */
        else if (opcode == 11'b0) begin
            /* TODO: implement multuplicaiton */
            Reg2Loc =   1'bx;
            UBranch =   1'b0;
            Branch =    1'b0;
            MemRead =   1'b0;
            MemtoReg =  1'b0;
            ALUOp =     3'b010;
            MemWrite =  1'b0;
            ALUsrc =    1'b1;
            RegWrite =  1'b1;
        end

        /* STUR D-type */
        else if (opcode == 11'b11111000000) begin
            Reg2Loc =   1'b1;
            UBranch =   1'b0;
            Branch =    1'b0;
            MemRead =   1'b0;
            MemtoReg =  1'b0;
            ALUOp =     3'b010;
            MemWrite =  1'b1;
            ALUsrc =    1'b1;
            RegWrite =  1'b0;
        end

        /* SUBS R-type */
        else if (opcode == 11'b11101011000) begin
            Reg2Loc =   1'b0;
            UBranch =   1'b0;
            Branch =    1'b0;
            MemRead =   1'b0;
            MemtoReg =  1'b0;
            ALUOp =     3'b011;
            MemWrite =  1'b0;
            ALUsrc =    1'b0;
            RegWrite =  1'b1;
        end
    end
    
endmodule 