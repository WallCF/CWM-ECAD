//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #7 - Lights Selector
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex7 - Lights Selector
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps
module top_tb ();


//Parameters
parameter CLK_PERIOD = 10;

//Registers and Parameters
reg clk;
reg sel;
reg rst;
reg button;
reg err;
wire [23:0]light;
reg [23:0]prev_light;


//Clock generation
initial begin
clk = 1'b0;
forever
#(CLK_PERIOD/2) clk=~clk;
end

//Logic
initial begin
sel = 0;
rst=1;
err=0;
button=0;
if(light!=24'hFFFFFF)
	begin
	$display("***TEST FAILED! Wrong light (1)");
	err=1;
	end
sel=1;
rst=0;
#CLK_PERIOD
prev_light = light;
#CLK_PERIOD
if(prev_light!=light)
	begin
	$display("***TEST FAILED! Wrong light (2)");
	err = 1;
	end
button = 1;

forever begin
prev_light=light;
#CLK_PERIOD
if(prev_light==light)
	begin
	$display("***TEST FAILED! Wrong light (3)");
	err = 1;
	end
end

end

//Finish test, check for success
 initial begin
        #500
        if (err==0)
          $display("***TEST PASSED! :) ***");
        $finish;
      end
//Instantiate
lighting lighting1 (
	.rst (rst),
	.sel (button),
	.button (colour),
	.clk (clk),
	.light (light)
	);


endmodule
