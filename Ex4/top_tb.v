//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #4 - Dynamic LED lights
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex4 - Dynamic LED lights
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
	);

//Parameters
parameter CLK_PERIOD = 10;

//Registers and Parameters
reg clk;
reg rst;
reg button;
reg err;
wire [2:0]colour;
reg [2:0]prev_colour;

//Clock generation
initial begin
clk = 1'b0;
forever
#(CLK_PERIOD/2) clk=~clk;
end


//User logic
initial begin

err = 0;
rst = 1;
button = 0;
prev_colour = 1;
#CLK_PERIOD
rst = 0;

forever begin
prev_colour = colour;
#CLK_PERIOD


if(colour>3'b111)
	begin
	$display("***TEST FAILED! Wrong Colour! (1)");
	err = 1;
	end

else if((colour!=prev_colour+1)&&(button==1)&&(rst==0)&&(prev_colour!=3'b110))
	begin
	$display("***TEST FAILED! Wrong Colour! (2)");
	err = 1;
	end

else if((colour!=prev_colour)&&(button==0)&&(rst==0))
	begin
	$display("***TEST FAILED! Wrong Colour! (3)");
	err = 1;
	end
else if((colour!=3'b001)&&(prev_colour==3'b110)&&(button==1))
	begin
	$display("***TEST FAILED! Wrong Colour! (3.5)");
	err = 1;
	end

else if((colour!=3'b001)&&(rst==1))
	begin
	$display("***TEST FAILED! Wrong Colour! (4)");
	err = 1;
	end
else if((colour==3'b000)||(colour==3'b111))
	begin
	$display("***TEST FAILED! Wrong Colour! (5)");
	err = 1;
	end
     

button = 1;

if(colour>=3'b111)
	begin
	$display("***TEST FAILED! Wrong Colour! (6)");
	err = 1;
	end
else if((colour!=prev_colour+1)&&(button==1)&&(rst==0)&&(colour!=3'b110))
	begin
	$display("***TEST FAILED! Wrong Colour! (7)");
	err = 1;
	end
else if((colour!=3'b001)&&(prev_colour==3'b110)&&(button==1))
	begin
	$display("***TEST FAILED! Wrong Colour! (7.5)");
	err = 1;
	end
else if((colour!=prev_colour)&&(button==0)&&(rst==0))
	begin
	$display("***TEST FAILED! Wrong Colour! (8)");
	err = 1;
	end
else if((colour!=3'b001)&&(rst==1))
	begin
	$display("***TEST FAILED! Wrong Colour! (9)");
	err = 1;
	end
else if((colour==3'b000)||(colour==3'b111))
	begin
	$display("***TEST FAILED! Wrong Colour! (10)");
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
     
//Instantiate counter module
lighting top (
	.rst (rst),
	.button (button),
	.colour (colour),
	.clk (clk)
	);

endmodule 

