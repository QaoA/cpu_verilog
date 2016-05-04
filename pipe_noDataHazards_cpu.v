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
	wire IDisStoreHazards;
	wire MEMm2reg;
	
	pipe_noDataHazards_ID ID(clk,clrn,IFinst,EXwn,MEMwn,WBwn,EXm2reg,EXwreg,MEMwreg,MEMm2reg,WBwreg,WBdata,
										IFwip,IDwreg,IDm2reg,IDwmem,IDaluc,IDselectAlua,IDselectAlub,IDisStoreHazards,IDwn,IDqa,IDqb,IDsaOrImme);
										
	wire [31:0] MEMaluResult;
	wire EXwmem;
	wire [31:0] EXaluResult,EXqb;
	wire EXisStoreHazardsEXwn;
	
	pipe_noDataHazards_EX EX(IDwreg,IDm2reg,IDwmem,IDaluc,IDselectAlua,IDselectAlub,IDisStoreHazards,IDwn,IDqa,IDqb,IDsaOrImme,MEMaluResult,WBdata,clk,clrn,
									EXwreg,EXm2reg,EXwmem,EXisStoreHazards,EXwn,EXaluResult,EXqb);
							  
	wire [31:0] MEMmemOut;
	wire [31:0] WBmemOut;
	
	pipe_noDataHazards_MEM MEM(EXwreg,EXm2reg,EXwmem,EXisStoreHazards,EXwn,EXaluResult,EXqb,WBdata,clk,clrn,
										MEMwreg,MEMm2reg,MEMwn,MEMaluResult,MEMmemOut);

	
	pipe_noDataHazards_WB WB(MEMwreg,MEMm2reg,MEMwn,MEMaluResult,MEMmemOut,clk,clrn,
									 WBwreg,WBwn,WBdata);
							 
	assign aluOut = EXaluResult;
	assign memOut = MEMmemOut;					 
endmodule
