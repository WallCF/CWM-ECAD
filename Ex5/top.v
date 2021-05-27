//////////////////////////////////////////////////////////////////////////////////
// Exercise #5 - Air Conditioning
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to an air conditioning control system
//  According to the state diagram provided in the exercise.
//
//  inputs:
//           clk, temperature [4:0]
//
//  outputs:
//           heating, cooling
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module air_cond (
	input clk,
	input [4:0]temperature,
	output reg heating,
	output reg cooling

		);

always @(posedge clk) begin

if(temperature>=22)
	begin
	cooling=1;
	heating=0;
	end
else if(temperature<=18)
	begin
	cooling=0;
	heating=1;
	end
else if((temperature>=20)&&(heating==5'b1))
	begin
	heating=0;
	cooling=0;
	end
else if((temperature<20)&&(heating==5'b1))
	begin
	heating=1;
	cooling=0;
	end
else if((temperature<=20)&&(cooling==5'b1))
	begin
	cooling=0;
	heating=0;
	end
else if((temperature>20)&&(cooling==5'b1))
	begin
	cooling=1;
	heating=0;
	end

end
endmodule
