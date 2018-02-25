module mux64x4_1(out, w0, w1, w2, w3, sel);
    input [63:0] w0, w1, w2, w3;
    input [1:0] sel;
    output [63:0] out;

    genvar i;
    generate 
        for (i = 0; i < 64; i++) begin : genmuxs
            mux4_1 muxs (.out(out[i]), .w0(w0[i]), .w1(w1[i]), .w2(w2[i]), .w3(w3[i]), .sel);
        end
    endgenerate
endmodule 

module mux64x4_1_testbench;
    logic [63:0] w0, w1, w2, w3;
    logic [1:0] sel;
    logic [63:0] out;

    mux64x4_1 dut (.out, .w0, .w1, .w2, .w3, .sel);
    
    integer i; 
    initial begin
        #10;
        w0 = 0;
        w1 = 1;
        w2 = 2;
        w3 = 3;
        #10;
        for (i = 0; i < 4; i++) begin
            sel = i; #10;
        end
        sel = 0; #20;
    end
endmodule 