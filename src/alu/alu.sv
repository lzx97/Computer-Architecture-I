/* A simple ARM 64-bit Arithmetic Logic Unit implemented on gate level.
 *
 * control				Operation
 * 000					PASS_B
 * 001					SHIFT_LEFT or SHIFT_RIGHT
 * 010					ADDTION
 * 011					SUBTRACTION
 * 100					BITWISE AND
 * 101					BITWISE OR
 * 110					BITWISE XOR
 * 111					MULTIPLICATION
 * 
 * flags : negative, zero, overflow, carry_out
 */
module alu(A, B, cntrl, result, negative, zero, overflow, carry_out, shiftdir);
	input [63:0] A, B;
	input [2:0] cntrl;
	input shiftdir;
	output [63:0] result;
	output negative, zero, overflow, carry_out;
	
	wire [63:0] carry_out0, carry_out1;
	wire [63:0] andout, orout, xorout, addout, subout, passbout, shiftout, mulout;
	
	wire topcarry0, topcarry1;
	
	// connect 64 1-bit ALUs together
	genvar i;
	generate 
		// ALU for first bits
		ALU1bit firstbit (	.carryout0(carry_out0[0]), 
							.carryout1(carry_out1[0]), 
							.a(A[0]), 
							.b(B[0]), 
							.carryin0(1'b0), // for add
							.carryin1(1'b1), // for substract
							.andout(andout[0]), 
							.orout(orout[0]), 
							.xorout(xorout[0]), 
							.addout(addout[0]), 
							.subout(subout[0]), 
							.passbout(passbout[0])
		);
		// ALUs for other 63 bits
		for (i = 1; i < 64; i++) begin : eachALU1bit
			ALU1bit alus (	.carryout0(carry_out0[i]), 
								.carryout1(carry_out1[i]), 
								.a(A[i]), 
								.b(B[i]), 
								.carryin0(carry_out0[i - 1]), 
								.carryin1(carry_out1[i - 1]), 
								.andout(andout[i]), 
								.orout(orout[i]), 
								.xorout(xorout[i]), 
								.addout(addout[i]), 
								.subout(subout[i]), 
								.passbout(passbout[i])
		);
		end
	endgenerate 

	// shift operation (added for lab 3)
	shifter shift (.value(A),
			.direction(shiftdir), // 0: left, 1: right
			.distance(B[5:0]),
			.result(shiftout)
	);

	// multiply operatoin (added for lab 3)
	mult multi (	.A(A),
					.B(B),
					.doSigned(1'b1), // 1: signed multiply 0: unsigned multiply
					.mult_low(mulout),
					.mult_high() 
	);

	// select output based on ALU control
	mux64x8_1 selectResult (.out(result), 
							.w0(passbout), 
							.w1(shiftout),
							.w2(addout), 
							.w3(subout),
							.w4(andout), 
							.w5(orout),
							.w6(xorout), 
							.w7(mulout),
							.sel(cntrl)
	);

	// calculate and output flags
	assign negative = result[63];
	zero_detection zd (.zero, .in(result));
	overflow_detection od (.overflow, .a(A[63]), .b(B[63]), .c(result[63]), .cntrl(cntrl[0]));
	mux2_1 mux0 (.out(carry_out), .w0(carry_out0[63]), .w1(carry_out1[63]), .sel(cntrl[0]));

endmodule 