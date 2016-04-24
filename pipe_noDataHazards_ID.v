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
module pipe_noDataHazards_ID(clk,clrn,IFinst,EXwn,MEMwn,WBwn,EXm2reg,EXwreg,MEMwreg,WBwreg,WBdata,
									  IFwip,IDwreg,IDm2reg,IDwmem,IDaluc,IDselectAlua,IDselectAlub,IDwn,IDqa,IDqb,IDsaOrImme
    );
	 input clk,clrn;
	 input [31:0] IFinst;
	 input [4:0] EXwn,MEMwn,WBwn;
	 input EXm2reg,EXwreg,MEMwreg,WBwreg;
	 input [31:0] WBdata;
	 
	 output IFwip,IDwreg,IDm2reg,IDwmem;
	 output [3:0] IDaluc;
	 output [1:0] IDselectAlua,IDselectAlub;
	 output [4:0] IDwn;
	 output [31:0] IDqa,IDqb,IDsaOrImme;
	 
	wire [31:0] inst;
	wire IDwir;
	pipe_inst_reg inst_reg(IFinst,inst,clk,clrn,IDwir);
	 
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
	
	pipe_cu cu(rs,rt,op,EXwreg,MEMwreg,EXwn,MEMwn,EXm2reg,
					sst,sext,shift,IDwreg,IDm2reg,IDwmem,IDaluc,IDselectAlua,IDselectAlub,IFwip,IDwir);
					
	mux2x5 select_wn(rt,rd,sst,IDwn);
	
	pipe_regfile rf(rs,rt,WBdata,WBwn,WBwreg,clk,clrn,IDqa,IDqb);
	
	wire e = sext & imme[15];
	wire [15:0] imm = {16{e}};
	wire [31:0] imme_extend = {imm,imme};
	wire [31:0] sa_extend = {27'b0,short_sa};
	mux2x32 select_IDsaOrImme(imme_extend,sa_extend,shift,IDsaOrImme);
	
endmodule
