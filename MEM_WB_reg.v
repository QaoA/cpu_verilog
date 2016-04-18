`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:12:40 04/16/2016 
// Design Name: 
// Module Name:    MEM_WB_reg 
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
module MEM_WB_reg(MEMwreg,MEMm2reg,MEMwn,MEMaluResult,MEMmemOut,clrn,clk,
						WBwreg,WBm2reg,WBwn,WBaluResult,WBmemOut
    );
	input MEMwreg,MEMm2reg;
	input [4:0] MEMwn;
	input [31:0] MEMaluResult,MEMmemOut;
	input clrn,clk;
	
	output WBwreg,WBm2reg;
	output [4:0] WBwn;
	output [31:0] WBaluResult,WBmemOut;
	
	reg WBwreg,WBm2reg;
	reg [4:0] WBwn;
	reg [31:0] WBaluResult,WBmemOut;

	always @(negedge clrn or posedge clk)
		if(clrn == 0)
			begin
				WBwreg <= 0;
				WBm2reg <= 0;
				WBwn <= 0;
				WBaluResult <= 0;
				WBmemOut <= 0;
			end
		else
			begin
				WBwreg <= MEMwreg;
				WBm2reg <= MEMm2reg;
				WBwn <= MEMwn;
				WBaluResult <= MEMaluResult;
				WBmemOut <= MEMmemOut;
			end
			
		initial
			begin
				WBwreg = 0;
				WBm2reg = 0;
				WBwn = 0;
				WBaluResult = 0;
				WBmemOut = 0;
			end
endmodule
