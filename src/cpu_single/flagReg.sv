/* 4-bit 'register' to help set flag for the CPU */ 

module flagReg(flag_out, flag_in, enable, clk, rst); 
	input [3:0] flag_in;
	input enable, clk, rst;
	output [3:0] flag_out;
	
	logic [3:0] load;
	
	genvar i;
	generate 
		for (i = 0; i < 4; i++) begin : eachdff
			mux2_1 muxs (.out(load[i]), .w0(flag_out[i]), .w1(flag_in[i]), .sel(enable));
			D_FF dn (.q(flag_out[i]), .d(load[i]), .reset(rst), .clk);
		end
	endgenerate 
endmodule 

module flagReg_testbench;
	parameter ClockDelay = 5000;

	logic [3:0] flag_in;
	logic enable, clk, rst;
	logic [3:0] flag_out;
	
	flagReg dut (flag_out, flag_in, enable, clk, rst); 
	
	initial begin // Set up the clock
		clk <= 0;
		forever #(ClockDelay/2) clk <= ~clk;
	end
	
	initial begin
		enable = 1;
		rst = 0;
		flag_in = 4'b1;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		enable = 0;
		flag_in = 4'b0010;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		enable = 1;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		
		rst = 1;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		$stop;
	end
endmodule 
		