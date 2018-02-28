module EX_MEM(ALUresult_out, WriteData_out, addr_out, Rd_out, WB_out, M_out, alu_flag_out, flag_out,  // output
				ALUresult, WriteData, addr, Rd, WB, M, alu_flag, flag, enable, clk, rst); // input 
	input enable, clk, rst;
	input [63:0] ALUresult, WriteData, addr;
	input [4:0] Rd;
	input [1:0] WB;
	input [4:0] M;
	input [3:0] alu_flag; //zero_alu, negative_alu, overflow_alu, carryout_alu;
	input [3:0] flag; //zero_flag, negative_flag, overflow_flag, carryout_flag;
	output [63:0]  ALUresult_out, WriteData_out, addr_out;
	output [4:0] Rd_out;
	output [1:0] WB_out;
	output [4:0] M_out;
	output [3:0] alu_flag_out; //zero_alu_out, negative_alu_out, overflow_alu_out, carryout_alu_out;
	output [3:0] flag_out; //zero_flag_out, negative_flag_out, overflow_flag_out, carryout_flag_out;
	
	genvar i;
	generate 
		// ALUresult
		for (i = 0; i < 64; i++) begin : eachALUbits
			regester11bit ALUs (.data_out(ALUresult_out[i]), .data_in(ALUresult[i]), .enable, .clk, .rst);
		end 
		
		// WriteData
		for (i = 0; i < 64; i++) begin : eachWDs
			regester11bit WDs (.data_out(WriteData_out[i]), .data_in(WriteData[i]), .enable, .clk, .rst);
		end

		for (i = 0; i < 64; i++) begin : eachaddr
			regester11bit addrs (.data_out(addr_out[i]), .data_in(addr[i]), .enable, .clk, .rst);
		end  
		
		// Rds
		for (i = 0; i < 5; i++) begin :eachRds
			regester11bit Rds (.data_out(Rd_out[i]), .data_in(Rd[i]), .enable, .clk, .rst);
		end 
		
		// M cntrl
		for (i = 0; i < 5; i++) begin : eachMs
			regester11bit Ms (.data_out(M_out[i]), .data_in(M[i]), .enable, .clk, .rst);
		end 
		
		// WB cntrl 
		for (i = 0; i < 2; i++) begin :eachWB
			regester11bit WBreg (.data_out(WB_out[i]), .data_in(WB[i]), .enable, .clk, .rst);
		end

		for (i = 0; i < 4; i++) begin :eachaluflag
			regester11bit aluflags (.data_out(alu_flag_out[i]), .data_in(alu_flag[i]), .enable, .clk, .rst);
		end

		for (i = 0; i < 4; i++) begin :eachflag
			regester11bit flags (.data_out(flag_out[i]), .data_in(flag[i]), .enable, .clk, .rst);
		end
	endgenerate
			
endmodule 