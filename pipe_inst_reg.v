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
module pipe_inst_reg(newInst,clk,clrn,wir,p4,
							oldInst,IDp4
    );
	 input [31:0] newInst;
	 input [31:0] p4;
	 input clk,clrn;
	 input wir;
	 output [31:0] oldInst;
	 output [31:0] IDp4;

	  reg [31:0] oldInst;
	  reg [31:0] IDp4;
	  always @(negedge clrn or posedge clk)
			if(clrn == 0)
				begin
					oldInst <= 0;
					IDp4 <= 0;
				end
			else
				begin
					if(wir)
						begin
						oldInst <= newInst;
						IDp4 <= p4;
						end
				end
		initial
			begin
				oldInst = 0;
				IDp4 = 0;
			end
endmodule
