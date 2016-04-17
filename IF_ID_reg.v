`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:28:51 04/16/2016 
// Design Name: 
// Module Name:    IF_ID_reg 
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
module IF_ID_reg(newInst,oldInst,clk,clrn
    );
	 input [31:0] newInst;
	 output [31:0] oldInst;
	 input clk,clrn;

	  reg [31:0] oldInst;
	  always @(negedge clrn or posedge clk)
			if(clrn == 0)
				begin
					oldInst <= 0;
				end
			else
				begin
					oldInst <= newInst;
				end
				
		initial
			begin
				oldInst = 0;
			end
endmodule
