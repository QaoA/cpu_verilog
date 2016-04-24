`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:24:01 04/23/2016 
// Design Name: 
// Module Name:    pipe_noDataHazards_WB 
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
module pipe_noDataHazards_WB(MEMwreg,MEMm2reg,MEMwn,MEMaluResult,MEMmemOut,clk,clrn,
									  WBwreg,WBwn,WBdata
    );
	 input MEMwreg,MEMm2reg;
	 input [4:0] MEMwn;
	 input [31:0] MEMaluResult,MEMmemOut;
	 input clk,clrn;
	 
	 output WBwreg;
	 output [4:0] WBwn;
	 output [31:0] WBdata;
	 
	 wire m2reg;
	 wire [4:0] wn;
	 wire [31:0] aluResult,memOut;
	 MEM_WB_reg mem_wb_reg(MEMwreg,MEMm2reg,MEMwn,MEMaluResult,MEMmemOut,clrn,clk,
									WBwreg,m2reg,WBwn,aluResult,memOut);
	 mux2x32 select_WBdata(aluResult,memOut,m2reg,WBdata);
endmodule
