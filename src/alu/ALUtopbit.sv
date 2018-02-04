module ALUtopbit(result, carryout0, carryout1, overflow, negative, a, b, carryin0, carryin1, control);
	input a, b, carryin0, carryin1;
	input [2:0] control;
	output result, carryout0, carryout1, overflow, negative;
	
	wire anot, bnot, muxoutnot;
	wire andout, orout, xorout, addout, subout, muxout;
	wire and1out, and2out;
	
	and andGate (andout, a, b);
	or orGate (orout, a, b);
	xor xorGate(xorout, a, b);
	adder add (.carryout(carryout0), .sum(addout), .carryin(carryin0), .a, .b);
	// filp and plus 1
	not bNotGate (bnot, b);
	adder substract (.carryout(carryout1), .sum(subout), .carryin(carryin1), .a, .b(bnot));
	
	logic [7:0] w;
	mux8_1 mux0 (.out(muxout), .w({1'bz, xorout, orout, andout,
		subout, addout, 1'bz, b}), .sel(control));
	
	// overflow detection
	wire adderout;
	mux2_1 mux1 (.out(adderout), .w0(addout), .w1(subout), .sel(control[0]));
	overflow_detection dectect (.overflow, .a, .b, .c(adderout), .cntrl(control[0]));
	
	assign result = muxout;
	assign negative = muxout;
endmodule 
	
module ALUtopbit_testbench;
	logic a, b, carryin0, carryin1;
	logic [2:0] control;
	logic result, carryout0, carryout1, negative, overflow;
	
	ALUtopbit dut (result, carryout0, carryout1, overflow, negative, a, b, carryin0, carryin1, control);
	
	
	initial begin
		integer i, j;
		{carryin0, carryin1} = 1; #50;
		for (i = 0; i < 4; i++) begin
			{a, b} = i; 
			for (j = 0; j < 8; j++) begin
				control = j; #10;
			end
			control = 3'b0;
		end
	end 
endmodule 
	
