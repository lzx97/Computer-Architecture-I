module signextend(in, out);
    input [15:0] in;
    output [63:0] out;

    assign out = { {48{in[15]}}, in };
endmodule 