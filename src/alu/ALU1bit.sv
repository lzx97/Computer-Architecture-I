module ALU1bit(carryout0, carryout1, a, b, carryin0, carryin1, andout, orout, xorout, addout, subout, passbout);
	input a, b, carryin0, carryin1;
	output carryout0, carryout1;
	output andout, orout, xorout, addout, subout, passbout;
	
	wire bnot;
	
	
	and andGate (andout, a, b);
	or orGate (orout, a, b);
	xor xorGate(xorout, a, b);
	adder add (.carryout(carryout0), .sum(addout), .carryin(carryin0), .a, .b);
	// filp and plus 1
	not bNotGate (bnot, b);
	adder substract (.carryout(carryout1), .sum(subout), .carryin(carryin1), .a, .b(bnot));
	assign passbout = b;

endmodule 

module ALU1bit_testbench;
	logic a, b, carryin0, carryin1; // input
	logic carryout0, carryout1; // output 
	logic andout, orout, xorout, addout, subout, passbout;
	
	ALU1bit dut (carryout0, carryout1, a, b, carryin0, carryin1, andout, orout, xorout, addout, subout, passbout);

	integer i;
	initial begin
		{carryin0, carryin1} = 1;
		for (i = 0; i < 4; i++) begin
			{a, b} = i; #10;
		end 
	end 
endmodule 