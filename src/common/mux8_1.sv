module mux8_1(out, w, sel);
	input [7:0] w;
	input [2:0] sel;
	output out;
	
	wire mux0out, mux1out;
	
	mux4_1 mux0 (.out(mux0out), .w0(w[0]), .w1(w[1]), .w2(w[2]), .w3(w[3]), .s0(sel[0]), .s1(sel[1]));
	mux4_1 mux1 (.out(mux1out), .w0(w[4]), .w1(w[5]), .w2(w[6]), .w3(w[7]), .s0(sel[0]), .s1(sel[1]));
	mux2_1 mux2 (.out, .w0(mux0out), .w1(mux1out), .sel(sel[2]));
	
endmodule 

module mux8_1_testbench;
	logic [7:0] w;
	logic [2:0] sel;
	logic out;
	
	mux8_1 dut (out, w, sel);
	
	initial begin
		integer i;
		w = 8'b11101001;
		for (i = 0; i < 8; i++) begin
			sel = i; #10;
		end
	end
endmodule 