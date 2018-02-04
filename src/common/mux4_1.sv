module mux4_1 (out, w0, w1, w2, w3, s0, s1);
	input w0, w1, w2, w3;
	input s0, s1;
	output out;
	
	wire s0not, s1not;
	wire g0_o, g1_o, g2_o, g3_o;
	
	not inverter1 (s0not, s0);
	not inverter2 (s1not, s1);
	
	and g0 (g0_o, w0, s0not, s1not);
	and g1 (g1_o, w1, s1not, s0);
	and g2 (g2_o, w2, s0not, s1);
	and g3 (g3_o, w3, s0, s1);
	
	or g4 (out, g0_o, g1_o, g2_o, g3_o);
endmodule

module mux4_1_testbench;
	logic w0, w1, w2, w3;
	logic s0, s1;
	logic out;
	
	mux4_1 dut (out, w0, w1, w2, w3, s0, s1);
	
	initial begin
		integer i;
		w0 = 0; w1 = 1; w2 = 0; w3 = 1;
		for (i = 0; i < 4; i++) begin
			{s1, s0} = i; #10;
		end
	end
endmodule
	