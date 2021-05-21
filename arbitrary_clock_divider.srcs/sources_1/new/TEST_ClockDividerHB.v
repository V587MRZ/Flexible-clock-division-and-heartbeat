`timescale 1ns / 1ps

module TEST_ClockDividerHB();
reg clk; 
initial begin 
clk=0;
forever #5 clk=~clk; //clock generation with period 10ns (100MHz)
end
reg reset, enable;
wire dividedClk, beat;

ClockDividerHB #(
.THRESHOLD(50_000)
) UUT (
.clk(clk),
.reset(reset),
.enable(enable),
.dividedClk(dividedClk),
.beat(beat)
);
initial begin // simulation inputs to block
    reset=0;
    enable=0;
    #100 enable=1;
    #100 enable=0;
    #50 reset=1;
    enable=1;
    #20 reset=0;
end
endmodule
