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
module pipe_noDataHazards_IF(IFwip,clk,clrn,jump_pc,will_jump,
									  inst,pc,p4
    );
	 input IFwip,clk,clrn;
	 input [31:0] jump_pc;
	 input will_jump;
	 output [31:0] inst;
	 output [31:0] pc;
	 output [31:0] p4;
	 
	 wire [31:0] nextPc;
	 
	 pipe_ip ip(clk,clrn,nextPc,IFwip,pc);
	 cla32 pcplus4(pc,32'h4,1'b0,p4);
	 IP_ROM inst_mem(pc,inst);
	 mux2x32 select_nextpc(p4,jump_pc,will_jump,nextPc);
	 
endmodule
