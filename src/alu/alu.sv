module alu(A, B, cntrl, result, negative, zero, overflow, carry_out);
	input [63:0] A, B;
	input [2:0] cntrl;
	output [63:0] result;
	output negative, zero, overflow, carry_out;
	
	wire [62:0] carry_out0, carry_out1;
	wire [63:0] result_temp;
	
	wire topcarry0, topcarry1;
	
	genvar i;
	generate 
		ALU1bit firstbit (.result(result_temp[0]), .carryout0(carry_out0[0]), .carryout1(carry_out1[0]), 
			.a(A[0]), .b(B[0]), .carryin0(1'b0), .carryin1(1'b1), .control(cntrl));
		for (i = 1; i < 63; i++) begin : eachALU1bit
			ALU1bit eachbit (.result(result_temp[i]), .carryout0(carry_out0[i]), .carryout1(carry_out1[i]),
				.a(A[i]), .b(B[i]), .carryin0(carry_out0[i - 1]), .carryin1(carry_out1[i - 1]), .control(cntrl));
		end
		ALUtopbit topbit (.result(result_temp[63]), .carryout0(topcarry0), .carryout1(topcarry1), 
			.overflow, .negative, .a(A[63]), .b(B[63]), .carryin0(carry_out0[62]), .carryin1(carry_out1[62]), .control(cntrl));
	endgenerate 
	
	mux2_1 mux0 (.out(carry_out), .w0(topcarry0), .w1(topcarry1), .sel(cntrl[0]));
	
	zero_detection zd (.zero, .in(result_temp));
	
	assign result = result_temp;
endmodule 