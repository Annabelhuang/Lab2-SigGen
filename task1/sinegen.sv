module sinegen #(
    parameter   A_WIDTH = 8,
                D_WIDTH = 8
)(
    //interface signal
    input logic [D_WIDTH-1:0]    incr,
    input logic                  rst,
    input logic                  en,
    input logic                  clk,
    output logic [D_WIDTH-1:0]   dout,
);

    logic  [A_WIDTH-1:0]        address;
    counter addrCounter(
        .incr(incr),
        .clk(clk),
        .rst(rst),
        .en(en),
        .count(address)
    );
    rom sineRom(
        .clk(clk),
        .addr(address),
        .dout(dout)
    );

endmodule
