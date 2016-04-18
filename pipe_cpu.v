`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:58:45 04/18/2016 
// Design Name: 
// Module Name:    pipe_cpu 
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
module pipe_cpu(clrn,clk,pc,aluOut
    );
	 
	 input clrn,clk;
	 output [31:0] pc,aluOut;
	 
	 wire [31:0] newInst;
	 pipe_IF IF(.clrn(clrn),.clk(clk),.newInst(newInst));
	 
	 wire WBwreg;
	 wire [4:0] WBwn;
	 wire [31:0] WBdata;
	 
	 wire IDwreg,IDm2reg,IDwmem,IDshift,IDaluimm;
	 wire [3:0] IDaluc;
	 wire [4:0] IDwn;
	 wire [31:0] IDqa,IDqb,IDimmeOrSa;
	 pipe_ID ID(.newInst(newInst),.clrn(clrn),.clk(clk),.WBwreg(WBwreg),.WBwn(WBwn),.WBdata(WBdata),
					.IDwreg(IDwreg),.IDm2reg(IDm2reg),.IDwmem(IDwmem),.IDaluc(IDaluc),.IDshift(IDshift),.IDaluimm(IDaluimm),
					.IDwn(IDwn),.IDqa(IDqa),.IDqb(IDqb),.IDimmeOrSa(IDaluimm));
	
	 wire EXwreg,EXm2reg,EXwmem;
	 wire [4:0] EXwn;
	 wire [31:0] EXaluResult,EXdi;
	 pipe_EX EX(.IDwreg(IDwreg),.IDm2reg(IDm2reg),.IDwmem(IDwmem),.IDaluc(IDaluc),.IDshift(IDshift),.IDaluimm(IDaluimm),.IDwn(IDwn),.IDqa(IDqa),.IDqb(IDqb),.IDimmeOrSa(IDimmeOrSa),.clk(clk),.clrn(clrn),
					.EXwreg(EXwreg),.EXm2reg(EXm2reg),.EXwmem(EXwmem),.EXwn(EXwn),.EXaluResult(EXaluResult),.EXdi(EXdi));
	 
	 wire MEMwreg,MEMm2reg;
	 wire [4:0] MEMwn;
	 wire [31:0] MEMaluResult,MEMmemOut;
	 pipe_MEM(.EXwreg(EXwreg),.EXm2reg(EXm2reg),.EXwmem(EXwmem),.EXwn(EXwn),.EXaluResult(EXaluResult),.EXdi(EXdi),.clrn(clrn),.clk(clk),
	   			.MEMwreg(MEMwreg),.MEMm2reg(MEMm2reg),.MEMwn(MEMwn),.MEMaluResult(MEMaluResult),.MEMmemOut(MEMmemOut));
					
	 pipe_WB WB(.MEMwreg(MEMwreg),.MEMm2reg(MEMm2reg),.MEMwn(MEMwn),.MEMaluResult(MEMaluResult),.MEMmemOut(MEMmemOut),.clrn(clrn),.clk(clk),
					.WBwreg(WBwreg),.WBdata(WBdata),.WBwn(WBwn));
					
	assign aluOut = EXaluResult;
endmodule
