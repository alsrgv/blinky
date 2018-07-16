`timescale 1ns / 1ps

module blinky(
    input clk,
    output led
    );

reg [27:0] count = 0;
reg state = 0;

assign led = state;

always @ (posedge(clk))
    if (count < 62500000)
        count <= count + 1;
    else
    begin
        count <= 0;
        state <= ~state;
    end

endmodule
