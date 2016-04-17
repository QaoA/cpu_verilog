`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:43:15 04/16/2016 
// Design Name: 
// Module Name:    ID_EX_reg 
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
module ID_EX_reg(wreg,m2reg,wmem,aluc,shift,aluimm,wn,qa,qb,immeOrSa,
						EXwreg,EXm2reg,EXwmem,EXaluc,EXshift,EXaluimm,EXwn,EXqa,EXqb,EXimmeOrSa
    );
	 input wreg,m2reg,wmem,shift,aluimm;
	 input [3:0] aluc;
	 input [4:0] wn;
	 input [31:0] qa,qb;
	 input [31:0] immeOrSa;
	 
	 output EXwreg,EXm2reg,EXwmem,EXshift,EXaluimm;
	 output [3:0] EXaluc;
	 output [4:0] EXwn;
	 output [31:0] EXqa,EXqb;
	 output [31:0] EXimmeOrSa;
	 
	 reg EXwreg,EXm2reg,EXwmem,EXshift,EXaluimm;
	 reg [3:0] EXaluc;
	 reg [4:0] EXwn;
	 reg [31:0] EXqa,EXqb;
	 reg [31:0] EXimmeOrSa;
	 
	 always @(negedge clrn or posedge clk)
		if(clrn == 0)
			begin
				EXwreg <= 0;
				EXm2reg <= 0;
				EXwmem <= 0;
				EXshift <= 0;
				EXaluimm <= 0;
				EXaluc <= 0;
				EXwn <= 0;
				EXqa <= 0;
				EXqb <= 0;
				EXimmeOrSa <= 0;
			end
		else
			begin
				EXwreg <= wreg;
				EXm2reg <= m2reg;
				EXwmem <= wmem;
				EXshift <= shift;
				EXaluimm <= aluimm;
				EXaluc <= aluc;
				EXwn <= wn;
				EXqa <= qa;
				EXqb <= qb;
				EXimmeOrSa <= immeOrSa;
			end
			
			initial
				begin
				EXwreg = 0;
				EXm2reg = 0;
				EXwmem = 0;
				EXshift = 0;
				EXaluimm = 0;
				EXaluc = 0;
				EXwn = 0;
				EXqa = 0;
				EXqb = 0;
				EXimmeOrSa = 0;
				end
endmodule
