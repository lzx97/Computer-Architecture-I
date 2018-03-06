module WriteData_unit(control, Rd_ID_EX, Rd_EX_MEM);
    input [4:0] Rd_ID_EX, Rd_EX_MEM;
    output reg control;

    always_comb begin
        if (Rd_ID_EX == Rd_EX_MEM && Rd_EX_MEM != 5'b11111) begin
            control = 1'b1;
        end
        else begin
            control = 1'b0;
        end
    end
endmodule 