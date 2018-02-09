module signextend(instr, result);
    input [31:0] instr;
    output [63:0] result;

    always_comb begin
        
        // R-type
        if (instr[31:21] == 11'b1xx0101x000) begin
            result = {{58{instr[15]}}, instr[15:10]};
        end

        // D-type
        else if (instr[31:21] == 11'b11111000010 || instr[31:21]== 11'b11111000000) begin // LDUR and STUR
            result = {{55{instr[20]}}, instr[20:12]};
        end 

        // CB-type
        else if (instr[31:24] == 8'b01010100 || instr[31:24] == 8'b10110100) begin // CBA and B.LT 
            result = {{45{instr[23]}}, instr[23:5]};
        end

        // B-type 
        else if (instr[31:26] == 6'b000101) begin // Branch
            result = {{38{instr[25]}}, instr[25:0]};
        end

        // I-type
        else if (instr[31:22] == 10'b1001000100) begin // ADDI
            result = {{52{instr[21]}}, instr[21:10]};
        end
        
    end
endmodule 