/* A 64-bit register with write_enable */ 

module register(data_out, data_in, enable, clk, rst);
	input enable, clk, rst;
	input [63:0] data_in;
	output [63:0] data_out;
	
	logic [63:0] load;
	
	genvar i;
	generate 
		for (i = 0; i < 64; i++) begin : eachreg
			regester11bit regs (.data_out(data_out[i]), .data_in(data_in[i]), .enable, .clk, .rst);
		end
	endgenerate 
endmodule 