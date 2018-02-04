module decoder2_4(y0, y1, y2, y3, w0, w1, enable);
	input w0, w1, enable;
	output y0, y1, y2, y3;
	
	wire w0not, w1not;
	
	not not1 (w0not, w0);
	not not2 (w1not, w1);
	
	and and1 (y0, w0not, w1not, enable);
	and and2 (y1, w0, w1not, enable);
	and and3 (y2, w0not, w1, enable);
	and and4 (y3, w0, w1, enable);
endmodule 

module decoder2_4_testbench;
	logic w0, w1, enable;
	logic y0, y1, y2, y3;
	
	decoder2_4 dut (.y0, .y1, .y2, .y3, .w0, .w1, .enable);

	initial begin 
		enable = 1; #100;
		w0 = 0; w1 = 0; #100;
		w0 = 1; w1 = 0; #100;
		w0 = 0; w1 = 1; #100;
		w0 = 1; w1 = 1; #100;
	end 
	
endmodule 