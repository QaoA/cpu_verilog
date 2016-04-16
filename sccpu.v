`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:34:12 03/23/2016 
// Design Name: 
// Module Name:    sccpu 
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
module sccpu(
	input clk,
	input clrn,
	output [31:0] inst,
	output [31:0] pc,
	output [31:0] aluout,
	output [31:0] memout
    );
	 wire [31:0] data;
	 wire wmem;
	 
	 sccpu_cpu sccpu_cpu(clk,clrn,inst,memout,pc,wmem,aluout,data);
	 IP_ROM inst_mem(pc,inst);
	 IP_RAM data_mem(wmem,aluout,data,clk,memout);
endmodule
