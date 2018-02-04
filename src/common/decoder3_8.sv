module decoder3_8(y0, y1, y2, y3, y4, y5, y6, y7, w0, w1, w2, enable);
	input w0, w1, w2, enable;
	output y0, y1, y2, y3, y4, y5, y6, y7;
	
	wire w2not, and1out, and2out;
	
	not not1 (w2not, w2);
	and and1 (and1out, w2not, enable);
	and and2 (and2out, w2, enable);
	
	decoder2_4 d0 (y0, y1, y2, y3, w0, w1, and1out);
	decoder2_4 d1 (y4, y5, y6, y7, w0, w1, and2out);
endmodule

module decoder3_8_testbench;
	logic w0, w1, w2, enable;
	logic y0, y1, y2, y3, y4, y5, y6, y7;
	
	decoder3_8 dut (y0, y1, y2, y3, y4, y5, y6, y7, w0, w1, w2, enable);
	
	initial begin
		#10; enable = 1;
		#10; w2 = 0; w1 = 0; w0 = 0;
		#10; w2 = 0; w1 = 0; w0 = 1;
		#10; w2 = 0; w1 = 1; w0 = 0;
		#10; w2 = 0; w1 = 1; w0 = 1;
		#10; w2 = 1; w1 = 0; w0 = 0;
		#10; w2 = 1; w1 = 0; w0 = 1;
		#10; w2 = 1; w1 = 1; w0 = 0;
		#10; w2 = 1; w1 = 1; w0 = 1;
	end
endmodule 