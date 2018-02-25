module EX_MEM(ALUresult_out, WriteData_out, WB_out, M_out // output
				ALUresult, WriteData, WB, M); // input 
	input [63:0] ALUresult, WriteData;
	input [4:0] Rd;
	input WB;
	input [1:0] M;
	output [63:0]  ALUresult_out, WriteData_out;
	output WB_out;
	output [1:0] M_out;
	
	genvar i;
	generate 
		// ALUresult
		for (i = 0; i < 64; i++) begin : eachALUbits
			regester11bit ALUs (.data_out(ALUresult_out[i]), .data_in(ALUresult[i]), .enable, .clk, .rst);
		end 
		
		// WriteData
		for (i = 0; i < 64; i++) begin : eachWDs
			regester11bit WDs (.data_out(ALUresult_out[i]), .data_in(ALUresult[i]), .enable, .clk, .rst);
		end 
		
		// Rds
		for (i = 0; i < 5; i++) begin :eachRds
			regester11bit Rds (.data_out(Rd_out[i]), .data_in(Rd[i]), .enable, .clk, .rst);
		end 
		
		// M cntrl
		for (i = 0; i < 2; i++) begin : eachMs
			regester11bit Ms (.data_out(M_out[i]), .data_in(M[i]), .enable, .clk, .rst);
		end 
		
		// WB cntrl 
		regester11bit WBreg (.data_out(WB_out), .data_in(WB), .enable, .clk, .rst);
	endgenerate
			
endmodule 