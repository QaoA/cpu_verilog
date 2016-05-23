`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:57:37 04/24/2016 
// Design Name: 
// Module Name:    pipe_noDataHazards_cpu 
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
module pipe_noDataHazards_cpu(clrn,clk,pc,aluOut,memOut
    );
	input clrn,clk;
	output [31:0] pc,aluOut,memOut;
	 
	wire IFwip;
	wire [31:0] IFinst;
	wire [31:0] MEMjumpPc;
	wire IDwillJump;
	wire [31:0] IFp4;
//									IFwip,clk,clrn,jump_pc,will_jump,
//									  inst,pc,p4
	pipe_noDataHazards_IF IF(IFwip,clk,clrn,MEMjumpPc,IDwillJump,
										IFinst,pc,IFp4);
	 
	wire EXwreg,EXm2reg,MEMwreg,WBwreg;
	wire [4:0] EXwn,MEMwn,WBwn;
	wire [31:0] WBdata;
	wire IDwreg,IDm2reg,IDwmem;
	wire [1:0] IDselectAlua,IDselectAlub;
	wire [3:0] IDaluc;
	wire [4:0] IDwn;
	wire [31:0] IDqa,IDqb;
	wire [31:0] IDsaOrImme;
	wire [1:0] IDisStoreHazards;
	wire MEMm2reg;
	wire [1:0] MEMjumpType;
	wire MEMzero;
	wire [1:0] IDjumpType;
	wire [31:0] IDjumpPc;

										//clk,clrn,IFinst,EXwn,MEMwn,WBwn,EXm2reg,EXwreg,MEMwreg,MEMm2reg,WBwreg,WBdata,MEMjumpType,MEMzero,IFp4,
									  //IFwip,IDwreg,IDm2reg,IDwmem,IDaluc,IDselectAlua,IDselectAlub,IDisStoreHazards,IDwn,IDqa,IDqb,IDsaOrImme,IDwillJump,IDjumpType,IDjumpPc
	pipe_noDataHazards_ID ID(clk,clrn,IFinst,EXwn,MEMwn,WBwn,EXm2reg,EXwreg,MEMwreg,MEMm2reg,WBwreg,WBdata,MEMjumpType,MEMzero,IFp4,
										IFwip,IDwreg,IDm2reg,IDwmem,IDaluc,IDselectAlua,IDselectAlub,IDisStoreHazards,IDwn,IDqa,IDqb,IDsaOrImme,IDwillJump,IDjumpType,IDjumpPc);
										
	wire [31:0] MEMaluResult;
	wire EXwmem;
	wire [31:0] EXaluResult,EXdi;
	wire [1:0]EXisStoreHazards;
	wire [1:0] EXjumpType;
	wire [31:0] EXjumpPc;
	wire EXzero;
	
									//IDwreg,IDm2reg,IDwmem,IDaluc,IDselectAlua,IDselectAlub,IDisStoreHazards,IDwn,IDqa,IDqb,IDsaOrImme,MEMaluResult,WBdata,clk,clrn,IDjumpType,IDjumpPc,WBdata,
								// EXwreg,EXm2reg,EXwmem,EXwn,EXaluResult,EXdi,EXjumpType,EXjumpPc,EXzero
	pipe_noDataHazards_EX EX(IDwreg,IDm2reg,IDwmem,IDaluc,IDselectAlua,IDselectAlub,IDisStoreHazards,IDwn,IDqa,IDqb,IDsaOrImme,MEMaluResult,WBdata,clk,clrn,IDjumpType,IDjumpPc,WBdata,
									EXwreg,EXm2reg,EXwmem,EXwn,EXaluResult,EXdi,EXjumpType,EXjumpPc,EXzero);
							  
	wire [31:0] MEMmemOut;
	wire [31:0] WBmemOut;
	
									//	EXwreg,EXm2reg,EXwmem,EXwn,EXaluResult,EXdi,WBdata,clk,clrn,EXjumpType,EXjumpPc,EXzero,
									//	MEMwreg,MEMm2reg,MEMwn,MEMaluResult,MEMmemOut,MEMjumpType,MEMjumpPc,MEMzero
	pipe_noDataHazards_MEM MEM(EXwreg,EXm2reg,EXwmem,EXwn,EXaluResult,EXdi,WBdata,clk,clrn,EXjumpType,EXjumpPc,EXzero,
										MEMwreg,MEMm2reg,MEMwn,MEMaluResult,MEMmemOut,MEMjumpType,MEMjumpPc,MEMzero);

	
	pipe_noDataHazards_WB WB(MEMwreg,MEMm2reg,MEMwn,MEMaluResult,MEMmemOut,clk,clrn,
									 WBwreg,WBwn,WBdata);
							 
	assign aluOut = EXaluResult;
	assign memOut = MEMmemOut;					 
endmodule
