module cpu_pipelined(reg_out, clk, reset);
    input clk, reset;
    output [31:0[63:0] reg_out;

    // IF stage wires
    wire [31:0] instr;
    wire [63:0] branchmuxout, pc_incr_addr, pc_out;

    // ID stage wires
    wire [31:0] instr_IF_ID;
    wire [63:0] pc_addr_IF_ID;

    wire branch_taken;
    wire [63:0] branch_addr;
    
    // EX stage wires

    
    // MEM stage wires


    // MEM stage wires


    /* ---- IF stage ---- */  

    mux2_1 #(.WIDTH(64)) branchmux (
                        .out(branchmuxout), 
                        .w0(pc_incr_addr),
                        .w1(branch_addr),
                        .sel(branch_taken)
    );

    pc programcounter ( .addr_out(pc_out), 
                        .addr_in(branchmuxout), 
                        .enable(1'b1),  // always enable
                        .clk, 
                        .rst
    );

    // program counter increment adder
    alu pc_increment (   .A(pc_out), 
                        .B(64'h4), 
                        .cntrl(3'b010), 
                        .result(pc_incr_addr), 
                        .negative(), 
                        .zero(), 
                        .overflow(), 
                        .carry_out(), 
                        .shiftdir(1'bx)
    );

    // instruction memory
    instructmem im (    .address(pc_out), 
                        .instruction(instr), 
                        .clk
    );



    /* ---- IF stage ---- */  

    IF_ID ifid (        .instr_IF_ID, 
                        .pc_addr_IF_ID, 
                        .instr, 
                        .pc_addr(pc_out), 
                        .enable, 
                        .clk, 
                        .rst
    );

    /* ---- ID stage ---- */

    