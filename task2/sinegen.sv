module sinegen #(
    parameter   A_WIDTH = 8,
                D_WIDTH = 8
)(
    //interface signal
    input logic [D_WIDTH-1:0]    incr,
    input logic                  rst,
    input logic                  en,
    input logic                  clk,
    input logic                  offset,
    output logic [D_WIDTH-1:0]   dout1,
    output logic [D_WIDTH-1:0]   dout2,
);

    logic  [A_WIDTH-1:0]        address1;
    counter addrCounter(
        .incr(incr),
        .clk(clk),
        .rst(rst),
        .en(en),
        .count(address1)
    );
    rom2port sineRom(
        .clk(clk),
        .addr1(address1),
        .addr2(address1 + offset),
        .dout1(dout1),
        .dout2(dout2)
    );

endmodule
