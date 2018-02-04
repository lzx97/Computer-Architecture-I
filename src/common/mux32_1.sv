module mux32_1(out, w, sel);
	input [31:0] w;
	input [4:0] sel;
	output out;
	
	wire muxout1, muxout2;
	
	mux16_1 mux1 (.out(muxout1), .w(w[15:0]), .sel(sel[3:0]));
	mux16_1 mux2 (.out(muxout2), .w(w[31:16]), .sel(sel[3:0]));
	
	mux2_1 mux3 (.out(out), .w0(muxout1), .w1(muxout2), .sel(sel[4]));
endmodule 

module mux32_1_testbench;
	logic [31:0] w;
	logic [4:0] sel;
	logic out;
	
	mux32_1 dut (out, w, sel);
	
	initial begin
		integer i, j;
		#50;
		for (i = 0; i < 32; i++) begin
			if (i % 2) 
				w[i] = 0;
			else 
				w[i] = 1;
		end
		#50;
		for (j = 0; j < 32; j++) begin
			sel = j; #10;
		end
	end
endmodule 