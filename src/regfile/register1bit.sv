module regester11bit(data_out, data_in, enable, clk, rst);
	input data_in, enable, clk, rst;
	output data_out;
	
	wire muxout;
	
	mux2_1 m (.out(muxout), .w0(data_out), .w1(data_in), .sel(enable));
	D_FF ff (.q(data_out), .d(muxout), .reset(rst), .clk);

endmodule 

module register11bit_testbench;

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