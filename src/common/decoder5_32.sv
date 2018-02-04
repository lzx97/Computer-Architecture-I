module decoder5_32(out, in, regWrite);
	input regWrite;
	input [4:0] in;
	output [31:0] out;
	
	wire [3:0] en;
	
	decoder2_4 d2_4 (.y0(en[0]), .y1(en[1]), .y2(en[2]), .y3(en[3]), .w0(in[3]), .w1(in[4]), .enable(regWrite));
	
	genvar i;
	generate 
		for (i = 0; i < 32; i+=8) begin : decoder
			decoder3_8 d3_8_0 (.y0(out[i]), .y1(out[i+1]), .y2(out[i+2]), .y3(out[i+3]),
				.y4(out[i+4]), .y5(out[i+5]), .y6(out[i+6]), .y7(out[i+7]), .w0(in[0]), 
				.w1(in[1]), .w2(in[2]), .enable(en[i/8]));
		end
	endgenerate
endmodule 

module decoder5_32_testbench;
	logic regWrite;
	logic [4:0] in;
	logic [31:0] out;
	
	decoder5_32 dut (out, in, regWrite);
	
	initial begin
		integer i;
		regWrite = 0; #10;
		regWrite = 1; #10;
		for (i = 0; i < 32; i++) begin
			in = i; #10;
		end
		regWrite = 0; #10;
		#1000;
	end
endmodule 