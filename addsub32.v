`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:51:15 03/21/2016 
// Design Name: 
// Module Name:    addsub32 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module addsub32(
	input [31:0] A,
	input [31:0] B,
	input 		 sub,
	output [31:0] Result
    );
	cla32 as32(A,B^{32{sub}},sub,Result);
endmodule
