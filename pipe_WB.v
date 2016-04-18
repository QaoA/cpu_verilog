`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:08:31 04/18/2016 
// Design Name: 
// Module Name:    pipe_WB 
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
module pipe_WB(MEMwreg,MEMm2reg,MEMwn,MEMaluResult,MEMmemOut,clrn,clk,
					WBwreg,WBdata,WBwn
    );
	input MEMwreg,MEMm2reg;
	input [4:0] MEMwn;
	input [31:0] MEMaluResult,MEMmemOut;
	input clrn,clk;
	
	output [31:0] WBdata;
	output WBwreg;
	output [4:0] WBwn;
	
	wire m2reg;
	wire [31:0] aluResult,memOut;
	MEM_WB_reg mem_to_wb_reg(.MEMwreg(MEMwreg),.MEMm2reg(MEMm2reg),.MEMwn(MEMwn),.MEMaluResult(MEMaluResult),.MEMmemOut(MEMmemOut),.clrn(clrn),.clk(clk),
   								.WBwreg(WBwreg),.WBm2reg(m2reg),.WBwn(WBwn),.WBaluResult(aluResult),.WBmemOut(memOut));
	
	mux2x32 wb_data_select(aluResult,memOut,m2reg,WBdata);
endmodule
