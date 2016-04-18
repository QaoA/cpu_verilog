`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:50:44 04/18/2016 
// Design Name: 
// Module Name:    pipe_MEM 
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
module pipe_MEM(MEMwreg,MEMm2reg,MEMwmem,MEMwn,MEMaluResult,MEMdi,clrn,clk,
					WBwreg,WBm2reg,WBwn,WBaluResult,WBmemOut
    );
	 
	 input MEMwreg,MEMm2reg,MEMwmem;
	 input [4:0] MEMwn;
	 input [31:0] MEMaluResult,MEMdi;
	 input clrn,clk;
	 
	 output WBwreg,WBm2reg;
	 output [4:0] WBwn;
	 output [31:0] WBaluResult,WBmemOut;
	 
	 wire [31:0] memOut;
	 IP_RAM data_mem(.we(MEMwmem),.addr(MEMaluResult),.datain(MEMdi),.clk(clk),.dataout(memData));
	 
	 MEM_WB_reg mem_to_wb_reg(.MEMwreg(MEMwreg),.MEMm2reg(MEMm2reg),.MEMwn(MEMwn),.MEMaluResult(MEMaluResult),.MEMmemOut(memOut),.clrn(clrn),.clk(clk),
										.WBwreg(WBwreg),.WBm2reg(WBm2reg),.WBwn(WBwn),.WBaluResult(WBaluResult),.WBmemOut(WBmemOut));
										
	 


endmodule
