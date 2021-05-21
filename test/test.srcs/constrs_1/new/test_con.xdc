#clk,enable,reset,dividedClk);
set_property -dict {PACKAGE_PIN W5 IOSTANDARD LVCMOS33} [get_ports clk]
create_clock -period 10.00 [get_ports clk]
set_property -dict {PACKAGE_PIN R2 IOSTANDARD LVCMOS33} [get_ports  enable]
set_property -dict {PACKAGE_PIN U18 IOSTANDARD LVCMOS33} [get_ports  reset]
set_property -dict {PACKAGE_PIN L1 IOSTANDARD LVCMOS33} [get_ports  dividedClk]