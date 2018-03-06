module readwrite(readwrite1, readwrite2, Rd_MEM_WB, Rn, Rm, RegWrite_MEM_WB);
    input [4:0] Rd_MEM_WB;
    input [4:0] Rn, Rm;
    input RegWrite_MEM_WB;
    output reg readwrite1, readwrite2;

    always_comb begin
        if (RegWrite_MEM_WB) begin
            if (Rd_MEM_WB == Rn && Rd_MEM_WB != 5'b11111) begin
                readwrite1 = 1'b1;
            end
            else begin 
                readwrite1 = 1'b0;
            end
            
            if (Rd_MEM_WB == Rm && Rd_MEM_WB != 5'b11111) begin
                readwrite2 = 1'b1;
            end
            else begin
                readwrite2 = 1'b0;
            end
        end 
        else begin
            readwrite1 = 1'b0;
            readwrite2 = 1'b0;
        end
    end
endmodule 