//////////////////////////////////////////////////////////////////////////////////
// Exercise #4 - Dynamic LED lights
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to design a LED based lighting solution, 
//  following the diagram provided in the exercises documentation. The lights change 
//  as long as a button is pressed, and stay the same when it is released. 
//
//  inputs:
//           clk, rst, button
//
//  outputs:
//           colour [2:0]
//
//  You need to write the whole file.

`timescale 1ns / 100ps

module lighting (

	//ports
	input clk,
	input rst,
	input button,
	output reg [2:0]colour

	);

// logic

always @(posedge clk) begin

if(rst==1)
	colour <= 3'b001;
else if((colour<=6)&&(button==1))
	colour <= colour + 3'b1;
	
else if (((colour==3'b110)&&(button==1))||(colour==3'b111))
	colour <= 3'b001;
else

colour <= colour;

end

endmodule
//////////////////////////////////////////////////////////////////////////////////

