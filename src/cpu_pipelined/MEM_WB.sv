module MEM_WB(Mem_out, ALUresult_out, Rd_out, WB_out, Mem, ALUresult, Rd, WB, enable, clk, rst);
	input enable, clk, rst;
	input [63:0] Mem, ALUresult;
	input [4:0] Rd;
	input [1:0] WB;
	
	output [63:0] Mem_out, ALUresult_out;
	output [4:0] Rd_out;
	output [1:0] WB_out;
	
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
		for (i = 0; i < 5; i++) begin : eachRds
			regester11bit Rds (.data_out(Rd_out[i]), .data_in(Rd[i]), .enable, .clk, .rst);
		end 
		
		// WB
		for (i = 0; i < 5; i++) begin : eachWB
			regester11bit WBreg (.data_out(WB_out[i]), .data_in(WB[i]), .enable, .clk, .rst);
		end
	endgenerate 
	
endmodule 