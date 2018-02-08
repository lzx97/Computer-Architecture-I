module mux64x32_1(out, data_in, sel);
	input logic [4:0] sel;
	input logic [31:0] [63:0] data_in;
	output logic [63:0] out;

	genvar i, j;
	generate
		for (i = 0; i < 64; i++) begin : muxinit
			logic [31:0] w;
			for (j = 0; j < 32; j++) begin : something
				assign w[j] = data_in[j][i];
			end
			mux32_1 mux32s (.out(out[i]), .w(w), .sel(sel));
		end
		
	endgenerate 
endmodule 

module mux64x32_1_testbench;
	logic [4:0] sel;
	logic [63:0] data_in [31:0];
	logic [63:0] out;
	
	mux64x32_1 dut (out, data_in, sel);
	
	integer i, j;
	initial begin
		for (i = 0; i < 64; i++) begin
			data_in[i] = i;
		end
		
		#20;
		
		for (j = 0; j <32; j++) begin
			sel = j; #10;
		end
	end
endmodule 

