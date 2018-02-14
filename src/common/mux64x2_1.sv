module mux64x2_1(out, w0, w1, sel);
    input [63:0] w0, w1;
    input sel;
    output [63:0] out;

    genvar i;
    generate 
        for (i = 0; i < 64; i++) begin : eachmux
            mux2_1 muxs (.out(out[i]), .w0(w0[i]), .w1(w1[i]), .sel);
        end
    endgenerate 

endmodule 