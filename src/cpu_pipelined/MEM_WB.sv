module MEM_WB(Mem_out, ALUresult_out, WB_out, Mem, ALUresult, Rd, WB);
	input [63:0] Mem, ALUresult;
	input [4:0] Rd;
	input WB;
	
	output [63:0] Mem_out, ALUresult_out;
	output [4:0] Rd_out;
	output WB_out;
	
	genvar i; 
	generate 
		// Mem
		for (i = 0; i < 64; i++) begin : eachMem
			regester11bit ALUs (.data_out(Mem_out[i]), .data_in(Mem[i]), .enable, .clk, .rst);
		end 
		
		// ALUresult
		for (i = 0; i < 64; i++) begin : eachALUs
			regester11bit ALUs (.data_out(ALUresult_out[i]), .data_in(ALUresult[i]), .enable, .clk, .rst);
		end 
		
		// Rd
		for (i = 0; i < 5; i++) begin :eachRds
			regester11bit Rds (.data_out(Rd_out[i]), .data_in(Rd[i]), .enable, .clk, .rst);
		end 
		
		// WB
		regester11bit WBreg (.data_out(WB_out), .data_in(WB), .enable, .clk, .rst);
	endgenerate 
	
endmodule 