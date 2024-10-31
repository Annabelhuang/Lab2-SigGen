module sigdelay #(
    parameter   A_WIDTH = 8,
                D_WIDTH = 8
)(
    //interface signal
    input logic [D_WIDTH-1:0]    incr,
    input logic                  rst,
    input logic                  en,
    input logic                  clk,
    input logic [D_WIDTH-1:0]    offset,
    input logic                  wr,
    input logic                  rd,
    input logic                 mic_signal,
    output logic [D_WIDTH-1:0]   delayed_signal,
);

    logic  [A_WIDTH-1:0]        address1;
    counter addrCounter(
        .incr(incr),
        .clk(clk),
        .rst(rst),
        .en(en),
        .count(address1)
    );
    ram2ports sineRam(
        .clk(clk),
        .wr_en(wr),
        .rd_en(rd),
        .rd_addr(address1 +offset),
        .wr_addr(address1),
        .din({(D_WIDTH-1){mic_signal}}),
        .dout(delayed_signal)
    );

endmodule
