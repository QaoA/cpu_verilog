`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:32:53 03/21/2016 
// Design Name: 
// Module Name:    sccpu_cpu 
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
module sccpu_cpu(
	input clk,
	input clrn,
	input [31:0] inst,
	input [31:0] mem,
	output [31:0] pc,
	output wmem,
	output [31:0] result,
	output [31:0] data
    );
	 
	wire wreg,sst,m2reg,shift,aluimm,sext;
	wire [3:0] aluc;
	wire [1:0] pcsource;
	
	wire z;
	
	//fetch instrument
	wire [11:0] op = inst[31:20];
	wire [4:0] rs = inst[9:5];//rs1
	wire [4:0] rt = inst[4:0];//rs2
	wire [4:0] rd = inst[14:10];//rd
	wire [31:0] sa = {27'b0,inst[19:15]};
	wire [15:0] imme = inst[25:10];
	wire [25:0] addr = inst[25:0];
	
	//pc
	wire [31:0] nextPc;
	wire [31:0] p4;
	dff32 ip(nextPc,clk,clrn,pc);
	cla32 pcplus4(pc,32'h0004,1'b0,p4);
	wire [31:0] jpc = {p4[31:28],addr[25:0],2'b00};
	
	//cu
	sccu cu(op,z,wreg,sst,m2reg,shift,aluimm,sext,aluc,wmem,pcsource);
	
	//imme extend
	wire e = sext & imme[15];
	wire [15:0] imm = {16{e}};
	wire [31:0] imme_extend = {imm,imme};
	
	//register file
	wire [31:0] qa,qb;
	wire [31:0] data_real;
	wire [4:0] wn;
	regfile rf(rs,rt,data_real,wn,wreg,clk,clrn,qa,qb);
	
	//alu_a,alu_b
	wire [31:0] alu_sa,alu_sb;
	mux2x32 alu_a(qa,sa,shift,alu_sa);
	mux2x32 alu_b(qb,imme_extend,aluimm,alu_sb);
	
	//alu
	alu al_unit(alu_sa,alu_sb,aluc,z,result);
	
	//rnb
	
	mux2x5 slct_st(rt,rd,sst,wn);
	
	//reslut
	mux2x32 reslut(result,mem,m2reg,data_real);
	
	//nextpc
	//label = pc + 4 + offset<<2
	wire [31:0] imme_label = p4 + {imme_extend[29:0],2'b00};
	mux4x32 nextpc(p4,imme_label,32'h0,jpc,pcsource,nextPc);
	
	assign data = qb;

endmodule
