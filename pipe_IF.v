`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:07:48 04/16/2016 
// Design Name: 
// Module Name:    pipe_IF 
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
module pipe_IF(pc,clrn,clk,
					inst,nextPc
    );
	 
	 input [31:0] pc;
	 input clrn,clk;
	 output [31:0] inst;
	 output [31:0] p4;
	 
	 wire [31:0] newInst;
	
	 cla32 pcplus4(pc,32'h0004,1'b0,p4);
	 IP_ROM inst_mem(pc,newInst);
	 IF_ID_reg inst_reg(newInst,inst,clk,clrn);

endmodule
