//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #6 - RGB Colour Converter
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex6 - RGB Colour Converter
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
	);

//Parameters
parameter CLK_PERIOD = 10;

//Registers and Parameters
reg clk;
reg enable;
reg [2:0]colour
reg err;
wire [23:0]rgb;
reg [23:0]test;


//Clock generation
initial begin
clk = 1'b0;
forever
#(CLK_PERIOD/2) clk=~clk;
end

//Logic
initial begin
enable = 1;
err = 0;
colour = 2'b0;
#CLK_PERIOD
test = rgb;
#CLK_PERIOD
colour <= colour + 24'b1
#CLK_PERIOD

forever begin
if(rgb!=test && enable = 0)
begin
$display("***TEST FAILED! Colour is incorrect (1)");
err = 1;
end

else if(test=rgb && enable = 1)
begin
$display("***TEST FAILED! Colour is incorrect (2)");
err = 1;
end




enable = 0;

#CLK_PERIOD

if(rgb!=test && enable = 0)
begin
$display("***TEST FAILED! Colour is incorrect (3)");
err = 1;
end

else if(test=rgb && enable = 1)
begin
$display("***TEST FAILED! Colour is incorrect (4)");
err = 1;
end


end
end


//Finish test, check for success
 initial begin
        #100
        if (err==0)
          $display("***TEST PASSED! :) ***");
        $finish;
      end
     
//Instantiate counter module
RGB top (
	.enable (enable),
	.colour (colour),
	.rgb (rgb),
	.clk (clk)
	);

endmodule 

