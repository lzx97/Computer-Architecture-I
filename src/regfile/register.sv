module register #(parameter WIDTH=1) (data_out, data_in, enable, clk, rst);
	input [WIDTH-1:0] data_in;
	input enable, clk, rst;
	output [WIDTH-1:0] data_out;

	wire [WIDTH-1:0] muxout;
	
	genvar i;
	generate 
		for (i = 0; i < WIDTH; i++) begin : eachbit
			mux2_1 m (.out(muxout[i]), .w0(data_out[i]), .w1(data_in[i]), .sel(enable));
			D_FF ff (.q(data_out[i]), .d(muxout[i]), .reset(rst), .clk);
		end
	endgenerate 


endmodule 

module register_testbench;

	parameter ClockDelay = 5000;

	logic data_in, enable, clk, rst;
	logic data_out;

	regester11bit dut (data_out, data_in, enable, clk, rst);

	initial begin // Set up the clock
		clk <= 0;
		forever #(ClockDelay/2) clk <= ~clk;
	end

	initial begin
		rst = 1; data_in = 0;@(posedge clk);

        rst = 0;
		enable = 1; @(posedge clk);
		enable = 0; @(posedge clk);
		data_in = 1; @(posedge clk);
		@(posedge clk);@(posedge clk);@(posedge clk);@(posedge clk);
		enable = 1; @(posedge clk);
		enable = 0; @(posedge clk);
		@(posedge clk);@(posedge clk);@(posedge clk);@(posedge clk);
        $stop;
	end
endmodule 