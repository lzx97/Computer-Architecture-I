module forwarding(ForwardA, ForwardB, Rn, Rm, Rd_EX_MEM, Rd_MEM_WB, EX_MEM_RegWrite, MEM_WB_RegWrite);
	input [4:0] Rn, Rm;
	input [4:0] Rd_EX_MEM, Rd_MEM_WB;
	input EX_MEM_RegWrite, MEM_WB_RegWrite;
	output reg [1:0] ForwardA, ForwardB;
	
	

	/*always_comb begin
		if(EX_MEM_RegWrite && !MEM_WB_RegWrite) begin
			if(Rn==Rd_EX_MEM && Rd_EX_MEM != 5'd31)
				ForwardA = 2'd1;
			else ForwardA = 2'd0;
			if(Rm==Rd_EX_MEM && Rd_EX_MEM != 5'd31)
				ForwardB = 2'd1;
			else ForwardB = 2'd0;
		end
		else if(!EX_MEM_RegWrite && MEM_WB_RegWrite) begin
			if(Rn==Rd_MEM_WB && Rd_MEM_WB != 5'd31)
				ForwardA = 2'd2;
			else ForwardA = 2'd0;
			if(Rm==Rd_MEM_WB && Rd_MEM_WB != 5'd31)
				ForwardB = 2'd2;
			else ForwardB = 2'd0;
		end
		else if(EX_MEM_RegWrite && MEM_WB_RegWrite) begin
			if(Rn==Rd_EX_MEM && Rd_EX_MEM != 5'd31)
				ForwardA = 2'd1;
			else begin
				if(Rn==Rd_MEM_WB && Rd_MEM_WB != 5'd31)
					ForwardA = 2'd2;
				else ForwardA = 2'd0;
			end
			if(Rm==Rd_EX_MEM && Rd_EX_MEM != 5'd31)
				ForwardB = 2'd1;
			else begin 
				if(Rm==Rd_MEM_WB && Rd_MEM_WB != 5'd31)
					ForwardB = 2'd2;
				else ForwardB = 2'd0;
			end
		end
		else begin
			ForwardA = 2'd0;
			ForwardB = 2'd0;
		end
	
	end*/
		
	always_comb begin
		if (EX_MEM_RegWrite && (Rd_EX_MEM != 5'b11111) && (Rd_EX_MEM == Rn)) begin
			ForwardA = 2'b10;
		end
		
		else if (EX_MEM_RegWrite && (Rd_EX_MEM != 5'b11111) && (Rd_EX_MEM == Rm)) begin
			ForwardB = 2'b10;
		end
		
		else if (MEM_WB_RegWrite && Rd_MEM_WB != 5'b11111 && 
				!(EX_MEM_RegWrite && (Rd_EX_MEM != 5'b11111) && (Rd_EX_MEM != Rn)) &&
					(Rd_MEM_WB == Rn)) begin
			ForwardA = 2'b01;
		end
		
		else if (MEM_WB_RegWrite && Rd_MEM_WB != 5'b11111 && 
				!(EX_MEM_RegWrite && (Rd_EX_MEM != 5'b11111) && (Rd_EX_MEM != Rm)) &&
					(Rd_MEM_WB == Rm)) begin

			ForwardB = 2'b01;
		end
		
		else begin
			ForwardA = 2'b00;
			ForwardB = 2'b00;
		end
	end
	

endmodule 