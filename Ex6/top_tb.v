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
reg [2:0]colour;
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
err=0;
colour = 3'b0;
#CLK_PERIOD
if(rgb!=24'b0)
	begin
	$display("***TEST FAILED! Wrong colour (1)");
	err = 1;
	end

forever begin
enable = 1;
#CLK_PERIOD
test = rgb;
enable = 0;
colour <= colour+ 3'b001;
#CLK_PERIOD


if(test!=rgb)  //tests the enable function
	begin
	err = 1;
	$display("***TEST FAILED Wrong Colour (2)");
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
Col_Convert top (
	.enable (enable),
	.colour (colour),
	.rgb (rgb),
	.clk (clk)
	);

endmodule 

