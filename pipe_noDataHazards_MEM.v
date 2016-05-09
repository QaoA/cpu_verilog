`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:48:01 04/23/2016 
// Design Name: 
// Module Name:    pipe_noDataHazards_MEM 
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
module pipe_noDataHazards_MEM(EXwreg,EXm2reg,EXwmem,EXisStoreHazards,EXwn,EXaluResult,EXqb,WBdata,clk,clrn,EXjumpType,EXjumpPc,EXzero,
										MEMwreg,MEMm2reg,MEMwn,MEMaluResult,MEMmemOut,MEMjumpType,MEMjumpPc,MEMzero
    ); 
	input EXwreg,EXm2reg,EXwmem;
	input EXisStoreHazards;
	input [4:0] EXwn;
	input [31:0] EXaluResult,EXqb;
	input [31:0] WBdata;
	input clk,clrn;
	input [1:0] EXjumpType;
	input [31:0] EXjumpPc;
	input EXzero;
	
	output MEMwreg,MEMm2reg;
	output [4:0] MEMwn;
	output [31:0] MEMaluResult,MEMmemOut;
	output [1:0] MEMjumpType;
	output [31:0] MEMjumpPc;
	output MEMzero;
	
	wire wmem;
	wire [31:0] MEMdi;
	wire [31:0] di;
	wire isStoreHazards;
	
//								EXwreg,EXm2reg,EXwmem,EXisStoreHazards,EXwn,aluResult,EXqb,clrn,clk,EXjumpType,EXjumpPc,EXzero,
//								MEMwreg,MEMm2reg,MEMwmem,MEMisStoreHazards,MEMwn,MEMaluResult,MEMdi,MEMjumpType,MEMjumpPc,MEMzero
	EX_MEM_reg ex_mem_reg(EXwreg,EXm2reg,EXwmem,EXisStoreHazards,EXwn,EXaluResult,EXqb,clrn,clk,EXjumpType,EXjumpPc,EXzero,
								MEMwreg,MEMm2reg,wmem,isStoreHazards,MEMwn,MEMaluResult,MEMdi,MEMjumpType,MEMjumpPc,MEMzero);
	mux2x32 select_di(MEMdi,WBdata,isStoreHazards,di);
	IP_RAM data_mem(wmem,MEMaluResult,di,clk,MEMmemOut);
endmodule
