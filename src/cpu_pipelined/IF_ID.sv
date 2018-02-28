module IF_ID(instr_out, pcaddr_out, instr, pcaddr, enable, clk, rst);
	input [31:0] instr;
	input [63:0] pcaddr;
	input enable, clk, rst;
	output [63:0] pcaddr_out;
	output [31:0] instr_out;
	
	genvar i;
	generate
		for (i = 0; i < 32; i++) begin : eachreg
			regester11bit regs (.data_out(instr_out[i]), .data_in(instr[i]), .enable, .clk, .rst);
		end

		for (i = 0; i < 64; i++) begin : eachpcaddr
			regester11bit pcs (.data_out(pcaddr_out[i]), .data_in(pcaddr[i]), .enable, .clk, .rst);
		end
	endgenerate 

endmodule 
