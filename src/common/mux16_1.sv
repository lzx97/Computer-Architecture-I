module mux16_1(out, w, sel);
	input [15:0] w;
	input [3:0] sel;
	output out;
	
	wire [3:0] tempout;
	
	genvar i;
	generate 
		for (i = 0; i < 16; i += 4) begin : muxinit
			mux4_1 muxs (.out(tempout[i/4]), .w0(w[i]), .w1(w[i+1]), .w2(w[i+2]), .w3(w[i+3]), .sel(sel[1:0]));
		end
	endgenerate 
	
	mux4_1 muxtop (.out(out), .w0(tempout[0]), .w1(tempout[1]), .w2(tempout[2]), .w3(tempout[3]), .sel(sel[3:2]));
	
endmodule

module mux16_1_testbench;
	logic [15:0] w;
	logic [3:0] sel;
	logic out;
	
	mux16_1 dut (out, w, sel);
	
	initial begin
		integer i, j;
		#50;
		for (i = 0; i < 16; i++) begin
			if (i % 2) 
				w[i] = 0;
			else 
				w[i] = 1;
		end
		#50;
		for (j = 0; j < 16; j++) begin
			sel = j; #10;
		end
	end
endmodule 
	
	