module adder_carryout(carryout, carryin, a, b);
	input carryin, a, b;
	output carryout;
	
	wire and0out, and1out, and2out;
	
	and and0 (and0out, a, carryin);
	and and1 (and1out, b, carryin);
	and and2 (and2out, a, b);
	
	or or0 (carryout, and0out, and1out, and2out);
	
endmodule 