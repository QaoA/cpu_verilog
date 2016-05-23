`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:56:34 04/23/2016 
// Design Name: 
// Module Name:    pipe_noDataHazards_ID 
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
module pipe_noDataHazards_ID(clk,clrn,IFinst,EXwn,MEMwn,WBwn,EXm2reg,EXwreg,MEMwreg,MEMm2reg,WBwreg,WBdata,MEMjumpType,MEMzero,IFp4,
									  IFwip,IDwreg,IDm2reg,IDwmem,IDaluc,IDselectAlua,IDselectAlub,IDisStoreHazards,IDwn,IDqa,IDqb,IDsaOrImme,IDwillJump,IDjumpType,IDjumpPc
    );
	 input clk,clrn;
	 input [31:0] IFinst;
	 input [4:0] EXwn,MEMwn,WBwn;
	 input EXm2reg,EXwreg,MEMwreg,WBwreg;
	 input [31:0] WBdata;
	 input MEMm2reg;
	 input [1:0] MEMjumpType;
	 input MEMzero;
	 input [31:0] IFp4;
	 
	 output IFwip,IDwreg,IDm2reg,IDwmem;
	 output [1:0] IDisStoreHazards;
	 output [3:0] IDaluc;
	 output [1:0] IDselectAlua,IDselectAlub;
	 output [4:0] IDwn;
	 output [31:0] IDqa,IDqb,IDsaOrImme;
	 output IDwillJump;
	 output [1:0]IDjumpType;
	 output [31:0] IDjumpPc;
	 
	wire [31:0] inst;
	wire IDwir;
	wire [31:0] IDp4;
	
//									newInst,clk,clrn,wir,p4,
//									oldInst,IDp4
	pipe_inst_reg inst_reg(IFinst,clk,clrn,IDwir,IFp4,
									inst,IDp4);
	 
	wire [4:0] rs,rt,rd;
	wire [4:0] short_sa;
	wire [11:0] op;
	wire [15:0] imme;
	
	assign rs = inst[9:5];
	assign rt = inst[4:0];
	assign rd = inst[14:10];
	assign op = inst[31:20];
	assign short_sa = inst[19:15];
	assign imme = inst[25:10];
	
	wire sst,shift,sext;

//					IDrs,IDrt,IDop,EXwreg,MEMwreg,MEMm2reg,EXwn,MEMwn,EXm2reg, MEMjumpType,MEMzero,
//					IDsst,IDsext,IDshift,IDwreg,IDm2reg,IDwmem,IDaluc,IDselectAlua,IDselectAlub,is_store_hazards,IFwip,IDwir,IFwillJump,IDjumpType
	pipe_cu cu(rs,rt,op,EXwreg,MEMwreg,MEMm2reg,EXwn,MEMwn,EXm2reg,MEMjumpType,MEMzero,
					sst,sext,shift,IDwreg,IDm2reg,IDwmem,IDaluc,IDselectAlua,IDselectAlub,IDisStoreHazards,IFwip,IDwir,IDwillJump,IDjumpType);
					
	mux2x5 select_wn(rt,rd,sst,IDwn);
	
	pipe_regfile rf(rs,rt,WBdata,WBwn,WBwreg,clk,clrn,IDqa,IDqb);
	
	wire e = sext & imme[15];
	wire [15:0] imm = {16{e}};
	wire [31:0] imme_extend = {imm,imme};
	wire [31:0] sa_extend = {27'b0,short_sa};
	mux2x32 select_IDsaOrImme(imme_extend,sa_extend,shift,IDsaOrImme);
	
	wire [31:0] offset = {imme_extend[29:0],2'b00};
	wire [31:0] address = {IDp4[31:28],inst[25:0],2'b00};
	wire [31:0] bneOrBeqJumpPc;
	cla32 jumpAdder(IDp4,offset,1'b0,bneOrBeqJumpPc);
	mux2x32 select_pc(bneOrBeqJumpPc,address,IDjumpType[1] & IDjumpType[0],IDjumpPc);
endmodule
