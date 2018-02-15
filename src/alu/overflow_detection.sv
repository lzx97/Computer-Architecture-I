/* An overflow detection unit to help set overflow flag for the ALU */ 

module overflow_detection(overflow, a, b, c, cntrl);
	input a, b, c, cntrl;
	output overflow;
	
	wire anot, bnot, cnot;
	wire and1out, and2out, and3out, and4out;
	wire overflow_add, overflow_sub;
	
	
	not aNotGate (anot, a);
	not bNotGate (bnot, b);
	not cNotGate (cnot, c);
	
	// Detection for addtion
	and and1 (and1out, anot, bnot, c);
	and and2 (and2out, a, b, cnot);
	or or1 (overflow_add, and1out, and2out);
	
	// Detection for subtraction
	and and3 (and3out, anot, b, c);
	and and4 (and4out, a, bnot, cnot);
	or or2 (overflow_sub, and3out, and4out);
	
	mux2_1 mux0 (.out(overflow), .w0(overflow_add), .w1(overflow_sub), .sel(cntrl));
	
endmodule 