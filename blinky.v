`timescale 1ns / 1ps

module blinky(
    input clk,
    output led
);

parameter cycle_freq_hz = 1;
parameter clock_freq_hz = 125000000;

localparam clocks_per_cycle = clock_freq_hz / cycle_freq_hz;
localparam on_clocks_per_cycle = clocks_per_cycle / 10;
localparam off_clocks_per_cycle = clocks_per_cycle * 9 / 10;

reg signed [27:0] count = -1;
reg state = 1;

assign led = state;

always @ (posedge(clk))
    if (state == 1 && count + 1 >= on_clocks_per_cycle ||
        state == 0 && count + 1 >= off_clocks_per_cycle)
    begin
        count <= 0;
        state <= ~state;
    end
    else
        count <= count + 1;

endmodule
