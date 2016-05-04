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
module pipe_noDataHazards_EX(IDwreg,IDm2reg,IDwmem,IDaluc,IDselectAlua,IDselectAlub,IDisStoreHazards,IDwn,IDqa,IDqb,IDsaOrImme,MEMaluResult,WBdata,clk,clrn,
										EXwreg,EXm2reg,EXwmem,EXisStoreHazards,EXwn,EXaluResult,EXqb
    );
	 
	 input IDwreg,IDm2reg,IDwmem;
	 input IDisStoreHazards;
	 input [3:0] IDaluc;
	 input [1:0] IDselectAlua,IDselectAlub;
	 input [4:0] IDwn;
	 input [31:0] IDqa,IDqb;
	 input [31:0] IDsaOrImme;
	 input [31:0] MEMaluResult,WBdata;
	 input clk,clrn;
	 
	 output EXwreg,EXm2reg,EXwmem;
	 output EXisStoreHazards;
	 output [4:0] EXwn;
	 output [31:0] EXaluResult,EXqb;
	 
	 wire [3:0] aluc;
	 wire [1:0] EXselectAlua,EXselectAlub;
	 wire [31:0] qa,qb;
	 wire [31:0] saOrImme;
	 pipe_ID_EX_reg id_ex_reg(IDwreg,IDm2reg,IDwmem,IDaluc,IDselectAlua,IDselectAlub,IDisStoreHazards,IDwn,IDqa,IDqb,IDsaOrImme,clk,clrn,
									 EXwreg,EXm2reg,EXwmem,aluc,EXselectAlua,EXselectAlub,EXisStoreHazards,EXwn,qa,qb,saOrImme);
	 
	 wire [31:0] alua,alub;
	 mux4x32 select_alua(qa,saOrImme,MEMaluResult,WBdata,EXselectAlua,alua);
	 mux4x32 select_alub(qb,saOrImme,MEMaluResult,WBdata,EXselectAlub,alub);
	 
	 wire z;
	 alu pipe_alu(alua,alub,aluc,z,EXaluResult);
	 
	 assign EXqb = qb;
endmodule
