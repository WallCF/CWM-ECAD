//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #5 - Air Conditioning
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex5 - Air Conditioning
// You need to write the whole file`timescale 1ns / 100ps

module top_tb(
	);

//Parameters
parameter CLK_PERIOD = 10;

//Registers and Parameters
reg clk;
reg temperature;
reg err;
wire heating;
wire cooling;

//Clock generation
initial begin
clk = 1'b0;
forever
#(CLK_PERIOD/2) clk=~clk;
end

//Logic
initial begin

err = 0;
temperature = 20;


forever begin
#CLK_PERIOD
if( (temperature>20 && heating!=5'b0 ) || (temperature<20 && cooling!=5'b0 ) )
	begin
	$display("***TEST FAILED! Wrong AC! (1)");
	err = 1;
	end
else if( (temperature<=18 && heating!=5'b1) || (temperature >=22 && cooling!=5'b1) )
	begin
	$display("***TEST FAILED! Wrong AC! (2)");
	err=0;
	end
temperature = temperature + 1;
if (temperature >=40)
	temperature = 0;


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
air_cond top (
	.temperature (temperature),
	.cooling (cooling),
	.heating (heating),
	.clk (clk)
	);

endmodule 
//////////////////////////////////////////////////////////////////////////////////
