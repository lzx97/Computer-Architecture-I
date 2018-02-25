module IF_ID();
	input [63:0] instr;
	input enable, clk, rst;
	output [63:0] instr_out;
	
	genvar i;
	generate
		for (i = 0; i < 63; i++) begin : eachreg
			regester11bit regs (.data_out(instr_out[i]), .data_in(instr[i]), .enable, .clk, .rst);
		end
	endgenerate 

endmodule 
