`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:52:58 04/23/2016 
// Design Name: 
// Module Name:    pipe_inst_reg 
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
module pipe_inst_reg(newInst,oldInst,clk,clrn,wir
    );
	 input [31:0] newInst;
	 output [31:0] oldInst;
	 input clk,clrn;
	 input wir;

	  reg [31:0] oldInst;
	  always @(negedge clrn or posedge clk)
			if(clrn == 0)
				begin
					oldInst <= 0;
				end
			else
				begin
					if(wir)
					oldInst <= newInst;
				end
		initial
			begin
				oldInst = 0;
			end
endmodule
