module readwrite(readwrite1, readwrite2, Rd_MEM_WB, Rn, Rm);
    input [4:0] Rd_MEM_WB;
    input [4:0] Rn, Rm;
    output reg readwrite1, readwrite2;

    always_comb begin
        if (Rd_MEM_WB == Rn) begin
            readwrite1 = 1'b1;
        end
        else begin 
            readwrite1 = 1'b0;
        end
        
        if (Rd_MEM_WB == Rm) begin
            readwrite2 = 1'b1;
        end
        else begin
            readwrite2 = 1'b0;
        end
    end
endmodule 