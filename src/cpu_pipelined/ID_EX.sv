module ID_EX(RD1_out, RD2_out, Rn_out, Rm_out, Rd_out, cntrl_EX_out, cntrl_M_out, cntrl_WB_out // output
				ReadData1, ReadData2, Rn, Rm, Rd, cntrl_EX, cntrl_M, cntrl_WB); // input
	input [63:0] ReadData1, ReadData2;
	input [4:0] Rn, Rm, Rd;
	
	// EX cntrl
	// {ALUsrc, ShiftDir, FlagEn, Brsel, ALUOp[2], ALUOp[1], ALUOp[0]}
	input [6:0] cntrl_EX;
	
	// M cntrl
	// {MemRead, MemWrite}
	input [1:0] cntrl_M;
	
	// WB cntrl
	// MemtoReg
	input cntrl_WB;
	
	output [63:0] RD1_out, RD2_out;
	output [4:0] Rn_out, Rm_out, Rd_out;
	output [6:0] cntrl_EX_out;
	output [1:0] cntrl_M_out;
	output cntrl_WB_out;
	
	genvar i;
	generate 
		// ReadData1
		for (i = 0; i < 64; i++) begin : eachRD1
			regester11bit RD1s (.data_out(RD1_out[i]), .data_in(ReadData1[i]), .enable, .clk, .rst);
		end 
		
		// ReadData2
		for (i = 0; i < 64; i++) begin : eachRD2
			regester11bit RD2s (.data_out(RD2_out[i]), .data_in(ReadData2_out[i]), .enable, .clk, .rst);
		end 
		
		// cntrl_EX
		for (i = 0; i < 7; i++) begin :eachEX
			regester11bit EXs (.data_out(cntrl_EX_out[i]), .data_in(cntrl_EX[i]), .enable, .clk, .rst);
		end 
		
		// cntrl_M
		for (i = 0; i < 2; i++) begin :eachM
			regester11bit Ms (.data_out(cntrl_M_out[i]), .data_in(cntrl_M[i]), .enable, .clk, .rst);
		end 
		
		// cntrl_WB
		regester11bit WB (.data_out(cntrl_WB), .data_in(cntrl_WB_out), .enable, .clk, .rst);
	endgenerate 
	
endmodule 