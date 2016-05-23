`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:42:43 04/23/2016 
// Design Name: 
// Module Name:    pipe_noDataHazards_EX 
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
module pipe_noDataHazards_EX(IDwreg,IDm2reg,IDwmem,IDaluc,IDselectAlua,IDselectAlub,IDisStoreHazards,IDwn,IDqa,IDqb,IDsaOrImme,MEMaluResult,WBdata,clk,clrn,IDjumpType,IDjumpPc,WBdata,
										EXwreg,EXm2reg,EXwmem,EXwn,EXaluResult,EXdi,EXjumpType,EXjumpPc,EXzero
    );
	 
	 input IDwreg,IDm2reg,IDwmem;
	 input [1:0] IDisStoreHazards;
	 input [3:0] IDaluc;
	 input [1:0] IDselectAlua,IDselectAlub;
	 input [4:0] IDwn;
	 input [31:0] IDqa,IDqb;
	 input [31:0] IDsaOrImme;
	 input [31:0] MEMaluResult;
	 input clk,clrn;
	 input [1:0] IDjumpType;
	 input [31:0] IDjumpPc;
	 input [31:0] WBdata;
	 
	 output EXwreg,EXm2reg,EXwmem;
	 output [4:0] EXwn;
	 output [31:0] EXaluResult,EXdi;
	 output [1:0] EXjumpType;
	 output [31:0] EXjumpPc;
	 output EXzero;
	 
	 wire [3:0] aluc;
	 wire [1:0] EXselectAlua,EXselectAlub;
	 wire [31:0] qa,qb;
	 wire [31:0] saOrImme;
	 wire [1:0] EXisStoreHazards;
	 
//	 									wreg,m2reg,wmem,aluc,IDselectAlua,IDselectAlub,IDisStoreHazards,IDwn,qa,qb,immeOrSa,clk,clrn,IDjumpType,IDjumpPc,
//										EXwreg,EXm2reg,EXwmem,EXaluc,EXselectAlua,EXselectAlub,EXisStoreHazards,EXwn,EXqa,EXqb,EXimmeOrSa,EXjumpType,EXjumpPc
	 pipe_ID_EX_reg id_ex_reg(IDwreg,IDm2reg,IDwmem,IDaluc,IDselectAlua,IDselectAlub,IDisStoreHazards,IDwn,IDqa,IDqb,IDsaOrImme,clk,clrn,IDjumpType,IDjumpPc,
									 EXwreg,EXm2reg,EXwmem,aluc,EXselectAlua,EXselectAlub,EXisStoreHazards,EXwn,qa,qb,saOrImme,EXjumpType,EXjumpPc);
	 
	 wire [31:0] alua,alub;
	 mux4x32 select_alua(qa,saOrImme,MEMaluResult,WBdata,EXselectAlua,alua);
	 mux4x32 select_alub(qb,saOrImme,MEMaluResult,WBdata,EXselectAlub,alub);
	 
	 //wire z;
	 alu pipe_alu(alua,alub,aluc,EXzero,EXaluResult);
	 
	 mux4x32 select_di(qb,MEMaluResult,WBdata,32'h0,EXisStoreHazards,EXdi);
endmodule
