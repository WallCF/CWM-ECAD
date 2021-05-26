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
    
//Todo: Parameters
parameter CLK_PERIOD = 10;
//Todo: Regitsers and wires
reg clk;
reg rst;
reg change;
reg on_off;
reg err;
wire [7:0]counter_out;
reg [7:0]previous_counter_out;

//Todo: Clock generation
initial begin
clk = 1'b0;
forever
#(CLK_PERIOD/2) clk=~clk;
end

//Todo: User logic
initial begin

err = 0;
rst = 1;
change = 0;
on_off = 1;

forever begin
#(5*CLK_PERIOD)

if(counter_out!=1'b0)
begin
$display("***TEST FAILED! for rst = 1, counter_out does not equal 0");
err = 1;
end


rst = 0;

previous_counter_out = counter_out;
#CLK_PERIOD	
if(counter_out!=previous_counter_out)
begin
$display("***TEST FAILED! There is change for change = 0");
err = 1;
end


change = 1;
forever begin
previous_counter_out = counter_out;
#CLK_PERIOD

if(counter_out!=previous_counter_out + 8'b1)
begin
$display("***TEST FAILED! Counter does not count up for on_off = 1");
err = 1;
end

end




change = 1;
on_off=0;
forever begin
previous_counter_out = counter_out;
#CLK_PERIOD

if(counter_out!=previous_counter_out - 8'b1)
begin
$display("***TEST FAILED! Counter does not count down for on_off = 0");
err = 1;
end

end


end
end
//Todo: Finish test, check for success
 initial begin
        #500
        if (err==0)
          $display("***TEST PASSED! :) ***");
        $finish;
      end
     
//Todo: Instantiate counter module
monitor top (
	.rst (rst),
	.change (change),
	.on_off (on_off),
	.clk (clk),
	.counter_out (counter_out)
	);

endmodule 
