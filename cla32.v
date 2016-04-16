`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:30:31 03/21/2016 
// Design Name: 
// Module Name:    cla32 
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
module cla32(a,b,ci,s
    );
	 input [31:0] a,b;
	 input ci;
	 output [31:0] s;
	 assign s = a + b + ci;
endmodule
