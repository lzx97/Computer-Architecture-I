module regester11bit(data_out, data_in, enable, clk, rst);
	input data_in, enable, clk, rst;
	output data_out;
	
	wire muxout;
	
	mux2_1 m (.out(muxout), .w0(data_out), .w1(data_in), .sel(enable));
	D_FF ff (.q(data_out), .d(muxout), .reset(rst), .clk);

endmodule 