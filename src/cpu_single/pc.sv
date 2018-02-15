/* program counter of the cpu */ 

module pc(addr_out, addr_in, enable, clk, rst);
    input [63:0] addr_in;
    input enable, clk, rst;
    output [63:0] addr_out;

    register PC (.data_out(addr_out), .data_in(addr_in), .enable, .clk, .rst);
    
endmodule 