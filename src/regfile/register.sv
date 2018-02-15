/* A 64-bit register with write_enable */ 

module register(data_out, data_in, enable, clk, rst);
	input enable, clk, rst;
	input [63:0] data_in;
	output [63:0] data_out;
	
	logic [63:0] load;
	
	genvar i;
	generate 
		for (i = 0; i < 64; i++) begin : eachDFF
			mux2_1 muxs (.out(load[i]), .w0(data_out[i]), .w1(data_in[i]), .sel(enable));
			D_FF dn (.q(data_out[i]), .d(load[i]), .reset(rst), .clk(clk));
		end
	endgenerate 
endmodule 