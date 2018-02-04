module adder (carryout, sum, carryin, a, b);
	input carryin, a, b;
	output carryout, sum;
	
	wire anot, bnot, cinot;
	wire and0out, and1out, and2out, and3out;
	
	not (anot, a);
	not (bnot, b);
	not (cinot, carryin);
	
	and and0 (and0out, a, bnot, cinot);
	and and1 (and1out, anot, b, cinot);
	and and2 (and2out, anot, bnot, carryin);
	and and3 (and3out, a, b, carryin);
	
	or or0 (sum, and0out, and1out, and2out, and3out);
	
	adder_carryout cout (.carryout, .carryin, .a, .b);
endmodule 