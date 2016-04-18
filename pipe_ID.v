`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:33:53 04/16/2016 
// Design Name: 
// Module Name:    pipe_ID 
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
module pipe_ID(newInst,clrn,clk,WBwreg,WBwn,WBdata,
					IDwreg,IDm2reg,IDwmem,IDaluc,IDshift,IDaluimm,IDwn,IDqa,IDqb,IDimmeOrSa
    );
	input [31:0] newInst;
	input clrn,clk;
	input WBwreg;
	input [4:0] WBwn;
	input [31:0] WBdata;
	
	output IDwreg,IDm2reg,IDwmem,IDshift,IDaluimm;
	output [3:0] IDaluc;
	output [4:0] IDwn;
	output [31:0] IDqa,IDqb;
	output [31:0] IDimmeOrSa;
	
	wire [31:0] inst;
	IF_ID_reg inst_reg(newInst,inst,clk,clrn);
	
	wire [11:0] op = inst[31:20];
	wire [4:0] rs = inst[9:5];//rs1
	wire [4:0] rt = inst[4:0];//rs2
	wire [4:0] rd = inst[14:10];//rd
	wire [31:0] sa = {27'b0,inst[19:15]};
	wire [15:0] imme = inst[25:10];

//	wire wreg,m2reg,wmem,shift,aluimm,sst,sext;
	wire sst,sext;
	wire [3:0] aluc;
	wire [1:0] pcsource;
	
	sccu pipe_cu(.op(op),.z(0),
					.wreg(IDwreg),.sst(sst),.m2reg(IDm2reg),.shlft(IDshift),.aluimm(IDaluimm),.sext(sext),.aluc(IDaluc),.wmem(IDwmem),.pcsource(pcsource));

	//wire [4:0] wn;
	mux2x5 wn_select(rt,rd,sst,IDwn);
	
	wire [31:0] qa,qb;
	regfile rf(.rna(rs),.rnb(rt),.d(WBdata),.wn(WBwn),
				  .we(WBwreg),.clk(clk),.clrn(clrn),.qa(qa),.qb(qb));
				  
	wire e = sext & imme[15];
	wire [15:0] imm = {16{e}};
	wire [31:0] imme_extend = {imm,imme};
	
	wire [31:0] immeOrSa;
	mux2x5 immeOrSa_select(imme_extend,sa,IDshift,IDimmeOrSa);
	
	//ID_EX_reg id_to_ex_reg(.wreg(wreg),.m2reg(m2reg),.wmem(wmem),.aluc(aluc),.shift(shift),.aluimm(aluimm),.wn(wn),.qa(qa),.qb(qb),.immeOrSa(immeOrSa),
		//							.EXwreg(EXwreg),.EXm2reg(EXm2reg),.EXwmem(EXwmem),.EXaluc(EXaluc),.EXshift(EXshift),.EXaluimm(EXaluimm),.EXwn(EXwn),
		//							.EXqa(EXqa),.EXqb(EXqb),.EXimmeOrSa(EXimmeOrSa));
	
endmodule
