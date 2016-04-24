`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:47:04 04/23/2016 
// Design Name: 
// Module Name:    pipe_ip 
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
module pipe_ip(clk,clrn,newPc,wpc,pc
    );
	 input clk,clrn;
	 input [31:0] newPc;
	 input wpc;
	 
	 output [31:0] pc;
	 
	 reg [31:0] pc;
	 
	 always @ (posedge clk or negedge clrn) 
		begin
			if(clrn == 0) pc <= 0;
			else if(wpc)			pc <= newPc;
		end
	initial 
		begin
			pc = 0;
		end
endmodule
