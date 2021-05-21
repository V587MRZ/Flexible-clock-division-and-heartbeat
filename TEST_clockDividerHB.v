`timescale 1ns / 1ps

module TEST_clockDividerHB();

reg clk; 

initial begin 
    clk=0;
    forever #5 clk=~clk; //clock generation with period 10ns (100MHz)
end

wire dividedClk, beat;
reg reset, enable;

ClockDividerHB #(.THRESHOLD(50_000)) UUT (.clk(clk),.reset(reset),.enable(enable),.dividedClk(dividedClk),.beat(beat)); //instantiation of module to test

initial begin
    reset = 1; // assert reset at beginning 
    enable = 0;
    #100 enable = 1;
    #20 reset = 0;
end

endmodule

