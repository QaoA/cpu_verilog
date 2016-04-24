`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:13:33 04/23/2016 
// Design Name: 
// Module Name:    pipe_ID_EX_reg 
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
module pipe_ID_EX_reg(wreg,m2reg,wmem,aluc,IDselectAlua,IDselectAlub,IDwn,qa,qb,immeOrSa,clk,clrn,
						EXwreg,EXm2reg,EXwmem,EXaluc,EXselectAlua,EXselectAlub,EXwn,EXqa,EXqb,EXimmeOrSa
    );
	 input wreg,m2reg,wmem;
	 input [1:0] IDselectAlua,IDselectAlub;
	 input [3:0] aluc;
	 input [4:0] IDwn;
	 input [31:0] qa,qb;
	 input [31:0] immeOrSa;
	 input clk,clrn;
	 
	 output EXwreg,EXm2reg,EXwmem;
	 output [1:0] EXselectAlua,EXselectAlub;
	 output [3:0] EXaluc;
	 output [4:0] EXwn;
	 output [31:0] EXqa,EXqb;
	 output [31:0] EXimmeOrSa;
	 
	 reg EXwreg,EXm2reg,EXwmem;
	 reg [1:0] EXselectAlua,EXselectAlub;
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
				EXselectAlua <= 0;
				EXselectAlub <= 0;
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
				EXselectAlua <= IDselectAlua;
				EXselectAlub <= IDselectAlub;
				EXaluc <= aluc;
				EXwn <= IDwn;
				EXqa <= qa;
				EXqb <= qb;
				EXimmeOrSa <= immeOrSa;
			end
			
			initial
				begin
				EXwreg = 0;
				EXm2reg = 0;
				EXwmem = 0;
				EXselectAlua = 0;
				EXselectAlub = 0;
				EXaluc = 0;
				EXwn = 0;
				EXqa = 0;
				EXqb = 0;
				EXimmeOrSa = 0;
				end
endmodule
