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
module pipe_IF(clrn,clk,
					newInst,pc
    );
	 output [31:0] pc;
	 input clrn,clk;
	 output [31:0] newInst;
	 
	 wire [31:0] newInst;
	 wire [31:0] nextPc;
	 wire [31:0] pc;
	 
	 cla32 pcplus4(pc,32'h00000004,1'b0,nextPc);
	 IP_ROM inst_mem(pc,newInst);
	 //IF_ID_reg inst_reg(newInst,inst,clk,clrn);
	 dff32 ip(nextPc,clk,clrn,pc);

endmodule
