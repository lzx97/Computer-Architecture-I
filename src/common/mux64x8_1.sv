module mux64x8_1(out, w0, w1, w2, w3, w4, w5, w6, w7, sel);
    input [63:0] w0, w1, w2, w3, w4, w5, w6, w7;
    input [2:0] sel;
    output [63:0] out;

    genvar i;
    generate 
        for (i = 0; i < 64; i++) begin : genmuxs
            mux8_1 muxs (.out(out[i]), .w({w7[i], w6[i], w5[i], w4[i], w3[i], w2[i], w1[i], w0[i]}), .sel(sel));
        end
    endgenerate
endmodule 

module mux64x8_1_testbench;
    logic [63:0] w0, w1, w2, w3, w4, w5, w6, w7;
    logic [2:0] sel;
    logic [63:0] out;

    mux64x8_1 dut (.out, .w0, .w1, .w2, .w3, .w4, .w5, .w6, .w7, .sel);
    
    integer i;
    initial begin
        #10;~
        w0 = 0;
        w1 = 1;
        w2 = 2;
        w3 = 3;
        w4 = 4; 
        w5 = 5;
        w6 = 6;
        w7 = 7;
        #10;
        for (i = 0; i < 8; i++) begin
            sel = i; #10;
        end
        sel = 0; #20;
    end
endmodule 