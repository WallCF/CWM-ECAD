//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #3 - Active IoT Devices Monitor
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex3 - Active IoT Devices Monitor
// Guidance: start with simple tests of the module (how should it react to each 
// control signal?). Don't try to test everything at once - validate one part of 
// the functionality at a time.
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
	);

//Parameters
parameter CLK_PERIOD = 10;

//Registers and Parameters
reg clk;
reg rst;
reg on_off;
reg change;
reg err;
wire [7:0]counter_out;
reg [7:0]prev_counter_out;

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
change = 0;
on_off = 1;
prev_counter_out = 0;
#CLK_PERIOD


forever begin
prev_counter_out = counter_out;
#CLK_PERIOD
if((counter_out!=0)&&(rst==1))
	begin
	$display("***TEST FAILED! Counter Wrong! (1)");
	err = 1;
	end
else if((counter_out!=prev_counter_out)&&(change==0)&&(rst==0))
	begin
	$display("***TEST FAILED! Counter wrong! (2)");
	err = 1;
	end
else if((counter_out!=prev_counter_out+1)&&(change==1)&&(rst==0)&&(on_off==1))
	begin
	$display("***TEST FAILED! Counter wrong! (3)");
	err = 1;
	end
else if((counter_out!=prev_counter_out-1)&&(change==1)&&(rst==0)&&(on_off==0))
	begin
	$display("***TEST FAILED! Counter wrong! (4)",rst," ",counter_out," ",prev_counter_out," ",change," ",on_off);
	err = 1;
	end





rst = 0;
prev_counter_out = counter_out;
#CLK_PERIOD
if((counter_out!=0)&&(rst==1))
	begin
	$display("***TEST FAILED! Counter Wrong! (5)");
	err = 1;
	end
else if((counter_out!=prev_counter_out)&&(change==0)&&(rst==0))
	begin
	$display("***TEST FAILED! Counter wrong! (6)");
	err = 1;
	end
else if((counter_out!=prev_counter_out+1)&&(change==1)&&(rst==0)&&(on_off==1))
	begin
	$display("***TEST FAILED! Counter wrong! (7)");
	err = 1;
	end
else if((counter_out!=prev_counter_out-1)&&(change==1)&&(rst==1)&&(on_off==0))
	begin
	$display("***TEST FAILED! Counter wrong! (8)");
	err = 1;
	end

change = 1;
prev_counter_out = counter_out;
#CLK_PERIOD
if((counter_out!=0)&&(rst==1))
	begin
	$display("***TEST FAILED! Counter Wrong! (9)");
	err = 1;
	end
else if((counter_out!=prev_counter_out)&&(change==0)&&(rst==0))
	begin
	$display("***TEST FAILED! Counter wrong! (10)");
	err = 1;
	end
else if((counter_out!=prev_counter_out+1)&&(change==1)&&(rst==0)&&(on_off==1))
	begin
	$display("***TEST FAILED! Counter wrong! (11)");
	err = 1;
	end
else if((counter_out!=prev_counter_out-1)&&(change==1)&&(rst==0)&&(on_off==0))
	begin
	$display("***TEST FAILED! Counter wrong! (12)");
	err = 1;
	end

on_off = 0;
prev_counter_out = counter_out;
#CLK_PERIOD
if((counter_out!=0)&&(rst==1))
	begin
	$display("***TEST FAILED! Counter Wrong! (13)");
	err = 1;
	end
else if((counter_out!=prev_counter_out)&&(change==0)&&(rst==0))
	begin
	$display("***TEST FAILED! Counter wrong! (14)");
	err = 1;
	end
else if((counter_out!=prev_counter_out+1)&&(change==1)&&(rst==0)&&(on_off==1))
	begin
	$display("***TEST FAILED! Counter wrong! (15)");
	err = 1;
	end
else if((counter_out!=prev_counter_out-1)&&(change==1)&&(rst==0)&&(on_off==0))
	begin
	$display("***TEST FAILED! Counter wrong! (16)");
	err = 1;
	end

end
end


//Finish test, check for success
 initial begin
        #50
        if (err==0)
          $display("***TEST PASSED! :) ***");
        $finish;
      end
     
//Instantiate counter module
monitor top (
	.rst (rst),
	.change (change),
	.on_off (on_off),
	.clk (clk),
	.counter_out (counter_out)
	);

endmodule  
