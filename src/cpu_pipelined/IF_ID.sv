module IF_ID(instr_out, pcaddr_out, instr, pcaddr, enable, clk, rst);
	input [63:0] instr, pcaddr;
	input enable, clk, rst;
	output [63:0] instr_out, pcaddr_out;
	
	genvar i;
	generate
		for (i = 0; i < 63; i++) begin : eachreg
			regester11bit regs (.data_out(instr_out[i]), .data_in(instr[i]), .enable, .clk, .rst);
		end

		for (i = 0; i < 63; i++) begin : eachpcaddr
			regester11bit pcs (.data_out(pcaddr_out[i]), .data_in(pcaddr[i]), .enable, .clk, .rst);
		end
	endgenerate 

endmodule 
