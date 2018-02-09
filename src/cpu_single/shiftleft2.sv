module shiftleft2(out, in);
    input [63:0] in;
    output [63:0] out;

    assign out = {in[61:0], 2'b00};

endmodule 