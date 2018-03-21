module mux2_1 #(parameter WIDTH=1) (out, w0, w1, sel);
	input [WIDTH-1:0] w0, w1;
	input sel;
	output [WIDTH-1:0] out;
	
	wire [WIDTH-1:0] and1_out, and2_out, inverter_out;
	
	genvar i;
	generate 
		for (i = 0; i < WIDTH; i++) begin : eachreg
			not inverter (inverter_out[i], sel);
			
			and and_gate1(and1_out[i], w0[i], inverter_out[i]);
			and and_gate2(and2_out[i], w1[i], sel);
			
			or or_gate(out[i], and1_out[i], and2_out[i]);
		end
	endgenerate
	
endmodule

module mux2_1_testbench;
	logic [63:0] w0, w1;
	logic sel;
	logic [63:0] out;

	mux2_1 #(.WIDTH(64)) mux (.out, .w0, .w1, .sel);

	initial begin
		sel = 0;
		w0 = 64'd5; w1 = 64'd10; #10;
		sel = 0; #10;
		sel = 1; #10
		w0 = 64'd100; w1 = 64'd50; #10;
		sel = 0; #10;
		sel = 1; #10;
	end 

endmodule 
	