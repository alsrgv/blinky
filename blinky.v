`timescale 1ns / 1ps

module blinky(
    input clk,
    output led
);

parameter freq_hz = 1;

reg [27:0] count = 0;
reg state = 0;

assign led = state;

always @ (posedge(clk))
    if (count + 1 < 62500000 / freq_hz)
        count <= count + 1;
    else
    begin
        count <= 0;
        state <= ~state;
    end

endmodule
