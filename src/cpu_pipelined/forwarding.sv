module forwarding(ForwardA, ForwardB, Rn, Rm, Rd_EX_MEM, Rd_MEM_WB, EX_MEM_RegWrite, MEM_WB_RegWrite);
	input [4:0] Rn, Rm;
	input [4:0] Rd_EX_MEM, Rd_MEM_WB;
	input EX_MEM_RegWrite, MEM_WB_RegWrite;
	output reg [1:0] ForwardA, ForwardB;
	
	always_comb begin
		if (EX_MEM_RegWrite && (Rd_EX_MEM != 5'b11111) && (Rd_EX_MEM == Rn)) begin
			ForwardA = 2'b10;
			ForwardB = 2'b00;
		end
		
		else if (EX_MEM_RegWrite && (Rd_EX_MEM != 5'b11111) && (Rd_EX_MEM == Rm)) begin
			ForwardA = 2'b00;
			ForwardB = 2'b10;
		end
		
		else if (MEM_WB_RegWrite && Rd_MEM_WB != 5'b11111 && 
				!(EX_MEM_RegWrite && (Rd_EX_MEM != 5'b11111) && (Rd_EX_MEM != Rn)) &&
					(Rd_MEM_WB == Rn)) begin
			ForwardA = 2'b01;
			ForwardB = 2'b00;
		end
		
		else if (MEM_WB_RegWrite && Rd_MEM_WB != 5'b11111 && 
				!(EX_MEM_RegWrite && (Rd_EX_MEM != 5'b11111) && (Rd_EX_MEM != Rm)) &&
					(Rd_MEM_WB == Rm)) begin
			ForwardA = 2'b00;
			ForwardB = 2'b01;
		end
		
		else begin
			ForwardA = 2'b00;
			ForwardB = 2'b00;
		end 
	end
	

endmodule 