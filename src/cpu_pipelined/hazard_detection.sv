module hazard_detection();
	input ID_EX_MemRead;
	input Rd_ID_EX, Rn, Rm;
	
	output reg muxcntrl, pcwrite, IF_ID_write;
	
	always_comb begin
		// Load
		if (ID_EX_MemRead && ((Rd_ID_EX == Rn) || (Rd_ID_EX == Rm))) begin
			// stall pipeline 
			muxcntrl = 0;
			pcwrite = 0;
			IF_ID_write = 0;
		end 
		
		// TODO: stall conditions for B, B.LT, CBZ
		
		else begin
			muxcntrl = 1;
			pcwrite = 1;
			IF_ID_write = 1;
		end 

endmodule 