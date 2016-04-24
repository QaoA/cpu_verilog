`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:35:37 04/23/2016 
// Design Name: 
// Module Name:    pipe_noDataHazards_IF 
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
module pipe_noDataHazards_IF(IFwip,clk,clrn,
									  inst,pc
    );
	 input IFwip,clk,clrn;
	 output inst;
	 output [31:0] pc;
	 
	 wire [31:0] nextPc;
	 //wire [31:0] pc;
	 
	 pipe_ip ip(clk,clrn,nextPc,IFwip,pc);
	 cla32 pcplus4(pc,32'h4,1'b0,nextPc);
	 IP_ROM inst_mem(pc,inst);
	 
endmodule
