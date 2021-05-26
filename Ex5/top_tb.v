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

#CLK_PERIOD
forever begin

if(((temperature>20)&&(heating!=5'b0))||((temperature<20)&&(cooling!=5'b0)))
	begin
	$display("***TEST FAILED! Wrong AC! (1)");
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
air_cond top (
	.temperature (temperature),
	.cooling (cooling),
	.heating (heating),
	.clk (clk)
	);

endmodule 
//////////////////////////////////////////////////////////////////////////////////
