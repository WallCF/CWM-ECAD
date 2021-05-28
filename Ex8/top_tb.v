//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #8  - Simple End-to-End Design
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex8
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
module top_tb(
	);

//Parameters
parameter CLK_PERIOD = 10;

//Registers and Parameters
wire clk_n;
reg clk_p;
reg [4:0]temperature;
reg err;
reg rst_n;
wire heating;
wire cooling;

//Clock generation
initial begin
clk_p = 1'b0;
forever
#(CLK_PERIOD/2)
clk_p=~clk_p;
end

assign clk_n=~clk_p;

//Logic

initial begin

err = 0;
rst_n=1;
#CLK_PERIOD
if(clk_p!=0)
	begin
	$display("***TEST FAILED! Wrong AC! (0)");
	err = 1;
	end

temperature = 5'b10101; //21
#CLK_PERIOD


forever begin
#CLK_PERIOD
if( (temperature>5'b10100 && heating!=5'b0 ) || (temperature<5'b10100 && cooling!=5'b0 ) )
	begin
	$display("***TEST FAILED! Wrong AC! (1)");
	err = 1;
	end
else if( (temperature<=5'b10010 && heating!=5'b1) || (temperature >=5'b10110 && cooling!=5'b1) )
	begin
	$display("***TEST FAILED! Wrong AC! (2)");
	err=1;
	end
else if( heating == 5'b1 && cooling == 5'b1)
	begin
	$display("***TEST FAILED! Wrong AC! (3)");
	err = 1;
	end
else if((temperature == 5'b10100) && (cooling == 5'b1 || heating == 5'b1))
	begin
	$display("***TEST FAILED! Wrong AC! (4)");
	err = 1;
	end
temperature <= temperature + 5'b1;
if (temperature>5'b11111)
	temperature<=5'b00000;

end
end

//Finish test, check for success
 initial begin
        #500
        if (err==0)
          $display("***TEST PASSED! :) ***");
        $finish;
      end
     
//Logic

//Instantiate counter module
top top1 (
	.clk_p (clk_p),
	.clk_n (clk_n),
	.rst_n (rst_n),
	.temperature_0 (temperature[0]),
	.temperature_1 (temperature[1]),
	.temperature_2 (temperature[2]),
	.temperature_3 (temperature[3]),
	.temperature_4 (temperature[4]),
	.heating (heating),
	.cooling (cooling)
	);

endmodule 
