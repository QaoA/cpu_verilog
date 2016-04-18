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
module pipe_MEM(EXwreg,EXm2reg,EXwmem,EXwn,EXaluResult,EXdi,clrn,clk,
					MEMwreg,MEMm2reg,MEMwn,MEMaluResult,MEMmemOut
    );
	 
	 input EXwreg,EXm2reg,EXwmem;
	 input [4:0] EXwn;
	 input [31:0] EXaluResult,EXdi;
	 input clrn,clk;
	 
	 output MEMwreg,MEMm2reg;
	 output [4:0] MEMwn;
	 output [31:0] MEMaluResult,MEMmemOut;
	 
	 wire wmem;
	 wire [31:0] di;
	 EX_MEM_reg ex_to_mem_reg(.EXwreg(EXwreg),.EXm2reg(EXm2reg),.EXwmem(EXwmem),.EXwn(EXwn),.aluResult(EXaluResult),.EXqb(EXdi),.clrn(clrn),.clk(clk),
										.MEMwreg(MEMwreg),.MEMm2reg(MEMm2reg),.MEMwmem(wmem),.MEMwn(MEMwn),.MEMaluResult(MEMaluResult),.MEMdi(di));

	// wire [31:0] memOut;
	 IP_RAM data_mem(.we(wmem),.addr(MEMaluResult),.datain(di),.clk(clk),.dataout(MEMmemData));
	 
	// MEM_WB_reg mem_to_wb_reg(.MEMwreg(MEMwreg),.MEMm2reg(MEMm2reg),.MEMwn(MEMwn),.MEMaluResult(MEMaluResult),.MEMmemOut(memOut),.clrn(clrn),.clk(clk),
	//									.WBwreg(WBwreg),.WBm2reg(WBm2reg),.WBwn(WBwn),.WBaluResult(WBaluResult),.WBmemOut(WBmemOut));
										
endmodule
