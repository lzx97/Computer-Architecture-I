module IF_ID();
    input [31:0] instr;
    input [63:0] pc_addr;
    input enable, clk, rst;
    output [31:0] instr_IF_ID;
    output [63:0] pc_addr_IF_ID;

    // register for 32-bit instruction
    register #(.WIDTH(32)) instrreg (   .data_out(instr_IF_ID), 
                                        .data_in(instr), 
                                        .enable, 
                                        .clk, 
                                        .rst
    );

    // register for 64-bit pc address from IF stage
    register #(.WIDTH(64)) pcaddrreg (  .data_out(pc_addr_IF_ID), 
                                        .data_in(pc_addr), 
                                        .enable, 
                                        .clk, 
                                        .rst
    );
    
endmodule 