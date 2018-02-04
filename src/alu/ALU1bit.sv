module ALU1bit(result, carryout0, carryout1, a, b, carryin0, carryin1, control);
	input a, b, carryin0, carryin1;
	input [2:0] control;
	output result, carryout0, carryout1;
	
	wire bnot;
	wire andout, orout, xorout, addout, subout;
	
	and andGate (andout, a, b);
	or orGate (orout, a, b);
	xor xorGate(xorout, a, b);
	adder add (.carryout(carryout0), .sum(addout), .carryin(carryin0), .a, .b);
	// filp and plus 1
	not bNotGate (bnot, b);
	adder substract (.carryout(carryout1), .sum(subout), .carryin(carryin1), .a, .b(bnot));
	
	logic [7:0] w;
	mux8_1 mux0 (.out(result), .w({1'bz, xorout, orout, andout, subout, 
		addout, 1'bz, b}), .sel(control));
endmodule 

module ALU1bit_testbench;
	logic a, b, carryin0, carryin1; // input
	logic [2:0] control; // input
	logic result, carryout0, carryout1; // output 
	
	ALU1bit dut (result, carryout0, carryout1, a, b, carryin0, carryin1, control);	
	
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