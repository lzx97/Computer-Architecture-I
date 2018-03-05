/* A zero detection unit to help set zero flag of the ALU */ 

module zero_detection(zero, in);
	input [63:0] in;
	output reg zero;

	always_comb begin
		if (in == 64'b0) begin
			zero = 1'b1;
		end
		else begin
			zero = 1'b0;
		end
	end
	
	/*wire [62:0] orout;
	
	genvar i;
	generate 
		or or0 (orout[0], in[0], in[1]);
		for (i = 1; i < 63; i++) begin : orgen
			or eachor (orout[i], orout[i - 1], in[i + 1]);
		end
	endgenerate 
	
	not notgate (zero, orout[62]);*/
endmodule 