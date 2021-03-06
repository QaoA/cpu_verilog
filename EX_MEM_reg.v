`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:01:48 04/16/2016 
// Design Name: 
// Module Name:    EX_MEM_reg 
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
module EX_MEM_reg(EXwreg,EXm2reg,EXwmem,EXwn,aluResult,EXqb,clrn,clk,EXjumpType,EXjumpPc,EXzero,
						MEMwreg,MEMm2reg,MEMwmem,MEMwn,MEMaluResult,MEMdi,MEMjumpType,MEMjumpPc,MEMzero
    );
	input EXwreg,EXm2reg,EXwmem;
	input [4:0] EXwn;
	input [31:0] aluResult,EXqb;
	input clrn,clk;
	input [1:0] EXjumpType;
	input [31:0] EXjumpPc;
	input EXzero;
	
	output MEMwreg,MEMm2reg,MEMwmem;
	output [4:0] MEMwn;
	output [31:0] MEMaluResult,MEMdi;
	output [1:0] MEMjumpType;
	output [31:0] MEMjumpPc;
	output MEMzero;
	
	reg MEMwreg,MEMm2reg,MEMwmem;
	reg [4:0] MEMwn;
	reg [31:0] MEMaluResult,MEMdi;
	reg [1:0] MEMjumpType;
	reg [31:0] MEMjumpPc;
	reg MEMzero;
	
	always @(negedge clrn or posedge clk)
		begin
			if(clrn == 0)
				begin
					MEMwreg <= 0;
					MEMm2reg <= 0;
					MEMwmem <= 0;
					MEMwn <= 0;
					MEMaluResult <= 0;
					MEMdi <= 0;
					MEMjumpType <= 0;
					MEMjumpPc <= 0;
					MEMzero <= 0;
				end
			else
				begin
					MEMwreg <= EXwreg;
					MEMm2reg <= EXm2reg;
					MEMwmem <= EXwmem;
					MEMwn <= EXwn;
					MEMaluResult <= aluResult;
					MEMdi <= EXqb;
					MEMjumpType <= EXjumpType;
					MEMjumpPc <= EXjumpPc;
					MEMzero <= EXzero;
				end
		end

	initial
		begin
			MEMwreg = 0;
			MEMm2reg = 0;
			MEMwmem = 0;
			MEMwn = 0;
			MEMaluResult = 0;
			MEMdi = 0;
			MEMjumpType = 0;
			MEMjumpPc = 0;
			MEMzero = 0;
		end
endmodule
