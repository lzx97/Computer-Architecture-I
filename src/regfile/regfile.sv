module regfile(ReadData1, ReadData2, WriteData, ReadRegister1, ReadRegister2, WriteRegister, RegWrite, clk);
	input [4:0] ReadRegister1, ReadRegister2, WriteRegister;
	input [63:0] WriteData;
	input RegWrite, clk;
	output [63:0] ReadData1, ReadData2;
	
	wire [31:0] decoder_out;
	wire [31:0] [63:0] reg_out;
	
	// XZR register (always 0)
	reg [63:0] reg31 = 64'b0;
	assign reg_out[31] = reg31;
	
	// initialize the decoder
	decoder5_32 decoder (.out(decoder_out), .in(WriteRegister), .regWrite(RegWrite));
	
	// generate other 31 registers
	genvar i;
	generate 
		for (i = 0; i < 31; i++) begin : reginit
			register regs (.data_out(reg_out[i]), .data_in(WriteData), .enable(decoder_out[i]), .clk(clk), .rst(1'b0));
		end
	endgenerate
	
	// initialize two 64x32:1 mutiplexers
	mux64x32_1 mux1 (.out(ReadData1), .data_in(reg_out), .sel(ReadRegister1));
	mux64x32_1 mux2 (.out(ReadData2), .data_in(reg_out), .sel(ReadRegister2));
endmodule 