`timescale 1ns/10ps

module mux2_1 (out, w0, w1, sel);
	input w0, w1;
	input sel;
	output out;
	
	wire And1_o, And2_o, inverter_o;
	
	not inverter (inverter_o, sel);
	
	and #50 and_gate1(And1_o, w0, inverter_o);
	and #50 and_gate2(And2_o, w1, sel);
	
	or or_gate(out, And1_o, And2_o);
	
endmodule
	