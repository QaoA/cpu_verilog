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
	 
	//IFwip,clk,clrn,
	//inst,pc
	wire IFwip;
	wire [31:0] IFinst;
	pipe_noDataHazards_IF IF(IFwip,clk,clrn,IFinst,pc);
	 
	wire EXwreg,EXm2reg,MEMwreg,WBwreg;
	wire [4:0] EXwn,MEMwn,WBwn;
	wire [31:0] WBdata;
	wire IDwreg,IDm2reg,IDwmem;
	wire [1:0] IDselectAlua,IDselectAlub;
	wire [3:0] IDaluc;
	wire [4:0] IDwn;
	wire [31:0] IDqa,IDqb;
	wire [31:0] IDsaOrImme;
	//								 clk,clrn,IFinst,EXwn,MEMwn,WBwn,EXm2reg,EXwreg,MEMwreg,WBwreg,WBdata,
	//								   IFwip,IDwreg,IDm2reg,IDwmem,IDaluc,IDselectAlua,IDselectAlub,IDwn,IDqa,IDqb,IDsaOrImme
	pipe_noDataHazards_ID ID(clk,clrn,IFinst,EXwn,MEMwn,WBwn,EXm2reg,EXwreg,MEMwreg,WBwreg,WBdata,
										IFwip,IDwreg,IDm2reg,IDwmem,IDaluc,IDselectAlua,IDselectAlub,IDwn,IDqa,IDqb,IDsaOrImme);
										
	wire [31:0] MEMaluResult;
	wire EXwmem;
	wire [31:0] EXaluResult,EXqb;
		//							 IDwreg,IDm2reg,IDwmem,IDaluc,IDselectAlua,IDselectAlub,IDwn,IDqa,IDqb,IDsaOrImme,MEMaluResult,WBdata,clk,clrn,
	//								EXwreg,EXm2reg,EXwmem,EXwn,EXaluResult,EXqb
	pipe_noDataHazards_EX EX(IDwreg,IDm2reg,IDwmem,IDaluc,IDselectAlua,IDselectAlub,IDwn,IDqa,IDqb,IDsaOrImme,MEMaluResult,WBdata,clk,clrn,
									EXwreg,EXm2reg,EXwmem,EXwn,EXaluResult,EXqb);
							  
	wire MEMm2reg;
	wire [31:0] MEMmemOut;
		//								EXwreg,EXm2reg,EXwmem,EXwn,EXaluResult,EXqb,clk,clrn,
	//									MEMwreg,MEMm2reg,MEMwn,MEMaluResult,MEMmemOut
	pipe_noDataHazards_MEM MEM(EXwreg,EXm2reg,EXwmem,EXwn,EXaluResult,EXqb,clk,clrn,
										MEMwreg,MEMm2reg,MEMwn,MEMaluResult,MEMmemOut);

	//								 MEMwreg,MEMm2reg,MEMwn,MEMaluResult,MEMmemOut,clk,clrn,
	//								  WBwreg,WBwn,WBdata
	pipe_noDataHazards_WB WB(MEMwreg,MEMm2reg,MEMwn,MEMaluResult,MEMmemOut,clk,clrn,
									 WBwreg,WBwn,WBdata);
							 
	assign aluOut = EXaluResult;
	assign memOut = MEMmemOut;					 
endmodule
