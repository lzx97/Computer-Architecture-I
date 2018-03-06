module mem_forward(select, Rn, Rd_EX_MEM, RegWrite_EX_MEM, MemRead_EX_MEM);
    input [4:0] Rn, Rd_EX_MEM;
    input RegWrite_EX_MEM, MemRead_EX_MEM;
    output reg select;

    always_comb begin
        if (MemRead_EX_MEM && RegWrite_EX_MEM && Rd_EX_MEM != 5'b11111 && Rn == Rd_EX_MEM) begin
            select = 1'b1;
        end
        else begin
            select = 1'b0;
        end
    end

endmodule 